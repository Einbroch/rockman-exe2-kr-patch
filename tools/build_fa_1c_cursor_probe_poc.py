#!/usr/bin/env python3
"""Build a non-distributable runtime probe for verified FA selector candidates.

The separate ROM copy uses an existing E5 glyph-bank record for one Hangul
sample and a same-length edit at the verified active entry. Parser code,
pointers, and the original ROM are not changed.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_korean_glyph_poc import (
    EXPECTED_ROM_SHA256,
    FONT_BASE_OFFSET,
    RECORD_BYTES,
    encode_4bpp,
    make_mask,
    sha256,
    write_preview,
)


ENTRY_OFFSET = 0x77A2AE
ENTRY_LENGTH = 59
ENTRY_SHA256 = "e6d121a664d2014393c1787af7e9fa8716bf285754dc97a9af1b3a396f2f2138"
INSERT_RELATIVE_OFFSET = 0x0C
FONT_RECORD_INDEX = 0xEA
GLYPH = "나"
PROFILES = {
    0x1C: {
        "expected_local_cursor_delta": 2,
        "original_range_sha256": "c2f3974dd9c06262a2774b022c4c9be62830c3eda477c66886679c1594288c30",
        "reserved_bytes": 0,
    },
    0x18: {
        "expected_local_cursor_delta": 4,
        "original_range_sha256": "effd0ea993fb144a6256462eb951898ddf24749b4f5133c78942b6e47a692c80",
        "reserved_bytes": 2,
    },
}


def range_hash(data: bytes, offset: int, length: int) -> str:
    return sha256(data[offset:offset + length])


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument("--selector", type=lambda value: int(value, 0), choices=sorted(PROFILES), default=0x1C)
    parser.add_argument("--font-size", type=int, default=16)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if not args.font.is_file():
        raise ValueError(f"font file not found: {args.font}")
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")

    profile = PROFILES[args.selector]
    probe_frame = bytes((0xFA, args.selector)) + (b"\x00" * profile["reserved_bytes"]) + bytes((0xE5, FONT_RECORD_INDEX - 0xE5))
    insert_length = len(probe_frame)
    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    if range_hash(original, ENTRY_OFFSET, ENTRY_LENGTH) != ENTRY_SHA256:
        raise ValueError("the selected message entry does not match the verified baseline")
    script_offset = ENTRY_OFFSET + INSERT_RELATIVE_OFFSET
    if range_hash(original, script_offset, insert_length) != profile["original_range_sha256"]:
        raise ValueError("the selected probe site does not match the verified baseline")
    if any(value >= 0xE5 for value in original[script_offset:script_offset + insert_length]):
        raise ValueError("the selected probe site is not a direct-glyph span")

    output = bytearray(original)
    glyph_mask = make_mask(args.font, GLYPH, args.font_size)
    glyph_data = encode_4bpp(glyph_mask)
    glyph_offset = FONT_BASE_OFFSET + FONT_RECORD_INDEX * RECORD_BYTES
    output[glyph_offset:glyph_offset + RECORD_BYTES] = glyph_data
    output[script_offset:script_offset + insert_length] = probe_frame
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    write_preview(glyph_mask, args.preview_dir / f"glyph_U+{ord(GLYPH):04X}.png")

    expected_writes = [
        {
            "kind": "font_record",
            "record_index": FONT_RECORD_INDEX,
            "unicode_code_point": f"U+{ord(GLYPH):04X}",
            "rom_offset": glyph_offset,
            "byte_length": RECORD_BYTES,
            "original_range_sha256": range_hash(original, glyph_offset, RECORD_BYTES),
            "replacement_range_sha256": sha256(glyph_data),
        },
        {
            "kind": "length_preserving_fa_cursor_probe",
            "entry_rom_offset": ENTRY_OFFSET,
            "entry_byte_length": ENTRY_LENGTH,
            "relative_offset": INSERT_RELATIVE_OFFSET,
            "rom_offset": script_offset,
            "byte_length": insert_length,
            "original_range_sha256": profile["original_range_sha256"],
            "opcode": 0xFA,
            "selector_value": args.selector,
            "expected_local_cursor_delta": profile["expected_local_cursor_delta"],
            "replacement_range_sha256": sha256(probe_frame),
        },
    ]
    allowed_ranges = [range(item["rom_offset"], item["rom_offset"] + item["byte_length"]) for item in expected_writes]
    changed = [
        offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after
    ]
    if not changed or not all(any(offset in allowed for allowed in allowed_ranges) for offset in changed):
        raise AssertionError("output diff escapes planned-write ranges")

    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_fa_cursor_runtime_probe",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "font_source": {"filename": args.font.name, "sha256": sha256(args.font.read_bytes()), "embedded_in_project": False},
        "entry": {"rom_offset": ENTRY_OFFSET, "byte_length": ENTRY_LENGTH, "sha256": ENTRY_SHA256, "length_preserved": True},
        "expected_writes": expected_writes,
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "the Korean glyph at the probe position appears after the selected FA frame without layout change",
        "limitations": [
            "A visible glyph without a layout change would support only this selector's cursor-placement hypothesis.",
            "It does not identify FA, establish other selector values, or authorize script reinsertion.",
            "The output ROM and preview are local test artifacts and are not distribution files.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
