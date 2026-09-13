#!/usr/bin/env python3
"""Find PC-relative literal loads of structural message-block addresses.

This is a metadata-only scaling audit for the catalogued script-like blocks.
It identifies direct Thumb/ARM literal-load references but does not infer that
the loaded address is consumed as text or that the block is safe to relocate.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from collections import defaultdict
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ROM_BASE = 0x08000000


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected Rev 1 ROM SHA-256")
    catalog_bytes = args.catalog.read_bytes()
    catalog = json.loads(catalog_bytes)
    if catalog.get("scope", {}).get("rom_sha256") != EXPECTED_ROM_SHA256:
        raise ValueError("catalog does not identify the supported Rev 1 ROM")

    address_to_records: dict[int, list[dict[str, object]]] = defaultdict(list)
    for record in catalog.get("records", []):
        if not record.get("structural_signals", {}).get("script_like"):
            continue
        offset = record.get("source_rom_offset")
        length = record.get("byte_length")
        source_sha256 = record.get("source_sha256")
        if not isinstance(offset, int) or not isinstance(length, int) or not isinstance(source_sha256, str):
            raise ValueError("catalog script-like record is malformed")
        if offset < 0 or length <= 0 or offset + length > len(rom):
            raise ValueError("catalog script-like record lies outside ROM")
        if hashlib.sha256(rom[offset:offset + length]).hexdigest() != source_sha256:
            raise ValueError("catalog script-like record hash differs from ROM")
        address_to_records[ROM_BASE + offset].append({
            "id": record.get("id"),
            "rom_offset": offset,
            "byte_length": length,
            "runtime_pointer_observed": str(record.get("status", "")).startswith("runtime_pointer_observed"),
        })

    refs: dict[int, list[dict[str, int | str]]] = defaultdict(list)
    for instruction_offset in range(0, len(rom) - 1, 2):
        instruction = struct.unpack_from("<H", rom, instruction_offset)[0]
        if instruction & 0xF800 != 0x4800:
            continue
        literal_offset = ((instruction_offset + 4) & ~3) + (instruction & 0xFF) * 4
        if literal_offset + 4 > len(rom):
            continue
        value = struct.unpack_from("<I", rom, literal_offset)[0]
        if value in address_to_records:
            refs[value].append({
                "architecture": "thumb",
                "instruction_offset": instruction_offset,
                "literal_offset": literal_offset,
                "destination_register": (instruction >> 8) & 7,
            })
    for instruction_offset in range(0, len(rom) - 3, 4):
        instruction = struct.unpack_from("<I", rom, instruction_offset)[0]
        if instruction & 0x0E5F0000 != 0x041F0000:
            continue
        immediate = instruction & 0xFFF
        literal_offset = instruction_offset + 8 + (immediate if instruction & 0x00800000 else -immediate)
        if literal_offset < 0 or literal_offset + 4 > len(rom):
            continue
        value = struct.unpack_from("<I", rom, literal_offset)[0]
        if value in address_to_records:
            refs[value].append({
                "architecture": "arm",
                "instruction_offset": instruction_offset,
                "literal_offset": literal_offset,
                "destination_register": (instruction >> 12) & 0xF,
            })

    referenced = []
    for address in sorted(refs):
        for record in address_to_records[address]:
            referenced.append({
                "id": record["id"],
                "block_rom_offset": record["rom_offset"],
                "block_byte_length": record["byte_length"],
                "runtime_pointer_observed": record["runtime_pointer_observed"],
                "literal_load_references": refs[address],
            })
    report = {
        "schema_version": 1,
        "scope": {
            "rom_filename": args.rom.name,
            "rom_sha256": digest,
            "catalog_filename": args.catalog.name,
            "catalog_sha256": hashlib.sha256(catalog_bytes).hexdigest(),
        },
        "validation": {
            "script_like_record_range_validation": "passed",
            "script_like_record_hash_validation": "passed",
        },
        "summary": {
            "catalog_script_like_block_count": sum(len(records) for records in address_to_records.values()),
            "unique_script_like_block_address_count": len(address_to_records),
            "blocks_with_direct_pc_relative_literal_load": len(referenced),
            "literal_load_reference_count": sum(len(item["literal_load_references"]) for item in referenced),
        },
        "blocks_with_direct_pc_relative_literal_load": referenced,
        "interpretation": "A PC-relative literal load is a relocation-research lead only. The audit does not prove consumer semantics, absence of constructed pointers, message boundaries, or relocation safety.",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
