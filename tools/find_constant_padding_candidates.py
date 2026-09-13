#!/usr/bin/env python3
"""Locate long constant-byte ROM runs as relocation candidates.

Constant padding is only a structural candidate for free space.  This tool
does not write a ROM and never labels a run as safe or unused.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--minimum-length", type=int, default=1024)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.minimum_length <= 0:
        raise ValueError("minimum length must be positive")
    data = args.rom.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected Rev 1 ROM SHA-256")

    runs: list[dict[str, int | str]] = []
    start = 0
    while start < len(data):
        value = data[start]
        end = start + 1
        while end < len(data) and data[end] == value:
            end += 1
        if value in (0x00, 0xFF) and end - start >= args.minimum_length:
            runs.append({
                "rom_offset": start,
                "byte_length": end - start,
                "fill_byte": f"{value:02X}",
                "aligned_4": start % 4 == 0,
            })
        start = end
    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest, "byte_length": len(data)},
        "minimum_length": args.minimum_length,
        "constant_padding_candidates": runs,
        "interpretation": "A constant run is not proof of unused space. Any relocation target requires independent consumer-reference and runtime validation.",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
