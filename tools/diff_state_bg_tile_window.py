#!/usr/bin/env python3
"""Compare a fixed VRAM tile window between two PNG-backed mGBA savestates.

The report contains tile-slot numbers and hashes only. It never writes VRAM,
tile graphics, palettes, or screenshots.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from analyze_state_bg_layout import VRAM_BYTES, VRAM_STATE_OFFSET, load_state


VRAM_BASE = 0x06000000
TILE_BYTES = 32


def load_vram(path: Path) -> bytes:
    payload = load_state(path)
    return payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state-before", type=Path, required=True)
    parser.add_argument("--state-after", type=Path, required=True)
    parser.add_argument("--vram-offset", type=lambda value: int(value, 0), default=0xC800)
    parser.add_argument("--byte-length", type=lambda value: int(value, 0), default=0x1300)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.vram_offset < 0 or args.byte_length <= 0 or args.vram_offset + args.byte_length > VRAM_BYTES:
        raise ValueError("requested range lies outside GBA VRAM")
    if args.vram_offset % TILE_BYTES or args.byte_length % TILE_BYTES:
        raise ValueError("range must begin and end on 4bpp 8x8 tile boundaries")
    before = load_vram(args.state_before)
    after = load_vram(args.state_after)
    changed = []
    for relative_offset in range(0, args.byte_length, TILE_BYTES):
        vram_offset = args.vram_offset + relative_offset
        old = before[vram_offset : vram_offset + TILE_BYTES]
        new = after[vram_offset : vram_offset + TILE_BYTES]
        if old != new:
            changed.append(
                {
                    "vram_offset": vram_offset,
                    "vram_address": VRAM_BASE + vram_offset,
                    "bg0_character_base_relative_tile_index": (vram_offset - 0x8000) // TILE_BYTES,
                    "before_tile_sha256": hashlib.sha256(old).hexdigest(),
                    "after_tile_sha256": hashlib.sha256(new).hexdigest(),
                }
            )
    report = {
        "schema_version": 1,
        "input": {
            "state_before_filename": args.state_before.name,
            "state_before_sha256": hashlib.sha256(args.state_before.read_bytes()).hexdigest(),
            "state_after_filename": args.state_after.name,
            "state_after_sha256": hashlib.sha256(args.state_after.read_bytes()).hexdigest(),
        },
        "vram_window": {
            "vram_offset": args.vram_offset,
            "vram_address": VRAM_BASE + args.vram_offset,
            "byte_length": args.byte_length,
            "tile_count": args.byte_length // TILE_BYTES,
        },
        "changed_tile_count": len(changed),
        "changed_tiles": changed,
        "interpretation_notice": (
            "A changed tile proves only that the two saved states differ in this VRAM slot. "
            "It does not establish a character-code mapping, a renderer, or a source asset."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
