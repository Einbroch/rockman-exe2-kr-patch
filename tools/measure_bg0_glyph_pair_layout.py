#!/usr/bin/env python3
"""Measure whether candidate two-tile dialogue records are vertically paired on BG0."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from analyze_state_bg_layout import IO_STATE_OFFSET, VRAM_BYTES, VRAM_STATE_OFFSET, load_state


def bg0_tile_index(vram: bytes, control: int, x: int, y: int) -> int:
    screen_base = ((control >> 8) & 0x1F) * 0x800
    width_tiles = (32, 64, 32, 64)[(control >> 14) & 3]
    block_x, block_y = x // 256, y // 256
    map_block = block_y * (width_tiles // 32) + block_x
    entry_offset = screen_base + map_block * 0x800 + ((y % 256) // 8 * 32 + (x % 256) // 8) * 2
    return struct.unpack_from("<H", vram, entry_offset)[0] & 0x3FF


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--correlation", type=Path, required=True)
    parser.add_argument("--region", default="96,104,208,152")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    x0, y0, x1, y1 = (int(value, 0) for value in args.region.split(","))
    if x0 % 8 or y0 % 8 or x1 % 8 or y1 % 8 or x0 >= x1 or y0 >= y1:
        raise ValueError("region must be a non-empty 8-pixel-aligned rectangle")
    payload = load_state(args.state)
    io = payload[IO_STATE_OFFSET : IO_STATE_OFFSET + 0x400]
    vram = payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
    control = struct.unpack_from("<H", io, 0x8)[0]
    correlation = json.loads(args.correlation.read_text(encoding="utf-8"))
    tiles = {(x, y): bg0_tile_index(vram, control, x, y) for y in range(y0, y1, 8) for x in range(x0, x1, 8)}
    pairs = []
    for pair in correlation["consecutive_bg0_tile_pairs_matching_entry_components"]:
        first, second = pair["first_bg0_tile_index"], pair["second_bg0_tile_index"]
        first_count = sum(tile == first for tile in tiles.values())
        second_count = sum(tile == second for tile in tiles.values())
        vertical = sum(tiles[(x, y)] == first and tiles.get((x, y + 8)) == second for x, y in tiles if y + 8 < y1)
        horizontal = sum(tiles[(x, y)] == first and tiles.get((x + 8, y)) == second for x, y in tiles if x + 8 < x1)
        pairs.append(
            {
                "first_bg0_tile_index": first,
                "second_bg0_tile_index": second,
                "first_component_region_cell_count": first_count,
                "second_component_region_cell_count": second_count,
                "vertical_adjacency_count": vertical,
                "horizontal_adjacency_count": horizontal,
            }
        )
    report = {
        "schema_version": 1,
        "input": {
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(args.state.read_bytes()).hexdigest(),
            "correlation_filename": args.correlation.name,
        },
        "region": {"x0": x0, "y0": y0, "x1_exclusive": x1, "y1_exclusive": y1},
        "bg0_control_register": control,
        "candidate_pairs": pairs,
        "pairs_with_vertical_adjacency_count": sum(bool(item["vertical_adjacency_count"]) for item in pairs),
        "interpretation_notice": (
            "Vertical tile adjacency supports a two-tile screen layout for these cached records. "
            "It does not prove glyph semantics, source-code mapping, or rendering behavior outside this state."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
