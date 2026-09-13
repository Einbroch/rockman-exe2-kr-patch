#!/usr/bin/env python3
"""Measure opaque order agreement between visible BG0 records and an active entry."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from analyze_state_bg_layout import IO_STATE_OFFSET, VRAM_BYTES, VRAM_STATE_OFFSET, load_state


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def bg0_tile(vram: bytes, control: int, x: int, y: int) -> int:
    screen_base = ((control >> 8) & 0x1F) * 0x800
    width_tiles = (32, 64, 32, 64)[(control >> 14) & 3]
    block = (y // 256) * (width_tiles // 32) + (x // 256)
    entry_offset = screen_base + block * 0x800 + ((y % 256) // 8 * 32 + (x % 256) // 8) * 2
    return struct.unpack_from("<H", vram, entry_offset)[0] & 0x3FF


def lcs_length(left: list[int], right: bytes) -> int:
    row = [0] * (len(right) + 1)
    for value in left:
        previous = 0
        for column, other in enumerate(right, 1):
            old = row[column]
            if value == other:
                row[column] = previous + 1
            elif row[column - 1] > row[column]:
                row[column] = row[column - 1]
            previous = old
    return row[-1]


def lcs_unmatched_left_stats(left: list[int], right: bytes) -> tuple[int, int, int]:
    table, matched_left, _ = lcs_backtrace(left, right)
    unmatched = [value for index, value in enumerate(left) if index not in matched_left]
    return table[-1][-1], len(unmatched), len(set(unmatched))


def lcs_backtrace(left: list[int], right: bytes) -> tuple[list[list[int]], set[int], list[tuple[int, int]]]:
    table = [[0] * (len(right) + 1) for _ in range(len(left) + 1)]
    for left_index, value in enumerate(left, 1):
        for right_index, other in enumerate(right, 1):
            if value == other:
                table[left_index][right_index] = table[left_index - 1][right_index - 1] + 1
            else:
                table[left_index][right_index] = max(table[left_index - 1][right_index], table[left_index][right_index - 1])
    left_index, right_index = len(left), len(right)
    matched_left = set()
    matched_pairs = []
    while left_index and right_index:
        if left[left_index - 1] == right[right_index - 1]:
            matched_left.add(left_index - 1)
            matched_pairs.append((left_index - 1, right_index - 1))
            left_index -= 1
            right_index -= 1
        elif table[left_index - 1][right_index] >= table[left_index][right_index - 1]:
            left_index -= 1
        else:
            right_index -= 1
    matched_pairs.reverse()
    return table, matched_left, matched_pairs


def single_record_gap_stats(left: list[int], right: bytes) -> dict[str, int]:
    _, _, matches = lcs_backtrace(left, right)
    boundaries = [(-1, -1), *matches, (len(left), len(right))]
    spans = []
    for (left_before, right_before), (left_after, right_after) in zip(boundaries, boundaries[1:]):
        if left_after - left_before - 1 == 1 and right_after - right_before - 1 > 0:
            span = right[right_before + 1 : right_after]
            spans.append((len(span), hashlib.sha256(span).hexdigest()))
    unique = set(spans)
    return {
        "single_unmatched_visible_record_internal_gap_count": len(spans),
        "distinct_unmatched_raw_span_length_and_hash_count": len(unique),
        "largest_identical_unmatched_raw_span_group_count": max((spans.count(item) for item in unique), default=0),
        "unmatched_raw_span_total_byte_count": sum(length for length, _ in spans),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--entry-rom-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--entry-length", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--entry-prefix-bytes", type=int, default=12)
    parser.add_argument("--record-matches", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.entry_prefix_bytes < 0 or args.entry_prefix_bytes > args.entry_length:
        raise ValueError("prefix length lies outside entry")
    x0, y0, x1, y1 = 64, 104, 208, 152
    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")
    entry = rom[args.entry_rom_offset : args.entry_rom_offset + args.entry_length]
    if len(entry) != args.entry_length:
        raise ValueError("entry extends outside ROM")
    matches = json.loads(args.record_matches.read_text(encoding="utf-8"))
    lookup = {
        (record["top_bg0_tile_index"], record["bottom_bg0_tile_index"]): record["aligned_font_record_candidates"][0]["font_record_index"]
        for record in matches["records"]
        if len(record["aligned_font_record_candidates"]) == 1
    }
    payload = load_state(args.state)
    io = payload[IO_STATE_OFFSET : IO_STATE_OFFSET + 0x400]
    vram = payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
    control = struct.unpack_from("<H", io, 0x8)[0]
    display_indices = []
    for y in range(y0, y1 - 8, 16):
        for x in range(x0, x1, 8):
            key = (bg0_tile(vram, control, x, y), bg0_tile(vram, control, x, y + 8))
            if key in lookup:
                display_indices.append(lookup[key])
    one_byte_display = [value for value in display_indices if 0 <= value <= 0xFF]
    suffix = entry[args.entry_prefix_bytes :]
    full_lcs, _, _ = lcs_unmatched_left_stats(one_byte_display, entry)
    suffix_lcs, suffix_unmatched, suffix_unmatched_distinct = lcs_unmatched_left_stats(one_byte_display, suffix)
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": digest,
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(args.state.read_bytes()).hexdigest(),
            "entry_rom_offset": args.entry_rom_offset,
            "entry_length": args.entry_length,
            "entry_sha256": hashlib.sha256(entry).hexdigest(),
            "entry_prefix_byte_count": args.entry_prefix_bytes,
            "record_match_report": args.record_matches.name,
        },
        "visible_record_order_count": len(display_indices),
        "one_byte_range_visible_record_order_count": len(one_byte_display),
        "longest_common_subsequence_length_against_full_entry": full_lcs,
        "longest_common_subsequence_length_against_entry_after_prefix": suffix_lcs,
        "one_byte_visible_records_unmatched_by_one_lcs_after_prefix_count": suffix_unmatched,
        "distinct_font_record_indices_among_unmatched_visible_records_count": suffix_unmatched_distinct,
        "single_record_gap_stats_after_prefix": single_record_gap_stats(one_byte_display, suffix),
        "interpretation_notice": (
            "This reports only an opaque order statistic. A full-length subsequence supports ordered "
            "single-byte rendering, but it does not assign positions, identify skipped controls, or prove a complete parser."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
