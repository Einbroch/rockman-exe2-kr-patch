#!/usr/bin/env python3
"""Relate observed dialogue BG0 tile hashes to 64-byte raw-ROM entry candidates."""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tile-occurrences", type=Path, required=True)
    parser.add_argument("--font-base-rom-offset", type=lambda value: int(value, 0), default=0x6973B0)
    parser.add_argument("--entry-bytes", type=int, default=64)
    parser.add_argument("--tile-bytes", type=int, default=32)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.entry_bytes != args.tile_bytes * 2:
        raise ValueError("this probe expects one candidate entry to contain exactly two tile-sized components")
    source = json.loads(args.tile_occurrences.read_text(encoding="utf-8"))
    by_tile: dict[int, list[dict]] = defaultdict(list)
    pattern_records = []
    for pattern in source["patterns"]:
        candidates = []
        for offset in pattern["rom_occurrence_offsets"]:
            delta = offset - args.font_base_rom_offset
            if delta < 0 or delta % args.tile_bytes:
                continue
            candidates.append(
                {
                    "rom_offset": offset,
                    "entry_index": delta // args.entry_bytes,
                    "component_index": (delta % args.entry_bytes) // args.tile_bytes,
                }
            )
        record = {
            "tile_pattern_sha256": pattern["tile_pattern_sha256"],
            "tile_indices": pattern["tile_indices"],
            "combined_topmost_dark_screenshot_pixel_count": pattern["combined_topmost_dark_screenshot_pixel_count"],
            "aligned_64_byte_entry_candidates": candidates,
        }
        pattern_records.append(record)
        for tile in pattern["tile_indices"]:
            by_tile[tile].append(record)
    pair_matches = []
    for tile in sorted(by_tile):
        if tile + 1 not in by_tile:
            continue
        compatible = []
        for left in by_tile[tile]:
            for right in by_tile[tile + 1]:
                for left_candidate in left["aligned_64_byte_entry_candidates"]:
                    for right_candidate in right["aligned_64_byte_entry_candidates"]:
                        if (
                            left_candidate["entry_index"] == right_candidate["entry_index"]
                            and left_candidate["component_index"] == 0
                            and right_candidate["component_index"] == 1
                        ):
                            compatible.append(
                                {
                                    "entry_index": left_candidate["entry_index"],
                                    "first_component_rom_offset": left_candidate["rom_offset"],
                                    "second_component_rom_offset": right_candidate["rom_offset"],
                                }
                            )
        if compatible:
            pair_matches.append(
                {"first_bg0_tile_index": tile, "second_bg0_tile_index": tile + 1, "shared_entry_candidates": compatible}
            )
    report = {
        "schema_version": 1,
        "input": {
            "tile_occurrence_report": args.tile_occurrences.name,
            "font_base_rom_offset": args.font_base_rom_offset,
            "entry_bytes": args.entry_bytes,
            "tile_bytes": args.tile_bytes,
        },
        "pattern_count": len(pattern_records),
        "patterns": pattern_records,
        "consecutive_bg0_tile_pairs_matching_entry_components": pair_matches,
        "interpretation_notice": (
            "A 64-byte alignment and a consecutive-tile pair are structural evidence for a two-component raw graphics record. "
            "They do not prove a character encoding, glyph dimensions, or a ROM modification strategy."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
