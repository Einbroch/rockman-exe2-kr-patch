#!/usr/bin/env python3
"""Seed protected, non-text translation candidates from the Rev 1 catalog."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    if catalog.get("scope", {}).get("rom_sha256") != EXPECTED_ROM_SHA256:
        raise ValueError("catalog does not identify the supported Rev 1 ROM")
    blocks = []
    for record in catalog.get("records", []):
        if not record.get("structural_signals", {}).get("script_like"):
            continue
        entries = []
        for subentry in record.get("subentries", []):
            entries.append(
                {
                    "entry_id": subentry["id"],
                    "source_rom_offset": subentry["source_rom_offset"],
                    "source_byte_length": subentry["byte_length"],
                    "source_sha256": subentry["source_sha256"],
                    "shared_start_with_previous": subentry["shared_start_with_previous"],
                    "status": "blocked_control_spec",
                    "translation_ko": "",
                    "notes": "Control-code boundary and source decoding are not yet complete.",
                }
            )
        blocks.append(
            {
                "block_id": record["id"],
                "source_rom_offset": record["source_rom_offset"],
                "source_byte_length": record["byte_length"],
                "source_sha256": record["source_sha256"],
                "catalog_status": record["status"],
                "entries": entries,
            }
        )
    document = {
        "schema_version": 1,
        "kind": "protected_translation_candidate_workspace",
        "source": {
            "catalog_filename": args.catalog.name,
            "rom_sha256": EXPECTED_ROM_SHA256,
            "selection": "all_catalog_records_marked_script_like",
        },
        "summary": {
            "candidate_block_count": len(blocks),
            "candidate_entry_count": sum(len(block["entries"]) for block in blocks),
            "status_counts": {"blocked_control_spec": sum(len(block["entries"]) for block in blocks)},
        },
        "blocks": blocks,
        "editing_policy": {
            "protected_fields": [
                "entry_id",
                "source_rom_offset",
                "source_byte_length",
                "source_sha256",
                "shared_start_with_previous",
            ],
            "editable_fields": ["translation_ko", "status", "notes"],
            "build_eligible_status": "complete",
        },
        "limitations": [
            "These are structural candidate entries, not a completed text population.",
            "No raw source bytes, decoded original text, or game assets are stored here.",
            "Every entry is blocked until a control-code specification and source decoder prove its editable boundary.",
        ],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(document, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
