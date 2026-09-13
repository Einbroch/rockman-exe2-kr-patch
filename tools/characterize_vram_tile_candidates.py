#!/usr/bin/env python3
"""Characterize matched 4bpp VRAM tile ranges without exporting graphic bytes."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from collections import Counter
from pathlib import Path


PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
VRAM_STATE_OFFSET = 0x1000
VRAM_BYTES = 0x18000


def load_vram(path: Path) -> bytes:
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
            return payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
        position = end + 4
    raise ValueError("no gbAs chunk found")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--vram-matches", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    vram = load_vram(args.state)
    matches = json.loads(args.vram_matches.read_text(encoding="utf-8"))["exact_full_stream_vram_matches"]
    candidates = []
    for match in matches:
        start = match["vram_offset"]
        end = start + match["unpacked_size"]
        tiles = [vram[offset : offset + 32] for offset in range(start, end, 32)]
        if any(len(tile) != 32 for tile in tiles):
            continue
        nibbles = [nibble for byte in vram[start:end] for nibble in (byte & 0x0F, byte >> 4)]
        nonzero_counts = [sum(nibble != 0 for byte in tile for nibble in (byte & 0x0F, byte >> 4)) for tile in tiles]
        unique_by_tile = Counter(
            len({nibble for byte in tile for nibble in (byte & 0x0F, byte >> 4)}) for tile in tiles
        )
        candidates.append(
            {
                "rom_offset": match["rom_offset"],
                "vram_offset": start,
                "tile_count_4bpp": len(tiles),
                "palette_index_histogram": {str(value): count for value, count in sorted(Counter(nibbles).items())},
                "distinct_palette_index_count": len(set(nibbles)),
                "blank_tile_count": sum(count == 0 for count in nonzero_counts),
                "mean_nonzero_pixels_per_tile": sum(nonzero_counts) / len(nonzero_counts),
                "tile_unique_palette_index_count_histogram": {str(value): count for value, count in sorted(unique_by_tile.items())},
                "distinct_tile_byte_pattern_count": len(set(tiles)),
                "interpretation_notice": (
                    "Sparse or low-palette tiles can occur in fonts, UI, sprites, and backgrounds. "
                    "These statistics are prioritization signals, not a font identification."
                ),
            }
        )
    report = {
        "schema_version": 1,
        "input": {
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(args.state.read_bytes()).hexdigest(),
            "vram_match_report": args.vram_matches.name,
        },
        "candidates": candidates,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
