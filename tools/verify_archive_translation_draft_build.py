#!/usr/bin/env python3
"""Independently verify the rebuilt archive translation draft ROM."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from build_korean_glyph_poc import FONT_BASE_OFFSET, RECORD_BYTES, encode_4bpp, make_mask
from exe1_k_font_source import glyph_record as exe1_k_glyph_record
from exe1_k_font_source import load_source as load_exe1_k_font_source
from gba_lz77 import decompress
from PIL import ImageFont


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def table(raw: bytes) -> list[int]:
    size = struct.unpack_from("<H", raw)[0]
    values = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, size, 2)]
    if size < 4 or size % 2 or values[0] != size or values[-1] != len(raw):
        raise ValueError("invalid archive table")
    if any(left > right for left, right in zip(values, values[1:])):
        raise ValueError("non-monotonic archive table")
    return values


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--original-rom", type=Path, required=True)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--archive-manifest", type=Path, required=True)
    parser.add_argument("--translation", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    font_group = parser.add_mutually_exclusive_group(required=True)
    font_group.add_argument("--font", type=Path)
    font_group.add_argument("--exe1-k-font-rom", type=Path)
    parser.add_argument("--font-index", type=int, default=0)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.font_index < 0:
        raise ValueError("--font-index must be non-negative")

    original = args.original_rom.read_bytes()
    rom = args.rom.read_bytes()
    manifest_bytes = args.archive_manifest.read_bytes()
    manifest = json.loads(manifest_bytes)
    translation_bytes = args.translation.read_bytes()
    translation = json.loads(translation_bytes)
    codepage_bytes = args.codepage.read_bytes()
    codepage = json.loads(codepage_bytes)
    if sha256(rom) != manifest["output"]["sha256"]:
        raise ValueError("ROM does not match archive manifest")
    if sha256(translation_bytes) != manifest["translation"]["sha256"]:
        raise ValueError("translation does not match archive manifest")
    if sha256(codepage_bytes) != manifest["codepage"]["sha256"]:
        raise ValueError("codepage does not match archive manifest")
    expected_font = manifest["font_source"]
    exe1_k_font_bytes: bytes | None = None
    if args.font is not None:
        font_bytes = args.font.read_bytes()
        selected_font = ImageFont.truetype(str(args.font), 16, index=args.font_index)
        font_family, font_style = selected_font.getname()
        if (
            expected_font.get("kind") not in (None, "external_scalable_font")
            or sha256(font_bytes) != expected_font["sha256"]
            or args.font_index != int(expected_font.get("face_index", 0))
            or font_family != expected_font.get("family", font_family)
            or font_style != expected_font.get("style", font_style)
        ):
            raise ValueError("font source or TTC face does not match archive manifest")
    else:
        if args.font_index != 0:
            raise ValueError("--font-index applies only to --font")
        assert args.exe1_k_font_rom is not None
        exe1_k_font_bytes = load_exe1_k_font_source(args.exe1_k_font_rom)
        if (
            expected_font.get("kind") != "external_patched_rom_glyph_reference"
            or sha256(exe1_k_font_bytes) != expected_font["sha256"]
            or expected_font.get("hangul_order") != "KS_X_1001_2350"
        ):
            raise ValueError("EXE 1 [K] font source does not match archive manifest")

    archive = manifest["archive"]
    source_offset = int(archive["source_rom_offset"])
    source_capacity = int(archive["source_capacity"])
    relocated_offset = int(archive["relocation"]["target_rom_offset"])
    original_raw, _ = decompress(original, source_offset)
    rebuilt_raw, consumed = decompress(rom, relocated_offset)
    original_table = table(original_raw)
    rebuilt_table = table(rebuilt_raw)
    if len(original_table) != len(rebuilt_table):
        raise AssertionError("entry count changed")
    if rom[source_offset:source_offset + source_capacity] != original[source_offset:source_offset + source_capacity]:
        raise AssertionError("original compressed archive slot was not preserved")

    mappings: dict[str, tuple[bytes, int]] = {}
    for item in codepage["entries"]:
        character = chr(int(item["unicode_code_point"][2:], 16))
        mappings[character] = (bytes(item["encoded_bytes"]), int(item["font_record_index"]))

    expected_entries = [original_raw[original_table[index]:original_table[index + 1]] for index in range(len(original_table) - 1)]
    required_characters: list[str] = []
    for item in translation["entries"]:
        index = int(item["entry_index"])
        source_entry = expected_entries[index]
        if bytes.fromhex(item["original_entry_raw_hex"]) != source_entry:
            raise AssertionError(f"entry {index} protected bytes differ")
        span_start, span_end = map(int, item["source_visible_text_span"])
        replacement = bytearray()
        for segment in item["replacement_segments"]:
            kind, value = next(iter(segment.items()))
            if kind == "hangul":
                for character in value:
                    replacement.extend(mappings[character][0])
                    if character not in required_characters:
                        required_characters.append(character)
            elif kind in ("direct_hex", "control_hex"):
                replacement.extend(bytes.fromhex(value))
            elif kind == "source_glyph_hex":
                source_glyphs = bytes.fromhex(value)
                if (
                    not source_glyphs
                    or len(source_glyphs) % 2
                    or any(source_glyphs[offset] not in (0xE5, 0xE6) for offset in range(0, len(source_glyphs), 2))
                    or source_glyphs not in source_entry[span_start:span_end]
                ):
                    raise AssertionError(
                        f"entry {index} source_glyph_hex is not a protected source E5/E6 run"
                    )
                replacement.extend(source_glyphs)
            else:
                raise ValueError(f"unknown segment kind: {kind}")
        expected_entries[index] = source_entry[:span_start] + replacement + source_entry[span_end:]

    expected_table_size = original_table[0]
    expected_offsets = [expected_table_size]
    cursor = expected_table_size
    for entry in expected_entries:
        cursor += len(entry)
        expected_offsets.append(cursor)
    expected_raw = bytearray(expected_table_size)
    for index, offset in enumerate(expected_offsets):
        struct.pack_into("<H", expected_raw, index * 2, offset)
    expected_raw.extend(b"".join(expected_entries))
    if bytes(expected_raw) != rebuilt_raw or expected_offsets != rebuilt_table:
        raise AssertionError("rebuilt archive differs from independent entry reconstruction")

    for character in required_characters:
        index = mappings[character][1]
        offset = FONT_BASE_OFFSET + index * RECORD_BYTES
        if args.font is not None:
            expected_glyph = encode_4bpp(make_mask(args.font, character, 16, args.font_index))
        else:
            assert exe1_k_font_bytes is not None
            expected_glyph, _, _ = exe1_k_glyph_record(exe1_k_font_bytes, character)
        if rom[offset:offset + RECORD_BYTES] != expected_glyph:
            raise AssertionError(f"font record differs for U+{ord(character):04X}")

    header_checksum = (-(sum(rom[0xA0:0xBD]) + 0x19)) & 0xFF
    if rom[0xBD] != header_checksum:
        raise AssertionError("GBA header complement checksum is invalid")
    packed_length = int(archive["replacement_compressed_byte_length"])
    if consumed != packed_length:
        raise AssertionError("relocated compressed stream length differs from manifest")
    if any(value != 0xFF for value in rom[relocated_offset + packed_length:]):
        raise AssertionError("expanded tail outside relocated archive is not FF")

    report = {
        "schema_version": 1,
        "kind": "independent_archive_translation_draft_build_verification",
        "original": {"filename": args.original_rom.name, "sha256": sha256(original)},
        "rom": {"filename": args.rom.name, "sha256": sha256(rom), "byte_length": len(rom)},
        "archive_manifest": {"filename": args.archive_manifest.name, "sha256": sha256(manifest_bytes)},
        "verification": {
            "original_compressed_slot_preserved": True,
            "all_untranslated_entries_byte_identical": True,
            "translated_entries_match_structured_segments": True,
            "rebuilt_table_matches_independent_offsets": True,
            "required_font_records_match_declared_source": True,
            "font_source_kind": expected_font.get("kind", "external_scalable_font"),
            "required_hangul_glyph_count": len(required_characters),
            "gba_header_complement_checksum_valid": True,
            "relocated_stream_consumed_byte_length": consumed,
            "expanded_tail_outside_archive_is_ff": True,
            "entry_count": len(rebuilt_table) - 1,
        },
        "passed": True,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report["verification"], ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
