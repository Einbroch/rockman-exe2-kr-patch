#!/usr/bin/env python3
"""Audit the fixed 0xE7..0xFF font-stream indirect-handler table.

The report contains only code addresses and instruction-derived metadata; it
does not export any message stream bytes or graphics assets.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from find_thumb_bl_target_refs import thumb_bl_target


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ROM_CPU_BASE = 0x08000000
TABLE_LITERAL_OFFSET = 0x20F54
TABLE_OFFSET = 0x20F8C
FIRST_OPCODE = 0xE7
LAST_OPCODE = 0xFF
FONT_INDEXER_OFFSET = 0x20D84


def halfword(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<H", rom, offset)[0]


def u32(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<I", rom, offset)[0]


def thumb_bl_target_at(rom: bytes, offset: int) -> int | None:
    first = halfword(rom, offset)
    second = halfword(rom, offset + 2)
    if (first & 0xF800, second & 0xF800) != (0xF000, 0xF800):
        return None
    return thumb_bl_target(offset, first, second)


def inspect_local_code(rom: bytes, handler: int, window: int) -> dict[str, object]:
    """Collect local syntax markers without assigning control-code semantics.

    The indirect entries can target internal basic blocks, so this bounded scan
    intentionally does not pretend to determine a function boundary.
    """
    end = min(len(rom) - 2, handler + window)
    r4_add_immediates: list[dict[str, int]] = []
    r4_byte_loads: list[dict[str, int]] = []
    bl_targets: list[dict[str, int]] = []
    exit_branches: list[dict[str, int]] = []
    for offset in range(handler, end, 2):
        instruction = halfword(rom, offset)
        # ADD r4, #imm8
        if (instruction & 0xFF00) == 0x3400:
            r4_add_immediates.append({"rom_offset": offset, "immediate": instruction & 0xFF})
        # LDRB Rd, [r4, #imm5]
        if (instruction & 0xF800) == 0x7800 and ((instruction >> 3) & 7) == 4:
            r4_byte_loads.append({"rom_offset": offset, "immediate": (instruction >> 6) & 0x1F})
        target = thumb_bl_target_at(rom, offset) if offset + 4 <= len(rom) else None
        if target is not None:
            bl_targets.append({"rom_offset": offset, "target_rom_offset": target})
        # Unconditional Thumb B; retain only its destination address.
        if (instruction & 0xF800) == 0xE000:
            displacement = (instruction & 0x7FF) << 1
            if displacement & 0x800:
                displacement -= 0x1000
            exit_branches.append({"rom_offset": offset, "target_rom_offset": offset + 4 + displacement})
    return {
        "scan_window_bytes": window,
        "r4_add_immediates": r4_add_immediates,
        "r4_byte_loads": r4_byte_loads,
        "bl_targets": bl_targets,
        "unconditional_branch_targets": exit_branches,
        "direct_font_indexer_call_offsets": [
            item["rom_offset"] for item in bl_targets if item["target_rom_offset"] == FONT_INDEXER_OFFSET
        ],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--scan-window", type=lambda value: int(value, 0), default=0x80)
    args = parser.parse_args()
    if args.scan_window <= 0 or args.scan_window % 2:
        raise ValueError("--scan-window must be a positive, even byte count")

    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")
    if halfword(rom, 0x20C7A) != 0x4AB6 or u32(rom, TABLE_LITERAL_OFFSET) != ROM_CPU_BASE + TABLE_OFFSET:
        raise ValueError("the verified font-control table reference is not present")

    entries = []
    for opcode in range(FIRST_OPCODE, LAST_OPCODE + 1):
        entry_offset = TABLE_OFFSET + (opcode - FIRST_OPCODE) * 4
        target_cpu_address = u32(rom, entry_offset)
        if not target_cpu_address & 1:
            raise ValueError(f"non-Thumb handler entry for opcode {opcode:#x}")
        handler = (target_cpu_address & ~1) - ROM_CPU_BASE
        if not 0 <= handler < len(rom):
            raise ValueError(f"handler outside ROM for opcode {opcode:#x}")
        entries.append({
            "opcode": opcode,
            "table_entry_rom_offset": entry_offset,
            "handler_thumb_cpu_address": target_cpu_address,
            "handler_rom_offset": handler,
            "local_structure": inspect_local_code(rom, handler, args.scan_window),
        })

    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest},
        "table": {
            "opcode_range": [FIRST_OPCODE, LAST_OPCODE],
            "entry_count": len(entries),
            "literal_rom_offset": TABLE_LITERAL_OFFSET,
            "table_rom_offset": TABLE_OFFSET,
            "font_indexer_rom_offset": FONT_INDEXER_OFFSET,
        },
        "entries": entries,
        "interpretation_notice": (
            "Each entry is a verified indirect branch target. The bounded local scan records instruction syntax only; "
            "r4-related markers do not by themselves establish a message-cursor advance, handler extent, or opcode meaning."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
