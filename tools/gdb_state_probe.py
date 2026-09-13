#!/usr/bin/env python3
"""Read-only basic probe for mGBA's local GDB Remote Serial Protocol server."""

from __future__ import annotations

import argparse
import hashlib
import json
import socket
from pathlib import Path


def checksum(payload: bytes) -> bytes:
    return f"{sum(payload) & 0xFF:02x}".encode("ascii")


class GdbRemote:
    def __init__(self, host: str, port: int) -> None:
        self.socket = socket.create_connection((host, port), timeout=5)
        self.socket.settimeout(5)

    def close(self) -> None:
        self.socket.close()

    def command(self, payload: str) -> str:
        raw = payload.encode("ascii")
        self.socket.sendall(b"$" + raw + b"#" + checksum(raw))
        first = self.socket.recv(1)
        if first not in {b"+", b"-", b"$"}:
            raise RuntimeError(f"unexpected GDB response prefix: {first!r}")
        if first == b"-":
            raise RuntimeError(f"GDB rejected packet: {payload}")
        if first == b"+":
            first = self.socket.recv(1)
        if first != b"$":
            raise RuntimeError(f"expected GDB packet after acknowledgement, got: {first!r}")
        response = bytearray()
        while True:
            byte = self.socket.recv(1)
            if byte == b"#":
                break
            response.extend(byte)
        received_checksum = self.socket.recv(2)
        if received_checksum.lower() != checksum(bytes(response)):
            raise RuntimeError("GDB response checksum mismatch")
        self.socket.sendall(b"+")
        return response.decode("ascii", "replace")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", default=2345, type=int)
    args = parser.parse_args()

    remote = GdbRemote(args.host, args.port)
    try:
        supported = remote.command("qSupported")
        stop_reason = remote.command("?")
        registers = remote.command("g")
        if len(registers) < 16 * 8:
            raise RuntimeError("register response is too short for ARM r0-r15")
        words = [int.from_bytes(bytes.fromhex(registers[index : index + 8]), "little") for index in range(0, 16 * 8, 8)]
        report = {
            "schema_version": 1,
            "endpoint": f"{args.host}:{args.port}",
            "q_supported": supported,
            "stop_reason": stop_reason,
            "registers": {f"r{index}": value for index, value in enumerate(words)},
            "register_snapshot_sha256": hashlib.sha256(registers.encode("ascii")).hexdigest(),
            "read_only": True,
        }
    finally:
        remote.close()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
