#!/usr/bin/env python3
"""Cross-check the runtime-observed entry against all PC patch language packages."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zipfile
from pathlib import Path


def read_u16_offsets(block: bytes) -> list[int]:
    if len(block) < 2:
        raise ValueError("block is too short for an offset table")
    table_bytes = int.from_bytes(block[:2], "little")
    if not table_bytes or table_bytes % 2 or table_bytes > len(block):
        raise ValueError("invalid leading offset-table size")
    offsets = [int.from_bytes(block[index : index + 2], "little") for index in range(0, table_bytes, 2)]
    if offsets[0] != table_bytes or any(left > right for left, right in zip(offsets, offsets[1:])):
        raise ValueError("invalid leading offset-table values")
    return offsets


def parse_map_record(archive: zipfile.ZipFile, language: str, record_index: int) -> tuple[int, int, int]:
    member = f"exe2j/data/msg/message_{language}.map"
    data = archive.read(member)
    values = struct.unpack(f"<{len(data) // 4}I", data)
    count = values[0]
    if not 0 <= record_index < count:
        raise ValueError(f"record index {record_index} is outside {language} map")
    offset = 3 + record_index * 3
    return tuple(values[offset : offset + 3])


def common_prefix_length(values: list[bytes]) -> int:
    for index, row in enumerate(zip(*values)):
        if len(set(row)) != 1:
            return index
    return min(map(len, values))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--archive", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    observed = [
        (record, entry)
        for record in catalog["records"]
        for entry in record.get("subentries", [])
        if entry["runtime_state_source_pointer_occurrence_count"] > 0
    ]
    if len(observed) != 1:
        raise ValueError(f"expected one runtime-observed subentry, found {len(observed)}")
    record, entry = observed[0]
    record_index = int(record["id"].rsplit("-", 1)[1])
    entry_index = int(entry["id"].rsplit("-", 1)[1])
    rom = args.rom.read_bytes()
    source_block = rom[record["source_rom_offset"] : record["source_rom_offset"] + record["byte_length"]]
    source_offsets = read_u16_offsets(source_block)
    source_payload = source_block[entry["source_rom_offset"] - record["source_rom_offset"] : entry["source_rom_offset"] - record["source_rom_offset"] + entry["byte_length"]]

    language_payloads: dict[str, bytes] = {}
    language_entries: dict[str, dict[str, int]] = {}
    with zipfile.ZipFile(args.archive) as archive:
        for language in ("jap", "chs", "cht", "eng"):
            _, package_offset, package_length = parse_map_record(archive, language, record_index)
            package = archive.read(f"exe2j/data/msg/message_{language}.mpak")
            block = package[package_offset : package_offset + package_length]
            offsets = read_u16_offsets(block)
            if entry_index >= len(offsets):
                raise ValueError(f"entry {entry_index} is absent in {language} block")
            start = offsets[entry_index]
            end = next((offset for offset in offsets if offset > start), len(block))
            language_payloads[language] = block[start:end]
            language_entries[language] = {
                "package_offset": package_offset,
                "block_byte_length": package_length,
                "entry_relative_start": start,
                "entry_byte_length": end - start,
            }

    all_payloads = [source_payload, *language_payloads.values()]
    prefix_length = common_prefix_length(all_payloads)
    report = {
        "schema_version": 1,
        "runtime_entry": {
            "id": entry["id"],
            "source_rom_offset": entry["source_rom_offset"],
            "source_rom_address": entry["source_rom_address"],
            "entry_index": entry_index,
            "source_entry_byte_length": len(source_payload),
            "source_entry_sha256": hashlib.sha256(source_payload).hexdigest(),
        },
        "cross_language": {
            "languages": language_entries,
            "all_representations_common_prefix_byte_length": prefix_length,
            "common_prefix_hex": source_payload[:prefix_length].hex(),
            "first_language_specific_byte_offset": prefix_length if prefix_length < min(map(len, all_payloads)) else None,
            "interpretation": (
                "The common prefix is preserved in the GBA source and every PC language package. "
                "It is a control-sequence candidate; its opcode meanings and argument widths still "
                "require confirmation from the GBA consumer."
            ),
        },
        "source_offset_table": {
            "entry_count": len(source_offsets),
            "entry_relative_start": source_offsets[entry_index],
            "next_entry_relative_start": next((offset for offset in source_offsets if offset > source_offsets[entry_index]), len(source_block)),
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
