#!/usr/bin/env python3
"""Verify that an emulator EWRAM dump contains the relocated EXE2 archive."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from gba_lz77 import decompress


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--ewram", type=Path, required=True)
    parser.add_argument("--archive-manifest", type=Path, required=True)
    parser.add_argument("--ewram-offset", type=lambda value: int(value, 0), default=0x38800)
    parser.add_argument("--output-report", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if args.output_report.exists() and not args.force:
        raise FileExistsError(f"report already exists: {args.output_report} (pass --force to replace it)")

    rom = args.rom.read_bytes()
    ewram = args.ewram.read_bytes()
    manifest = json.loads(args.archive_manifest.read_text(encoding="utf-8"))
    expected_rom_sha256 = manifest["output"]["sha256"]
    rom_sha256 = sha256(rom)
    if rom_sha256 != expected_rom_sha256:
        raise ValueError(f"ROM does not match archive manifest: {rom_sha256}")

    archive = manifest["archive"]
    relocation = archive["relocation"]
    target_offset = int(relocation["target_rom_offset"])
    pointer_offset = int(relocation["source_pointer_word_rom_offset"])
    expected_pointer = int(relocation["target_rom_address"])
    actual_pointer = struct.unpack_from("<I", rom, pointer_offset)[0]
    if actual_pointer != expected_pointer:
        raise AssertionError(f"archive pointer is 0x{actual_pointer:08X}, expected 0x{expected_pointer:08X}")

    raw, consumed = decompress(rom, target_offset)
    loaded = ewram[args.ewram_offset : args.ewram_offset + len(raw)]
    differing_bytes = sum(before != after for before, after in zip(raw, loaded, strict=True))
    if differing_bytes:
        raise AssertionError(f"EWRAM archive differs at {differing_bytes} bytes")

    table_bytes = struct.unpack_from("<H", raw)[0]
    if table_bytes < 4 or table_bytes % 2:
        raise AssertionError("invalid archive offset table length")
    table = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, table_bytes, 2)]
    if table[0] != table_bytes or any(left > right for left, right in zip(table, table[1:])):
        raise AssertionError("invalid archive offset table")
    entry_count = len(table) - 1
    edited_entries = []
    if "edits" in manifest:
        marker = bytes.fromhex("e51be525e527")
        for edit in manifest["edits"]:
            entry_index = int(edit["entry_index"])
            start, end = table[entry_index], table[entry_index + 1]
            entry = raw[start:end]
            marker_offset = entry.find(marker)
            if marker_offset != int(edit["relative_offset"]):
                raise AssertionError(
                    f"entry {entry_index} marker offset is {marker_offset}, expected {edit['relative_offset']}"
                )
            edited_entries.append({
                "entry_index": entry_index,
                "start": start,
                "end": end,
                "byte_length": len(entry),
                "verified_span_kind": "inserted_marker",
                "marker_relative_offset": marker_offset,
            })
    elif "replacements" in manifest:
        for replacement in manifest["replacements"]:
            entry_index = int(replacement["entry_index"])
            start, end = table[entry_index], table[entry_index + 1]
            entry = raw[start:end]
            span_start = int(replacement["source_span"][0])
            replacement_length = int(replacement["replacement_byte_length"])
            replacement_bytes = entry[span_start:span_start + replacement_length]
            if sha256(replacement_bytes) != replacement["replacement_sha256"]:
                raise AssertionError(f"entry {entry_index} replacement span differs from the manifest")
            edited_entries.append({
                "entry_index": entry_index,
                "start": start,
                "end": end,
                "byte_length": len(entry),
                "verified_span_kind": "structured_translation_replacement",
                "replacement_relative_offset": span_start,
                "replacement_byte_length": replacement_length,
                "replacement_sha256": sha256(replacement_bytes),
            })
    else:
        raise ValueError("archive manifest has neither edits nor replacements")

    report = {
        "schema_version": 1,
        "kind": "expanded_archive_runtime_dump_verification",
        "rom": {"filename": args.rom.name, "sha256": rom_sha256, "byte_length": len(rom)},
        "archive": {
            "rom_offset": target_offset,
            "gba_address": f"0x{expected_pointer:08X}",
            "compressed_byte_length": consumed,
            "decompressed_byte_length": len(raw),
            "decompressed_sha256": sha256(raw),
            "entry_count": entry_count,
            "edited_entries": edited_entries,
        },
        "runtime_dump": {
            "filename": args.ewram.name,
            "file_sha256": sha256(ewram),
            "ewram_offset": args.ewram_offset,
            "loaded_byte_length": len(loaded),
            "loaded_sha256": sha256(loaded),
            "differing_byte_count": differing_bytes,
        },
        "passed": True,
    }
    args.output_report.parent.mkdir(parents=True, exist_ok=True)
    args.output_report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
