#!/usr/bin/env python3
"""Grow entry 0 of the relocated active block by selected Korean glyphs.

The probe preserves every original entry byte, inserts verified E5/E6 glyph
pairs at a direct-glyph boundary in entry 0, and shifts every later table
offset by the inserted byte count. It is a bounded test of this one
table-backed block, not a general text-reinsertion implementation.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from build_codepage_message_poc import load_mapping
from build_korean_glyph_poc import FONT_BASE_OFFSET, RECORD_BYTES, encode_4bpp, make_mask, write_preview


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ROM_BASE = 0x08000000
BLOCK_OFFSET = 0x77A298
BLOCK_LENGTH = 525
BLOCK_SHA256 = "e48bab039cbc1c73b7147b7808e51552ad0482156ab7d962653b22dbb6505416"
POINTER_LITERAL_OFFSET = 0x0C84E4
TARGET_OFFSET = 0x7FF970
TARGET_FILL = 0xFF
TABLE_OFFSETS = [22, 81, 112, 136, 166, 186, 211, 262, 335, 364, 364]


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--policy", type=Path, required=True)
    parser.add_argument("--message", default="가")
    parser.add_argument("--entry-index", type=int, default=0)
    parser.add_argument("--entry-relative-offset", type=lambda value: int(value, 0), default=18)
    parser.add_argument("--allow-candidate-unobserved-codepage", action="store_true")
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument("--font-size", type=int, default=16)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if not args.font.is_file():
        raise ValueError(f"font file not found: {args.font}")
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")
    mapping, policy_sha256, codepage_mode = load_mapping(
        args.codepage, args.policy, args.allow_candidate_unobserved_codepage
    )
    if not args.message or any(character not in mapping for character in args.message):
        raise ValueError("every message character must be assigned by the supplied code page")
    insertion = bytes(value for character in args.message for value in mapping[character]["encoded_bytes"])
    if not insertion or len(insertion) % 2:
        raise ValueError("the Korean insertion must contain complete E5/E6 glyph pairs")
    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    block = original[BLOCK_OFFSET:BLOCK_OFFSET + BLOCK_LENGTH]
    if sha256(block) != BLOCK_SHA256:
        raise ValueError("active block differs from verified baseline")
    table = [struct.unpack_from("<H", block, index * 2)[0] for index in range(len(TABLE_OFFSETS))]
    if table != TABLE_OFFSETS:
        raise ValueError("active block offset table differs from verified baseline")
    if not 0 <= args.entry_index < len(table) - 1:
        raise ValueError("entry index must have a following table boundary")
    entry_start, entry_end = table[args.entry_index], table[args.entry_index + 1]
    if entry_end <= entry_start:
        raise ValueError("selected entry does not have a positive verified byte length")
    insert_at = entry_start + args.entry_relative_offset
    if not entry_start < insert_at < entry_end:
        raise ValueError("planned insertion lies outside the selected entry")
    if not block[insert_at - 1] < 0xE5 or not block[insert_at] >= 0xE5:
        raise ValueError("planned insertion is not at the verified direct-glyph boundary")
    if TARGET_OFFSET % 4 or TARGET_OFFSET + BLOCK_LENGTH + len(insertion) > len(original):
        raise ValueError("relocation target is not an aligned in-ROM range")
    if any(value != TARGET_FILL for value in original[TARGET_OFFSET:TARGET_OFFSET + BLOCK_LENGTH + len(insertion)]):
        raise ValueError("relocation target does not retain its validated constant fill")
    if struct.unpack_from("<I", original, POINTER_LITERAL_OFFSET)[0] != ROM_BASE + BLOCK_OFFSET:
        raise ValueError("active block literal differs from verified baseline")

    relocated = bytearray(block[:insert_at] + insertion + block[insert_at:])
    shifted_offsets = [
        offset if index <= args.entry_index else offset + len(insertion)
        for index, offset in enumerate(table)
    ]
    for index, offset in enumerate(shifted_offsets):
        struct.pack_into("<H", relocated, index * 2, offset)
    if len(relocated) != BLOCK_LENGTH + len(insertion):
        raise AssertionError("unexpected relocated block size")

    output = bytearray(original)
    output[TARGET_OFFSET:TARGET_OFFSET + len(relocated)] = relocated
    struct.pack_into("<I", output, POINTER_LITERAL_OFFSET, ROM_BASE + TARGET_OFFSET)
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    selected_characters = list(dict.fromkeys(args.message))
    font_writes = []
    for character in selected_characters:
        entry = mapping[character]
        index = entry["font_record_index"]
        mask = make_mask(args.font, character, args.font_size)
        glyph_data = encode_4bpp(mask)
        glyph_offset = FONT_BASE_OFFSET + index * RECORD_BYTES
        output[glyph_offset:glyph_offset + RECORD_BYTES] = glyph_data
        write_preview(mask, args.preview_dir / f"glyph_U+{ord(character):04X}.png")
        font_writes.append({
            "kind": "candidate_unobserved_font_record",
            "unicode_code_point": entry["unicode_code_point"],
            "font_record_index": index,
            "rom_offset": glyph_offset,
            "byte_length": RECORD_BYTES,
            "original_range_sha256": sha256(original[glyph_offset:glyph_offset + RECORD_BYTES]),
            "replacement_range_sha256": sha256(glyph_data),
        })

    expected_writes = [
        {
            "kind": "relocated_active_block_with_entry0_growth",
            "source_rom_offset": BLOCK_OFFSET,
            "source_byte_length": BLOCK_LENGTH,
            "source_sha256": BLOCK_SHA256,
            "target_rom_offset": TARGET_OFFSET,
            "target_byte_length": len(relocated),
            "entry_index": args.entry_index,
            "entry_original_byte_length": entry_end - entry_start,
            "entry_relocated_byte_length": shifted_offsets[args.entry_index + 1] - shifted_offsets[args.entry_index],
            "inserted_glyph_stream_byte_length": len(insertion),
            "shifted_later_offset_count": len(shifted_offsets) - args.entry_index - 1,
        },
        {
            "kind": "active_block_pointer_literal",
            "rom_offset": POINTER_LITERAL_OFFSET,
            "byte_length": 4,
            "replacement_pointer": f"{ROM_BASE + TARGET_OFFSET:08X}",
        },
    ] + font_writes
    allowed_ranges = [
        range(TARGET_OFFSET, TARGET_OFFSET + len(relocated)),
        range(POINTER_LITERAL_OFFSET, POINTER_LITERAL_OFFSET + 4),
    ] + [range(item["rom_offset"], item["rom_offset"] + item["byte_length"]) for item in font_writes]
    changed = [offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after]
    if not changed or not all(any(offset in allowed for allowed in allowed_ranges) for offset in changed):
        raise AssertionError("output diff escapes planned-write ranges")
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_active_entry_growth_probe",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "codepage": {
            "filename": args.codepage.name,
            "sha256": sha256(args.codepage.read_bytes()),
            "mode": codepage_mode,
            "written_glyph_record_count": len(font_writes),
        },
        "policy": {"filename": args.policy.name, "sha256": policy_sha256},
        "font_source": {"filename": args.font.name, "sha256": sha256(args.font.read_bytes()), "embedded_in_project": False},
        "expected_writes": expected_writes,
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "The inserted Korean text appears while the following original dialogue continues normally, demonstrating this entry table remains coherent after variable-length growth.",
        "limitations": [
            "This proves only entry 0 of this one relocated block in the tested state.",
            "It does not establish global message-boundary or font-slot safety.",
            "The output ROM is a local test artifact and is not a distribution file.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
