#!/usr/bin/env python3
"""Audit the fixed Thumb dispatch paths leading to the 64-byte font indexer."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from find_thumb_bl_target_refs import thumb_bl_target


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
INDEXER_OFFSET = 0x20D84


def word(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<H", rom, offset)[0]


def call_target(rom: bytes, offset: int) -> int:
    return thumb_bl_target(offset, word(rom, offset), word(rom, offset + 2))


def expect(rom: bytes, offset: int, value: int) -> None:
    actual = word(rom, offset)
    if actual != value:
        raise ValueError(f"unexpected instruction at {offset:#x}: {actual:#06x}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")
    for offset, value in (
        (0x20C6C, 0x6A6C), (0x20C6E, 0x7821),
        (0x20C70, 0x29E7), (0x20C72, 0xDA00), (0x20C76, 0x39E7),
        (0x20C78, 0x0089), (0x20C7A, 0x4AB6), (0x20C7C, 0x5851), (0x20C80, 0x4708),
        (0x20CA6, 0x29E5), (0x20CAA, 0x29E6),
        (0x20CBC, 0x7861), (0x20CBE, 0x31E5), (0x20CC8, 0x3402),
        (0x20CCE, 0x7861), (0x20CD0, 0x31E6), (0x20CD2, 0x31FF), (0x20CDC, 0x3402),
        (0x20CB6, 0x3401),
    ):
        expect(rom, offset, value)
    default_target = call_target(rom, 0x20CAE)
    e5_target = call_target(rom, 0x20CC0)
    e6_target = call_target(rom, 0x20CD4)
    if {default_target, e5_target, e6_target} != {INDEXER_OFFSET}:
        raise ValueError("dispatch paths do not converge at the expected indexer")
    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest},
        "font_indexer_rom_offset": INDEXER_OFFSET,
        "dispatch": {
            "stream_pointer_load_rom_offset": 0x20C6C,
            "current_byte_load_rom_offset": 0x20C6E,
            "control_jump_table": {
                "threshold_immediate": 0xE7,
                "comparison_rom_offset": 0x20C70,
                "index_subtract_rom_offset": 0x20C76,
                "index_scale_shift": 2,
                "indirect_branch_rom_offset": 0x20C80,
            },
            "comparison_immediates": [0xE5, 0xE6],
            "default_path": {
                "indexer_call_rom_offset": 0x20CAE,
                "indexer_target_rom_offset": default_target,
                "r4_advance_immediate": 1,
            },
            "e5_extension": {
                "next_byte_load_rom_offset": 0x20CBC,
                "index_add_immediate": 0xE5,
                "indexer_call_rom_offset": 0x20CC0,
                "indexer_target_rom_offset": e5_target,
                "r4_advance_immediate": 2,
            },
            "e6_extension": {
                "next_byte_load_rom_offset": 0x20CCE,
                "index_add_immediates": [0xE6, 0xFF],
                "indexer_call_rom_offset": 0x20CD4,
                "indexer_target_rom_offset": e6_target,
                "r4_advance_immediate": 2,
            },
        },
        "interpretation_notice": (
            "This is a static Thumb-path observation. It shows three paths converge at the font indexer, "
            "but does not by itself prove r4 is the active message cursor, classify every opcode, or authorize editing."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
