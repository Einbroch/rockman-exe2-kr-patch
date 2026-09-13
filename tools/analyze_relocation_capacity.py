#!/usr/bin/env python3
"""Create a metadata-only capacity plan for bounded message-block relocation."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def constant_runs(data: bytes, minimum: int) -> list[dict[str, int | str]]:
    runs = []
    start = 0
    while start < len(data):
        value = data[start]
        end = start + 1
        while end < len(data) and data[end] == value:
            end += 1
        if end - start >= minimum and value in (0x00, 0xFF):
            runs.append(
                {
                    "start_rom_offset": start,
                    "end_rom_offset_exclusive": end,
                    "byte_length": end - start,
                    "fill_byte": f"{value:02X}",
                    "four_byte_aligned_start": (start + (-start % 4)),
                }
            )
        start = end
    return runs


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--literal-audit", type=Path, required=True)
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    parser.add_argument("--minimum-run-bytes", type=int, default=128)
    args = parser.parse_args()
    if args.minimum_run_bytes <= 0:
        raise ValueError("--minimum-run-bytes must be positive")
    rom = args.rom.read_bytes()
    catalog_bytes = args.catalog.read_bytes()
    audit_bytes = args.literal_audit.read_bytes()
    catalog = json.loads(catalog_bytes)
    audit = json.loads(audit_bytes)
    by_id = {record["id"]: record for record in catalog["records"]}
    direct_blocks = []
    for row in audit["blocks_with_direct_pc_relative_literal_load"]:
        record = by_id.get(row["id"])
        if record is None:
            raise ValueError("literal audit names an unknown catalog record")
        direct_blocks.append(
            {
                "id": record["id"],
                "source_rom_offset": record["source_rom_offset"],
                "source_byte_length": record["byte_length"],
                "direct_literal_consumer_count": len(row["literal_load_references"]),
            }
        )
    direct_blocks.sort(key=lambda item: (item["source_rom_offset"], item["id"]))
    runs = constant_runs(rom, args.minimum_run_bytes)
    direct_source_total = sum(item["source_byte_length"] for item in direct_blocks)
    plan = {
        "schema_version": 1,
        "kind": "metadata_only_relocation_capacity_plan",
        "input": {
            "filename": args.rom.name,
            "sha256": sha256(rom),
            "byte_length": len(rom),
        },
        "catalog": {"filename": args.catalog.name, "sha256": sha256(catalog_bytes)},
        "literal_audit": {"filename": args.literal_audit.name, "sha256": sha256(audit_bytes)},
        "direct_literal_block_summary": {
            "block_count": len(direct_blocks),
            "source_byte_total": direct_source_total,
            "blocks": direct_blocks,
        },
        "constant_padding_candidates": {
            "minimum_run_bytes": args.minimum_run_bytes,
            "candidate_count": len(runs),
            "total_byte_length": sum(item["byte_length"] for item in runs),
            "runs": runs,
            "warning": (
                "A constant run is only a candidate. This report does not establish that a run is unreferenced "
                "or safe to overwrite; each allocation needs its own consumer and runtime validation."
            ),
        },
        "planning_conclusion": {
            "direct_literal_source_bytes_exceed_all_constant_candidate_bytes": direct_source_total > sum(item["byte_length"] for item in runs),
            "recommendation": (
                "Use a separately validated relocation bank for broad coverage. Size it from measured translated "
                "output plus growth headroom; do not infer safety from constant padding alone."
            ),
        },
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(plan, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Relocation capacity plan",
        "",
        "Metadata-only static analysis; it contains no extracted game text.",
        "",
        f"- Direct-literal catalog blocks: {len(direct_blocks)}",
        f"- Their current source bytes: {direct_source_total}",
        f"- Constant-padding candidates at least {args.minimum_run_bytes} bytes: {len(runs)}",
        f"- Total candidate bytes: {sum(item['byte_length'] for item in runs)}",
        "",
        "The constant runs are not proven free. A dedicated relocation bank is required before broad reinsertion; "
        "its size must be derived from measured translated output and verified on the target emulator.",
    ]
    args.output_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
