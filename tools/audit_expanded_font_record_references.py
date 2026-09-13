#!/usr/bin/env python3
"""Measure potential E5/E6 font-record references in structural candidates.

The candidate boundaries are not yet fully decoded, so an E5/E6-shaped byte
pair is reported only as a potential reference.  The output contains counts,
indices, offsets hashes, and coverage metadata only; it never exports message
bytes, decoded text, or font graphics.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
E5_OPCODE = 0xE5
E5_FIRST_INDEX = 0xE5
E5_LAST_INDEX = 0x1E4
E6_OPCODE = 0xE6
E6_FIRST_INDEX = 0x1E5
E6_LAST_INDEX = 0x2E4


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def summarize_prefix(first_index: int, last_index: int, counts: Counter[int]) -> dict[str, object]:
    all_indices = set(range(first_index, last_index + 1))
    observed_indices = sorted(counts)
    return {
        "record_index_range": [first_index, last_index],
        "total_raw_pair_count": sum(counts.values()),
        "distinct_potentially_referenced_record_count": len(observed_indices),
        "potentially_referenced_record_indices": observed_indices,
        "no_raw_pair_observed_record_indices": sorted(all_indices - set(observed_indices)),
        "raw_pair_count_by_record_index": {str(index): counts[index] for index in observed_indices},
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    if sha256(rom) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected Rev 1 ROM SHA-256")
    catalog_bytes = args.catalog.read_bytes()
    catalog = json.loads(catalog_bytes)
    if catalog.get("scope", {}).get("rom_sha256") != EXPECTED_ROM_SHA256:
        raise ValueError("catalog does not identify the supported Rev 1 ROM")

    canonical: dict[tuple[int, int, str], None] = {}
    for record in catalog.get("records", []):
        if not record.get("structural_signals", {}).get("script_like"):
            continue
        for entry in record.get("subentries", []):
            offset = entry.get("source_rom_offset")
            length = entry.get("byte_length")
            digest = entry.get("source_sha256")
            if not isinstance(offset, int) or not isinstance(length, int) or not isinstance(digest, str):
                raise ValueError("catalog subentry is malformed")
            if offset < 0 or length <= 0 or offset + length > len(rom):
                raise ValueError("catalog subentry lies outside ROM")
            if sha256(rom[offset:offset + length]) != digest:
                raise ValueError("catalog subentry hash differs from ROM")
            canonical[(offset, length, digest)] = None

    e5_raw_pair_counts: Counter[int] = Counter()
    e6_raw_pair_counts: Counter[int] = Counter()
    canonical_span_with_glyph_pair_count = 0
    for offset, length, _digest in canonical:
        data = rom[offset:offset + length]
        span_pairs = 0
        for position in range(len(data) - 1):
            if data[position] == E5_OPCODE:
                index = E5_FIRST_INDEX + data[position + 1]
                e5_raw_pair_counts[index] += 1
                span_pairs += 1
            elif data[position] == E6_OPCODE:
                index = E6_FIRST_INDEX + data[position + 1]
                e6_raw_pair_counts[index] += 1
                span_pairs += 1
        canonical_span_with_glyph_pair_count += bool(span_pairs)

    e5_observations = summarize_prefix(E5_FIRST_INDEX, E5_LAST_INDEX, e5_raw_pair_counts)
    e6_observations = summarize_prefix(E6_FIRST_INDEX, E6_LAST_INDEX, e6_raw_pair_counts)
    high_indices = set(range(0x200, E6_LAST_INDEX + 1))
    observed_high = sorted(high_indices & set(e6_raw_pair_counts))
    e6_observations["expanded_region"] = {
        "record_index_range": [0x200, E6_LAST_INDEX],
        "distinct_potentially_referenced_record_count": len(observed_high),
        "potentially_referenced_record_indices": observed_high,
    }
    report = {
        "schema_version": 1,
        "scope": {
            "rom_filename": args.rom.name,
            "rom_sha256": sha256(rom),
            "catalog_filename": args.catalog.name,
            "catalog_sha256": sha256(catalog_bytes),
            "scan_source": "canonical exact structural script-like subentries only",
        },
        "validation": {
            "catalog_subentry_range_validation": "passed",
            "catalog_subentry_hash_validation": "passed",
        },
        "coverage": {
            "catalog_script_like_subentry_count": sum(
                len(record.get("subentries", []))
                for record in catalog.get("records", [])
                if record.get("structural_signals", {}).get("script_like")
            ),
            "canonical_exact_subentry_count": len(canonical),
            "canonical_subentry_count_with_raw_e5_or_e6_pair": canonical_span_with_glyph_pair_count,
        },
        "glyph_prefix_raw_pair_observations": {
            "e5": e5_observations,
            "e6": e6_observations,
        },
        "interpretation": {
            "safe_to_overwrite_conclusion": "not established",
            "reason": "Candidate boundaries and all non-dialogue consumers remain unverified; raw E5/E6-shaped pairs may include data that is not an executed glyph token.",
            "value": "An observed index is a concrete collision risk inside the catalogued structural candidate scope. An unobserved index is only a prioritization signal, not evidence that it is free.",
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
