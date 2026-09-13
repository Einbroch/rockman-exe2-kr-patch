#!/usr/bin/env python3
"""Audit candidate GBA message spans without exporting source text.

The candidate workspace may contain entries derived from overlapping PC map
records. This audit validates each recorded source hash against Rev 1, then
counts exact duplicates and distinct-range overlap relationships.
"""

from __future__ import annotations

import argparse
import hashlib
import heapq
import json
from collections import Counter
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


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
        raise ValueError("unexpected Rev 1 ROM SHA-256")
    workspace_bytes = args.workspace.read_bytes()
    workspace = json.loads(workspace_bytes)
    if workspace.get("source", {}).get("rom_sha256") != EXPECTED_ROM_SHA256:
        raise ValueError("workspace does not identify the supported Rev 1 ROM")

    spans: list[tuple[int, int, str]] = []
    status_counts: Counter[str] = Counter()
    invalid_ranges = 0
    hash_mismatches = 0
    for block in workspace.get("blocks", []):
        for entry in block.get("entries", []):
            offset = entry.get("source_rom_offset")
            length = entry.get("source_byte_length")
            digest = entry.get("source_sha256")
            status = entry.get("status")
            if not isinstance(offset, int) or not isinstance(length, int) or not isinstance(digest, str):
                raise ValueError("workspace contains a malformed entry")
            if offset < 0 or length <= 0 or offset + length > len(rom):
                invalid_ranges += 1
                continue
            if sha256(rom[offset:offset + length]) != digest:
                hash_mismatches += 1
            spans.append((offset, offset + length, digest))
            status_counts[str(status)] += 1
    if invalid_ranges or hash_mismatches:
        raise ValueError("workspace source ranges or hashes do not match the verified ROM")

    grouped: dict[tuple[int, int, str], int] = Counter(spans)
    unique_spans = sorted(grouped, key=lambda item: (item[0], item[1], item[2]))
    duplicate_group_counts = Counter(grouped.values())

    active: list[tuple[int, int, int, str]] = []
    relationship_counts: Counter[str] = Counter()
    spans_with_overlap: set[tuple[int, int, str]] = set()
    for span in unique_spans:
        start, end, digest = span
        while active and active[0][0] <= start:
            heapq.heappop(active)
        for active_end, active_start, _serial, active_digest in active:
            other = (active_start, active_end, active_digest)
            spans_with_overlap.add(span)
            spans_with_overlap.add(other)
            if active_start == start and active_end == end:
                relationship_counts["identical"] += 1
            elif active_start <= start and end <= active_end:
                relationship_counts["contained"] += 1
            elif start <= active_start and active_end <= end:
                relationship_counts["contains"] += 1
            else:
                relationship_counts["partial"] += 1
        heapq.heappush(active, (end, start, len(active), digest))

    report = {
        "schema_version": 1,
        "inputs": {
            "rom_filename": args.rom.name,
            "rom_sha256": sha256(rom),
            "workspace_filename": args.workspace.name,
            "workspace_sha256": sha256(workspace_bytes),
        },
        "validation": {
            "entry_source_hash_validation": "passed",
            "entry_range_validation": "passed",
        },
        "candidate_entries": {
            "total": len(spans),
            "status_counts": dict(sorted(status_counts.items())),
            "unique_exact_source_spans": len(unique_spans),
            "duplicate_entry_count": len(spans) - len(unique_spans),
            "duplicate_group_size_counts": {
                str(size): count for size, count in sorted(duplicate_group_counts.items()) if size > 1
            },
        },
        "distinct_span_overlap": {
            "unique_spans_with_any_overlap": len(spans_with_overlap),
            "relationship_pair_counts": dict(sorted(relationship_counts.items())),
            "interpretation": "Overlap counts concern distinct exact source spans only. Exact duplicate workspace entries are counted separately.",
        },
        "policy": {
            "translation_deduplication": "Translate only a canonical exact source span after control semantics and runtime reachability are verified.",
            "partial_or_containment_overlap": "Do not independently translate intersecting spans; retain blocked status until a canonical GBA boundary is proven.",
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
