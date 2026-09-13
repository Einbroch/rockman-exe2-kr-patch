#!/usr/bin/env python3
"""Build a metadata-only translation/reinsertion work inventory.

No source message bytes, decoded text, glyphs, or translations are emitted.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--literal-audit", type=Path, required=True)
    parser.add_argument("--pointer-census", type=Path, required=True)
    parser.add_argument("--pointer-table-audit", type=Path, required=True)
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    args = parser.parse_args()
    catalog_bytes = args.catalog.read_bytes()
    literal_bytes = args.literal_audit.read_bytes()
    census_bytes = args.pointer_census.read_bytes()
    table_bytes = args.pointer_table_audit.read_bytes()
    catalog = json.loads(catalog_bytes)
    literal = json.loads(literal_bytes)
    census = json.loads(census_bytes)
    table_audit = json.loads(table_bytes)
    direct_ids = {row["id"] for row in literal["blocks_with_direct_pc_relative_literal_load"]}
    census_by_id = {row["id"]: row for row in census["records"]}
    table_code_loaded_ids = set()
    table_unloaded_ids = set()
    for table in table_audit["tables"]:
        target = table_code_loaded_ids if table["pc_relative_literal_consumer_count"] else table_unloaded_ids
        target.update(table["target_block_ids"])
    entries = []
    for record in catalog["records"]:
        block_id = record["id"]
        if block_id in direct_ids:
            route = "direct_pc_relative_literal"
        elif block_id in table_code_loaded_ids:
            route = "candidate_pointer_table_with_static_code_load"
        elif block_id in table_unloaded_ids:
            route = "candidate_pointer_table_without_static_code_load"
        elif census_by_id.get(block_id, {}).get("exact_aligned_pointer_word_count", 0):
            route = "unclassified_start_pointer_word"
        else:
            route = "no_observed_block_start_pointer_word"
        for subentry in record.get("subentries", []):
            entries.append(
                {
                    "id": subentry["id"],
                    "block_id": block_id,
                    "source_rom_offset": subentry["source_rom_offset"],
                    "source_byte_length": subentry["byte_length"],
                    "source_sha256": subentry["source_sha256"],
                    "canonical_for_translation": not subentry["shared_start_with_previous"],
                    "reinsertion_route": route,
                    "runtime_state_evidence_required": True,
                    "translation_status": "unassigned",
                    "reinsertion_status": "unplanned",
                }
            )
    route_counts = Counter(entry["reinsertion_route"] for entry in entries)
    canonical_count = sum(entry["canonical_for_translation"] for entry in entries)
    report = {
        "schema_version": 1,
        "kind": "metadata_only_translation_reinsertion_inventory",
        "catalog": {"filename": args.catalog.name, "sha256": sha256(catalog_bytes)},
        "literal_audit": {"filename": args.literal_audit.name, "sha256": sha256(literal_bytes)},
        "pointer_census": {"filename": args.pointer_census.name, "sha256": sha256(census_bytes)},
        "pointer_table_audit": {"filename": args.pointer_table_audit.name, "sha256": sha256(table_bytes)},
        "summary": {
            "subentry_count": len(entries),
            "canonical_translation_entry_count": canonical_count,
            "shared_start_noncanonical_entry_count": len(entries) - canonical_count,
            "entry_count_by_reinsertion_route": dict(sorted(route_counts.items())),
            "warning": (
                "Source byte length is an observation, not a Korean target capacity. "
                "Every translated entry still needs encoding, control-code, relocation, and runtime validation."
            ),
        },
        "entries": entries,
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Translation/reinsertion metadata inventory",
        "",
        "This inventory intentionally contains IDs, offsets, hashes, byte lengths, and routing metadata only.",
        "It contains no extracted game messages or translations.",
        "",
        f"- Subentries: {len(entries)}",
        f"- Canonical translation entries: {canonical_count}",
        f"- Shared-start noncanonical entries: {len(entries) - canonical_count}",
        "",
        "## Reinsertion-route counts",
        "",
    ]
    lines.extend(f"- {route}: {count}" for route, count in sorted(route_counts.items()))
    lines.extend(
        [
            "",
            "A route is structural planning metadata, not runtime proof. Runtime evidence remains required before a block is edited.",
        ]
    )
    args.output_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
