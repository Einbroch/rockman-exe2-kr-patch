#!/usr/bin/env python3
"""Relate a PNG savestate's GBA text-background tilemaps to VRAM match ranges.

The output contains register values, tile-index counts, and candidate-range
usage only. It does not export VRAM, palettes, tiles, or screen images.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from collections import Counter
from pathlib import Path


PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
IO_STATE_OFFSET = 0x400
VRAM_STATE_OFFSET = 0x1000
VRAM_BYTES = 0x18000


def load_state(path: Path) -> bytes:
    raw = path.read_bytes()
    if not raw.startswith(PNG_SIGNATURE):
        raise ValueError("input is not a PNG-backed mGBA savestate")
    position = len(PNG_SIGNATURE)
    while position + 12 <= len(raw):
        length = struct.unpack_from(">I", raw, position)[0]
        kind = raw[position + 4 : position + 8]
        start = position + 8
        end = start + length
        if end + 4 > len(raw):
            raise ValueError("truncated PNG chunk")
        if kind == b"gbAs":
            payload = zlib.decompress(raw[start:end])
            if len(payload) != 0x61000:
                raise ValueError(f"unexpected GBA state size: {len(payload):#x}")
            return payload
        position = end + 4
    raise ValueError("no gbAs chunk found")


def map_dimensions(size_bits: int) -> tuple[int, int]:
    return ((32, 32), (64, 32), (32, 64), (64, 64))[size_bits]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--vram-matches", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    payload = load_state(args.state)
    io = payload[IO_STATE_OFFSET : IO_STATE_OFFSET + 0x400]
    vram = payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
    dispcnt = struct.unpack_from("<H", io, 0)[0]
    match_report = json.loads(args.vram_matches.read_text(encoding="utf-8"))
    matches = match_report["exact_full_stream_vram_matches"]

    backgrounds = []
    for bg in range(4):
        control = struct.unpack_from("<H", io, 0x8 + bg * 2)[0]
        enabled = bool(dispcnt & (1 << (8 + bg)))
        char_base = ((control >> 2) & 3) * 0x4000
        screen_base = ((control >> 8) & 0x1F) * 0x800
        color_8bpp = bool(control & 0x80)
        width, height = map_dimensions((control >> 14) & 3)
        entry_count = width * height
        if screen_base + entry_count * 2 <= len(vram):
            tile_entries = [struct.unpack_from("<H", vram, screen_base + index * 2)[0] for index in range(entry_count)]
            tile_indices = Counter(value & 0x3FF for value in tile_entries)
            map_available = True
        else:
            tile_indices = Counter()
            map_available = False
        bytes_per_tile = 64 if color_8bpp else 32
        candidate_usage = []
        for match in matches:
            start = match["vram_offset"]
            length = match["unpacked_size"]
            if start < char_base or (start - char_base) % bytes_per_tile or length % bytes_per_tile:
                continue
            first_tile = (start - char_base) // bytes_per_tile
            tile_count = length // bytes_per_tile
            references = sum(count for tile, count in tile_indices.items() if first_tile <= tile < first_tile + tile_count)
            candidate_usage.append(
                {
                    "rom_offset": match["rom_offset"],
                    "candidate_first_tile_index": first_tile,
                    "candidate_tile_count": tile_count,
                    "tilemap_reference_count": references,
                    "distinct_referenced_candidate_tile_count": sum(
                        1 for tile in tile_indices if first_tile <= tile < first_tile + tile_count
                    ),
                }
            )
        backgrounds.append(
            {
                "background": bg,
                "enabled": enabled,
                "control_register": control,
                "character_base_vram_offset": char_base,
                "screen_base_vram_offset": screen_base,
                "color_mode": "8bpp" if color_8bpp else "4bpp",
                "tilemap_dimensions": [width, height],
                "tilemap_available": map_available,
                "distinct_tile_indices": len(tile_indices),
                "candidate_usage": candidate_usage,
            }
        )
    report = {
        "schema_version": 1,
        "input": {
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(args.state.read_bytes()).hexdigest(),
            "vram_match_report": args.vram_matches.name,
        },
        "display_control_register": dispcnt,
        "display_mode": dispcnt & 7,
        "backgrounds": backgrounds,
        "interpretation_notice": (
            "Tilemap references show which exact-VRAM-match candidate ranges are used by an enabled "
            "text background in this savestate. They do not identify a range as font glyphs or prove "
            "a particular screen region contains dialogue text."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
