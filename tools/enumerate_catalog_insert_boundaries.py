#!/usr/bin/env python3
"""List metadata-only direct-glyph/control insertion boundaries for one block."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def parse_table(block: bytes) -> list[int]:
    if len(block) < 4:
        raise ValueError("block is too short")
    table_bytes = struct.unpack_from("<H", block)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(block):
        raise ValueError("block has no valid u16 offset table")
    table = [struct.unpack_from("<H", block, offset)[0] for offset in range(0, table_bytes, 2)]
    if table[0] != table_bytes or any(left > right for left, right in zip(table, table[1:])):
        raise ValueError("table is not monotonic")
    return table


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--block-id", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    catalog_bytes = args.catalog.read_bytes()
    catalog = json.loads(catalog_bytes)
    record = next((row for row in catalog.get("records", []) if isinstance(row, dict) and row.get("id") == args.block_id), None)
    if record is None:
        raise ValueError("block id is absent from catalog")
    offset, length = record.get("source_rom_offset"), record.get("byte_length")
    if not isinstance(offset, int) or not isinstance(length, int):
        raise ValueError("catalog record range is invalid")
    block = rom[offset:offset + length]
    if len(block) != length or hashlib.sha256(block).hexdigest() != record.get("source_sha256"):
        raise ValueError("catalog source range differs from the declared base ROM")
    table = parse_table(block)
    entries = []
    for index, (start, end) in enumerate(zip(table, table[1:])):
        candidates = [relative for relative in range(1, end - start) if block[start + relative - 1] < 0xE5 <= block[start + relative]]
        entries.append({"entry_index": index, "byte_length": end - start, "verified_direct_glyph_control_relative_offsets": candidates})
    report = {
        "schema_version": 1,
        "kind": "catalog_block_direct_glyph_control_boundary_inventory",
        "input": {"filename": args.rom.name, "sha256": digest},
        "catalog": {"filename": args.catalog.name, "sha256": hashlib.sha256(catalog_bytes).hexdigest()},
        "block": {"id": args.block_id, "source_rom_offset": offset, "byte_length": length, "entry_count": len(entries)},
        "entries": entries,
        "interpretation_notice": "Offsets identify verified byte-boundary shape only; they do not disclose source text or prove semantic insertion suitability.",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
