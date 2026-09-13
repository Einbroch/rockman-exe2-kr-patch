#!/usr/bin/env python3
"""Build a data-driven one-entry Korean code-page PoC ROM copy.

It consumes a provisional E5/E6 code page, generates only the glyph records
needed by one Hangul test string, and performs a same-length edit in the
verified active message entry.
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


def range_digest(data: bytes, offset: int, length: int) -> str:
    return sha256(data[offset:offset + length])


def load_mapping(
    path: Path, policy_path: Path, allow_candidate_unobserved: bool
) -> tuple[dict[str, dict[str, object]], str, str]:
    document = json.loads(path.read_text(encoding="utf-8"))
    if document.get("kind") != "provisional_korean_codepage":
        raise ValueError("this PoC requires a provisional Korean code page")
    mode = document.get("mode")
    if mode in ("candidate_unobserved_overlay", "candidate_catalog_unobserved_overlay"):
        evidence = document.get("placement_evidence")
        if not allow_candidate_unobserved or not isinstance(evidence, dict) or evidence.get("safety_conclusion") != "not established":
            raise ValueError("candidate-unobserved code pages require explicit PoC opt-in and retain unproven safety")
    elif mode != "overlay":
        raise ValueError("this PoC requires an E5/E6 overlay-style code page")
    policy_bytes = policy_path.read_bytes()
    policy = json.loads(policy_bytes)
    if policy.get("target_rom_sha256") != EXPECTED_ROM_SHA256:
        raise ValueError("policy does not identify the supported Rev 1 ROM")
    if document.get("policy", {}).get("sha256") != sha256(policy_bytes):
        raise ValueError("code page was not compiled against the supplied policy")
    allowed_prefixes = {
        item.get("opcode") for item in policy.get("glyph_prefixes", [])
        if item.get("policy") == "verified_glyph_transport_only" and item.get("stream_byte_count") == 2
    }
    if allowed_prefixes != {0xE5, 0xE6} or policy.get("build_rule", {}).get("allow_new_E7_to_FF_command_frames") is not False:
        raise ValueError("policy does not provide the verified E5/E6-only insertion boundary")
    mapping: dict[str, dict[str, object]] = {}
    for entry in document.get("entries", []):
        character = entry.get("character")
        encoded = entry.get("encoded_bytes")
        index = entry.get("font_record_index")
        if not isinstance(character, str) or len(character) != 1 or not isinstance(encoded, list) or not isinstance(index, int):
            raise ValueError("invalid code-page entry")
        if character in mapping or not all(isinstance(value, int) and 0 <= value <= 0xFF for value in encoded):
            raise ValueError("duplicate or malformed code-page entry")
        if not 0xE5 <= index <= 0x2E4:
            raise ValueError("overlay entry lies outside the verified E5/E6 bank")
        if len(encoded) != 2 or encoded[0] not in allowed_prefixes:
            raise ValueError("code-page entry does not use an allowed glyph transport")
        expected = [0xE5, index - 0xE5] if index <= 0x1E4 else [0xE6, index - 0x1E5]
        if encoded != expected:
            raise ValueError("code-page entry disagrees with the verified font-index transport")
        mapping[character] = entry
    return mapping, sha256(policy_bytes), str(mode)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--policy", type=Path, required=True)
    parser.add_argument("--message", default="가다")
    parser.add_argument("--relative-offset", type=lambda value: int(value, 0), default=0x0C)
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument("--allow-candidate-unobserved-codepage", action="store_true")
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
    encoded_message = bytes(value for character in args.message for value in mapping[character]["encoded_bytes"])
    if len(encoded_message) % 2 or not encoded_message:
        raise ValueError("the Korean test message must encode to one or more complete E5/E6 pairs")

    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    if range_digest(original, ENTRY_OFFSET, ENTRY_LENGTH) != ENTRY_SHA256:
        raise ValueError("active entry differs from verified baseline")
    if not 0 <= args.relative_offset < ENTRY_LENGTH:
        raise ValueError("relative offset lies outside the verified active entry")
    script_offset = ENTRY_OFFSET + args.relative_offset
    entry_end = ENTRY_OFFSET + ENTRY_LENGTH
    direct_run_length = 0
    while script_offset + direct_run_length < entry_end and original[script_offset + direct_run_length] < 0xE5:
        direct_run_length += 1
    if len(encoded_message) > direct_run_length:
        raise ValueError("encoded Korean message exceeds the verified contiguous direct-glyph span")
    source_span = original[script_offset:script_offset + len(encoded_message)]

    output = bytearray(original)
    expected_writes: list[dict[str, object]] = []
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    selected_characters = list(dict.fromkeys(args.message))
    for character in selected_characters:
        entry = mapping[character]
        index = entry["font_record_index"]
        offset = FONT_BASE_OFFSET + index * RECORD_BYTES
        mask = make_mask(args.font, character, args.font_size)
        replacement = encode_4bpp(mask)
        output[offset:offset + RECORD_BYTES] = replacement
        write_preview(mask, args.preview_dir / f"glyph_U+{ord(character):04X}.png")
        expected_writes.append({
            "kind": "font_record_from_codepage",
            "unicode_code_point": entry["unicode_code_point"],
            "font_record_index": index,
            "rom_offset": offset,
            "byte_length": RECORD_BYTES,
            "original_range_sha256": range_digest(original, offset, RECORD_BYTES),
            "replacement_range_sha256": sha256(replacement),
        })
    output[script_offset:script_offset + len(encoded_message)] = encoded_message
    expected_writes.append({
        "kind": "length_preserving_message_edit_from_codepage",
        "entry_rom_offset": ENTRY_OFFSET,
        "entry_byte_length": ENTRY_LENGTH,
        "relative_offset": args.relative_offset,
        "rom_offset": script_offset,
        "byte_length": len(encoded_message),
        "original_range_sha256": sha256(source_span),
        "codepage_filename": args.codepage.name,
        "encoded_character_count": len(args.message),
        "verified_contiguous_direct_glyph_span_byte_length": direct_run_length,
        "replacement_range_sha256": sha256(encoded_message),
    })
    ranges = [range(item["rom_offset"], item["rom_offset"] + item["byte_length"]) for item in expected_writes]
    changed = [offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after]
    if not changed or not all(any(offset in allowed for allowed in ranges) for offset in changed):
        raise AssertionError("output diff escapes planned-write ranges")
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    report = {
        "schema_version": 1,
        "kind": "non_distributable_data_driven_korean_codepage_poc",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "codepage": {
            "filename": args.codepage.name,
            "sha256": sha256(args.codepage.read_bytes()),
            "mode": codepage_mode,
            "written_glyph_record_count": len(selected_characters),
        },
        "policy": {"filename": args.policy.name, "sha256": policy_sha256},
        "font_source": {"filename": args.font.name, "sha256": sha256(args.font.read_bytes()), "embedded_in_project": False},
        "entry": {"rom_offset": ENTRY_OFFSET, "byte_length": ENTRY_LENGTH, "sha256": ENTRY_SHA256, "length_preserved": True},
        "expected_writes": expected_writes,
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "limitations": [
            "This maps only the supplied technical sample and one verified dialogue entry.",
            "Only glyph records used by the supplied message are written; this reduces but does not eliminate collision risk.",
            "Candidate-unobserved placement is not proof that selected records are unused by other original text scopes.",
            "The output ROM and previews are local test artifacts and are not distribution files.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
