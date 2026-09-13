#!/usr/bin/env python3
"""Verify the static call path that presents the runtime-observed message block.

The offsets are intentionally explicit for the verified Rev 1 ROM.  This is
not a general disassembler and does not claim that the callee consumes the
passed pointer or identifies the glyph renderer.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


EXPECTED_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ROM_BASE = 0x08000000


def u16(data: bytes, offset: int) -> int:
    return struct.unpack_from("<H", data, offset)[0]


def u32(data: bytes, offset: int) -> int:
    return struct.unpack_from("<I", data, offset)[0]


def thumb_literal_offset(instruction_offset: int, instruction: int) -> int:
    if instruction & 0xF800 != 0x4800:
        raise ValueError(f"not a Thumb literal LDR at {instruction_offset:#x}")
    return ((instruction_offset + 4) & ~3) + (instruction & 0xFF) * 4


def thumb_bl_target(instruction_offset: int, first: int, second: int) -> int:
    if first & 0xF800 != 0xF000 or second & 0xF800 != 0xF800:
        raise ValueError(f"not a Thumb-1 BL pair at {instruction_offset:#x}")
    displacement = ((first & 0x7FF) << 12) | ((second & 0x7FF) << 1)
    if displacement & 0x400000:
        displacement -= 0x800000
    return instruction_offset + 4 + displacement


def need(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    data = args.rom.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    need(digest == EXPECTED_SHA256, f"unexpected ROM SHA-256: {digest}")

    # C841C selects a handler through six Thumb addresses at C8428.  Entry 2
    # is C846B (file offset C846A), the handler that contains the block load.
    dispatch_offset = 0x0C841C
    table_offset = 0x0C8428
    handler_entries = [u32(data, table_offset + index * 4) for index in range(6)]
    need(u16(data, dispatch_offset) == 0xB500, "dispatch entry prologue changed")
    need(handler_entries[2] == ROM_BASE + 0x0C846A + 1, "expected state handler is absent")

    handler_offset = 0x0C846A
    block_ldr_offset = 0x0C8478
    block_literal_offset = thumb_literal_offset(block_ldr_offset, u16(data, block_ldr_offset))
    block_address = u32(data, block_literal_offset)
    need(block_literal_offset == 0x0C84E4, "unexpected active-block literal location")
    need(block_address == ROM_BASE + 0x0077A298, "unexpected active message block address")
    need(u16(data, block_ldr_offset + 2) == 0x2100, "r1 is not explicitly set to zero")

    call_offset = 0x0C847C
    ingest_offset = thumb_bl_target(call_offset, u16(data, call_offset), u16(data, call_offset + 2))
    need(ingest_offset == 0x020B60, "unexpected ingest call target")
    need(u16(data, ingest_offset) == 0xB520, "ingest function prologue changed")

    ram_ldr_offset = 0x020B9E
    ram_literal_offset = thumb_literal_offset(ram_ldr_offset, u16(data, ram_ldr_offset))
    ram_address = u32(data, ram_literal_offset)
    need(ram_literal_offset == 0x020F44, "unexpected RAM-context literal location")
    need(ram_address == 0x0200A1B0, "unexpected RAM-context address")

    # The initializer keeps the caller's block base, resolves the caller's
    # u8 selector through the block's u16 offset table, then initializes the
    # parser current/end pointers from the resolved entry start.
    entry_resolution_offsets = {
        "store_block_base": 0x020B84,
        "load_entry_offset": 0x020B8A,
        "add_entry_offset": 0x020B8C,
        "store_parser_current": 0x020B8E,
        "store_parser_end": 0x020B90,
    }
    expected_entry_resolution_instructions = {
        "store_block_base": 0x62A8,
        "load_entry_offset": 0x5A41,
        "add_entry_offset": 0x1840,
        "store_parser_current": 0x6268,
        "store_parser_end": 0x62E8,
    }
    for name, offset in entry_resolution_offsets.items():
        need(u16(data, offset) == expected_entry_resolution_instructions[name], f"unexpected {name} instruction")

    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest},
        "dispatch": {
            "function_offset": dispatch_offset,
            "handler_table_offset": table_offset,
            "handler_thumb_addresses": handler_entries,
            "selected_handler_table_index": 2,
            "selected_handler_offset": handler_offset,
        },
        "active_block_call_argument": {
            "ldr_instruction_offset": block_ldr_offset,
            "literal_offset": block_literal_offset,
            "rom_address": block_address,
            "rom_file_offset": block_address - ROM_BASE,
            "following_instruction": "MOVS r1, #0",
        },
        "direct_call": {
            "bl_instruction_offset": call_offset,
            "target_offset": ingest_offset,
            "target_prologue": "PUSH {r5, lr}",
        },
        "ingest_function_ram_context": {
            "ldr_instruction_offset": ram_ldr_offset,
            "literal_offset": ram_literal_offset,
            "ram_address": ram_address,
        },
        "entry_resolution": {
            "source_block_base_state_offset": 40,
            "parser_current_state_offset": 36,
            "parser_end_state_offset": 44,
            "caller_selector_width_bits": 8,
            "block_entry_offset_width_bits": 16,
            "instruction_rom_offsets": entry_resolution_offsets,
        },
        "verified_conclusion": (
            "The runtime-observed block start 0x0877A298 is statically loaded into r0 by a "
            "state-handler table entry immediately before a direct call to ROM offset 0x020B60. "
            "That function stores the passed block base, resolves the passed selector through "
            "the block's u16 entry-offset table, and initializes parser current/end pointers "
            "from the resolved entry start."
        ),
        "not_yet_proven": [
            "all callers and all block pointer consumers beyond this exact handler route",
            "whether every catalog block uses the same initializer and offset-table shape",
            "the role or layout of RAM at 0x0200A1B0",
            "the meanings and widths of ED, FA, F9, and F1 control candidates",
            "the character-code to glyph mapping",
        ],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
