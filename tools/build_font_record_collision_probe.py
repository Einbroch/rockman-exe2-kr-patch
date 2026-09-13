#!/usr/bin/env python3
"""Build a font-only collision probe for one expanded dialogue-font record.

No message bytes, pointers, or executable code are changed.  A visible Korean
marker appearing in untouched original text shows that the selected record is
consumed on the tested screen; no marker is not a global non-use conclusion.
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


GLYPH = "나"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument("--record-index", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--font-size", type=int, default=16)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if not args.font.is_file():
        raise ValueError(f"font file not found: {args.font}")
    if not 0xE5 <= args.record_index <= 0x2E4:
        raise ValueError("record index must be within the verified E5/E6 range 229..740")
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")

    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    mask = make_mask(args.font, GLYPH, args.font_size)
    glyph_data = encode_4bpp(mask)
    record_offset = FONT_BASE_OFFSET + args.record_index * RECORD_BYTES
    output = bytearray(original)
    output[record_offset:record_offset + RECORD_BYTES] = glyph_data
    changed = [offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after]
    if not changed or any(offset < record_offset or offset >= record_offset + RECORD_BYTES for offset in changed):
        raise AssertionError("output diff escapes selected font record")

    args.preview_dir.mkdir(parents=True, exist_ok=True)
    write_preview(mask, args.preview_dir / f"glyph_U+{ord(GLYPH):04X}.png")
    expected_write = {
        "kind": "font_only_expanded_record_collision_probe",
        "record_index": args.record_index,
        "rom_offset": record_offset,
        "byte_length": RECORD_BYTES,
        "original_range_sha256": sha256(original[record_offset:record_offset + RECORD_BYTES]),
        "replacement_range_sha256": sha256(glyph_data),
    }
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    report = {
        "schema_version": 1,
        "kind": "non_distributable_font_record_collision_probe",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "font_source": {"filename": args.font.name, "sha256": sha256(args.font.read_bytes()), "embedded_in_project": False},
        "expected_writes": [expected_write],
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "A Korean marker in untouched original text proves a collision on that tested screen.",
        "limitations": [
            "No marker does not prove the record is unused in other screens or consumers.",
            "The output ROM and preview are local test artifacts and are not distribution files.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
