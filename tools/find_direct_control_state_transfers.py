#!/usr/bin/env python3
"""Find direct message-parameter to r5 state-byte transfers at handler entry.

The report contains only opcode numbers, code offsets, and register-derived
metadata. It does not store script bytes, instructions, decoded text, or game
assets.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ROM_CPU_BASE = 0x08000000
TABLE_OFFSET = 0x20F8C
FIRST_OPCODE = 0xE7
LAST_OPCODE = 0xFF


def halfword(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<H", rom, offset)[0]


def u32(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<I", rom, offset)[0]


def ldrb_from_r4(instruction: int) -> tuple[int, int] | None:
    if (instruction & 0xF800) != 0x7800 or ((instruction >> 3) & 7) != 4:
        return None
    return instruction & 7, (instruction >> 6) & 0x1F


def strb_to_r5(instruction: int) -> tuple[int, int] | None:
    if (instruction & 0xF800) != 0x7000 or ((instruction >> 3) & 7) != 5:
        return None
    return instruction & 7, (instruction >> 6) & 0x1F


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--entry-window", type=lambda value: int(value, 0), default=0x10)
    args = parser.parse_args()
    if args.entry_window <= 0 or args.entry_window % 2:
        raise ValueError("--entry-window must be positive and even")
    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")

    entries = []
    for opcode in range(FIRST_OPCODE, LAST_OPCODE + 1):
        target = u32(rom, TABLE_OFFSET + (opcode - FIRST_OPCODE) * 4)
        if not target & 1:
            raise ValueError(f"non-Thumb entry for opcode {opcode:#x}")
        handler = (target & ~1) - ROM_CPU_BASE
        reads: dict[int, list[dict[str, int]]] = {}
        transfers = []
        for offset in range(handler, min(handler + args.entry_window, len(rom) - 1), 2):
            instruction = halfword(rom, offset)
            read = ldrb_from_r4(instruction)
            if read is not None:
                register, parameter_offset = read
                reads.setdefault(register, []).append({"rom_offset": offset, "parameter_offset": parameter_offset})
            write = strb_to_r5(instruction)
            if write is not None:
                register, state_byte_offset = write
                for source in reads.get(register, []):
                    transfers.append({
                        "parameter_rom_offset": source["rom_offset"],
                        "parameter_offset": source["parameter_offset"],
                        "state_write_rom_offset": offset,
                        "state_base_register": 5,
                        "state_byte_offset": state_byte_offset,
                    })
        if transfers:
            entries.append({"opcode": opcode, "handler_rom_offset": handler, "transfers": transfers})

    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest},
        "scope": {"opcode_range": [FIRST_OPCODE, LAST_OPCODE], "entry_window_bytes": args.entry_window},
        "direct_parameter_to_r5_byte_transfer_entries": entries,
        "interpretation_notice": (
            "A marker proves only that a byte read from r4 at handler entry is subsequently stored through r5 in the "
            "same bounded entry window. The r5 field meaning and full command semantics are not assigned."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
