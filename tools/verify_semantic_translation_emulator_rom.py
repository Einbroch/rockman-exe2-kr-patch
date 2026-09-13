#!/usr/bin/env python3
"""Verify the exact EXE2 emulator-validation ROM and emit a bench QA receipt."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from capstone import CS_ARCH_ARM, CS_MODE_LITTLE_ENDIAN, CS_MODE_THUMB, Cs

from gba_lz77 import decompress


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def archive_offsets(raw: bytes) -> list[int]:
    if len(raw) < 4:
        raise ValueError("archive is too short")
    table_size = struct.unpack_from("<H", raw)[0]
    if table_size < 4 or table_size % 2 or table_size > len(raw):
        raise ValueError("invalid archive boundary table")
    values = [struct.unpack_from("<H", raw, pos)[0] for pos in range(0, table_size, 2)]
    if values[0] != table_size or values[-1] != len(raw):
        raise ValueError("archive boundary table does not cover the payload")
    if any(left > right for left, right in zip(values, values[1:])):
        raise ValueError("archive boundary table is not monotonic")
    return values


def expected_range(write: dict) -> tuple[int, int, str]:
    start = int(write["rom_offset"])
    kind = write["kind"]
    if kind == "archive_pointer":
        length = len(bytes.fromhex(write["replacement_hex"]))
    elif kind == "relocated_archive":
        length = int(write["byte_length"])
    elif kind == "master_hangul_font":
        length = int(write["record_count"]) * int(write["record_byte_length"])
    elif kind == "thumb_trampoline":
        length = int(write["byte_length"])
    elif kind == "thumb_hook":
        length = len(bytes.fromhex(write["replacement_hex"]))
    else:
        raise ValueError(f"unsupported Expected Write kind: {kind}")
    return start, start + length, kind


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-rom", type=Path, required=True)
    parser.add_argument("--candidate-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--report", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if args.report.exists() and not args.force:
        raise FileExistsError(args.report)

    source = args.source_rom.read_bytes()
    candidate = args.candidate_rom.read_bytes()
    manifest_bytes = args.manifest.read_bytes()
    manifest = json.loads(manifest_bytes)
    if manifest.get("artifact_role") != "emulator_validation_candidate":
        raise ValueError("manifest does not identify an emulator-validation candidate")
    if sha256(source) != manifest["immutable_source"]["sha256"]:
        raise ValueError("immutable source hash mismatch")
    if len(candidate) != manifest["output"]["byte_length"] or sha256(candidate) != manifest["output"]["sha256"]:
        raise ValueError("candidate ROM identity mismatch")
    if len(source) != 0x800000 or len(candidate) != 0x1000000:
        raise ValueError("unexpected source or expanded ROM size")

    if candidate[0xA0:0xAC] != b"ROCKMAN_EXE2" or candidate[0xAC:0xB0] != b"AE2J":
        raise ValueError("GBA title or game code mismatch")
    header_complement = (-sum(candidate[0xA0:0xBD]) - 0x19) & 0xFF
    if candidate[0xBD] != header_complement:
        raise ValueError("GBA header complement checksum mismatch")
    if candidate[0xA0:0xC0] != source[0xA0:0xC0]:
        raise ValueError("GBA identity header changed")

    archive_count = 0
    pointer_count = 0
    physical_continuation_count = 0
    for archive in manifest["archives"]:
        offset = int(archive["relocated_rom_offset"])
        length = int(archive["replacement_stored_byte_length"])
        stored = candidate[offset:offset + length]
        if sha256(stored) != archive["replacement_stored_sha256"]:
            raise ValueError(f"{archive['selector']}: stored archive hash mismatch")
        if archive["storage"] == "lz77":
            if "physical_continuation" in archive:
                raise ValueError(f"{archive['selector']}: compressed archive declares a physical continuation")
            raw, consumed = decompress(candidate, offset)
            if consumed != length:
                raise ValueError(f"{archive['selector']}: compressed extent mismatch")
        elif archive["storage"] == "raw":
            continuation = archive.get("physical_continuation")
            if continuation is None:
                raw = stored
            else:
                core_length = int(archive["replacement_decompressed_byte_length"])
                continuation_length = int(continuation.get("replacement_byte_length", continuation["source_byte_length"]))
                if length != core_length + continuation_length:
                    raise ValueError(f"{archive['selector']}: physical continuation extent mismatch")
                if int(continuation["relocated_rom_offset"]) != offset + core_length:
                    raise ValueError(f"{archive['selector']}: physical continuation placement mismatch")
                raw = stored[:core_length]
                continuation_bytes = stored[core_length:]
                expected_continuation_sha256 = continuation.get("replacement_sha256", continuation["source_sha256"])
                if sha256(continuation_bytes) != expected_continuation_sha256:
                    raise ValueError(f"{archive['selector']}: physical continuation hash mismatch")
                if not continuation.get("translated", False) and (
                    continuation_length != int(continuation["source_byte_length"])
                    or expected_continuation_sha256 != continuation["source_sha256"]
                ):
                    raise ValueError(f"{archive['selector']}: untranslated continuation differs from source")
                if any(int(item["jump_target"]) != len(archive_offsets(raw)) - 1 for item in continuation["outbound_entries"]):
                    raise ValueError(f"{archive['selector']}: continuation jump target is not the terminal entry")
                physical_continuation_count += 1
        else:
            raise ValueError(f"{archive['selector']}: unknown storage")
        archive_offsets(raw)
        if sha256(raw) != archive["replacement_decompressed_sha256"]:
            raise ValueError(f"{archive['selector']}: decompressed archive hash mismatch")
        pointer = struct.pack("<I", 0x08000000 + offset)
        for location in archive["pointer_locations"]:
            if candidate[location:location + 4] != pointer:
                raise ValueError(f"{archive['selector']}: relocated pointer mismatch")
            pointer_count += 1
        archive_count += 1

    font = manifest["font"]
    font_start = int(font["master_rom_offset"])
    font_length = int(font["record_count"]) * int(font["record_byte_length"])
    if sha256(candidate[font_start:font_start + font_length]) != font["payload_sha256"]:
        raise ValueError("master Hangul font hash mismatch")

    decoder = Cs(CS_ARCH_ARM, CS_MODE_THUMB | CS_MODE_LITTLE_ENDIAN)
    for write in manifest["expected_writes"]:
        start = int(write["rom_offset"])
        kind = write["kind"]
        if kind in {"archive_pointer", "thumb_hook"}:
            replacement = bytes.fromhex(write["replacement_hex"])
            if candidate[start:start + len(replacement)] != replacement:
                raise ValueError(f"{kind} final bytes mismatch at 0x{start:X}")
            expected = write.get("expected_source_hex") or write.get("expected_immutable_source_hex")
            expected_bytes = bytes.fromhex(expected)
            if source[start:start + len(expected_bytes)] != expected_bytes:
                raise ValueError(f"{kind} source bytes mismatch at 0x{start:X}")
        elif kind in {"relocated_archive", "thumb_trampoline"}:
            length = int(write["byte_length"])
            if sha256(candidate[start:start + length]) != write["sha256"]:
                raise ValueError(f"{kind} payload mismatch at 0x{start:X}")
            if kind == "thumb_trampoline":
                code_length = int(write["code_byte_length"])
                instructions = list(decoder.disasm(candidate[start:start + code_length], 0x08000000 + start))
                if not instructions or sum(item.size for item in instructions) != code_length:
                    raise ValueError(f"Thumb decode boundary mismatch at 0x{start:X}")
        elif kind == "master_hangul_font":
            length = int(write["record_count"]) * int(write["record_byte_length"])
            if sha256(candidate[start:start + length]) != write["sha256"]:
                raise ValueError("Expected Write font payload mismatch")
        else:
            raise ValueError(f"unknown Expected Write kind: {kind}")

    intervals = sorted(expected_range(write) for write in manifest["expected_writes"])
    for previous, current in zip(intervals, intervals[1:]):
        if current[0] < previous[1]:
            raise ValueError(f"overlapping Expected Writes: {previous} and {current}")
    clean = source + bytes((0xFF,)) * (len(candidate) - len(source))
    interval_index = 0
    changed_count = 0
    for offset, (before, after) in enumerate(zip(clean, candidate, strict=True)):
        if before == after:
            continue
        changed_count += 1
        while interval_index < len(intervals) and offset >= intervals[interval_index][1]:
            interval_index += 1
        if interval_index >= len(intervals) or not intervals[interval_index][0] <= offset < intervals[interval_index][1]:
            raise ValueError(f"unexplained final difference at ROM 0x{offset:X}")

    report = {
        "schema_version": 1,
        "kind": "gba_emulator_validation_candidate_bench_qa",
        "qa_status": "PASS (bench)",
        "runtime_status": "PENDING_RUNTIME",
        "runtime_policy": {"audio_enabled": False, "exact_candidate_required": True},
        "source": {"filename": args.source_rom.name, "sha256": sha256(source), "byte_length": len(source)},
        "candidate": {"filename": args.candidate_rom.name, "sha256": sha256(candidate), "byte_length": len(candidate)},
        "build_manifest": {"filename": args.manifest.name, "sha256": sha256(manifest_bytes)},
        "verified": {
            "gba_identity_header": True,
            "gba_header_complement_checksum": True,
            "archive_count": archive_count,
            "archive_boundaries_and_hashes": True,
            "raw_physical_continuation_count": physical_continuation_count,
            "raw_physical_continuations_verified": True,
            "relocated_pointer_count": pointer_count,
            "font_record_count": int(font["record_count"]),
            "font_payload_hash": True,
            "thumb_instruction_boundaries": True,
            "expected_write_ranges_non_overlapping": True,
            "all_final_differences_explained": True,
            "changed_byte_count_from_clean_expanded_source": changed_count,
        },
        "translation_scope": manifest["translation_scope"],
        "limitations": [
            "This receipt proves static artifact integrity, not emulator behavior.",
            "Muted emulator boot, representative dialogue rendering, progression, exit, and re-entry remain pending.",
            "The candidate is a local full-ROM development artifact and must not be distributed.",
        ],
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
