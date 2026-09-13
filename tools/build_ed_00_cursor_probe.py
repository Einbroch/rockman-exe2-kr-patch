#!/usr/bin/env python3
"""Build a cursor-boundary probe for selected observed ED prefixes.

At a verified direct-glyph span, the probe places an E5 Hangul transport in
the third stream byte after ED. A visible Korean marker supports a two-byte
cursor result for the selected selector; an absent marker with normal progress
supports consumption of that third byte. Either result is limited to this
exact selector and entry.
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
INSERT_LENGTH = 5
INSERT_EXPECTED_SHA256 = "7b0791b85ece989007cecbadff81f8d866614ce663483027f5fcd3190ff75605"
FONT_RECORD_INDEX = 0xEA
GLYPH = "나"


def range_hash(data: bytes, offset: int, length: int) -> str:
    return sha256(data[offset:offset + length])


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument("--selector", type=lambda value: int(value, 0), choices=(0x00, 0x02), default=0x00)
    parser.add_argument("--font-size", type=int, default=16)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if not args.font.is_file():
        raise ValueError(f"font file not found: {args.font}")
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")

    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    if range_hash(original, ENTRY_OFFSET, ENTRY_LENGTH) != ENTRY_SHA256:
        raise ValueError("the selected message entry does not match the verified baseline")
    script_offset = ENTRY_OFFSET + INSERT_RELATIVE_OFFSET
    if range_hash(original, script_offset, INSERT_LENGTH) != INSERT_EXPECTED_SHA256:
        raise ValueError("the selected probe site does not match the verified baseline")
    if any(value >= 0xE5 for value in original[script_offset:script_offset + INSERT_LENGTH]):
        raise ValueError("the selected probe site is not a direct-glyph span")

    probe_frame = bytes((0xED, args.selector, 0xE5, FONT_RECORD_INDEX - 0xE5, 0x00))
    output = bytearray(original)
    glyph_mask = make_mask(args.font, GLYPH, args.font_size)
    glyph_data = encode_4bpp(glyph_mask)
    glyph_offset = FONT_BASE_OFFSET + FONT_RECORD_INDEX * RECORD_BYTES
    output[glyph_offset:glyph_offset + RECORD_BYTES] = glyph_data
    output[script_offset:script_offset + INSERT_LENGTH] = probe_frame
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
            "kind": "length_preserving_ed_selector_cursor_probe",
            "entry_rom_offset": ENTRY_OFFSET,
            "entry_byte_length": ENTRY_LENGTH,
            "relative_offset": INSERT_RELATIVE_OFFSET,
            "rom_offset": script_offset,
            "byte_length": INSERT_LENGTH,
            "original_range_sha256": INSERT_EXPECTED_SHA256,
            "opcode": 0xED,
            "selector_value": args.selector,
            "marker_transport": "E5 at third post-opcode byte",
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
        "kind": f"non_distributable_ed_{args.selector:02x}_cursor_runtime_probe",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "font_source": {"filename": args.font.name, "sha256": sha256(args.font.read_bytes()), "embedded_in_project": False},
        "entry": {"rom_offset": ENTRY_OFFSET, "byte_length": ENTRY_LENGTH, "sha256": ENTRY_SHA256, "length_preserved": True},
        "expected_writes": expected_writes,
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "A visible Korean marker supports a two-byte cursor at this site; an absent marker with normal progress supports third-byte consumption.",
        "limitations": [
            "This tests only the selected ED selector in one verified entry.",
            "It does not name ED, establish its state effects, or authorize command rewriting.",
            "The output ROM and preview are local test artifacts and are not distribution files.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
