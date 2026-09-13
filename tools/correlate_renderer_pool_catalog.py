#!/usr/bin/env python3
"""Correlate the active EWRAM renderer pool with catalogued ROM blocks.

Only match metadata is emitted. Source and EWRAM bytes are never serialized.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from inspect_renderer_state_pointer import (
    EWRAM_BASE,
    EWRAM_BYTES,
    EWRAM_STATE_START,
    FIELDS,
    ROM_BASE,
    state_payload,
)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--seed-bytes", type=int, default=16)
    args = parser.parse_args()
    if not 8 <= args.seed_bytes <= 32:
        raise ValueError("seed length must be between 8 and 32")

    payload = state_payload(args.input)
    rom = args.rom.read_bytes()
    catalog_bytes = args.catalog.read_bytes()
    records = json.loads(catalog_bytes).get("records")
    if not isinstance(records, list):
        raise ValueError("catalog has no records")

    r10 = struct.unpack_from("<I", payload, 0x20 + 10 * 4)[0]
    global_offset = r10 + 0x48 - ROM_BASE
    if not 0 <= global_offset <= len(rom) - 4:
        raise ValueError("saved r10 does not resolve the renderer global")
    renderer_state = struct.unpack_from("<I", rom, global_offset)[0]
    if not EWRAM_BASE <= renderer_state < EWRAM_BASE + EWRAM_BYTES:
        raise ValueError("renderer state is outside EWRAM")
    renderer_offset = EWRAM_STATE_START + renderer_state - EWRAM_BASE
    pointers = {name: struct.unpack_from("<I", payload, renderer_offset + relative)[0] for name, relative in FIELDS.items()}
    base = pointers["source_block_base"]
    current = pointers["current_text_pointer"]
    end = pointers["current_entry_end"]
    if not all(EWRAM_BASE <= value < EWRAM_BASE + EWRAM_BYTES for value in (base, current, end)):
        raise ValueError("renderer pointers do not all identify EWRAM")
    pool_end = min(EWRAM_BASE + EWRAM_BYTES, max(current, end) + 64)
    if pool_end <= base or pool_end - base > 0x10000:
        raise ValueError("renderer pool window is invalid or unbounded")
    pool_state_start = EWRAM_STATE_START + base - EWRAM_BASE
    pool = payload[pool_state_start : pool_state_start + pool_end - base]

    seed_index: dict[bytes, list[tuple[str, int, int]]] = {}
    record_lengths: dict[str, int] = {}
    for record in records:
        record_id = record.get("id")
        source_offset = record.get("source_rom_offset")
        length = record.get("byte_length")
        if not isinstance(record_id, str) or not isinstance(source_offset, int) or not isinstance(length, int):
            continue
        raw = rom[source_offset : source_offset + length]
        record_lengths[record_id] = len(raw)
        for relative in range(0, len(raw) - args.seed_bytes + 1):
            seed_index.setdefault(raw[relative : relative + args.seed_bytes], []).append((record_id, source_offset, relative))

    best: dict[str, dict[str, int | str]] = {}
    for pool_relative in range(0, len(pool) - args.seed_bytes + 1):
        for record_id, source_offset, source_relative in seed_index.get(pool[pool_relative : pool_relative + args.seed_bytes], []):
            left = 0
            while left < pool_relative and left < source_relative and pool[pool_relative - left - 1] == rom[source_offset + source_relative - left - 1]:
                left += 1
            right = args.seed_bytes
            record_length = record_lengths[record_id]
            while (
                pool_relative + right < len(pool)
                and source_relative + right < record_length
                and pool[pool_relative + right] == rom[source_offset + source_relative + right]
            ):
                right += 1
            matched = left + right
            previous = best.get(record_id)
            if previous is None or matched > int(previous["matched_byte_length"]):
                best[record_id] = {
                    "id": record_id,
                    "matched_byte_length": matched,
                    "source_relative_offset": source_relative - left,
                    "pool_relative_offset": pool_relative - left,
                }
    ranked = sorted(best.values(), key=lambda row: (-int(row["matched_byte_length"]), str(row["id"])))[:20]
    report = {
        "schema_version": 1,
        "kind": "renderer_ewram_pool_catalog_correlation",
        "input": {"filename": args.input.name, "sha256": sha256(args.input.read_bytes())},
        "state_payload_sha256": sha256(payload),
        "rom": {"filename": args.rom.name, "sha256": sha256(rom)},
        "catalog": {"filename": args.catalog.name, "sha256": sha256(catalog_bytes)},
        "renderer_state_address": renderer_state,
        "pool": {
            "base_address": base,
            "current_pointer_relative_offset": current - base,
            "entry_end_relative_offset": end - base,
            "window_byte_length": len(pool),
            "seed_byte_length": args.seed_bytes,
        },
        "ranked_catalog_matches": ranked,
        "interpretation_notice": (
            "Matches show exact byte runs shared by the active EWRAM pool and catalogued ROM ranges. Short runs can "
            "occur by chance; a block still needs pointer/call-site and runtime checks before reinsertion."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
