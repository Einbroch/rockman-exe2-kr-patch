#!/usr/bin/env python3
"""Build a bounded multi-entry variable-length Korean PoC for active block 23.

Each edit is declared as ENTRY_INDEX:RELATIVE_OFFSET:HANGUL.  The tool only
permits insertions at direct-glyph boundaries in the verified original block,
copies the resulting block to the validated padding target, and recalculates
every later 16-bit table offset from the cumulative inserted lengths.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from dataclasses import dataclass
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


@dataclass(frozen=True)
class Edit:
    entry_index: int
    relative_offset: int
    message: str
    insertion: bytes
    original_insert_offset: int


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_edit(value: str, table: list[int], mapping: dict[str, dict[str, object]]) -> Edit:
    try:
        entry_text, relative_text, message = value.split(":", 2)
        entry_index = int(entry_text, 0)
        relative_offset = int(relative_text, 0)
    except ValueError as error:
        raise ValueError("edit must use ENTRY_INDEX:RELATIVE_OFFSET:HANGUL") from error
    if not 0 <= entry_index < len(table) - 1:
        raise ValueError("edit entry index must have a following table boundary")
    entry_start, entry_end = table[entry_index], table[entry_index + 1]
    if entry_end <= entry_start or not message or any(character not in mapping for character in message):
        raise ValueError("edit message or table entry is invalid")
    insertion = bytes(value for character in message for value in mapping[character]["encoded_bytes"])
    if not insertion or len(insertion) % 2:
        raise ValueError("edit Korean text must encode to complete E5/E6 pairs")
    insert_offset = entry_start + relative_offset
    if not entry_start < insert_offset < entry_end:
        raise ValueError("edit insertion lies outside its entry")
    return Edit(entry_index, relative_offset, message, insertion, insert_offset)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--policy", type=Path, required=True)
    parser.add_argument("--edit", action="append", required=True)
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
    edits = [parse_edit(value, TABLE_OFFSETS, mapping) for value in args.edit]
    if len({edit.entry_index for edit in edits}) != len(edits):
        raise ValueError("only one insertion per table entry is allowed in this PoC")

    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    block = original[BLOCK_OFFSET:BLOCK_OFFSET + BLOCK_LENGTH]
    if sha256(block) != BLOCK_SHA256:
        raise ValueError("active block differs from verified baseline")
    table = [struct.unpack_from("<H", block, index * 2)[0] for index in range(len(TABLE_OFFSETS))]
    if table != TABLE_OFFSETS:
        raise ValueError("active block offset table differs from verified baseline")
    for edit in edits:
        if not block[edit.original_insert_offset - 1] < 0xE5 or not block[edit.original_insert_offset] >= 0xE5:
            raise ValueError("an edit insertion is not at a verified direct-glyph boundary")
    total_inserted = sum(len(edit.insertion) for edit in edits)
    if TARGET_OFFSET % 4 or TARGET_OFFSET + BLOCK_LENGTH + total_inserted > len(original):
        raise ValueError("relocation target is not an aligned in-ROM range")
    if any(value != TARGET_FILL for value in original[TARGET_OFFSET:TARGET_OFFSET + BLOCK_LENGTH + total_inserted]):
        raise ValueError("relocation target does not retain its validated constant fill")
    if struct.unpack_from("<I", original, POINTER_LITERAL_OFFSET)[0] != ROM_BASE + BLOCK_OFFSET:
        raise ValueError("active block literal differs from verified baseline")

    relocated = bytearray(block)
    for edit in sorted(edits, key=lambda item: item.original_insert_offset, reverse=True):
        relocated[edit.original_insert_offset:edit.original_insert_offset] = edit.insertion
    shifted_offsets = []
    for index, offset in enumerate(table):
        delta = sum(len(edit.insertion) for edit in edits if edit.entry_index < index)
        shifted_offsets.append(offset + delta)
    for index, offset in enumerate(shifted_offsets):
        struct.pack_into("<H", relocated, index * 2, offset)
    if len(relocated) != BLOCK_LENGTH + total_inserted:
        raise AssertionError("unexpected relocated block size")

    output = bytearray(original)
    output[TARGET_OFFSET:TARGET_OFFSET + len(relocated)] = relocated
    struct.pack_into("<I", output, POINTER_LITERAL_OFFSET, ROM_BASE + TARGET_OFFSET)
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    selected_characters = list(dict.fromkeys("".join(edit.message for edit in edits)))
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
    edit_metadata = [
        {
            "entry_index": edit.entry_index,
            "entry_original_byte_length": table[edit.entry_index + 1] - table[edit.entry_index],
            "entry_relocated_byte_length": shifted_offsets[edit.entry_index + 1] - shifted_offsets[edit.entry_index],
            "inserted_glyph_stream_byte_length": len(edit.insertion),
        }
        for edit in sorted(edits, key=lambda item: item.entry_index)
    ]
    expected_writes = [
        {
            "kind": "relocated_active_block_with_multi_entry_growth",
            "source_rom_offset": BLOCK_OFFSET,
            "source_byte_length": BLOCK_LENGTH,
            "source_sha256": BLOCK_SHA256,
            "target_rom_offset": TARGET_OFFSET,
            "target_byte_length": len(relocated),
            "edited_entries": edit_metadata,
            "total_inserted_glyph_stream_byte_length": total_inserted,
            "shifted_later_offset_count": len(table) - 1,
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
        "kind": "non_distributable_active_block_multi_entry_growth_poc",
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
        "expected_screen_result": "Each edited entry displays its inserted Korean text and later entries remain selectable through cumulatively shifted table offsets.",
        "limitations": [
            "This proves only declared insertions in this one relocated active block.",
            "It does not establish global message-boundary or font-slot safety.",
            "The output ROM is a local test artifact and is not a distribution file.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
