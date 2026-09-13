#!/usr/bin/env python3
"""Create a metadata-only Rev 1 catalog from the PC patch's Japanese message map.

The PC map is evidence for candidate blocks only.  This tool stores hashes and
coordinates, never the ROM bytes or copied message text.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zipfile
from pathlib import Path


GBA_ROM_BASE = 0x08000000
EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_map(data: bytes) -> tuple[tuple[int, int, int], list[tuple[int, int, int]]]:
    if len(data) < 12 or len(data) % 4:
        raise ValueError("map must contain a three-word header followed by complete words")
    values = struct.unpack(f"<{len(data) // 4}I", data)
    count, source_start, source_end = values[:3]
    record_words = values[3:]
    if len(record_words) != count * 3:
        raise ValueError(f"map header declares {count} records, found {len(record_words) // 3}")
    return (count, source_start, source_end), [tuple(record_words[index : index + 3]) for index in range(0, len(record_words), 3)]


def structural_signals(raw: bytes) -> dict[str, object]:
    first_offset = int.from_bytes(raw[:2], "little") if len(raw) >= 2 else None
    offset_table_count = first_offset // 2 if first_offset and first_offset % 2 == 0 else 0
    offsets = [int.from_bytes(raw[index : index + 2], "little") for index in range(0, first_offset or 0, 2)]
    offset_table_valid = bool(
        first_offset
        and first_offset <= len(raw)
        and len(offsets) == offset_table_count
        and offsets
        and offsets[0] == first_offset
        and all(first_offset <= offset < len(raw) for offset in offsets)
        and all(left <= right for left, right in zip(offsets, offsets[1:]))
    )
    controls = {f"{byte:02X}": raw.count(byte) for byte in (0xED, 0xF1, 0xF9, 0xFA)}
    script_like = offset_table_valid and (controls["ED"] > 0 or controls["F1"] > 0)
    return {
        "leading_u16_offset_table": offset_table_valid,
        "offset_table_entry_count": offset_table_count if offset_table_valid else None,
        "offset_table_offsets": offsets if offset_table_valid else [],
        "control_byte_counts": controls,
        "script_like": script_like,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--archive", type=Path, required=True)
    parser.add_argument("--map-member", default="exe2j/data/msg/message_jap.map")
    parser.add_argument("--package-member", default="exe2j/data/msg/message_jap.mpak")
    parser.add_argument("--state-report", type=Path, help="optional PNG-backed state analysis report")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    rom_sha256 = sha256(rom)
    if rom_sha256 != EXPECTED_ROM_SHA256:
        raise ValueError(f"unsupported ROM SHA-256: {rom_sha256}")

    with zipfile.ZipFile(args.archive) as archive:
        map_data = archive.read(args.map_member)
        package = archive.read(args.package_member)
    (declared_count, source_start, source_end), records = parse_map(map_data)
    state_pointer_counts: dict[str, int] = {}
    state_subentry_pointer_counts: dict[str, int] = {}
    if args.state_report:
        state_report = json.loads(args.state_report.read_text(encoding="utf-8"))
        for hit in state_report.get("gba_state_payload", {}).get("candidate_source_pointer_occurrences", []):
            state_pointer_counts[hit["id"]] = hit["source_pointer_le_occurrence_count"]
        for hit in state_report.get("gba_state_payload", {}).get("candidate_subentry_pointer_occurrences", []):
            state_subentry_pointer_counts[hit["id"]] = hit["source_pointer_le_occurrence_count"]

    catalog_records = []
    invalid_source_ranges = 0
    invalid_package_ranges = 0
    identical_payloads = 0
    for index, (source_address, package_offset, byte_length) in enumerate(records):
        source_offset = source_address - GBA_ROM_BASE
        source_valid = 0 <= source_offset <= len(rom) and byte_length <= len(rom) - source_offset
        package_valid = 0 <= package_offset <= len(package) and byte_length <= len(package) - package_offset
        if not source_valid:
            invalid_source_ranges += 1
        if not package_valid:
            invalid_package_ranges += 1
        raw = rom[source_offset : source_offset + byte_length] if source_valid else b""
        payload = package[package_offset : package_offset + byte_length] if package_valid else b""
        payload_identical = source_valid and package_valid and raw == payload
        identical_payloads += payload_identical
        signals = structural_signals(raw) if source_valid else {"leading_u16_offset_table": False, "offset_table_entry_count": None, "offset_table_offsets": [], "control_byte_counts": {}, "script_like": False}
        record_id = f"pc-jap-map-{index:04d}"
        pointer_occurrences = state_pointer_counts.get(record_id, 0)
        subentries = []
        if signals["script_like"]:
            unique_offsets = sorted(set(signals["offset_table_offsets"]))
            end_by_start = {
                start: next((end for end in unique_offsets if end > start), len(raw))
                for start in unique_offsets
            }
            for subindex, start in enumerate(signals["offset_table_offsets"]):
                end = end_by_start[start]
                subentry_id = f"{record_id}/entry-{subindex:02d}"
                subentries.append(
                    {
                        "id": subentry_id,
                        "source_rom_offset": source_offset + start,
                        "source_rom_address": source_address + start,
                        "byte_length": end - start,
                        "source_sha256": sha256(raw[start:end]),
                        "shared_start_with_previous": subindex > 0 and start == signals["offset_table_offsets"][subindex - 1],
                        "runtime_state_source_pointer_occurrence_count": state_subentry_pointer_counts.get(subentry_id, 0),
                    }
                )
        runtime_observed = pointer_occurrences or any(entry["runtime_state_source_pointer_occurrence_count"] for entry in subentries)
        if runtime_observed and signals["script_like"]:
            status = "runtime_pointer_observed_script_like"
        elif runtime_observed:
            status = "runtime_pointer_observed"
        elif signals["script_like"]:
            status = "candidate_script_like"
        else:
            status = "candidate_unclassified"
        catalog_records.append(
            {
                "id": record_id,
                "status": status,
                "source_rom_offset": source_offset if source_valid else None,
                "source_rom_address": source_address,
                "source_in_header_range": source_start <= source_address < source_end,
                "package_offset": package_offset,
                "byte_length": byte_length,
                "source_range_valid": source_valid,
                "package_range_valid": package_valid,
                "source_sha256": sha256(raw) if source_valid else None,
                "package_sha256": sha256(payload) if package_valid else None,
                "source_equals_japanese_package": payload_identical,
                "structural_signals": signals,
                "runtime_state_source_pointer_occurrence_count": pointer_occurrences,
                "subentries": subentries,
            }
        )

    report = {
        "schema_version": 1,
        "scope": {
            "rom_filename": args.rom.name,
            "rom_sha256": rom_sha256,
            "archive_filename": args.archive.name,
            "archive_sha256": sha256(args.archive.read_bytes()),
            "map_member": args.map_member,
            "package_member": args.package_member,
        },
        "map_header": {
            "declared_record_count": declared_count,
            "source_address_start": source_start,
            "source_address_end_exclusive": source_end,
        },
        "summary": {
            "candidate_block_count": len(catalog_records),
            "source_range_invalid_count": invalid_source_ranges,
            "package_range_invalid_count": invalid_package_ranges,
            "source_equals_japanese_package_count": identical_payloads,
            "script_like_candidate_count": sum(record["structural_signals"]["script_like"] for record in catalog_records),
            "candidate_subentry_count": sum(len(record["subentries"]) for record in catalog_records),
            "runtime_pointer_observed_count": sum(record["status"].startswith("runtime_pointer_observed") for record in catalog_records),
            "unclassified_count": sum(record["status"] == "candidate_unclassified" for record in catalog_records),
        },
        "records": catalog_records,
        "interpretation_notice": (
            "All records are structural candidates. A candidate is not a text entry until a "
            "runtime consumer or independent decoding evidence confirms its boundaries and meaning."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
