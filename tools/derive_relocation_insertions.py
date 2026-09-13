#!/usr/bin/env python3
"""Recover insertion coordinates from a bounded relocated-block PoC.

This emits metadata only (entry indices, relative offsets, and lengths). It
never emits source text or inserted byte streams.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from difflib import SequenceMatcher
from pathlib import Path


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_table(block: bytes) -> list[int]:
    if len(block) < 4:
        raise ValueError("block is too short")
    table_bytes = struct.unpack_from("<H", block)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(block):
        raise ValueError("block has no valid u16 offset table")
    values = [struct.unpack_from("<H", block, offset)[0] for offset in range(0, table_bytes, 2)]
    if values[0] != table_bytes or any(left > right for left, right in zip(values, values[1:])):
        raise ValueError("table offsets are not monotonic")
    return values


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-rom", type=Path, required=True)
    parser.add_argument("--poc-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    manifest_bytes = args.manifest.read_bytes()
    manifest = json.loads(manifest_bytes)
    writes = manifest.get("expected_writes")
    if not isinstance(writes, list) or not writes or not isinstance(writes[0], dict):
        raise ValueError("manifest has no relocated-block write")
    write = writes[0]
    for key in ("source_rom_offset", "source_byte_length", "target_rom_offset", "target_byte_length"):
        if not isinstance(write.get(key), int):
            raise ValueError(f"manifest is missing integer {key}")
    source_offset = int(write["source_rom_offset"])
    source_length = int(write["source_byte_length"])
    target_offset = int(write["target_rom_offset"])
    target_length = int(write["target_byte_length"])

    base = args.base_rom.read_bytes()
    poc = args.poc_rom.read_bytes()
    source = base[source_offset:source_offset + source_length]
    relocated = poc[target_offset:target_offset + target_length]
    if len(source) != source_length or len(relocated) != target_length:
        raise ValueError("declared block range exceeds input")
    if write.get("source_sha256") != sha256(source):
        raise ValueError("source block does not match manifest")

    source_table = parse_table(source)
    relocated_table = parse_table(relocated)
    if len(source_table) != len(relocated_table):
        raise ValueError("table entry count changed")

    insertions = []
    for index in range(len(source_table) - 1):
        source_entry = source[source_table[index]:source_table[index + 1]]
        relocated_entry = relocated[relocated_table[index]:relocated_table[index + 1]]
        matcher = SequenceMatcher(a=source_entry, b=relocated_entry, autojunk=False)
        chunks = [op for op in matcher.get_opcodes() if op[0] != "equal"]
        if not chunks:
            continue
        if len(chunks) != 1 or chunks[0][0] != "insert":
            raise ValueError(f"entry {index} does not contain one bounded insertion")
        _, source_start, source_end, relocated_start, relocated_end = chunks[0]
        if source_start != source_end:
            raise ValueError(f"entry {index} modifies source bytes")
        insertions.append(
            {
                "entry_index": index,
                "relative_offset": source_start,
                "inserted_byte_length": relocated_end - relocated_start,
            }
        )

    expected = write.get("edited_entries")
    if isinstance(expected, list) and len(expected) != len(insertions):
        raise ValueError("derived insertion count differs from manifest")
    if not insertions:
        raise ValueError("no insertions were derived")
    report = {
        "schema_version": 1,
        "kind": "derived_relocation_insertion_coordinates",
        "input": {
            "base_rom_sha256": sha256(base),
            "poc_rom_sha256": sha256(poc),
            "manifest_sha256": sha256(manifest_bytes),
        },
        "block": {
            "source_rom_offset": source_offset,
            "source_byte_length": source_length,
            "target_rom_offset": target_offset,
            "target_byte_length": target_length,
            "table_entry_count": len(source_table) - 1,
        },
        "insertions": insertions,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
