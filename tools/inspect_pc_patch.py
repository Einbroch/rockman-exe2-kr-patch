#!/usr/bin/env python3
"""Inventory a Legacy Collection-style patch archive without extracting assets."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zipfile
from collections import Counter
from pathlib import Path


MAX_METADATA_MEMBER_BYTES = 1_000_000
GBA_ROM_BASE = 0x08000000


def read_small_member(archive: zipfile.ZipFile, name: str) -> bytes:
    info = archive.getinfo(name)
    if info.file_size > MAX_METADATA_MEMBER_BYTES:
        raise ValueError(f"refusing to read oversized metadata member: {name}")
    return archive.read(info)


def map_summary(archive: zipfile.ZipFile, name: str, package_byte_length: int | None) -> dict[str, object]:
    data = read_small_member(archive, name)
    if len(data) % 4:
        return {"byte_length": len(data), "valid_little_endian_u32_table": False}
    values = list(struct.unpack(f"<{len(data) // 4}I", data))
    result: dict[str, object] = {
        "byte_length": len(data),
        "valid_little_endian_u32_table": True,
        "u32_count": len(values),
        "minimum": min(values, default=0),
        "maximum": max(values, default=0),
        "first_16_values": values[:16],
    }
    if len(values) >= 3:
        declared_count = values[0]
        record_words = values[3:]
        result["three_word_record_layout"] = {
            "declared_record_count": declared_count,
            "header_source_start": values[1],
            "header_source_end": values[2],
            "record_word_count": len(record_words),
            "record_count_matches_header": len(record_words) == declared_count * 3,
            "sample_records": [
                {"source_address": record_words[index], "package_offset": record_words[index + 1], "byte_length": record_words[index + 2]}
                for index in range(0, min(len(record_words) // 3, 5) * 3, 3)
            ],
        }
        records = [tuple(record_words[index : index + 3]) for index in range(0, len(record_words) - 2, 3)]
        result["record_validation"] = {
            "source_addresses_in_declared_range": sum(values[1] <= source < values[2] for source, _, _ in records),
            "source_addresses_outside_declared_range": sum(not (values[1] <= source < values[2]) for source, _, _ in records),
            "package_member_bytes": package_byte_length,
            "records_within_package_bounds": (
                sum(offset <= package_byte_length and length <= package_byte_length - offset for _, offset, length in records)
                if package_byte_length is not None
                else None
            ),
            "records_outside_package_bounds": (
                sum(not (offset <= package_byte_length and length <= package_byte_length - offset) for _, offset, length in records)
                if package_byte_length is not None
                else None
            ),
        }
    return result


def sha256_stream(stream) -> str:
    digest = hashlib.sha256()
    while block := stream.read(1024 * 1024):
        digest.update(block)
    return digest.hexdigest()


def gba_header(data: bytes) -> dict[str, object]:
    def ascii_at(offset: int, size: int) -> str:
        return data[offset : offset + size].rstrip(b"\0").decode("ascii", "replace")

    expected = (-sum(data[0xA0:0xBD]) - 0x19) & 0xFF
    return {
        "title": ascii_at(0xA0, 12),
        "game_code": ascii_at(0xAC, 4),
        "maker_code": ascii_at(0xB0, 2),
        "software_version": data[0xBC],
        "header_checksum_valid": data[0xBD] == expected,
    }


def compare_range(archive: zipfile.ZipFile, member: zipfile.ZipInfo, local_rom: Path, start: int, end: int) -> dict[str, object]:
    """Compare a ROM range in memory without writing either input to disk."""
    if not 0 <= start <= end <= member.file_size:
        raise ValueError(f"invalid comparison range: {start:#x}..{end:#x}")
    with archive.open(member) as stream:
        stream.read(start)
        archive_data = stream.read(end - start)
    with local_rom.open("rb") as stream:
        stream.seek(start)
        local_data = stream.read(end - start)
    differences = [index for index, (left, right) in enumerate(zip(archive_data, local_data)) if left != right]
    return {
        "rom_offset_start": start,
        "rom_offset_end_exclusive": end,
        "byte_length": end - start,
        "archive_sha256": hashlib.sha256(archive_data).hexdigest(),
        "local_sha256": hashlib.sha256(local_data).hexdigest(),
        "byte_identical": not differences and len(archive_data) == len(local_data),
        "different_byte_count": len(differences),
        "first_difference_rom_offset": start + differences[0] if differences else None,
        "last_difference_rom_offset": start + differences[-1] if differences else None,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--archive", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--compare-rom", type=Path, help="local ROM to compare without extracting the archive member")
    parser.add_argument("--rom-member", default="exe2j/rom.srl", help="archive member used by --compare-rom")
    args = parser.parse_args()

    archive_bytes = args.archive.read_bytes()
    with zipfile.ZipFile(args.archive) as archive:
        members = archive.infolist()
        file_members = [member for member in members if not member.is_dir()]
        names = {member.filename for member in file_members}
        message_maps = {}
        for name in sorted(name for name in names if name.startswith("exe2j/data/msg/") and name.endswith(".map")):
            package_name = name.removesuffix(".map") + ".mpak"
            package_size = archive.getinfo(package_name).file_size if package_name in names else None
            message_maps[name] = map_summary(archive, name, package_size)
        report = {
            "schema_version": 1,
            "archive": {
                "filename": args.archive.name,
                "sha256": hashlib.sha256(archive_bytes).hexdigest(),
                "byte_length": len(archive_bytes),
                "member_count": len(members),
                "uncompressed_byte_length": sum(member.file_size for member in file_members),
                "encrypted_member_count": sum(bool(member.flag_bits & 1) for member in file_members),
                "compression_method_counts": dict(Counter(member.compress_type for member in file_members)),
            },
            "members": [
                {
                    "path": member.filename,
                    "uncompressed_bytes": member.file_size,
                    "compressed_bytes": member.compress_size,
                    "crc32": f"{member.CRC:08x}",
                }
                for member in file_members
            ],
            "message_maps": message_maps,
            "reference_boundary": (
                "This report inventories metadata only. Do not extract, commit, or redistribute "
                "the archive's game assets. Reuse terminology and independently verified format "
                "ideas only; do not transfer PC offsets, fonts, or binary assets to the GBA project."
            ),
        }
        if args.compare_rom:
            info = archive.getinfo(args.rom_member)
            local_sha256 = hashlib.sha256(args.compare_rom.read_bytes()).hexdigest()
            with archive.open(info) as member_stream:
                archive_sha256 = sha256_stream(member_stream)
            with archive.open(info) as member_stream:
                archive_header = gba_header(member_stream.read(0xBE))
            with args.compare_rom.open("rb") as local_stream:
                local_header = gba_header(local_stream.read(0xBE))
            report["rom_comparison"] = {
                "archive_member": args.rom_member,
                "archive_member_bytes": info.file_size,
                "local_rom_filename": args.compare_rom.name,
                "local_rom_bytes": args.compare_rom.stat().st_size,
                "archive_member_sha256": archive_sha256,
                "local_rom_sha256": local_sha256,
                "byte_identical": info.file_size == args.compare_rom.stat().st_size and archive_sha256 == local_sha256,
                "archive_gba_header": archive_header,
                "local_gba_header": local_header,
            }
            regions = {
                (layout["header_source_start"] - GBA_ROM_BASE, layout["header_source_end"] - GBA_ROM_BASE)
                for summary in message_maps.values()
                if (layout := summary.get("three_word_record_layout"))
                and GBA_ROM_BASE <= layout["header_source_start"] <= layout["header_source_end"] <= GBA_ROM_BASE + info.file_size
            }
            report["message_source_range_comparisons"] = [
                compare_range(archive, info, args.compare_rom, start, end)
                for start, end in sorted(regions)
            ]
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
