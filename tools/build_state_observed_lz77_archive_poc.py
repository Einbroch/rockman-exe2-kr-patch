#!/usr/bin/env python3
"""Build a bounded Korean marker PoC inside one verified LZ77 text archive."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from dataclasses import dataclass
from pathlib import Path

from build_korean_glyph_poc import FONT_BASE_OFFSET, RECORD_BYTES
from gba_lz77 import compress, decompress


@dataclass(frozen=True)
class Edit:
    entry_index: int
    relative_offset: int
    code_points: tuple[str, ...]
    insertion: bytes
    absolute_offset: int


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_table(raw: bytes) -> list[int]:
    if len(raw) < 4:
        raise ValueError("archive is too short")
    table_bytes = struct.unpack_from("<H", raw)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(raw):
        raise ValueError("archive has no valid u16 entry table")
    table = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, table_bytes, 2)]
    if table[0] != table_bytes or any(left > right for left, right in zip(table, table[1:])) or table[-1] != len(raw):
        raise ValueError("archive entry table is not a complete monotonic range")
    return table


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--expected-input-sha256", required=True)
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--source-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--source-capacity", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--relocation-offset", type=lambda value: int(value, 0))
    parser.add_argument("--expanded-size", type=lambda value: int(value, 0))
    parser.add_argument("--source-pointer-word-offset", type=lambda value: int(value, 0))
    parser.add_argument("--edit", action="append", required=True, help="ENTRY:RELATIVE:U+XXXX[,U+XXXX]")
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()
    if args.output_rom.exists():
        raise FileExistsError(f"output already exists: {args.output_rom}")

    rom = args.rom.read_bytes()
    input_digest = sha256(rom)
    if input_digest.lower() != args.expected_input_sha256.lower():
        raise ValueError("input ROM SHA-256 differs from the declared base")
    codepage_bytes = args.codepage.read_bytes()
    codepage = json.loads(codepage_bytes)
    if codepage.get("mode") != "candidate_catalog_unobserved_overlay":
        raise ValueError("this build requires the catalog-screened codepage")
    mappings = {entry.get("unicode_code_point"): entry for entry in codepage.get("entries", []) if isinstance(entry, dict)}

    manifest_bytes = args.base_manifest.read_bytes()
    base_manifest = json.loads(manifest_bytes)
    if base_manifest.get("output", {}).get("sha256") != input_digest:
        raise ValueError("base manifest does not identify the input ROM")
    installed_fonts = {
        write.get("unicode_code_point"): write
        for write in base_manifest.get("expected_writes", [])
        if isinstance(write, dict) and isinstance(write.get("unicode_code_point"), str)
    }

    raw, original_compressed_length = decompress(rom, args.source_offset)
    if original_compressed_length > args.source_capacity or args.source_offset + args.source_capacity > len(rom):
        raise ValueError("declared compressed source capacity is invalid")
    table = parse_table(raw)
    edits = []
    for text in args.edit:
        try:
            entry_text, relative_text, code_point_text = text.split(":", 2)
            entry_index = int(entry_text, 0)
            relative_offset = int(relative_text, 0)
            code_points = tuple(code_point_text.split(","))
        except ValueError as error:
            raise ValueError("edit must use ENTRY:RELATIVE:U+XXXX[,U+XXXX]") from error
        if not 0 <= entry_index < len(table) - 1 or not code_points:
            raise ValueError("edit entry or code-point list is invalid")
        insertion = bytearray()
        for code_point in code_points:
            mapping = mappings.get(code_point)
            if not isinstance(mapping, dict) or not isinstance(mapping.get("encoded_bytes"), list):
                raise ValueError(f"code point is absent from supplied codepage: {code_point}")
            font_write = installed_fonts.get(code_point)
            if not isinstance(font_write, dict):
                raise ValueError(f"base ROM does not declare the required installed glyph: {code_point}")
            font_index = mapping.get("font_record_index")
            if not isinstance(font_index, int) or font_write.get("font_record_index") != font_index:
                raise ValueError("base font record differs from codepage mapping")
            font_offset = FONT_BASE_OFFSET + font_index * RECORD_BYTES
            if sha256(rom[font_offset : font_offset + RECORD_BYTES]) != font_write.get("replacement_range_sha256"):
                raise ValueError("installed glyph bytes differ from base manifest")
            insertion.extend(int(value) for value in mapping["encoded_bytes"])
        start, end = table[entry_index], table[entry_index + 1]
        absolute = start + relative_offset
        if not start < absolute < end or not raw[absolute - 1] < 0xE5 <= raw[absolute]:
            raise ValueError("edit is not at a verified direct-glyph/control boundary")
        edits.append(Edit(entry_index, relative_offset, code_points, bytes(insertion), absolute))
    if len({edit.entry_index for edit in edits}) != len(edits):
        raise ValueError("only one edit per entry is permitted")

    modified = bytearray(raw)
    for edit in sorted(edits, key=lambda item: item.absolute_offset, reverse=True):
        modified[edit.absolute_offset : edit.absolute_offset] = edit.insertion
    shifted_table = []
    for index, offset in enumerate(table):
        delta = sum(len(edit.insertion) for edit in edits if edit.entry_index < index)
        shifted_table.append(offset + delta)
        struct.pack_into("<H", modified, index * 2, offset + delta)
    packed = compress(bytes(modified))
    roundtrip, consumed = decompress(packed)
    if roundtrip != bytes(modified) or consumed != len(packed):
        raise AssertionError("recompressed archive failed round-trip verification")
    relocation_requested = any(
        value is not None for value in (args.relocation_offset, args.expanded_size, args.source_pointer_word_offset)
    )
    relocation = None
    if relocation_requested:
        if None in (args.relocation_offset, args.expanded_size, args.source_pointer_word_offset):
            raise ValueError("relocation requires offset, expanded size, and source pointer word offset")
        assert args.relocation_offset is not None
        assert args.expanded_size is not None
        assert args.source_pointer_word_offset is not None
        if args.relocation_offset < len(rom) or args.relocation_offset % 4:
            raise ValueError("relocation offset must be aligned and outside the input ROM")
        if args.expanded_size not in (0x1000000, 0x2000000) or args.relocation_offset + len(packed) > args.expanded_size:
            raise ValueError("expanded size must be a supported power-of-two GBA ROM size")
        if not 0 <= args.source_pointer_word_offset <= len(rom) - 4:
            raise ValueError("source pointer word lies outside the input ROM")
        expected_pointer = 0x08000000 + args.source_offset
        if struct.unpack_from("<I", rom, args.source_pointer_word_offset)[0] != expected_pointer:
            raise ValueError("source pointer word differs from the selected archive")
        output = bytearray(rom)
        output.extend(b"\xFF" * (args.expanded_size - len(output)))
        output[args.relocation_offset : args.relocation_offset + len(packed)] = packed
        replacement_pointer = 0x08000000 + args.relocation_offset
        struct.pack_into("<I", output, args.source_pointer_word_offset, replacement_pointer)
        changed = [offset for offset, (before, after) in enumerate(zip(rom, output[: len(rom)], strict=True)) if before != after]
        allowed = range(args.source_pointer_word_offset, args.source_pointer_word_offset + 4)
        if not changed or not all(offset in allowed for offset in changed):
            raise AssertionError("base-ROM diff escapes the declared pointer word")
        relocation = {
            "target_rom_offset": args.relocation_offset,
            "target_rom_address": replacement_pointer,
            "expanded_output_byte_length": args.expanded_size,
            "source_pointer_word_rom_offset": args.source_pointer_word_offset,
            "original_pointer": f"{expected_pointer:08X}",
            "replacement_pointer": f"{replacement_pointer:08X}",
            "original_source_preserved": True,
        }
    else:
        if len(packed) > args.source_capacity:
            raise ValueError("recompressed archive exceeds the declared in-place capacity")
        output = bytearray(rom)
        original_slot = bytes(output[args.source_offset : args.source_offset + args.source_capacity])
        replacement_slot = packed + original_slot[len(packed) :]
        output[args.source_offset : args.source_offset + args.source_capacity] = replacement_slot
        changed = [offset for offset, (before, after) in enumerate(zip(rom, output, strict=True)) if before != after]
        allowed = range(args.source_offset, args.source_offset + args.source_capacity)
        if not changed or not all(offset in allowed for offset in changed):
            raise AssertionError("output diff escapes the declared compressed source slot")

    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    result = {
        "schema_version": 1,
        "kind": "non_distributable_state_observed_lz77_archive_poc",
        "input": {"filename": args.rom.name, "sha256": input_digest},
        "base_manifest": {"filename": args.base_manifest.name, "sha256": sha256(manifest_bytes)},
        "codepage": {"filename": args.codepage.name, "sha256": sha256(codepage_bytes), "mode": codepage.get("mode")},
        "archive": {
            "source_rom_offset": args.source_offset,
            "source_capacity": args.source_capacity,
            "original_compressed_byte_length": original_compressed_length,
            "replacement_compressed_byte_length": len(packed),
            "original_decompressed_byte_length": len(raw),
            "replacement_decompressed_byte_length": len(modified),
            "original_decompressed_sha256": sha256(raw),
            "replacement_decompressed_sha256": sha256(bytes(modified)),
            "entry_count": len(table) - 1,
            "relocation": relocation,
        },
        "edits": [
            {
                "entry_index": edit.entry_index,
                "relative_offset": edit.relative_offset,
                "unicode_code_points": list(edit.code_points),
                "inserted_byte_length": len(edit.insertion),
                "original_entry_byte_length": table[edit.entry_index + 1] - table[edit.entry_index],
                "replacement_entry_byte_length": shifted_table[edit.entry_index + 1] - shifted_table[edit.entry_index],
            }
            for edit in sorted(edits, key=lambda item: item.entry_index)
        ],
        "changed_byte_count_within_input_rom": len(changed),
        "appended_byte_count": len(output) - len(rom),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "The state-observed entries display the declared Korean marker and later archive entries remain reachable.",
        "limitations": [
            "This validates only the two state-observed entries in one LZ77 archive.",
            "The output is a local test ROM, not a distributable patch.",
            "One-glyph in-place capacity does not establish translated archive capacity.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
