#!/usr/bin/env python3
"""Match complete visible 8x16 BG0 cache records against raw ROM records.

Only tile numbers, source offsets, record indices, occurrence counts, and
hashes are recorded. Tile and script bytes remain in memory.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from collections import Counter
from pathlib import Path

from analyze_state_bg_layout import IO_STATE_OFFSET, VRAM_BYTES, VRAM_STATE_OFFSET, load_state


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
TILE_BYTES = 32
RECORD_BYTES = 64


def bg0_tile(vram: bytes, control: int, x: int, y: int) -> int:
    screen_base = ((control >> 8) & 0x1F) * 0x800
    width_tiles = (32, 64, 32, 64)[(control >> 14) & 3]
    block = (y // 256) * (width_tiles // 32) + (x // 256)
    entry_offset = screen_base + block * 0x800 + ((y % 256) // 8 * 32 + (x % 256) // 8) * 2
    return struct.unpack_from("<H", vram, entry_offset)[0] & 0x3FF


def bounded_find(data: bytes, needle: bytes, limit: int) -> tuple[list[int], bool]:
    hits, start = [], 0
    while True:
        position = data.find(needle, start)
        if position < 0:
            return hits, False
        hits.append(position)
        if len(hits) == limit:
            return hits, data.find(needle, position + 1) >= 0
        start = position + 1


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--region", default="64,104,208,152")
    parser.add_argument("--minimum-bg0-tile-index", type=int, default=576)
    parser.add_argument("--maximum-bg0-tile-index", type=int, default=699)
    parser.add_argument("--font-base-rom-offset", type=lambda value: int(value, 0), default=0x6973B0)
    parser.add_argument("--maximum-occurrences", type=int, default=16)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    x0, y0, x1, y1 = (int(value, 0) for value in args.region.split(","))
    if min(x0, y0) < 0 or x0 >= x1 or y0 >= y1 or any(value % 8 for value in (x0, y0, x1, y1)):
        raise ValueError("region must be a non-empty 8-pixel-aligned rectangle")
    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")
    payload = load_state(args.state)
    io = payload[IO_STATE_OFFSET : IO_STATE_OFFSET + 0x400]
    vram = payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
    control = struct.unpack_from("<H", io, 0x8)[0]
    char_base = ((control >> 2) & 3) * 0x4000
    usage = Counter()
    for y in range(y0, y1 - 8, 16):
        for x in range(x0, x1, 8):
            top = bg0_tile(vram, control, x, y)
            bottom = bg0_tile(vram, control, x, y + 8)
            if top + 1 == bottom and args.minimum_bg0_tile_index <= top <= args.maximum_bg0_tile_index:
                usage[(top, bottom)] += 1
    records = []
    for (top, bottom), count in sorted(usage.items()):
        vram_offset = char_base + top * TILE_BYTES
        record = vram[vram_offset : vram_offset + RECORD_BYTES]
        positions, truncated = bounded_find(rom, record, args.maximum_occurrences)
        aligned = []
        for offset in positions:
            delta = offset - args.font_base_rom_offset
            if delta >= 0 and delta % RECORD_BYTES == 0:
                aligned.append({"rom_offset": offset, "font_record_index": delta // RECORD_BYTES})
        records.append(
            {
                "top_bg0_tile_index": top,
                "bottom_bg0_tile_index": bottom,
                "region_pair_cell_count": count,
                "record_sha256": hashlib.sha256(record).hexdigest(),
                "rom_occurrence_count_lower_bound": len(positions),
                "rom_occurrence_count_truncated": truncated,
                "aligned_font_record_candidates": aligned,
            }
        )
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": digest,
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(args.state.read_bytes()).hexdigest(),
        },
        "region": {"x0": x0, "y0": y0, "x1_exclusive": x1, "y1_exclusive": y1},
        "bg0_control_register": control,
        "character_base_vram_offset": char_base,
        "font_base_rom_offset": args.font_base_rom_offset,
        "record_bytes": RECORD_BYTES,
        "paired_cache_record_count": len(records),
        "records": records,
        "interpretation_notice": (
            "A complete-record match is a structural source lead for this state's BG0 cache. "
            "It does not establish character values, controls, or a writable patch format."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
