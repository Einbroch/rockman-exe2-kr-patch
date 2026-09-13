#!/usr/bin/env python3
"""Verify that a runtime EWRAM dump contains the rebuilt relocated archive."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from gba_lz77 import decompress


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def integer(value: str) -> int:
    return int(value, 0)


def archive_table(raw: bytes) -> list[int]:
    if len(raw) < 4:
        raise ValueError("archive is too short")
    size = struct.unpack_from("<H", raw)[0]
    if size < 4 or size % 2 or size > len(raw):
        raise ValueError("archive table size is invalid")
    values = list(struct.unpack_from(f"<{size // 2}H", raw, 0))
    if values[0] != size or values[-1] != len(raw):
        raise ValueError("archive table does not cover the full stream")
    if any(left > right for left, right in zip(values, values[1:])):
        raise ValueError("archive table is not monotonic")
    return values


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--archive-manifest", type=Path, required=True)
    parser.add_argument("--dump-dir", type=Path, required=True)
    parser.add_argument("--ewram-offset", type=integer, default=0x38800)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    manifest = json.loads(args.archive_manifest.read_text(encoding="utf-8"))
    if sha256(rom) != manifest["output"]["sha256"]:
        raise ValueError("ROM does not match the archive manifest")

    archive = manifest["archive"]
    relocated_offset = int(archive["relocation"]["target_rom_offset"])
    raw, consumed = decompress(rom, relocated_offset)
    if consumed != int(archive["replacement_compressed_byte_length"]):
        raise AssertionError("runtime target compressed length differs from the manifest")
    if len(raw) != int(archive["replacement_decompressed_byte_length"]):
        raise AssertionError("runtime target decompressed length differs from the manifest")
    if sha256(raw) != archive["replacement_decompressed_sha256"]:
        raise AssertionError("runtime target decompressed hash differs from the manifest")

    table = archive_table(raw)
    ewram_path = args.dump_dir / "ewram.bin"
    ewram = ewram_path.read_bytes()
    end = args.ewram_offset + len(raw)
    if args.ewram_offset < 0 or end > len(ewram):
        raise ValueError("archive range lies outside ewram.bin")
    loaded = ewram[args.ewram_offset:end]
    differing = sum(expected != actual for expected, actual in zip(raw, loaded, strict=True))
    if differing:
        raise AssertionError(f"runtime archive differs from ROM reconstruction in {differing} bytes")

    edited_entries = []
    for replacement in manifest["replacements"]:
        index = int(replacement["entry_index"])
        edited_entries.append(
            {
                "entry_index": index,
                "start": table[index],
                "end": table[index + 1],
                "byte_length": table[index + 1] - table[index],
                "verified_span_kind": "structured_translation_replacement",
                "replacement_relative_offset": int(replacement["source_span"][0]),
                "replacement_byte_length": int(replacement["replacement_byte_length"]),
                "replacement_sha256": replacement["replacement_sha256"],
            }
        )

    report = {
        "schema_version": 1,
        "kind": "expanded_archive_runtime_dump_verification",
        "rom": {
            "filename": args.rom.name,
            "sha256": sha256(rom),
            "byte_length": len(rom),
        },
        "archive": {
            "rom_offset": relocated_offset,
            "gba_address": f"0x{0x08000000 + relocated_offset:08X}",
            "compressed_byte_length": consumed,
            "decompressed_byte_length": len(raw),
            "decompressed_sha256": sha256(raw),
            "entry_count": len(table) - 1,
            "edited_entries": edited_entries,
        },
        "runtime_dump": {
            "directory": args.dump_dir.name,
            "filename": ewram_path.name,
            "file_sha256": sha256(ewram),
            "ewram_offset": args.ewram_offset,
            "loaded_byte_length": len(loaded),
            "loaded_sha256": sha256(loaded),
            "differing_byte_count": differing,
        },
        "passed": True,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report["runtime_dump"], ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
