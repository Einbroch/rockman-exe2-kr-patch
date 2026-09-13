#!/usr/bin/env python3
"""Classify exact aligned ROM-pointer words for every catalog block.

The census is structural only: it records offsets, counts, and audit
membership. It does not infer that every word is a live consumer and never
serializes game text or byte payloads.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


ROM_BASE = 0x08000000


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--literal-audit", type=Path, required=True)
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    catalog_bytes = args.catalog.read_bytes()
    audit_bytes = args.literal_audit.read_bytes()
    catalog = json.loads(catalog_bytes)
    audit = json.loads(audit_bytes)
    records = [record for record in catalog["records"] if record.get("source_rom_offset") is not None]
    expected = {}
    for record in records:
        expected.setdefault(ROM_BASE + record["source_rom_offset"], []).append(record["id"])
    matches = {record["id"]: [] for record in records}
    for offset in range(0, len(rom) - 3, 4):
        value = struct.unpack_from("<I", rom, offset)[0]
        for record_id in expected.get(value, []):
            matches[record_id].append(offset)
    direct_by_id = {
        row["id"]: sorted({reference["literal_offset"] for reference in row["literal_load_references"]})
        for row in audit["blocks_with_direct_pc_relative_literal_load"]
    }
    rows = []
    unclassified_targets_by_offset = {}
    for record in sorted(records, key=lambda item: (item["source_rom_offset"], item["id"])):
        all_offsets = matches[record["id"]]
        direct_offsets = direct_by_id.get(record["id"], [])
        if any(offset not in all_offsets for offset in direct_offsets):
            raise ValueError("literal audit offset does not contain its catalog block pointer")
        indirect_or_unclassified = sorted(set(all_offsets) - set(direct_offsets))
        for offset in indirect_or_unclassified:
            unclassified_targets_by_offset.setdefault(offset, []).append(record["id"])
        rows.append(
            {
                "id": record["id"],
                "source_rom_offset": record["source_rom_offset"],
                "source_byte_length": record["byte_length"],
                "exact_aligned_pointer_word_count": len(all_offsets),
                "exact_aligned_pointer_word_rom_offsets": all_offsets,
                "direct_pc_relative_literal_word_count": len(direct_offsets),
                "direct_pc_relative_literal_word_rom_offsets": direct_offsets,
                "unclassified_or_data_pointer_word_count": len(indirect_or_unclassified),
                "unclassified_or_data_pointer_word_rom_offsets": indirect_or_unclassified,
            }
        )
    candidate_table_runs = []
    sorted_unclassified_offsets = sorted(unclassified_targets_by_offset)
    run = []
    for offset in sorted_unclassified_offsets:
        if run and offset != run[-1] + 4:
            if len(run) >= 2:
                candidate_table_runs.append(
                    {
                        "start_rom_offset": run[0],
                        "end_rom_offset_exclusive": run[-1] + 4,
                        "word_count": len(run),
                        "target_block_ids": [
                            block_id for member in run for block_id in unclassified_targets_by_offset[member]
                        ],
                    }
                )
            run = []
        run.append(offset)
    if len(run) >= 2:
        candidate_table_runs.append(
            {
                "start_rom_offset": run[0],
                "end_rom_offset_exclusive": run[-1] + 4,
                "word_count": len(run),
                "target_block_ids": [block_id for member in run for block_id in unclassified_targets_by_offset[member]],
            }
        )
    summary = {
        "catalog_block_count": len(rows),
        "blocks_with_exact_aligned_pointer_word": sum(row["exact_aligned_pointer_word_count"] > 0 for row in rows),
        "blocks_with_direct_pc_relative_literal": sum(row["direct_pc_relative_literal_word_count"] > 0 for row in rows),
        "blocks_with_only_unclassified_or_data_pointer_words": sum(
            row["exact_aligned_pointer_word_count"] > 0 and row["direct_pc_relative_literal_word_count"] == 0
            for row in rows
        ),
        "blocks_without_start_pointer_word": sum(row["exact_aligned_pointer_word_count"] == 0 for row in rows),
        "exact_aligned_pointer_word_total": sum(row["exact_aligned_pointer_word_count"] for row in rows),
        "direct_pc_relative_literal_word_total": sum(row["direct_pc_relative_literal_word_count"] for row in rows),
        "unclassified_or_data_pointer_word_total": sum(row["unclassified_or_data_pointer_word_count"] for row in rows),
        "candidate_contiguous_pointer_table_run_count": len(candidate_table_runs),
        "candidate_contiguous_pointer_table_word_total": sum(item["word_count"] for item in candidate_table_runs),
    }
    report = {
        "schema_version": 1,
        "kind": "catalog_block_start_pointer_word_census",
        "input": {"filename": args.rom.name, "sha256": digest(rom), "byte_length": len(rom)},
        "catalog": {"filename": args.catalog.name, "sha256": digest(catalog_bytes)},
        "literal_audit": {"filename": args.literal_audit.name, "sha256": digest(audit_bytes)},
        "summary": summary,
        "records": rows,
        "candidate_contiguous_unclassified_pointer_table_runs": candidate_table_runs,
        "interpretation_notice": (
            "An exact aligned word equal to a block start is a structural reference candidate only. "
            "It is not proof that the word is live, is a pointer table, or can safely be repointed."
        ),
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    md = [
        "# Catalog block-start pointer-word census",
        "",
        "Metadata-only structural census; no game text is included.",
        "",
    ]
    for key, value in summary.items():
        md.append(f"- {key}: {value}")
    md.extend(
        [
            "",
            "Exact aligned words are reference candidates, not confirmed live consumers. "
            "Only the separately audited direct PC-relative literal subset is safe for the current guarded relocation path.",
        ]
    )
    args.output_md.write_text("\n".join(md) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
