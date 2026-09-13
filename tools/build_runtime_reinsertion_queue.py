#!/usr/bin/env python3
"""Rank metadata-only next-block candidates for bounded reinsertion PoCs."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--literal-audit", type=Path, required=True)
    parser.add_argument("--exclude-id", action="append", default=[])
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    args = parser.parse_args()

    catalog_bytes = args.catalog.read_bytes()
    literal_bytes = args.literal_audit.read_bytes()
    catalog = json.loads(catalog_bytes)
    literal_audit = json.loads(literal_bytes)
    if catalog.get("input", {}).get("sha256") not in (None, EXPECTED_ROM_SHA256):
        raise ValueError("catalog does not identify the supported Rev 1 ROM")
    records = catalog.get("records")
    literals = literal_audit.get("blocks_with_direct_pc_relative_literal_load")
    if not isinstance(records, list) or not isinstance(literals, list):
        raise ValueError("required catalog or literal-audit rows are absent")
    literal_rows = {row.get("id"): row for row in literals if isinstance(row, dict) and isinstance(row.get("id"), str)}
    excluded = set(args.exclude_id)
    candidates = []
    rejected = {"no_runtime_pointer": 0, "no_direct_literal_consumer": 0, "excluded": 0}
    for record in records:
        if not isinstance(record, dict) or not isinstance(record.get("id"), str):
            continue
        block_id = record["id"]
        pointer_count = record.get("runtime_state_source_pointer_occurrence_count", 0)
        if not isinstance(pointer_count, int) or pointer_count <= 0:
            rejected["no_runtime_pointer"] += 1
            continue
        literal_row = literal_rows.get(block_id)
        references = literal_row.get("literal_load_references") if isinstance(literal_row, dict) else None
        if not isinstance(references, list) or not references:
            rejected["no_direct_literal_consumer"] += 1
            continue
        if block_id in excluded:
            rejected["excluded"] += 1
            continue
        candidates.append(
            {
                "id": block_id,
                "source_rom_offset": record.get("source_rom_offset"),
                "byte_length": record.get("byte_length"),
                "runtime_state_source_pointer_occurrence_count": pointer_count,
                "direct_literal_consumer_count": len(references),
                "subentry_count": len(record.get("subentries", [])) if isinstance(record.get("subentries"), list) else 0,
                "status": record.get("status"),
            }
        )
    candidates.sort(key=lambda row: (-row["runtime_state_source_pointer_occurrence_count"], -row["direct_literal_consumer_count"], row["source_rom_offset"]))
    report = {
        "schema_version": 1,
        "kind": "runtime_observed_direct_literal_reinsertion_queue",
        "catalog": {"filename": args.catalog.name, "sha256": sha256(catalog_bytes)},
        "literal_audit": {"filename": args.literal_audit.name, "sha256": sha256(literal_bytes)},
        "criteria": {
            "required": ["runtime state start-pointer occurrence", "direct PC-relative literal consumer"],
            "excluded_ids": sorted(excluded),
            "not_proven_by_queue": ["specific state file availability", "entry boundary suitability", "relocation padding", "font-slot safety", "runtime rendering"],
        },
        "summary": {"candidate_count": len(candidates), "rejected": rejected},
        "candidates": candidates,
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Runtime-observed reinsertion queue",
        "",
        "Metadata-only candidate ranking; no source game text or assets are included.",
        "",
        f"- Candidates after filters: {len(candidates)}",
        f"- Excluded block IDs: {', '.join(sorted(excluded)) if excluded else '(none)'}",
        "- Required per candidate: runtime start-pointer occurrence and a direct PC-relative literal consumer.",
        "- This queue is not a safety proof; each candidate still needs state, boundary, relocation, and emulator checks.",
    ]
    args.output_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
