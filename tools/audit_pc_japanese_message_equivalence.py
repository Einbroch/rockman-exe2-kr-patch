#!/usr/bin/env python3
"""Compare PC Japanese message-package records with the verified GBA ROM.

The audit reads the archive in memory and writes only aggregate metadata,
offsets, lengths, and hashes. It never exports source messages or assets.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zipfile
from collections import Counter
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
EXPECTED_ARCHIVE_SHA256 = "47756a72a1e793b6b02e07cc16404ff4b2e6ca5ff4bc554edff2c38e6cc3debc"
ROM_CPU_BASE = 0x08000000
MAP_MEMBER = "exe2j/data/msg/message_jap.map"
PACKAGE_MEMBER = "exe2j/data/msg/message_jap.mpak"
PROBE_OFFSET = 0x77A2AE
PROBE_LENGTH = 59


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--archive", type=Path, required=True)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    archive_data = args.archive.read_bytes()
    if sha256(archive_data) != EXPECTED_ARCHIVE_SHA256:
        raise ValueError("unexpected PC reference archive SHA-256")
    rom = args.rom.read_bytes()
    if sha256(rom) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected Rev 1 ROM SHA-256")

    with zipfile.ZipFile(args.archive) as archive:
        map_data = archive.read(MAP_MEMBER)
        package_data = archive.read(PACKAGE_MEMBER)
    if len(map_data) < 12 or len(map_data) % 4:
        raise ValueError("Japanese message map is not a valid u32 table")
    values = struct.unpack(f"<{len(map_data) // 4}I", map_data)
    declared_count, declared_start, declared_end = values[:3]
    words = values[3:]
    if len(words) != declared_count * 3:
        raise ValueError("Japanese message map record count does not match header")

    comparison_counts: Counter[str] = Counter()
    valid_records = []
    invalid_record_count = 0
    for index in range(declared_count):
        source_address, package_offset, byte_length = words[index * 3 : index * 3 + 3]
        source_offset = source_address - ROM_CPU_BASE
        valid = (
            ROM_CPU_BASE <= source_address <= source_address + byte_length <= ROM_CPU_BASE + len(rom)
            and package_offset <= len(package_data)
            and byte_length <= len(package_data) - package_offset
        )
        if not valid:
            invalid_record_count += 1
            continue
        source = rom[source_offset:source_offset + byte_length]
        package = package_data[package_offset:package_offset + byte_length]
        comparison_counts["equal" if source == package else "different"] += 1
        valid_records.append((index, source_offset, byte_length))

    probe_end = PROBE_OFFSET + PROBE_LENGTH
    covering = [
        {"record_index": index, "source_rom_offset": offset, "source_byte_length": length}
        for index, offset, length in valid_records
        if offset <= PROBE_OFFSET and probe_end <= offset + length
    ]
    overlaps = [
        {"record_index": index, "source_rom_offset": offset, "source_byte_length": length}
        for index, offset, length in valid_records
        if offset < probe_end and PROBE_OFFSET < offset + length
    ]
    report = {
        "schema_version": 1,
        "inputs": {
            "archive_filename": args.archive.name,
            "archive_sha256": sha256(archive_data),
            "rom_filename": args.rom.name,
            "rom_sha256": sha256(rom),
        },
        "map": {
            "member": MAP_MEMBER,
            "package_member": PACKAGE_MEMBER,
            "declared_record_count": declared_count,
            "declared_source_cpu_range": [declared_start, declared_end],
            "valid_record_count": len(valid_records),
            "invalid_record_count": invalid_record_count,
            "package_byte_length": len(package_data),
            "record_byte_equivalence": dict(comparison_counts),
        },
        "active_entry_probe": {
            "source_rom_offset": PROBE_OFFSET,
            "source_byte_length": PROBE_LENGTH,
            "source_sha256": sha256(rom[PROBE_OFFSET:probe_end]),
            "fully_covered_by_records": covering,
            "overlapping_records": overlaps,
        },
        "interpretation_notice": (
            "Equality establishes that a PC Japanese package record reproduces the corresponding bytes in this Rev 1 ROM. "
            "It does not decode text, assign control semantics, authorize insertion, or transfer PC assets into the GBA project."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
