#!/usr/bin/env python3
"""Independently verify a context-selected full-font-bank development ROM."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


FONT_BASE = 0x006973B0
RECORD_BYTES = 64
RECORD_COUNT = 741
BANK_BYTES = RECORD_BYTES * RECORD_COUNT
HOOK = 0x00020D84
CONTINUATION = 0x00020D8C
ROM_BASE = 0x08000000


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load(path: Path) -> dict[str, object]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"JSON root must be an object: {path}")
    return value


def expected_trampoline(start: int, end: int, alternate_base: int) -> bytes:
    code = struct.pack(
        "<14H",
        0x4688, 0x4A06, 0x4294, 0xD304, 0x4A05, 0x4294, 0xD201,
        0x4805, 0xE000, 0x4805, 0x0189, 0x1840, 0x4B04, 0x4718,
    )
    return code + struct.pack(
        "<5I", start, end, alternate_base, ROM_BASE + FONT_BASE, ROM_BASE + CONTINUATION + 1
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--original-rom", type=Path, required=True)
    parser.add_argument("--input-rom", type=Path, required=True)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    original = args.original_rom.read_bytes()
    prior = args.input_rom.read_bytes()
    rom = args.rom.read_bytes()
    manifest_bytes = args.manifest.read_bytes()
    manifest = load(args.manifest)
    codepage = load(args.codepage)
    if manifest.get("kind") != "non_distributable_context_selected_full_font_bank_poc":
        raise ValueError("manifest kind is not contextual font-bank PoC")
    if manifest.get("input", {}).get("sha256") != digest(prior):
        raise ValueError("manifest input hash mismatch")
    if manifest.get("original", {}).get("sha256") != digest(original):
        raise ValueError("manifest original hash mismatch")
    if manifest.get("output", {}).get("sha256") != digest(rom):
        raise ValueError("manifest output hash mismatch")

    banks = manifest["font_banks"]
    hook = manifest["hook"]
    context = manifest["context"]
    alternate = int(banks["alternate_context_bank_rom_offset"])
    trampoline_offset = int(hook["trampoline_rom_offset"])
    start = int(context["cursor_start_inclusive"], 16)
    end = int(context["cursor_end_exclusive"], 16)
    trampoline = expected_trampoline(start, end, ROM_BASE + alternate)
    hook_bytes = struct.pack("<HHI", 0x4B00, 0x4718, ROM_BASE + trampoline_offset + 1)

    checks = {
        "supported_lengths": len(original) == 0x800000 and len(prior) == len(rom) == 0x1000000,
        "ordinary_font_bank_matches_original": (
            rom[FONT_BASE:FONT_BASE + BANK_BYTES] == original[FONT_BASE:FONT_BASE + BANK_BYTES]
        ),
        "alternate_font_bank_matches_prior_development_bank": (
            rom[alternate:alternate + BANK_BYTES] == prior[FONT_BASE:FONT_BASE + BANK_BYTES]
        ),
        "hook_bytes_match_independent_encoding": rom[HOOK:HOOK + len(hook_bytes)] == hook_bytes,
        "trampoline_matches_independent_encoding": (
            rom[trampoline_offset:trampoline_offset + len(trampoline)] == trampoline
        ),
        "context_bounds_are_ordered": 0x02000000 <= start < end <= 0x02040000,
        "archive_at_expanded_rom_start_unchanged": rom[0x800000:0x810000] == prior[0x800000:0x810000],
        "gba_header_complement_checksum_valid": (
            rom[0xBD] == ((-(sum(rom[0xA0:0xBD]) + 0x19)) & 0xFF)
        ),
    }

    mapping_indices = [entry.get("font_record_index") for entry in codepage.get("entries", [])]
    checks["codepage_indices_unique_and_in_range"] = (
        bool(mapping_indices)
        and all(isinstance(index, int) and 0 <= index < RECORD_COUNT for index in mapping_indices)
        and len(mapping_indices) == len(set(mapping_indices))
    )
    checks["all_codepage_records_match_alternate_bank"] = checks["codepage_indices_unique_and_in_range"] and all(
        rom[alternate + index * RECORD_BYTES:alternate + (index + 1) * RECORD_BYTES]
        == prior[FONT_BASE + index * RECORD_BYTES:FONT_BASE + (index + 1) * RECORD_BYTES]
        for index in mapping_indices
    )

    allowed_prefix = set(range(HOOK, HOOK + len(hook_bytes))) | set(range(FONT_BASE, FONT_BASE + BANK_BYTES))
    prefix_diffs = [offset for offset in range(0x800000) if prior[offset] != rom[offset]]
    checks["prefix_differences_confined"] = bool(prefix_diffs) and all(offset in allowed_prefix for offset in prefix_diffs)
    allowed_tail = set(range(alternate, alternate + BANK_BYTES)) | set(
        range(trampoline_offset, trampoline_offset + len(trampoline))
    )
    tail_diffs = [offset for offset in range(0x800000, len(rom)) if prior[offset] != rom[offset]]
    checks["tail_differences_confined"] = bool(tail_diffs) and all(offset in allowed_tail for offset in tail_diffs)

    passed = all(checks.values())
    report = {
        "schema_version": 1,
        "kind": "independent_context_selected_full_font_bank_verification",
        "rom": {"filename": args.rom.name, "sha256": digest(rom), "byte_length": len(rom)},
        "manifest": {"filename": args.manifest.name, "sha256": digest(manifest_bytes)},
        "context": {"cursor_start_inclusive": f"0x{start:08X}", "cursor_end_exclusive": f"0x{end:08X}"},
        "codepage_mapped_record_count": len(mapping_indices),
        "verification": checks,
        "passed": passed,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(checks, indent=2))
    if not passed:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
