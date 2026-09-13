#!/usr/bin/env python3
"""Measure the conservative existing 8x16 font-record capacity for Rev 1.

The report contains only offsets, index ranges, and palette-index statistics.
It neither exports nor reproduces font graphics or message bytes.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
FONT_BASE_OFFSET = 0x6973B0
RECORD_BYTES = 64
DIRECT_MAX_INDEX = 0xE4
E5_FIRST_INDEX = 0xE5
E5_LAST_INDEX = 0x1E4
E6_FIRST_INDEX = 0x1E5
E6_LAST_INDEX = 0x2E4


def max_palette_index(record: bytes) -> int:
    return max(max(byte & 0x0F, byte >> 4) for byte in record)


def contiguous_runs(values: list[bool]) -> list[dict[str, int]]:
    runs: list[dict[str, int]] = []
    start: int | None = None
    for index, value in enumerate(values + [False]):
        if value and start is None:
            start = index
        elif not value and start is not None:
            runs.append({"first_record_index": start, "last_record_index": index - 1, "record_count": index - start})
            start = None
    return runs


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")

    indexer_max = E6_LAST_INDEX
    records = [
        rom[FONT_BASE_OFFSET + index * RECORD_BYTES:FONT_BASE_OFFSET + (index + 1) * RECORD_BYTES]
        for index in range(indexer_max + 1)
    ]
    max_indices = [max_palette_index(record) for record in records]
    same_simple_palette = [value <= 3 for value in max_indices]
    runs = contiguous_runs(same_simple_palette)
    leading = runs[0] if runs and runs[0]["first_record_index"] == 0 else None
    if leading is None:
        raise ValueError("no leading same-palette candidate font run")
    conservative_last = leading["last_record_index"]
    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest},
        "font_record_format": {
            "base_rom_offset": FONT_BASE_OFFSET,
            "record_bytes": RECORD_BYTES,
            "display_layout": "two_vertical_8x8_4bpp_tiles",
            "observed_dialogue_palette_index_ceiling": 3,
        },
        "static_indexer_ranges": {
            "direct": [0, DIRECT_MAX_INDEX],
            "e5_extended": [E5_FIRST_INDEX, E5_LAST_INDEX],
            "e6_extended": [E6_FIRST_INDEX, E6_LAST_INDEX],
            "combined_contiguous_range": [0, indexer_max],
            "combined_record_count": indexer_max + 1,
        },
        "simple_palette_run_measurement": {
            "max_palette_index_histogram": {
                str(value): max_indices.count(value) for value in sorted(set(max_indices))
            },
            "same_palette_record_runs": runs,
            "conservative_leading_candidate_range": [0, conservative_last],
            "conservative_leading_candidate_record_count": conservative_last + 1,
            "first_record_after_leading_run": {
                "record_index": conservative_last + 1,
                "max_palette_index": max_indices[conservative_last + 1],
            },
            "e6_parameters_inside_conservative_range": [0, conservative_last - E6_FIRST_INDEX],
        },
        "interpretation_notice": (
            "The indexer arithmetic can address 741 records, but only the leading 512-record run shares the "
            "observed dialogue font's palette-index ceiling without a gap. This is a conservative candidate "
            "font-bank boundary, not proof that later records are unusable or that 512 entries suffice for Korean."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
