#!/usr/bin/env python3
"""Read-only initial survey for a GBA ROM.

This tool never writes to the supplied ROM.  It records reproducible structural
observations only; candidate results must still be verified against the game's
runtime consumers before being treated as format specifications.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


GBA_ROM_BASE = 0x08000000


def gba_header(data: bytes) -> dict[str, object]:
    def ascii_at(offset: int, size: int) -> str:
        return data[offset : offset + size].rstrip(b"\0").decode("ascii", "replace")

    expected = (-sum(data[0xA0:0xBD]) - 0x19) & 0xFF
    return {
        "title": ascii_at(0xA0, 12),
        "game_code": ascii_at(0xAC, 4),
        "maker_code": ascii_at(0xB0, 2),
        "software_version": data[0xBC],
        "header_checksum": f"{data[0xBD]:02X}",
        "computed_header_checksum": f"{expected:02X}",
        "header_checksum_valid": data[0xBD] == expected,
    }


def lz77_end(data: bytes, start: int) -> tuple[int | None, int]:
    """Validate and skip a GBA BIOS LZ77 (0x10) stream.

    Returns the byte immediately after the stream (or None when malformed) and
    the declared decompressed size.  No output is materialized.
    """
    if start + 4 > len(data) or data[start] != 0x10:
        return None, 0
    unpacked_size = int.from_bytes(data[start + 1 : start + 4], "little")
    if not 0 < unpacked_size <= 0x200000:
        return None, unpacked_size
    source = start + 4
    produced = 0
    while produced < unpacked_size:
        if source >= len(data):
            return None, unpacked_size
        flags = data[source]
        source += 1
        for bit in range(8):
            if produced >= unpacked_size:
                break
            if not (flags & (0x80 >> bit)):
                if source >= len(data):
                    return None, unpacked_size
                source += 1
                produced += 1
                continue
            if source + 2 > len(data):
                return None, unpacked_size
            pair = int.from_bytes(data[source : source + 2], "big")
            source += 2
            length = (pair >> 12) + 3
            displacement = (pair & 0x0FFF) + 1
            if displacement > produced:
                return None, unpacked_size
            produced += min(length, unpacked_size - produced)
    return source, unpacked_size


def scan_lz77(data: bytes) -> list[dict[str, int]]:
    streams: list[dict[str, int]] = []
    for offset, value in enumerate(data):
        if value != 0x10:
            continue
        end, unpacked_size = lz77_end(data, offset)
        if end is not None:
            streams.append(
                {
                    "rom_offset": offset,
                    "rom_address": GBA_ROM_BASE + offset,
                    "packed_size": end - offset,
                    "unpacked_size": unpacked_size,
                }
            )
    return streams


def ascii_runs(data: bytes, minimum: int = 5, limit: int = 200) -> dict[str, object]:
    """Summarize printable runs without retaining ROM text in the report."""
    results: list[dict[str, object]] = []
    count = 0
    start: int | None = None
    for index, value in enumerate(data + b"\0"):
        printable = 0x20 <= value <= 0x7E
        if printable and start is None:
            start = index
        if not printable and start is not None:
            if index - start >= minimum:
                raw = data[start:index]
                count += 1
                if len(results) < limit:
                    results.append(
                        {
                            "rom_offset": start,
                            "rom_address": GBA_ROM_BASE + start,
                            "length": len(raw),
                            "sha256": hashlib.sha256(raw).hexdigest(),
                        }
                    )
            start = None
    return {"candidate_count": count, "sample_limit": limit, "samples": results}


def gba_pointer_candidates(data: bytes) -> dict[str, object]:
    counts: Counter[int] = Counter()
    samples: dict[int, list[int]] = {}
    for offset in range(0, len(data) - 3, 4):
        value = int.from_bytes(data[offset : offset + 4], "little")
        target = value - GBA_ROM_BASE
        if 0 <= target < len(data):
            counts[target] += 1
            samples.setdefault(target, []).append(offset)
    common = []
    for target, count in counts.most_common(200):
        common.append(
            {
                "target_rom_offset": target,
                "target_rom_address": GBA_ROM_BASE + target,
                "reference_count": count,
                "sample_storage_offsets": samples[target][:8],
            }
        )
    return {"aligned_pointer_words": sum(counts.values()), "top_targets": common}


def repeated_byte_runs(data: bytes, minimum: int = 0x100, limit: int = 100) -> list[dict[str, int]]:
    """Find long 00/FF runs as *space candidates*, not confirmed free space."""
    runs: list[dict[str, int]] = []
    index = 0
    while index < len(data):
        value = data[index]
        if value not in (0x00, 0xFF):
            index += 1
            continue
        end = index + 1
        while end < len(data) and data[end] == value:
            end += 1
        if end - index >= minimum:
            runs.append({"rom_offset": index, "length": end - index, "byte_value": value})
        index = end
    return sorted(runs, key=lambda run: run["length"], reverse=True)[:limit]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True, help="input ROM (read-only)")
    parser.add_argument("--output", type=Path, required=True, help="survey JSON output")
    args = parser.parse_args()

    data = args.rom.read_bytes()
    lz77 = scan_lz77(data)
    report = {
        "schema_version": 1,
        "input": {
            "filename": args.rom.name,
            "byte_length": len(data),
            "sha256": hashlib.sha256(data).hexdigest(),
        },
        "gba_header": gba_header(data),
        "observations": {
            "gba_bios_lz77_0x10": {
                "validated_stream_count": len(lz77),
                "streams": lz77,
            },
            "ascii_runs_minimum_5": ascii_runs(data),
            "aligned_rom_pointer_candidates": gba_pointer_candidates(data),
            "repeated_00_or_ff_runs_minimum_256": repeated_byte_runs(data),
        },
        "interpretation_notice": (
            "All offsets, LZ streams, pointers, and repeated-byte runs are candidates. "
            "Confirm each with runtime or independent evidence before modification."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
