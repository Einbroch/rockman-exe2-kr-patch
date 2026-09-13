#!/usr/bin/env python3
"""Find aligned, partial LZ77 tile runs resident in a PNG savestate's VRAM.

The report records offsets, lengths, and SHA-256 values only. Decompressed
graphics and VRAM tile bytes remain in memory and are not exported.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict
from pathlib import Path

from match_state_vram_lz77_candidates import (
    EXPECTED_ROM_SHA256,
    VRAM_BASE,
    VRAM_BYTES,
    VRAM_STATE_OFFSET,
    decompress_lz77,
    load_state,
)


TILE_BYTES = 32


def digest(value: bytes) -> bytes:
    return hashlib.sha256(value).digest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--survey", type=Path, required=True)
    parser.add_argument("--minimum-tiles", type=int, default=8)
    parser.add_argument("--minimum-distinct-tiles", type=int, default=4)
    parser.add_argument("--maximum-runs-per-stream", type=int, default=16)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.minimum_tiles < 2:
        raise ValueError("minimum tiles must be at least 2")
    if not 1 <= args.minimum_distinct_tiles <= args.minimum_tiles:
        raise ValueError("minimum distinct tiles must be between 1 and minimum tiles")
    if args.maximum_runs_per_stream < 1:
        raise ValueError("maximum runs per stream must be positive")

    rom = args.rom.read_bytes()
    rom_digest = hashlib.sha256(rom).hexdigest()
    if rom_digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {rom_digest}")
    state_raw = args.state.read_bytes()
    payload = load_state(args.state)
    vram = payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
    survey = json.loads(args.survey.read_text(encoding="utf-8"))
    streams = survey["observations"]["gba_bios_lz77_0x10"]["streams"]

    window_bytes = args.minimum_tiles * TILE_BYTES
    vram_first_tiles: dict[bytes, list[int]] = defaultdict(list)
    for target_offset in range(0, len(vram) - window_bytes + 1, TILE_BYTES):
        vram_first_tiles[vram[target_offset : target_offset + TILE_BYTES]].append(target_offset)

    matches = []
    skipped_short = 0
    for stream in streams:
        if stream["unpacked_size"] < window_bytes:
            skipped_short += 1
            continue
        unpacked = decompress_lz77(rom, stream["rom_offset"])
        if len(unpacked) != stream["unpacked_size"]:
            raise ValueError(f"survey size mismatch at {stream['rom_offset']:#x}")
        source_tile_count = len(unpacked) // TILE_BYTES
        stream_matches = []
        for source_tile in range(source_tile_count - args.minimum_tiles + 1):
            source_offset = source_tile * TILE_BYTES
            first_tile = unpacked[source_offset : source_offset + TILE_BYTES]
            initial = unpacked[source_offset : source_offset + window_bytes]
            initial_tiles = {
                initial[index : index + TILE_BYTES] for index in range(0, len(initial), TILE_BYTES)
            }
            if len(initial_tiles) < args.minimum_distinct_tiles:
                continue
            for target_offset in vram_first_tiles.get(first_tile, []):
                if vram[target_offset : target_offset + window_bytes] != initial:
                    continue
                if source_tile and target_offset >= TILE_BYTES and (
                    unpacked[source_offset - TILE_BYTES : source_offset]
                    == vram[target_offset - TILE_BYTES : target_offset]
                ):
                    continue
                tile_count = args.minimum_tiles
                while (
                    source_offset + (tile_count + 1) * TILE_BYTES <= len(unpacked)
                    and target_offset + (tile_count + 1) * TILE_BYTES <= len(vram)
                    and unpacked[
                        source_offset + tile_count * TILE_BYTES : source_offset + (tile_count + 1) * TILE_BYTES
                    ]
                    == vram[target_offset + tile_count * TILE_BYTES : target_offset + (tile_count + 1) * TILE_BYTES]
                ):
                    tile_count += 1
                byte_count = tile_count * TILE_BYTES
                run = unpacked[source_offset : source_offset + byte_count]
                distinct_tile_count = len({run[index : index + TILE_BYTES] for index in range(0, len(run), TILE_BYTES)})
                if distinct_tile_count < args.minimum_distinct_tiles:
                    continue
                stream_matches.append(
                    {
                        "rom_offset": stream["rom_offset"],
                        "rom_address": stream["rom_address"],
                        "packed_size": stream["packed_size"],
                        "unpacked_size": stream["unpacked_size"],
                        "source_tile_index": source_tile,
                        "source_byte_offset": source_offset,
                        "matching_tile_count": tile_count,
                        "matching_byte_count": byte_count,
                        "distinct_matching_tile_pattern_count": distinct_tile_count,
                        "matching_run_sha256": hashlib.sha256(run).hexdigest(),
                        "vram_offset": target_offset,
                        "vram_address": VRAM_BASE + target_offset,
                    }
                )
                if len(stream_matches) >= args.maximum_runs_per_stream:
                    break
            if len(stream_matches) >= args.maximum_runs_per_stream:
                break
        matches.extend(stream_matches)
    matches.sort(key=lambda item: (-item["matching_tile_count"], item["rom_offset"], item["source_byte_offset"]))
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": rom_digest,
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(state_raw).hexdigest(),
            "survey_filename": args.survey.name,
        },
        "vram": {"emulated_base_address": VRAM_BASE, "byte_length": len(vram)},
        "tile_bytes": TILE_BYTES,
        "minimum_contiguous_matching_tiles": args.minimum_tiles,
        "minimum_contiguous_matching_bytes": window_bytes,
        "minimum_distinct_matching_tile_patterns": args.minimum_distinct_tiles,
        "maximum_reported_runs_per_stream": args.maximum_runs_per_stream,
        "survey_stream_count": len(streams),
        "skipped_short_stream_count": skipped_short,
        "aligned_partial_or_full_tile_runs": matches,
        "interpretation_notice": (
            "A matching run proves only that aligned decompressed bytes are resident in this state's VRAM. "
            "It does not identify glyph tiles, distinguish background from sprite graphics, or prove a loader path."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
