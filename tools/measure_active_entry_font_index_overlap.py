#!/usr/bin/env python3
"""Measure opaque membership overlap between an active entry and font-index leads.

No script bytes or candidate values are emitted: the report records only sizes,
hashes, and aggregate overlap counts.
"""

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
    parser.add_argument("--correlation", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    rom_digest = hashlib.sha256(rom).hexdigest()
    if rom_digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {rom_digest}")
    entry = rom[args.entry_rom_offset : args.entry_rom_offset + args.entry_length]
    if len(entry) != args.entry_length:
        raise ValueError("entry extends outside ROM")
    correlation = json.loads(args.correlation.read_text(encoding="utf-8"))
    pair_entry_occurrences = [
        candidate["entry_index"]
        for pair in correlation["consecutive_bg0_tile_pairs_matching_entry_components"]
        for candidate in pair["shared_entry_candidates"]
    ]
    pair_entries = set(pair_entry_occurrences)
    one_byte_entries = {index for index in pair_entries if 0 <= index <= 0xFF}
    observed = set(entry)
    pair_counts = Counter(index for index in pair_entry_occurrences if 0 <= index <= 0xFF)
    exact_frequency_matches = sum(count == entry.count(index) for index, count in pair_counts.items())
    not_exceeding_entry_frequency = sum(count <= entry.count(index) for index, count in pair_counts.items())
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": rom_digest,
            "entry_rom_offset": args.entry_rom_offset,
            "entry_length": args.entry_length,
            "entry_sha256": hashlib.sha256(entry).hexdigest(),
            "correlation_filename": args.correlation.name,
        },
        "consecutive_tile_pair_derived_entry_index_count": len(pair_entries),
        "one_byte_range_entry_index_count": len(one_byte_entries),
        "one_byte_range_entry_indices_present_somewhere_in_active_entry_count": len(one_byte_entries & observed),
        "one_byte_range_pair_record_appearance_count": sum(pair_counts.values()),
        "one_byte_range_entry_indices_with_exact_pair_to_byte_frequency_match_count": exact_frequency_matches,
        "one_byte_range_entry_indices_with_pair_count_not_exceeding_byte_frequency_count": not_exceeding_entry_frequency,
        "interpretation_notice": (
            "This is an opaque membership and frequency measurement. It neither reports nor assigns bytes, "
            "does not exclude controls, and does not establish byte positions, widths, text grammar, "
            "or a complete character-to-glyph mapping."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
