#!/usr/bin/env python3
"""Build a three-glyph PoC covering the existing E5 and E6 glyph paths."""

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
SCRIPT_WRITES = (
    (0x0C, bytes((0xE5, 0x05)), "e638914c44e947357e7d0c46e9ad2c1b01c58d6a42a5b18ff3e3fb97143ce24d", 0xEA),
    (0x0E, bytes((0xE6, 0x00)), "f0051dcbedc1f655cc270a13fd3a172329d543e87d1a2ee558bc51447b12b3bb", 0x1E5),
)
FONT_RECORDS = ((0xE9, "가"), (0xEA, "나"), (0x1E5, "다"))


def digest_range(data: bytes, offset: int, length: int) -> str:
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
    if digest_range(original, ENTRY_OFFSET, ENTRY_LENGTH) != ENTRY_SHA256:
        raise ValueError("the selected message entry does not match the verified baseline")

    output = bytearray(original)
    expected_writes: list[dict[str, object]] = []
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    for record_index, character in FONT_RECORDS:
        offset = FONT_BASE_OFFSET + record_index * RECORD_BYTES
        mask = make_mask(args.font, character, args.font_size)
        replacement = encode_4bpp(mask)
        output[offset:offset + RECORD_BYTES] = replacement
        write_preview(mask, args.preview_dir / f"glyph_U+{ord(character):04X}.png")
        expected_writes.append({
            "kind": "font_record",
            "record_index": record_index,
            "unicode_code_point": f"U+{ord(character):04X}",
            "rom_offset": offset,
            "byte_length": RECORD_BYTES,
            "original_range_sha256": digest_range(original, offset, RECORD_BYTES),
            "replacement_range_sha256": sha256(replacement),
        })

    for relative_offset, replacement, expected_hash, record_index in SCRIPT_WRITES:
        offset = ENTRY_OFFSET + relative_offset
        if digest_range(original, offset, len(replacement)) != expected_hash:
            raise ValueError(f"script site at relative offset {relative_offset:#x} differs from the verified baseline")
        if any(value >= 0xE5 for value in original[offset:offset + len(replacement)]):
            raise ValueError("selected script site is not a direct-glyph pair")
        output[offset:offset + len(replacement)] = replacement
        expected_writes.append({
            "kind": "length_preserving_message_edit",
            "entry_rom_offset": ENTRY_OFFSET,
            "entry_byte_length": ENTRY_LENGTH,
            "relative_offset": relative_offset,
            "rom_offset": offset,
            "byte_length": len(replacement),
            "original_range_sha256": expected_hash,
            "glyph_record_index": record_index,
            "encoding": "E5_extended_glyph" if replacement[0] == 0xE5 else "E6_extended_glyph",
            "replacement_range_sha256": sha256(replacement),
        })

    allowed_ranges = [range(item["rom_offset"], item["rom_offset"] + item["byte_length"]) for item in expected_writes]
    changed = [offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after]
    if not changed or not all(any(offset in allowed for allowed in allowed_ranges) for offset in changed):
        raise AssertionError("output diff escapes planned-write ranges")
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_korean_e5_e6_bank_poc",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "font_source": {"filename": args.font.name, "sha256": sha256(args.font.read_bytes()), "embedded_in_project": False},
        "entry": {"rom_offset": ENTRY_OFFSET, "byte_length": ENTRY_LENGTH, "sha256": ENTRY_SHA256, "length_preserved": True},
        "expected_writes": expected_writes,
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "limitations": [
            "This is a three-glyph proof of existing E5/E6 paths, not a complete Korean encoding.",
            "It confirms only the selected dialogue renderer and one length-preserving entry edit.",
            "The output ROM and previews are local test artifacts and are not distribution files.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
