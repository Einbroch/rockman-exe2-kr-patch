#!/usr/bin/env python3
"""Match validated ROM LZ77 graphics candidates against a PNG savestate's VRAM.

Only coordinates, lengths, and hashes are written.  Decompressed graphics and
VRAM bytes remain in memory and are never exported as assets.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
VRAM_STATE_OFFSET = 0x1000
VRAM_BYTES = 0x18000
VRAM_BASE = 0x06000000


def load_state(path: Path) -> bytes:
    data = path.read_bytes()
    if not data.startswith(PNG_SIGNATURE):
        raise ValueError("input is not a PNG-backed mGBA savestate")
    position = len(PNG_SIGNATURE)
    while position + 12 <= len(data):
        length = struct.unpack_from(">I", data, position)[0]
        kind = data[position + 4 : position + 8]
        start = position + 8
        end = start + length
        if end + 4 > len(data):
            raise ValueError("truncated PNG chunk")
        if kind == b"gbAs":
            payload = zlib.decompress(data[start:end])
            if len(payload) != 0x61000:
                raise ValueError(f"unexpected GBA state size: {len(payload):#x}")
            return payload
        position = end + 4
    raise ValueError("no gbAs chunk found")


def decompress_lz77(data: bytes, offset: int) -> bytes:
    if data[offset] != 0x10:
        raise ValueError("not a BIOS LZ77 0x10 stream")
    expected = int.from_bytes(data[offset + 1 : offset + 4], "little")
    source = offset + 4
    output = bytearray()
    while len(output) < expected:
        flags = data[source]
        source += 1
        for bit in range(8):
            if len(output) >= expected:
                break
            if flags & (0x80 >> bit):
                pair = int.from_bytes(data[source : source + 2], "big")
                source += 2
                length = (pair >> 12) + 3
                distance = (pair & 0x0FFF) + 1
                if distance > len(output):
                    raise ValueError("invalid LZ77 backreference")
                for _ in range(length):
                    if len(output) >= expected:
                        break
                    output.append(output[-distance])
            else:
                output.append(data[source])
                source += 1
    return bytes(output)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--survey", type=Path, required=True)
    parser.add_argument("--minimum-bytes", type=lambda value: int(value, 0), default=128)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.minimum_bytes < 1:
        raise ValueError("minimum bytes must be positive")
    rom = args.rom.read_bytes()
    rom_digest = hashlib.sha256(rom).hexdigest()
    if rom_digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {rom_digest}")
    state_payload = load_state(args.state)
    vram = state_payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
    survey = json.loads(args.survey.read_text(encoding="utf-8"))
    streams = survey["observations"]["gba_bios_lz77_0x10"]["streams"]

    matches = []
    skipped_short = 0
    for stream in streams:
        offset = stream["rom_offset"]
        unpacked_size = stream["unpacked_size"]
        if unpacked_size < args.minimum_bytes or unpacked_size > len(vram):
            skipped_short += 1
            continue
        unpacked = decompress_lz77(rom, offset)
        if len(unpacked) != unpacked_size:
            raise ValueError(f"survey size mismatch at {offset:#x}")
        vram_offset = vram.find(unpacked)
        if vram_offset >= 0:
            matches.append(
                {
                    "rom_offset": offset,
                    "rom_address": stream["rom_address"],
                    "packed_size": stream["packed_size"],
                    "unpacked_size": unpacked_size,
                    "unpacked_sha256": hashlib.sha256(unpacked).hexdigest(),
                    "vram_offset": vram_offset,
                    "vram_address": VRAM_BASE + vram_offset,
                }
            )
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": rom_digest,
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(args.state.read_bytes()).hexdigest(),
            "survey_filename": args.survey.name,
        },
        "vram": {"emulated_base_address": VRAM_BASE, "byte_length": len(vram)},
        "minimum_candidate_unpacked_bytes": args.minimum_bytes,
        "survey_stream_count": len(streams),
        "skipped_short_or_oversized_stream_count": skipped_short,
        "exact_full_stream_vram_matches": matches,
        "interpretation_notice": (
            "An exact match proves only that a decompressed ROM byte stream is present in this "
            "savestate's VRAM. It does not identify tiles as font glyphs, a background, or sprites, "
            "and it does not prove the runtime loading routine."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
