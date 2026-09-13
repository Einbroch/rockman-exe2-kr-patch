#!/usr/bin/env python3
"""Test Korean rendering through E6 at a reachable expanded font record.

The default probes record 512, the first record outside the conservative
same-palette run.  The caller may select any E6-addressable expanded record.
The probe supplies a valid dialogue-format Korean glyph and changes no parser
or pointer code.
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
INSERT_EXPECTED_SHA256 = "e638914c44e947357e7d0c46e9ad2c1b01c58d6a42a5b18ff3e3fb97143ce24d"
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
    parser.add_argument("--record-index", type=lambda value: int(value, 0), default=0x200)
    parser.add_argument("--font-size", type=int, default=16)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if not args.font.is_file():
        raise ValueError(f"font file not found: {args.font}")
    if not 0x200 <= args.record_index <= 0x2E4:
        raise ValueError("record index must be within the expanded E6 range 512..740")
    e6_parameter = args.record_index - 0x1E5
    if not 0 <= e6_parameter <= 0xFF:
        raise AssertionError("selected record is not reachable through E6")
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")

    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    if range_hash(original, ENTRY_OFFSET, ENTRY_LENGTH) != ENTRY_SHA256:
        raise ValueError("the selected message entry does not match the verified baseline")
    script_offset = ENTRY_OFFSET + INSERT_RELATIVE_OFFSET
    if range_hash(original, script_offset, 2) != INSERT_EXPECTED_SHA256:
        raise ValueError("the selected probe site does not match the verified baseline")
    if any(value >= 0xE5 for value in original[script_offset:script_offset + 2]):
        raise ValueError("the selected probe site is not a direct-glyph pair")

    output = bytearray(original)
    glyph_mask = make_mask(args.font, GLYPH, args.font_size)
    glyph_data = encode_4bpp(glyph_mask)
    glyph_offset = FONT_BASE_OFFSET + args.record_index * RECORD_BYTES
    output[glyph_offset:glyph_offset + RECORD_BYTES] = glyph_data
    replacement = bytes((0xE6, e6_parameter))
    output[script_offset:script_offset + 2] = replacement
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    write_preview(glyph_mask, args.preview_dir / f"glyph_U+{ord(GLYPH):04X}.png")

    expected_writes = [
        {
            "kind": "font_record_outside_conservative_palette_run",
            "record_index": args.record_index,
            "rom_offset": glyph_offset,
            "byte_length": RECORD_BYTES,
            "original_range_sha256": range_hash(original, glyph_offset, RECORD_BYTES),
            "replacement_range_sha256": sha256(glyph_data),
        },
        {
            "kind": "length_preserving_e6_expanded_record_probe",
            "entry_rom_offset": ENTRY_OFFSET,
            "entry_byte_length": ENTRY_LENGTH,
            "relative_offset": INSERT_RELATIVE_OFFSET,
            "rom_offset": script_offset,
            "byte_length": len(replacement),
            "original_range_sha256": INSERT_EXPECTED_SHA256,
            "font_record_index": args.record_index,
            "replacement_range_sha256": sha256(replacement),
        },
    ]
    allowed_ranges = [range(item["rom_offset"], item["rom_offset"] + item["byte_length"]) for item in expected_writes]
    changed = [offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after]
    if not changed or not all(any(offset in allowed for allowed in allowed_ranges) for offset in changed):
        raise AssertionError("output diff escapes planned-write ranges")
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_korean_expanded_record_probe",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "font_source": {"filename": args.font.name, "sha256": sha256(args.font.read_bytes()), "embedded_in_project": False},
        "entry": {"rom_offset": ENTRY_OFFSET, "byte_length": ENTRY_LENGTH, "sha256": ENTRY_SHA256, "length_preserved": True},
        "expected_writes": expected_writes,
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "A visible Korean glyph demonstrates that the selected expanded record is reachable and render-compatible after supplying dialogue-format source data.",
        "limitations": [
            "One successful record does not establish all later indices or full-bank safety.",
            "It does not authorize replacing original later-bank assets in a full patch.",
            "The output ROM and preview are local test artifacts and are not distribution files.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
