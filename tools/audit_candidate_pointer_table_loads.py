#!/usr/bin/env python3
"""Audit PC-relative code literals that name candidate pointer-table ranges.

This is a static evidence pass. It reports instruction and literal offsets but
does not claim table semantics, liveness, or complete consumer coverage.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


ROM_BASE = 0x08000000


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def table_for_address(tables: list[dict[str, object]], address: int) -> tuple[int, dict[str, object]] | None:
    rom_offset = address - ROM_BASE
    for index, table in enumerate(tables):
        if int(table["start_rom_offset"]) <= rom_offset < int(table["end_rom_offset_exclusive"]):
            return index, table
    return None


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--pointer-census", type=Path, required=True)
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    census_bytes = args.pointer_census.read_bytes()
    census = json.loads(census_bytes)
    tables = census["candidate_contiguous_unclassified_pointer_table_runs"]
    consumers = [[] for _ in tables]

    # Thumb LDR (literal): 01001 Rt imm8.
    for instruction_offset in range(0, len(rom) - 1, 2):
        instruction = struct.unpack_from("<H", rom, instruction_offset)[0]
        if instruction & 0xF800 != 0x4800:
            continue
        literal_offset = ((instruction_offset + 4) & ~3) + (instruction & 0xFF) * 4
        if literal_offset + 4 > len(rom):
            continue
        value = struct.unpack_from("<I", rom, literal_offset)[0]
        hit = table_for_address(tables, value)
        if hit is None:
            continue
        index, table = hit
        consumers[index].append(
            {
                "architecture": "thumb",
                "instruction_rom_offset": instruction_offset,
                "literal_word_rom_offset": literal_offset,
                "destination_register": instruction & 0x7,
                "loaded_table_rom_offset": value - ROM_BASE,
                "loaded_table_relative_offset": value - ROM_BASE - int(table["start_rom_offset"]),
            }
        )

    # ARM single-data-transfer LDR [pc, #+/-imm12] literal form.
    for instruction_offset in range(0, len(rom) - 3, 4):
        instruction = struct.unpack_from("<I", rom, instruction_offset)[0]
        if (instruction & 0x0E100000) != 0x04100000:  # class, immediate, load
            continue
        if ((instruction >> 16) & 0xF) != 0xF or not (instruction & (1 << 24)):
            continue
        displacement = instruction & 0xFFF
        literal_offset = instruction_offset + 8 + (displacement if instruction & (1 << 23) else -displacement)
        if literal_offset < 0 or literal_offset + 4 > len(rom):
            continue
        value = struct.unpack_from("<I", rom, literal_offset)[0]
        hit = table_for_address(tables, value)
        if hit is None:
            continue
        index, table = hit
        consumers[index].append(
            {
                "architecture": "arm",
                "instruction_rom_offset": instruction_offset,
                "literal_word_rom_offset": literal_offset,
                "destination_register": (instruction >> 12) & 0xF,
                "loaded_table_rom_offset": value - ROM_BASE,
                "loaded_table_relative_offset": value - ROM_BASE - int(table["start_rom_offset"]),
            }
        )
    rows = []
    for table, table_consumers in zip(tables, consumers, strict=True):
        rows.append({**table, "pc_relative_literal_consumer_count": len(table_consumers), "consumers": table_consumers})
    summary = {
        "candidate_table_count": len(rows),
        "tables_with_pc_relative_literal_consumer": sum(row["pc_relative_literal_consumer_count"] > 0 for row in rows),
        "pc_relative_literal_consumer_total": sum(row["pc_relative_literal_consumer_count"] for row in rows),
    }
    report = {
        "schema_version": 1,
        "kind": "candidate_pointer_table_pc_relative_literal_audit",
        "input": {"filename": args.rom.name, "sha256": sha256(rom), "byte_length": len(rom)},
        "pointer_census": {"filename": args.pointer_census.name, "sha256": sha256(census_bytes)},
        "summary": summary,
        "tables": rows,
        "interpretation_notice": (
            "A PC-relative load naming a candidate table range establishes only a static address-flow candidate. "
            "It does not prove the table is live, that every entry is consumed as a pointer, or that all consumers are found."
        ),
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Candidate pointer-table PC-relative literal audit",
        "",
        "Metadata-only static evidence; no game text is included.",
        "",
        f"- Candidate tables: {summary['candidate_table_count']}",
        f"- Tables with a PC-relative literal consumer: {summary['tables_with_pc_relative_literal_consumer']}",
        f"- Candidate consumers: {summary['pc_relative_literal_consumer_total']}",
        "",
        "This narrows static candidates only. Runtime state evidence and bounded output validation remain mandatory before any pointer-table update.",
    ]
    args.output_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
