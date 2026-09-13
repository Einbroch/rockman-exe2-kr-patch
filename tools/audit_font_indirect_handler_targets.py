#!/usr/bin/env python3
"""Audit statically selected target tables behind selected control opcodes.

Only dispatch metadata, target addresses, and bounded cursor-flow results are
written. No message bytes, glyphs, palette data, or instruction listings are
exported.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from trace_font_control_handler_cfg import EXPECTED_ROM_SHA256, ROM_CPU_BASE, trace_handler


DISPATCHES = (
    {
        "opcode": 0xF1,
        "handler_rom_offset": 0x21404,
        "table_literal_rom_offset": 0x21418,
        "parameter_offset": 1,
        "selector_model": "parameter_aligned_down_to_multiple_of_4",
        "selector_values": (0, 4),
    },
    {
        "opcode": 0xF3,
        "handler_rom_offset": 0x214F4,
        "table_literal_rom_offset": 0x21504,
        "parameter_offset": 1,
        "selector_model": "parameter_byte_word_offset",
        "selector_values": tuple(range(0, 40, 4)),
    },
    {
        "opcode": 0xF8,
        "handler_rom_offset": 0x219F0,
        "table_literal_rom_offset": 0x21A00,
        "parameter_offset": 1,
        "selector_model": "parameter_byte_word_offset",
        "selector_values": tuple(range(0, 20, 4)),
    },
    {
        "opcode": 0xFA,
        "handler_rom_offset": 0x21C98,
        "table_literal_rom_offset": 0x21CA8,
        "parameter_offset": 1,
        "selector_model": "parameter_byte_word_offset",
        "selector_values": tuple(range(0, 40, 4)),
    },
)


def u32(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<I", rom, offset)[0]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--max-states", type=int, default=1024)
    parser.add_argument("--max-span", type=lambda value: int(value, 0), default=0x1000)
    args = parser.parse_args()
    if args.max_states <= 0 or args.max_span <= 0:
        raise ValueError("--max-states and --max-span must be positive")

    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")

    entries = []
    all_candidates = []
    for dispatch in DISPATCHES:
        table_cpu_address = u32(rom, dispatch["table_literal_rom_offset"])
        if not ROM_CPU_BASE <= table_cpu_address < ROM_CPU_BASE + len(rom):
            raise ValueError(f"opcode {dispatch['opcode']:#x} table outside ROM")
        table_rom_offset = table_cpu_address - ROM_CPU_BASE
        if not 0 <= table_rom_offset < len(rom):
            raise ValueError(f"opcode {dispatch['opcode']:#x} table outside ROM")

        targets = []
        for selector in dispatch["selector_values"]:
            target_cpu_address = u32(rom, table_rom_offset + selector)
            if not (target_cpu_address & 1):
                raise ValueError(
                    f"opcode {dispatch['opcode']:#x} selector {selector:#x} is not a Thumb target"
                )
            target_rom_offset = (target_cpu_address & ~1) - ROM_CPU_BASE
            if not 0 <= target_rom_offset < len(rom):
                raise ValueError(
                    f"opcode {dispatch['opcode']:#x} selector {selector:#x} target outside ROM"
                )
            trace = trace_handler(rom, target_rom_offset, args.max_states, args.max_span)
            target = {
                "selector_value": selector,
                "target_thumb_cpu_address": target_cpu_address,
                "target_rom_offset": target_rom_offset,
                "local_trace": trace,
            }
            if trace["local_static_width_candidate"] is not None:
                all_candidates.append({
                    "opcode": dispatch["opcode"],
                    "selector_value": selector,
                    "width": trace["local_static_width_candidate"],
                })
            targets.append(target)

        entries.append({
            "opcode": dispatch["opcode"],
            "handler_rom_offset": dispatch["handler_rom_offset"],
            "parameter_offset": dispatch["parameter_offset"],
            "selector_model": dispatch["selector_model"],
            "table_literal_rom_offset": dispatch["table_literal_rom_offset"],
            "target_table_rom_offset": table_rom_offset,
            "target_count": len(targets),
            "targets": targets,
        })

    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest},
        "entries": entries,
        "summary": {
            "local_static_width_candidate_count": len(all_candidates),
            "local_static_width_candidates": all_candidates,
        },
        "interpretation_notice": (
            "A target candidate is a bounded local result after the dispatcher selects that target. "
            "It is neither a confirmed command specification nor authorization to alter command bytes. "
            "Runtime validation is still required for selector reachability and state effects."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
