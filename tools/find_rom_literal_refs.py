#!/usr/bin/env python3
"""Find ARM/Thumb PC-relative literal loads that reference selected ROM words.

This is a structural locator, not a complete disassembler or call-graph tool.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


def parse_offsets(values: list[str]) -> set[int]:
    return {int(value, 0) for value in values}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--literal-offset", action="append", help="ROM file offset containing a 32-bit literal")
    parser.add_argument("--literal-value", action="append", help="32-bit little-endian value to locate before scanning literal loads")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    data = args.rom.read_bytes()
    if not args.literal_offset and not args.literal_value:
        parser.error("one of --literal-offset or --literal-value is required")
    targets = parse_offsets(args.literal_offset or [])
    requested_values = [int(value, 0) for value in args.literal_value or []]
    value_occurrences = {}
    for value in requested_values:
        if not 0 <= value <= 0xFFFFFFFF:
            raise ValueError(f"literal value outside u32 range: {value}")
        needle = struct.pack("<I", value)
        offsets = []
        position = data.find(needle)
        while position >= 0:
            offsets.append(position)
            position = data.find(needle, position + 1)
        value_occurrences[f"{value:08X}"] = offsets
        targets.update(offsets)
    for target in targets:
        if target < 0 or target + 4 > len(data):
            raise ValueError(f"literal offset outside ROM: {target:#x}")

    thumb_refs = []
    for offset in range(0, len(data) - 1, 2):
        instruction = struct.unpack_from("<H", data, offset)[0]
        if instruction & 0xF800 != 0x4800:  # LDR Rd, [PC, #imm8*4]
            continue
        literal_offset = ((offset + 4) & ~3) + (instruction & 0xFF) * 4
        if literal_offset in targets:
            thumb_refs.append(
                {
                    "instruction_offset": offset,
                    "destination_register": instruction >> 8 & 7,
                    "literal_offset": literal_offset,
                }
            )

    arm_refs = []
    for offset in range(0, len(data) - 3, 4):
        instruction = struct.unpack_from("<I", data, offset)[0]
        # Single data transfer, LDR, base R15, pre-indexed, no writeback.
        if instruction & 0x0E5F0000 != 0x041F0000:
            continue
        immediate = instruction & 0xFFF
        up = bool(instruction & 0x00800000)
        literal_offset = offset + 8 + (immediate if up else -immediate)
        if literal_offset in targets:
            arm_refs.append(
                {
                    "instruction_offset": offset,
                    "destination_register": instruction >> 12 & 0xF,
                    "literal_offset": literal_offset,
                    "condition": instruction >> 28,
                }
            )

    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": hashlib.sha256(data).hexdigest()},
        "literals": [
            {
                "rom_offset": target,
                "little_endian_u32": struct.unpack_from("<I", data, target)[0],
            }
            for target in sorted(targets)
        ],
        "requested_literal_value_occurrences": value_occurrences,
        "thumb_pc_relative_ldr_references": thumb_refs,
        "arm_pc_relative_ldr_references": arm_refs,
        "limitation": "Only PC-relative LDR literal forms are scanned; no absence claim is made for other address-construction paths.",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
