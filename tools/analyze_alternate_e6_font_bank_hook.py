#!/usr/bin/env python3
"""Produce a metadata-only feasibility record for an alternate E6 font bank."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


ROM_BASE = 0x08000000
FONT_INDEXER_OFFSET = 0x020D84
FONT_INDEXER_CONTINUATION_OFFSET = 0x020D8C
FONT_BASE_LITERAL_OFFSET = 0x020F68
FONT_BASE = 0x086973B0
ALTERNATE_FIRST_INDEX = 512
ALTERNATE_LAST_INDEX = 740
FONT_RECORD_BYTES = 64


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    parser.add_argument("--proposed-bank-rom-offset", type=lambda value: int(value, 0), default=0x800000)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    if struct.unpack_from("<I", rom, FONT_BASE_LITERAL_OFFSET)[0] != FONT_BASE:
        raise ValueError("font base literal does not match the verified Rev 1 font base")
    overwritten = rom[FONT_INDEXER_OFFSET:FONT_INDEXER_CONTINUATION_OFFSET]
    if len(overwritten) != 8:
        raise AssertionError("unexpected font-indexer hook span")
    bank_count = ALTERNATE_LAST_INDEX - ALTERNATE_FIRST_INDEX + 1
    bank_bytes = bank_count * FONT_RECORD_BYTES
    bank_end = args.proposed_bank_rom_offset + bank_bytes
    if args.proposed_bank_rom_offset < len(rom) or args.proposed_bank_rom_offset % 4:
        raise ValueError("proposed alternate bank must begin at an aligned appended-ROM offset")
    adjusted_base = ROM_BASE + args.proposed_bank_rom_offset - ALTERNATE_FIRST_INDEX * FONT_RECORD_BYTES
    report = {
        "schema_version": 1,
        "kind": "static_alternate_e6_font_bank_hook_feasibility",
        "input": {"filename": args.rom.name, "sha256": sha256(rom), "byte_length": len(rom)},
        "verified_existing_path": {
            "font_indexer_rom_offset": FONT_INDEXER_OFFSET,
            "font_indexer_hook_span_byte_length": len(overwritten),
            "font_indexer_hook_span_sha256": sha256(overwritten),
            "continuation_rom_offset": FONT_INDEXER_CONTINUATION_OFFSET,
            "font_base_literal_rom_offset": FONT_BASE_LITERAL_OFFSET,
            "font_base_pointer": f"{FONT_BASE:08X}",
            "font_record_byte_length": FONT_RECORD_BYTES,
        },
        "alternate_e6_bank": {
            "index_range": [ALTERNATE_FIRST_INDEX, ALTERNATE_LAST_INDEX],
            "record_count": bank_count,
            "byte_length": bank_bytes,
            "proposed_bank_rom_offset": args.proposed_bank_rom_offset,
            "proposed_bank_end_rom_offset_exclusive": bank_end,
            "index_times_record_size_adjusted_base_pointer": f"{adjusted_base:08X}",
            "selection_predicate": "font_record_index >= 512",
        },
        "hook_design": {
            "required_behavior": [
                "preserve the incoming font record index until its existing 64-byte scaling step",
                "select the original base below index 512",
                "select the adjusted alternate base at or above index 512",
                "resume at the verified continuation after reproducing the overwritten setup instructions",
            ],
            "minimum_trampoline_requirements": [
                "Thumb entry trampoline from the eight-byte hook span",
                "preservation of original register/flag effects needed by the continuation",
                "a literal or equivalent address construction for the alternate adjusted base",
            ],
        },
        "limitations": [
            "This is static feasibility only; it does not provide executable hook bytes or modify a ROM.",
            "The existing E6 transport reaches this range, but token collision and non-dialogue consumers remain unresolved.",
            "Appended-ROM mapping and the trampoline's register/flag behavior require emulator validation before any production use.",
        ],
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Alternate E6 font-bank hook feasibility",
        "",
        "Metadata-only static design; no source text, glyphs, or executable patch bytes are included.",
        "",
        f"- Existing indexer hook span: `0x{FONT_INDEXER_OFFSET:06X}`–`0x{FONT_INDEXER_CONTINUATION_OFFSET:06X}` (8 bytes)",
        f"- Alternate index range: {ALTERNATE_FIRST_INDEX}–{ALTERNATE_LAST_INDEX}",
        f"- Alternate records: {bank_count}",
        f"- Alternate bank bytes: {bank_bytes}",
        f"- Proposed appended bank: `0x{args.proposed_bank_rom_offset:06X}`–`0x{bank_end:06X}`",
        "",
        "The proposed hook selects the existing font base below index 512 and an adjusted appended-bank base at or above it. "
        "It is a feasibility design only: transport collisions, appended-ROM mapping, and trampoline behavior still require runtime proof.",
    ]
    args.output_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
