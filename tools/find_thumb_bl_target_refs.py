#!/usr/bin/env python3
"""Find structural Thumb BL encodings that resolve to one ROM file offset."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def thumb_bl_target(call_offset: int, first: int, second: int) -> int:
    sign = (first >> 10) & 1
    j1 = (second >> 13) & 1
    j2 = (second >> 11) & 1
    i1 = 1 ^ (j1 ^ sign)
    i2 = 1 ^ (j2 ^ sign)
    displacement = (
        (sign << 24)
        | (i1 << 23)
        | (i2 << 22)
        | ((first & 0x03FF) << 12)
        | ((second & 0x07FF) << 1)
    )
    if sign:
        displacement -= 1 << 25
    return (call_offset + 4 + displacement) & 0xFFFFFFFF


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--target-rom-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")
    calls = []
    for offset in range(0, len(rom) - 3, 2):
        first, second = struct.unpack_from("<HH", rom, offset)
        if first & 0xF800 != 0xF000 or second & 0xD000 != 0xD000:
            continue
        if thumb_bl_target(offset, first, second) == args.target_rom_offset:
            calls.append({"call_instruction_rom_offset": offset, "target_rom_offset": args.target_rom_offset})
    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest, "target_rom_offset": args.target_rom_offset},
        "structural_thumb_bl_calls": calls,
        "interpretation_notice": (
            "This decodes BL-shaped halfword pairs throughout the ROM without code/data classification. "
            "A result is a structural call candidate; an empty result does not exclude branches, indirect calls, or other modes."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
