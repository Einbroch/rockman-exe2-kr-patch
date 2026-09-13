#!/usr/bin/env python3
"""Verify protected translation-candidate fields against the supported ROM."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ALLOWED_STATUSES = {"blocked_control_spec", "untranslated", "in_progress", "needs_review", "needs_human_review", "complete"}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--workspace", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    if sha256(rom) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    workspace = json.loads(args.workspace.read_text(encoding="utf-8"))
    if workspace.get("kind") != "protected_translation_candidate_workspace":
        raise ValueError("unexpected workspace kind")
    seen_ids: set[str] = set()
    status_counts: dict[str, int] = {}
    entry_count = 0
    for block in workspace.get("blocks", []):
        for entry in block.get("entries", []):
            entry_id = entry.get("entry_id")
            if not isinstance(entry_id, str) or entry_id in seen_ids:
                raise ValueError("missing or duplicate entry ID")
            seen_ids.add(entry_id)
            status = entry.get("status")
            if status not in ALLOWED_STATUSES:
                raise ValueError(f"unsupported status for {entry_id}")
            offset = entry.get("source_rom_offset")
            length = entry.get("source_byte_length")
            if not isinstance(offset, int) or not isinstance(length, int) or offset < 0 or length < 0 or offset + length > len(rom):
                raise ValueError(f"invalid source range for {entry_id}")
            if sha256(rom[offset:offset + length]) != entry.get("source_sha256"):
                raise ValueError(f"protected source mismatch for {entry_id}")
            status_counts[status] = status_counts.get(status, 0) + 1
            entry_count += 1
    report = {
        "schema_version": 1,
        "workspace_filename": args.workspace.name,
        "workspace_entry_count": entry_count,
        "unique_entry_id_count": len(seen_ids),
        "status_counts": status_counts,
        "protected_source_hash_validation": "passed",
        "build_eligible_entry_count": status_counts.get("complete", 0),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
