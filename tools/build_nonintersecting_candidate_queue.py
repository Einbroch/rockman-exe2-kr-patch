#!/usr/bin/env python3
"""Build a metadata-only, non-intersecting candidate review queue.

This is a deduplicated staging artifact, not a translation-ready script. It
contains no source text and retains every entry in blocked_control_spec state.
"""

from __future__ import annotations

import argparse
import hashlib
import heapq
import json
from collections import defaultdict
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

    aliases: dict[tuple[int, int, str], int] = defaultdict(int)
    total_entries = 0
    for block in workspace.get("blocks", []):
        for entry in block.get("entries", []):
            total_entries += 1
            if entry.get("status") != "blocked_control_spec" or entry.get("translation_ko") != "":
                raise ValueError("source workspace is no longer an untouched blocked candidate set")
            offset = entry.get("source_rom_offset")
            length = entry.get("source_byte_length")
            digest = entry.get("source_sha256")
            if not isinstance(offset, int) or not isinstance(length, int) or not isinstance(digest, str):
                raise ValueError("workspace contains a malformed entry")
            if offset < 0 or length <= 0 or offset + length > len(rom):
                raise ValueError("workspace contains an out-of-range entry")
            if sha256(rom[offset:offset + length]) != digest:
                raise ValueError("workspace source hash does not match the verified ROM")
            aliases[(offset, offset + length, digest)] += 1

    unique_spans = sorted(aliases, key=lambda span: (span[0], span[1], span[2]))
    active: list[tuple[int, int, str]] = []
    intersecting: set[tuple[int, int, str]] = set()
    for span in unique_spans:
        start, end, digest = span
        while active and active[0][0] <= start:
            heapq.heappop(active)
        for active_end, active_start, active_digest in active:
            intersecting.add(span)
            intersecting.add((active_start, active_end, active_digest))
        heapq.heappush(active, (end, start, digest))

    queue_spans = [span for span in unique_spans if span not in intersecting]
    for previous, current in zip(queue_spans, queue_spans[1:]):
        if previous[1] > current[0]:
            raise AssertionError("queue unexpectedly contains intersecting spans")

    queue_entries = [
        {
            "id": f"canonical-span-{index:04d}",
            "source_rom_offset": start,
            "source_byte_length": end - start,
            "source_sha256": digest,
            "merged_exact_candidate_count": aliases[(start, end, digest)],
            "status": "blocked_control_spec",
            "translation_ko": "",
            "notes": "Non-intersecting structural candidate only; source decoding, control semantics, and runtime reachability remain unverified.",
        }
        for index, (start, end, digest) in enumerate(queue_spans)
    ]
    report = {
        "schema_version": 1,
        "kind": "nonintersecting_structural_message_candidate_queue",
        "source": {
            "rom_sha256": sha256(rom),
            "parent_workspace_filename": args.workspace.name,
            "parent_workspace_sha256": sha256(workspace_bytes),
        },
        "summary": {
            "parent_candidate_entry_count": total_entries,
            "unique_exact_source_span_count": len(unique_spans),
            "excluded_intersecting_unique_span_count": len(intersecting),
            "queue_entry_count": len(queue_entries),
        },
        "validation": {
            "parent_source_hash_validation": "passed",
            "queue_exact_deduplication": "passed",
            "queue_nonintersection_validation": "passed",
        },
        "entries": queue_entries,
        "editing_policy": {
            "source_text_included": False,
            "new_high_control_frames_allowed": False,
            "translation_or_reinsertion_allowed": False,
            "unlock_condition": "Verified GBA message boundary, source decoding, control preservation, and runtime reachability for the specific entry.",
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
