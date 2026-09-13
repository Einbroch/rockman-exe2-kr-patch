#!/usr/bin/env python3
"""Rank metadata-only direct-literal blocks suitable for future state capture."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_table(block: bytes) -> list[int] | None:
    if len(block) < 4:
        return None
    table_bytes = struct.unpack_from("<H", block)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(block):
        return None
    table = [struct.unpack_from("<H", block, offset)[0] for offset in range(0, table_bytes, 2)]
    if table[0] != table_bytes or any(left > right for left, right in zip(table, table[1:])):
        return None
    return table


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--literal-audit", type=Path, required=True)
    parser.add_argument("--exclude-id", action="append", default=[])
    parser.add_argument("--limit", type=int, default=20)
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    if sha256(rom) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    catalog_bytes = args.catalog.read_bytes()
    audit_bytes = args.literal_audit.read_bytes()
    catalog = json.loads(catalog_bytes)
    audit = json.loads(audit_bytes)
    records = {row.get("id"): row for row in catalog.get("records", []) if isinstance(row, dict) and isinstance(row.get("id"), str)}
    literal_rows = audit.get("blocks_with_direct_pc_relative_literal_load")
    if not isinstance(literal_rows, list):
        raise ValueError("literal audit has no direct-literal rows")
    excluded = set(args.exclude_id)
    candidates = []
    for literal_row in literal_rows:
        if not isinstance(literal_row, dict) or not isinstance(literal_row.get("id"), str):
            continue
        block_id = literal_row["id"]
        if block_id in excluded:
            continue
        record = records.get(block_id)
        references = literal_row.get("literal_load_references")
        if record is None or not isinstance(references, list) or not references:
            continue
        offset, length = record.get("source_rom_offset"), record.get("byte_length")
        if not isinstance(offset, int) or not isinstance(length, int):
            continue
        block = rom[offset:offset + length]
        if len(block) != length or sha256(block) != record.get("source_sha256"):
            raise ValueError(f"catalog integrity failure for {block_id}")
        table = parse_table(block)
        if table is None or len(table) < 2:
            continue
        boundary_count = sum(
            1
            for start, end in zip(table, table[1:])
            for relative in range(1, end - start)
            if block[start + relative - 1] < 0xE5 <= block[start + relative]
        )
        if boundary_count == 0:
            continue
        candidates.append(
            {
                "id": block_id,
                "source_rom_offset": offset,
                "byte_length": length,
                "entry_count": len(table) - 1,
                "direct_literal_consumer_count": len(references),
                "verified_direct_glyph_control_boundary_count": boundary_count,
                "runtime_state_source_pointer_occurrence_count": record.get("runtime_state_source_pointer_occurrence_count", 0),
            }
        )
    candidates.sort(
        key=lambda row: (
            -int(row["runtime_state_source_pointer_occurrence_count"] or 0),
            -row["direct_literal_consumer_count"],
            -row["verified_direct_glyph_control_boundary_count"],
            row["source_rom_offset"],
        )
    )
    limited = candidates[:args.limit]
    report = {
        "schema_version": 1,
        "kind": "direct_literal_state_capture_target_queue",
        "input": {"filename": args.rom.name, "sha256": sha256(rom)},
        "catalog": {"filename": args.catalog.name, "sha256": sha256(catalog_bytes)},
        "literal_audit": {"filename": args.literal_audit.name, "sha256": sha256(audit_bytes)},
        "criteria": {
            "required": ["direct PC-relative literal consumer", "valid u16 entry-offset table", "at least one direct-glyph/control insertion boundary"],
            "excluded_ids": sorted(excluded),
            "state_capture_requirement": "A future state must independently show this block's source pointer or exact catalog fragment before a PoC is built.",
        },
        "summary": {"eligible_before_limit": len(candidates), "returned": len(limited)},
        "candidates": limited,
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Direct-literal state-capture target queue",
        "",
        "Metadata-only target ranking; no source game text or assets are included.",
        "",
        f"- Eligible before limit: {len(candidates)}",
        f"- Returned targets: {len(limited)}",
        "- Every returned target still needs independent runtime state evidence before a PoC build.",
    ]
    args.output_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
