#!/usr/bin/env python3
"""Measure opaque font-index frequency agreement for complete dialogue cache records."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--entry-rom-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--entry-length", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--record-matches", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")
    entry = rom[args.entry_rom_offset : args.entry_rom_offset + args.entry_length]
    if len(entry) != args.entry_length:
        raise ValueError("entry extends outside ROM")
    source = json.loads(args.record_matches.read_text(encoding="utf-8"))
    records = source["records"]
    unambiguous_indices = [
        record["aligned_font_record_candidates"][0]["font_record_index"]
        for record in records
        if len(record["aligned_font_record_candidates"]) == 1
    ]
    one_byte_counts = Counter(index for index in unambiguous_indices if 0 <= index <= 0xFF)
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": digest,
            "entry_rom_offset": args.entry_rom_offset,
            "entry_length": args.entry_length,
            "entry_sha256": hashlib.sha256(entry).hexdigest(),
            "record_match_report": args.record_matches.name,
        },
        "visible_paired_cache_record_count": len(records),
        "unambiguous_aligned_font_record_count": len(unambiguous_indices),
        "records_without_unambiguous_font_candidate_count": len(records) - len(unambiguous_indices),
        "unique_unambiguous_font_record_index_count": len(set(unambiguous_indices)),
        "one_byte_range_font_record_index_count": len(one_byte_counts),
        "one_byte_range_font_record_indices_present_somewhere_in_active_entry_count": sum(
            entry.count(index) > 0 for index in one_byte_counts
        ),
        "one_byte_range_font_record_appearance_count": sum(one_byte_counts.values()),
        "one_byte_range_indices_with_exact_record_to_byte_frequency_match_count": sum(
            count == entry.count(index) for index, count in one_byte_counts.items()
        ),
        "one_byte_range_indices_with_record_count_not_exceeding_byte_frequency_count": sum(
            count <= entry.count(index) for index, count in one_byte_counts.items()
        ),
        "interpretation_notice": (
            "This is an opaque count comparison: no byte values, text, or graphics are emitted. "
            "It does not establish byte positions, exclude commands, define the exceptional record, "
            "or authorize reinsertion."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
