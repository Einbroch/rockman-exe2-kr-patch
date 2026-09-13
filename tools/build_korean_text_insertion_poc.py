#!/usr/bin/env python3
"""Build a one-entry Korean extended-glyph reinsertion PoC ROM copy.

The PoC builds from the immutable Rev 1 ROM and performs three planned writes:
two 64-byte font records and one two-byte, length-preserving message edit.
No pointer, entry boundary, parser, or control-handler code is changed.
"""

from __future__ import annotations

import argparse
import hashlib
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
INSERT_EXPECTED_SHA256 = "e638914c44e947357e7d0c46e9ad2c1b01c58d6a42a5b18ff3e3fb97143ce24d"
EXTENDED_PREFIX = 0xE5
INSERT_PARAMETER = 0x05
FONT_RECORDS = ((0xE9, "가"), (0xEA, "나"))


def range_hash(data: bytes, offset: int, length: int) -> str:
    return sha256(data[offset:offset + length])


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview-dir", type=Path, required=True)
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
    if range_hash(original, script_offset, 2) != INSERT_EXPECTED_SHA256:
        raise ValueError("the selected two-byte script site does not match the verified baseline")
    if any(value >= EXTENDED_PREFIX for value in original[script_offset:script_offset + 2]):
        raise ValueError("the selected script site is not two direct-glyph bytes")

    output = bytearray(original)
    expected_writes: list[dict[str, object]] = []
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    for record_index, character in FONT_RECORDS:
        record_offset = FONT_BASE_OFFSET + record_index * RECORD_BYTES
        mask = make_mask(args.font, character, args.font_size)
        replacement = encode_4bpp(mask)
        original_hash = range_hash(original, record_offset, RECORD_BYTES)
        output[record_offset:record_offset + RECORD_BYTES] = replacement
        write_preview(mask, args.preview_dir / f"glyph_U+{ord(character):04X}.png")
        expected_writes.append({
            "kind": "font_record",
            "record_index": record_index,
            "unicode_code_point": f"U+{ord(character):04X}",
            "rom_offset": record_offset,
            "byte_length": RECORD_BYTES,
            "original_range_sha256": original_hash,
            "replacement_range_sha256": sha256(replacement),
        })

    script_replacement = bytes((EXTENDED_PREFIX, INSERT_PARAMETER))
    output[script_offset:script_offset + 2] = script_replacement
    expected_writes.append({
        "kind": "length_preserving_message_edit",
        "entry_rom_offset": ENTRY_OFFSET,
        "entry_byte_length": ENTRY_LENGTH,
        "relative_offset": INSERT_RELATIVE_OFFSET,
        "rom_offset": script_offset,
        "byte_length": 2,
        "original_range_sha256": INSERT_EXPECTED_SHA256,
        "encoding": "E5_extended_glyph",
        "glyph_record_index": 0xE5 + INSERT_PARAMETER,
        "replacement_range_sha256": sha256(script_replacement),
    })

    allowed_ranges = [
        range(item["rom_offset"], item["rom_offset"] + item["byte_length"]) for item in expected_writes
    ]
    changed_positions = [
        offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after
    ]
    if not changed_positions or not all(any(offset in allowed for allowed in allowed_ranges) for offset in changed_positions):
        raise AssertionError("output diff escapes the planned-write ranges")

    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_korean_text_reinsertion_poc",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "font_source": {
            "filename": args.font.name,
            "sha256": sha256(args.font.read_bytes()),
            "embedded_in_project": False,
        },
        "entry": {
            "rom_offset": ENTRY_OFFSET,
            "byte_length": ENTRY_LENGTH,
            "sha256": ENTRY_SHA256,
            "length_preserved": True,
        },
        "expected_writes": expected_writes,
        "changed_byte_count": len(changed_positions),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "limitations": [
            "This is one verified message entry and two Korean glyphs, not a general Korean text encoding.",
            "The script edit replaces two direct glyph bytes with one extended glyph sequence of the same byte length.",
            "The output ROM and previews are local test artifacts and are not distribution files.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
