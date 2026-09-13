#!/usr/bin/env python3
"""Locate dark, visible BG tile patterns in the source ROM without exporting tiles."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from analyze_state_bg_layout import VRAM_BYTES, VRAM_STATE_OFFSET, load_state


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
GBA_ROM_BASE = 0x08000000
TILE_BYTES = 32


def bounded_occurrences(haystack: bytes, needle: bytes, limit: int) -> tuple[list[int], bool]:
    positions = []
    start = 0
    while True:
        position = haystack.find(needle, start)
        if position < 0:
            return positions, False
        positions.append(position)
        if len(positions) >= limit:
            return positions, haystack.find(needle, position + 1) >= 0
        start = position + 1


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--attribution", type=Path, required=True)
    parser.add_argument("--background", type=int, default=0)
    parser.add_argument("--maximum-occurrences", type=int, default=16)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.maximum_occurrences < 1:
        raise ValueError("maximum occurrences must be positive")
    rom = args.rom.read_bytes()
    rom_digest = hashlib.sha256(rom).hexdigest()
    if rom_digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {rom_digest}")
    attribution = json.loads(args.attribution.read_text(encoding="utf-8"))
    background = next((item for item in attribution["backgrounds"] if item["background"] == args.background), None)
    if background is None:
        raise ValueError("requested background is absent from attribution report")
    payload = load_state(args.state)
    vram = payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
    char_base = ((background["control_register"] >> 2) & 3) * 0x4000

    unique_patterns: dict[str, dict] = {}
    for item in background["topmost_region_tile_usage"]:
        if item["topmost_dark_screenshot_pixel_count"] == 0:
            continue
        tile_offset = char_base + item["tile_index"] * TILE_BYTES
        pattern = vram[tile_offset : tile_offset + TILE_BYTES]
        pattern_digest = hashlib.sha256(pattern).hexdigest()
        entry = unique_patterns.setdefault(
            pattern_digest,
            {
                "tile_pattern_sha256": pattern_digest,
                "tile_indices": [],
                "palette_banks": [],
                "combined_topmost_dark_screenshot_pixel_count": 0,
            },
        )
        entry["tile_indices"].append(item["tile_index"])
        entry["palette_banks"].append(item["palette_bank"])
        entry["combined_topmost_dark_screenshot_pixel_count"] += item["topmost_dark_screenshot_pixel_count"]
    results = []
    for entry in unique_patterns.values():
        tile_offset = char_base + entry["tile_indices"][0] * TILE_BYTES
        pattern = vram[tile_offset : tile_offset + TILE_BYTES]
        positions, truncated = bounded_occurrences(rom, pattern, args.maximum_occurrences)
        results.append(
            {
                **entry,
                "tile_indices": sorted(set(entry["tile_indices"])),
                "palette_banks": sorted(set(entry["palette_banks"])),
                "rom_occurrence_count_lower_bound": len(positions),
                "rom_occurrence_count_truncated": truncated,
                "rom_occurrence_offsets": positions,
                "rom_occurrence_addresses": [GBA_ROM_BASE + position for position in positions],
            }
        )
    results.sort(key=lambda item: (-item["combined_topmost_dark_screenshot_pixel_count"], item["tile_indices"][0]))
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": rom_digest,
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(args.state.read_bytes()).hexdigest(),
            "attribution_filename": args.attribution.name,
        },
        "background": args.background,
        "character_base_vram_offset": char_base,
        "tile_bytes": TILE_BYTES,
        "visible_dark_tile_pattern_count": len(results),
        "patterns": results,
        "interpretation_notice": (
            "An exact byte-pattern occurrence is only a ROM-location lead. It does not prove this location "
            "is the loaded font source, establish a text encoding, or show a renderer path."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
