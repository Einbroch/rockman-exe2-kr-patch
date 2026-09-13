#!/usr/bin/env python3
"""Build a bounded, non-distributable Korean translation draft PoC.

The input is the verified 8 MiB active-block stage ROM.  This builder reads
the untouched Rev 1 archive 00/09 from its original slot, validates protected
entry bytes from the translation asset, replaces only the declared visible
spans, writes the required Korean font records, and relocates the recompressed
archive into an expanded 16 MiB image.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from dataclasses import dataclass
from pathlib import Path

from build_korean_glyph_poc import FONT_BASE_OFFSET, RECORD_BYTES, encode_4bpp, make_mask, write_preview
from exe1_k_font_source import glyph_record as exe1_k_glyph_record
from exe1_k_font_source import load_source as load_exe1_k_font_source
from exe1_k_font_source import record_to_mask as exe1_k_record_to_mask
from gba_lz77 import compress, decompress
from PIL import ImageFont


ROM_BASE = 0x08000000
EXPECTED_TRANSLATION_SCHEMA = 2
EXPECTED_TRANSLATION_KIND = "non_distributable_state_observed_archive_translation_draft"
EXPECTED_CODEPAGE_MODE = "candidate_catalog_unobserved_overlay"
CONTEXTUAL_CODEPAGE_MODE = "contextual_full_bank"


@dataclass(frozen=True)
class Replacement:
    entry_id: str
    entry_index: int
    entry_start: int
    entry_end: int
    span_start: int
    span_end: int
    original_span: bytes
    encoded: bytes
    hangul: str
    controls: tuple[int, ...]
    page_relative_offsets: tuple[int, ...]

    @property
    def absolute_start(self) -> int:
        return self.entry_start + self.span_start

    @property
    def absolute_end(self) -> int:
        return self.entry_start + self.span_end

    @property
    def delta(self) -> int:
        return len(self.encoded) - len(self.original_span)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_hex(value: object, field: str) -> bytes:
    if not isinstance(value, str):
        raise ValueError(f"{field} must be a hexadecimal string")
    try:
        return bytes.fromhex(value)
    except ValueError as error:
        raise ValueError(f"{field} is not valid hexadecimal") from error


def parse_table(raw: bytes) -> list[int]:
    if len(raw) < 4:
        raise ValueError("archive is too short")
    table_bytes = struct.unpack_from("<H", raw)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(raw):
        raise ValueError("archive has no valid u16 entry table")
    table = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, table_bytes, 2)]
    if table[0] != table_bytes:
        raise ValueError("archive table byte length disagrees with its first offset")
    if any(left > right for left, right in zip(table, table[1:])) or table[-1] != len(raw):
        raise ValueError("archive entry table is not a complete monotonic range")
    return table


OPAQUE_PRESERVED_FRAME_LENGTHS = {
    0xEA: 4,
    0xED: 3,
    0xEE: 3,
    0xEF: 3,
    0xF0: 6,
    0xF2: 4,
    0xF3: 6,
}


def opaque_preserved_frame_length(raw: bytes, offset: int) -> int | None:
    value = raw[offset]
    if value == 0xF8:
        if offset + 2 > len(raw):
            raise ValueError("protected source span ends in an incomplete F8 command")
        # Observed playerAnimate (F8 04 nn) has one argument byte; the
        # playerLock/playerUnlock/playerFinish forms used here are two bytes.
        return 3 if raw[offset + 1] == 0x04 else 2
    if value == 0xF6:
        if offset + 2 > len(raw):
            raise ValueError("protected source span ends in an incomplete F6 command")
        # itemGiveChip (F6 10 chipLo chipHi code amount) is six bytes;
        # the itemGive form observed in this archive is four bytes.
        return 6 if raw[offset + 1] == 0x10 else 4
    if value == 0xF9:
        # The selected chip-print command carries a two-byte chip identity and
        # buffer byte. Other selected item/code print commands are four bytes.
        if raw[offset:offset + 5] == b"\xF9\x00\x82\x01\x00":
            return 5
        return 4
    return OPAQUE_PRESERVED_FRAME_LENGTHS.get(value)


def protected_inline_controls(raw: bytes) -> tuple[int, ...]:
    """Return verified inline control commands, including command parameters.

    Single-byte E8/E9/EB controls and the observed fixed-length
    EA/ED/EE/EF/F0/F2/F3/F6/F8/F9 frames are admitted only as byte-exact preserved
    sequences. Keeping every
    parameter byte in the protected sequence prevents a draft from silently
    changing timing, layout, or branching while still allowing low-valued
    parameters to be represented as part of a typed control segment. This is
    an opaque preservation rule, not a claim that the command semantics are
    fully specified.
    """
    controls = bytearray()
    offset = 0
    while offset < len(raw):
        value = raw[offset]
        if value in (0xE5, 0xE6):
            if offset + 1 >= len(raw):
                raise ValueError("protected source span ends in an incomplete E5/E6 pair")
            offset += 2
        elif value in (0xE8, 0xE9, 0xEB):
            controls.append(value)
            offset += 1
        elif (frame_length := opaque_preserved_frame_length(raw, offset)) is not None:
            if offset + frame_length > len(raw):
                raise ValueError(
                    f"protected source span ends in an incomplete {value:02X} command"
                )
            controls.extend(raw[offset:offset + frame_length])
            offset += frame_length
        else:
            if value >= 0xE7:
                raise ValueError(f"unsupported control 0x{value:02X} inside replacement span")
            offset += 1
    return tuple(controls)


def validate_control_segment(control: bytes, entry_id: str) -> None:
    offset = 0
    while offset < len(control):
        value = control[offset]
        if value in (0xE8, 0xE9, 0xEB):
            offset += 1
        elif (frame_length := opaque_preserved_frame_length(control, offset)) is not None:
            if offset + frame_length > len(control):
                raise ValueError(f"{entry_id}: incomplete {value:02X} control segment")
            offset += frame_length
        else:
            raise ValueError(f"{entry_id}: unsupported inline control 0x{value:02X}")


def encoded_index(index: int) -> list[int]:
    if 0 <= index <= 0xE4:
        return [index]
    if 0xE5 <= index <= 0x1E4:
        return [0xE5, index - 0xE5]
    if 0x1E5 <= index <= 0x2E4:
        return [0xE6, index - 0x1E5]
    raise ValueError(f"font record index is outside the renderer transport: {index}")


def load_codepage(
    path: Path, allow_contextual_full_bank: bool
) -> tuple[dict[str, dict[str, object]], bytes, dict[str, object]]:
    payload = path.read_bytes()
    document = json.loads(payload)
    mode = document.get("mode")
    if mode == CONTEXTUAL_CODEPAGE_MODE:
        if not allow_contextual_full_bank:
            raise ValueError("contextual_full_bank requires --allow-contextual-full-bank")
        reservation = document.get("context_reservation")
        if not isinstance(reservation, dict) or not reservation.get("combined_reserved_record_count"):
            raise ValueError("contextual_full_bank codepage has no non-Hangul reservation evidence")
    elif mode != EXPECTED_CODEPAGE_MODE:
        raise ValueError("translation draft requires the catalog-screened codepage mode")
    mapping: dict[str, dict[str, object]] = {}
    used_indices: set[int] = set()
    for entry in document.get("entries", []):
        if not isinstance(entry, dict):
            raise ValueError("codepage entry must be an object")
        code_point = entry.get("unicode_code_point")
        encoded = entry.get("encoded_bytes")
        index = entry.get("font_record_index")
        if not isinstance(code_point, str) or not code_point.startswith("U+"):
            raise ValueError("codepage entry has no Unicode code point")
        try:
            character = chr(int(code_point[2:], 16))
        except ValueError as error:
            raise ValueError(f"invalid code point: {code_point}") from error
        if character in mapping:
            raise ValueError(f"duplicate codepage character: {code_point}")
        if not isinstance(index, int) or not 0 <= index <= 0x2E4:
            raise ValueError(f"invalid font record for {code_point}")
        if not isinstance(encoded, list) or encoded != encoded_index(index):
            raise ValueError(f"encoded bytes do not match the font record for {code_point}")
        if index in used_indices:
            raise ValueError(f"duplicate codepage font record: {index}")
        used_indices.add(index)
        mapping[character] = entry
    return mapping, payload, document


def encode_segments(
    segments: object, mapping: dict[str, dict[str, object]], entry_id: str
) -> tuple[bytes, str, tuple[int, ...], tuple[bytes, ...]]:
    if not isinstance(segments, list) or not segments:
        raise ValueError(f"{entry_id}: replacement_segments must be a non-empty list")
    encoded = bytearray()
    hangul = []
    controls: list[int] = []
    source_glyph_runs: list[bytes] = []
    for position, segment in enumerate(segments):
        if not isinstance(segment, dict) or len(segment) != 1:
            raise ValueError(f"{entry_id}: segment {position} must contain exactly one typed value")
        kind, value = next(iter(segment.items()))
        if kind == "hangul":
            if not isinstance(value, str) or not value:
                raise ValueError(f"{entry_id}: empty Hangul segment")
            for character in value:
                if not 0xAC00 <= ord(character) <= 0xD7A3:
                    raise ValueError(f"{entry_id}: non-Hangul character in Hangul segment: {character!r}")
                entry = mapping.get(character)
                if entry is None:
                    raise ValueError(f"{entry_id}: codepage has no mapping for {character} (U+{ord(character):04X})")
                pair = entry["encoded_bytes"]
                assert isinstance(pair, list)
                encoded.extend(pair)
                hangul.append(character)
        elif kind == "direct_hex":
            direct = parse_hex(value, f"{entry_id}.replacement_segments[{position}].direct_hex")
            if not direct or any(byte >= 0xE5 for byte in direct):
                raise ValueError(f"{entry_id}: direct bytes must be non-empty and below E5")
            encoded.extend(direct)
        elif kind == "source_glyph_hex":
            source_glyphs = parse_hex(
                value, f"{entry_id}.replacement_segments[{position}].source_glyph_hex"
            )
            if (
                not source_glyphs
                or len(source_glyphs) % 2
                or any(source_glyphs[offset] not in (0xE5, 0xE6) for offset in range(0, len(source_glyphs), 2))
            ):
                raise ValueError(
                    f"{entry_id}: source glyph bytes must be complete E5/E6 pairs"
                )
            encoded.extend(source_glyphs)
            source_glyph_runs.append(source_glyphs)
        elif kind == "control_hex":
            control = parse_hex(value, f"{entry_id}.replacement_segments[{position}].control_hex")
            if not control:
                raise ValueError(f"{entry_id}: control bytes must be non-empty")
            validate_control_segment(control, entry_id)
            encoded.extend(control)
            controls.extend(control)
        else:
            raise ValueError(f"{entry_id}: unknown replacement segment type: {kind}")
    return bytes(encoded), "".join(hangul), tuple(controls), tuple(source_glyph_runs)


def page_relative_offsets(
    encoded: bytes, *, allow_terminal_jump_break: bool = False
) -> tuple[int, ...]:
    """Return page starts within a replacement using the verified EB E9 break.

    A script may clear the final dialogue page and immediately jump to another
    entry.  In that narrowly declared case the terminal EB E9 does not create
    an empty local page; the following protected F5 command transfers control.
    """
    starts = [0]
    offset = 0
    while offset < len(encoded):
        if encoded[offset:offset + 2] == b"\xEB\xE9":
            starts.append(offset + 2)
            offset += 2
        else:
            offset += 1
    if starts[-1] >= len(encoded):
        if not allow_terminal_jump_break:
            raise ValueError("replacement ends immediately after a page-break control")
        starts.pop()
    return tuple(starts)


def load_replacements(
    path: Path,
    raw: bytes,
    table: list[int],
    mapping: dict[str, dict[str, object]],
    source_offset: int,
    source_capacity: int,
    relocation_offset: int,
    compressed_length: int,
) -> tuple[list[Replacement], bytes, dict[str, object]]:
    payload = path.read_bytes()
    document = json.loads(payload)
    if document.get("schema_version") != EXPECTED_TRANSLATION_SCHEMA or document.get("kind") != EXPECTED_TRANSLATION_KIND:
        raise ValueError("translation asset schema or kind is not supported")
    if document.get("build_eligibility") != "development_poc_only":
        raise ValueError("translation draft is not explicitly eligible for a development PoC")
    if document.get("review_state") != "machine_draft_needs_human_review":
        raise ValueError("translation draft review state is not explicit")
    archive = document.get("archive")
    if not isinstance(archive, dict):
        raise ValueError("translation asset has no archive identity")
    expected_archive = {
        "source_rom_offset": source_offset,
        "source_capacity": source_capacity,
        "relocated_rom_offset": relocation_offset,
        "original_compressed_byte_length": compressed_length,
        "original_decompressed_byte_length": len(raw),
        "original_decompressed_sha256": sha256(raw),
    }
    for field, expected in expected_archive.items():
        if archive.get(field) != expected:
            raise ValueError(f"translation archive identity mismatch for {field}")

    replacements: list[Replacement] = []
    seen_ids: set[str] = set()
    seen_entries: set[int] = set()
    for item in document.get("entries", []):
        if not isinstance(item, dict):
            raise ValueError("translation entry must be an object")
        entry_id = item.get("entry_id")
        entry_index = item.get("entry_index")
        if not isinstance(entry_id, str) or not entry_id or entry_id in seen_ids:
            raise ValueError("translation entry ID is absent or duplicated")
        if not isinstance(entry_index, int) or not 0 <= entry_index < len(table) - 1 or entry_index in seen_entries:
            raise ValueError(f"{entry_id}: entry index is invalid or duplicated")
        if item.get("status") != "needs_human_review":
            raise ValueError(f"{entry_id}: only explicit needs_human_review drafts are accepted")
        start, end = table[entry_index], table[entry_index + 1]
        entry_raw = raw[start:end]
        if item.get("original_entry_offset") != start or item.get("original_entry_byte_length") != len(entry_raw):
            raise ValueError(f"{entry_id}: protected entry bounds differ from the current extraction")
        if parse_hex(item.get("original_entry_raw_hex"), f"{entry_id}.original_entry_raw_hex") != entry_raw:
            raise ValueError(f"{entry_id}: protected entry bytes differ from the current extraction")
        span = item.get("source_visible_text_span")
        if not isinstance(span, list) or len(span) != 2 or not all(isinstance(value, int) for value in span):
            raise ValueError(f"{entry_id}: invalid visible text span")
        span_start, span_end = span
        if not 0 <= span_start < span_end <= len(entry_raw):
            raise ValueError(f"{entry_id}: visible text span lies outside the entry")
        original_span = entry_raw[span_start:span_end]
        if parse_hex(item.get("source_visible_raw_hex"), f"{entry_id}.source_visible_raw_hex") != original_span:
            raise ValueError(f"{entry_id}: protected visible text bytes differ from the current extraction")
        encoded, hangul, controls, source_glyph_runs = encode_segments(
            item.get("replacement_segments"), mapping, entry_id
        )
        if any(run not in original_span for run in source_glyph_runs):
            raise ValueError(
                f"{entry_id}: source_glyph_hex is not a byte-identical run from the protected source span"
            )
        allow_terminal_jump_break = False
        declared_jump_target = item.get("direct_jump_target_entry")
        if declared_jump_target is not None:
            page_span = item.get("preserved_page_end_control_span")
            if (
                not isinstance(declared_jump_target, int)
                or not isinstance(page_span, list)
                or len(page_span) != 2
                or not all(isinstance(value, int) for value in page_span)
            ):
                raise ValueError(f"{entry_id}: invalid declared terminal jump")
            page_start, page_end = page_span
            jump = parse_hex(
                item.get("preserved_page_end_control_hex"),
                f"{entry_id}.terminal_jump",
            )
            if (
                page_start != span_end
                or page_end != span_end + 3
                or jump[:1] != b"\xF5"
                or len(jump) != 3
                or int.from_bytes(jump[1:], "big") != declared_jump_target
                or entry_raw[page_start:page_end] != jump
            ):
                raise ValueError(
                    f"{entry_id}: terminal page break is not followed by the declared protected F5 jump"
                )
            allow_terminal_jump_break = True
        page_offsets = page_relative_offsets(
            encoded, allow_terminal_jump_break=allow_terminal_jump_break
        )
        proposed_pages = item.get("proposed_pages")
        if proposed_pages is not None:
            if not isinstance(proposed_pages, list) or len(proposed_pages) != len(page_offsets):
                raise ValueError(f"{entry_id}: proposed page count differs from encoded page controls")
            if any(
                not isinstance(page, list)
                or not page
                or any(not isinstance(line, str) or not line for line in page)
                for page in proposed_pages
            ):
                raise ValueError(f"{entry_id}: proposed pages must contain non-empty text lines")
        declared_controls = item.get("protected_control_hex_in_replacement_span")
        if not isinstance(declared_controls, list):
            raise ValueError(f"{entry_id}: protected control list is absent")
        declared = tuple(byte for value in declared_controls for byte in parse_hex(value, f"{entry_id}.protected_control"))
        original_controls = protected_inline_controls(original_span)
        if controls != declared or declared != original_controls:
            raise ValueError(
                f"{entry_id}: replacement control sequence {controls} does not preserve source sequence {original_controls}"
            )
        page_span = item.get("preserved_page_end_control_span")
        if page_span is not None:
            if not isinstance(page_span, list) or len(page_span) != 2 or not all(isinstance(value, int) for value in page_span):
                raise ValueError(f"{entry_id}: invalid preserved page-end span")
            page_start, page_end = page_span
            if page_start < span_end or page_end > len(entry_raw) or page_start >= page_end:
                raise ValueError(f"{entry_id}: preserved page-end span overlaps the replacement")
            expected_page = parse_hex(item.get("preserved_page_end_control_hex"), f"{entry_id}.page_end")
            if entry_raw[page_start:page_end] != expected_page:
                raise ValueError(f"{entry_id}: preserved page-end bytes differ from the current extraction")
        replacements.append(
            Replacement(
                entry_id,
                entry_index,
                start,
                end,
                span_start,
                span_end,
                original_span,
                encoded,
                hangul,
                controls,
                page_offsets,
            )
        )
        seen_ids.add(entry_id)
        seen_entries.add(entry_index)
    if not replacements:
        raise ValueError("translation asset contains no replacement entries")
    return replacements, payload, document


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--expected-input-sha256", required=True)
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--translation", type=Path, required=True)
    font_group = parser.add_mutually_exclusive_group(required=True)
    font_group.add_argument("--font", type=Path)
    font_group.add_argument(
        "--exe1-k-font-rom",
        type=Path,
        help="Local EXE 1 [K] ROM whose verified KS X 1001 8x16 records supply the selected pixel font.",
    )
    parser.add_argument(
        "--font-permission-record",
        type=Path,
        help="User-attested permission record for the EXE 1 [K] font source.",
    )
    parser.add_argument("--font-index", type=int, default=0)
    parser.add_argument("--font-size", type=int, default=16)
    parser.add_argument("--source-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--source-capacity", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--relocation-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--expanded-size", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--source-pointer-word-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument(
        "--decompressed-output",
        type=Path,
        help="Optional exact rebuilt decompressed archive for runtime memory verification.",
    )
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument(
        "--allow-contextual-full-bank",
        action="store_true",
        help="Permit a context-reserved 0..740 codepage for an intermediate ROM that will be wrapped by the contextual font-bank builder.",
    )
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    font_path = args.font if args.font is not None else args.exe1_k_font_rom
    assert font_path is not None
    for source in (args.rom, args.base_manifest, args.codepage, args.translation, font_path):
        if not source.is_file():
            raise FileNotFoundError(source)
    if args.font is not None and args.font_permission_record is not None:
        raise ValueError("--font-permission-record applies only to --exe1-k-font-rom")
    if args.exe1_k_font_rom is not None and args.font_permission_record is None:
        raise ValueError("--exe1-k-font-rom requires --font-permission-record")
    if args.font_index < 0:
        raise ValueError("--font-index must be non-negative")
    exe1_k_font_bytes: bytes | None = None
    if args.font is not None:
        selected_font = ImageFont.truetype(str(args.font), args.font_size, index=args.font_index)
        font_family, font_style = selected_font.getname()
        font_source = {
            "kind": "external_scalable_font",
            "filename": args.font.name,
            "sha256": sha256(args.font.read_bytes()),
            "face_index": args.font_index,
            "family": font_family,
            "style": font_style,
            "embedded_in_project": False,
        }
    else:
        if args.font_index != 0:
            raise ValueError("--font-index applies only to --font")
        assert args.exe1_k_font_rom is not None
        exe1_k_font_bytes = load_exe1_k_font_source(args.exe1_k_font_rom)
        assert args.font_permission_record is not None
        if not args.font_permission_record.is_file():
            raise FileNotFoundError(args.font_permission_record)
        permission_bytes = args.font_permission_record.read_bytes()
        permission = json.loads(permission_bytes)
        if (
            permission.get("kind") != "third_party_font_permission_record"
            or permission.get("state") != "adopted"
            or permission.get("source_asset", {}).get("sha256") != sha256(exe1_k_font_bytes)
            or permission.get("adopted_effect", {}).get("font_reuse_permission_status")
            != "permission_received_user_attested"
            or permission.get("adopted_effect", {}).get("font_rights_no_longer_a_project_blocker") is not True
        ):
            raise ValueError("EXE 1 [K] font permission record is missing, mismatched, or not adopted")
        font_source = {
            "kind": "external_patched_rom_glyph_reference",
            "filename": args.exe1_k_font_rom.name,
            "sha256": sha256(exe1_k_font_bytes),
            "family": "EXE1_K_KS_X_1001_pixel_font",
            "style": "8x16_two_tile_4bpp_palette_1_3",
            "font_base_rom_offset": 0x80016C,
            "hangul_base_record_index": 512,
            "hangul_order": "KS_X_1001_2350",
            "embedded_in_project": False,
            "permission_record": {
                "filename": args.font_permission_record.name,
                "sha256": sha256(permission_bytes),
                "decision_id": permission.get("decision_id"),
            },
            "distribution_permission_status": "permission_received_user_attested",
            "documentary_permission_copy_stored_in_workspace": bool(
                permission.get("human_attestation", {}).get("documentary_permission_copy_stored_in_workspace")
            ),
        }
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")
    if args.manifest.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.manifest} (pass --force to replace it)")
    if args.decompressed_output is not None and args.decompressed_output.exists() and not args.force:
        raise FileExistsError(
            f"output already exists: {args.decompressed_output} (pass --force to replace it)"
        )
    if args.relocation_offset < args.rom.stat().st_size or args.relocation_offset % 4:
        raise ValueError("relocation offset must be aligned and outside the input ROM")
    if args.expanded_size not in (0x1000000, 0x2000000) or args.relocation_offset >= args.expanded_size:
        raise ValueError("expanded size or relocation offset is unsupported")

    rom = args.rom.read_bytes()
    input_digest = sha256(rom)
    if input_digest.lower() != args.expected_input_sha256.lower():
        raise ValueError(f"input ROM SHA-256 differs from the declared base: {input_digest}")
    base_manifest_bytes = args.base_manifest.read_bytes()
    base_manifest = json.loads(base_manifest_bytes)
    if base_manifest.get("output", {}).get("sha256") != input_digest:
        raise ValueError("base manifest does not identify the input ROM")
    if not 0 <= args.source_offset < len(rom) or args.source_offset + args.source_capacity > len(rom):
        raise ValueError("archive source slot lies outside the input ROM")
    raw, original_compressed_length = decompress(rom, args.source_offset)
    if original_compressed_length > args.source_capacity:
        raise ValueError("original compressed stream exceeds its declared source capacity")
    table = parse_table(raw)
    mapping, codepage_bytes, codepage_document = load_codepage(
        args.codepage, args.allow_contextual_full_bank
    )
    replacements, translation_bytes, translation_document = load_replacements(
        args.translation,
        raw,
        table,
        mapping,
        args.source_offset,
        args.source_capacity,
        args.relocation_offset,
        original_compressed_length,
    )

    no_change_packed = compress(raw)
    no_change_roundtrip, no_change_consumed = decompress(no_change_packed)
    if no_change_roundtrip != raw or no_change_consumed != len(no_change_packed):
        raise AssertionError("no-change archive recompression failed self round-trip")

    modified = bytearray(raw)
    for replacement in sorted(replacements, key=lambda item: item.absolute_start, reverse=True):
        if modified[replacement.absolute_start:replacement.absolute_end] != replacement.original_span:
            raise AssertionError(f"{replacement.entry_id}: replacement source changed before application")
        modified[replacement.absolute_start:replacement.absolute_end] = replacement.encoded
    shifted_table: list[int] = []
    for boundary_index, offset in enumerate(table):
        delta = sum(item.delta for item in replacements if item.entry_index < boundary_index)
        shifted = offset + delta
        if not 0 <= shifted <= 0xFFFF:
            raise ValueError("translated archive table offset exceeds u16")
        shifted_table.append(shifted)
        struct.pack_into("<H", modified, boundary_index * 2, shifted)
    if shifted_table[0] != table[0] or shifted_table[-1] != len(modified):
        raise AssertionError("translated archive table does not cover the rebuilt archive")
    if parse_table(bytes(modified)) != shifted_table:
        raise AssertionError("translated archive does not reparse to the calculated table")

    source_entries = {item["entry_index"]: item for item in translation_document["entries"]}
    for item in sorted(replacements, key=lambda value: value.entry_index):
        source_item = source_entries[item.entry_index]
        page_span = source_item.get("preserved_page_end_control_span")
        if page_span is not None:
            page_start, page_end = page_span
            new_entry_start = shifted_table[item.entry_index]
            new_page_start = new_entry_start + page_start + item.delta
            new_page_end = new_entry_start + page_end + item.delta
            expected_page = parse_hex(source_item["preserved_page_end_control_hex"], f"{item.entry_id}.page_end")
            if bytes(modified[new_page_start:new_page_end]) != expected_page:
                raise AssertionError(f"{item.entry_id}: page-end controls were not preserved after growth")

    packed = compress(bytes(modified))
    roundtrip, consumed = decompress(packed)
    if roundtrip != bytes(modified) or consumed != len(packed):
        raise AssertionError("translated archive recompression failed self round-trip")
    if args.relocation_offset + len(packed) > args.expanded_size:
        raise ValueError("translated compressed archive exceeds the relocation range")
    expected_pointer = ROM_BASE + args.source_offset
    if struct.unpack_from("<I", rom, args.source_pointer_word_offset)[0] != expected_pointer:
        raise ValueError("archive pointer word differs from the selected source archive")

    output = bytearray(rom)
    output.extend(b"\xFF" * (args.expanded_size - len(output)))
    output[args.relocation_offset:args.relocation_offset + len(packed)] = packed
    replacement_pointer = ROM_BASE + args.relocation_offset
    struct.pack_into("<I", output, args.source_pointer_word_offset, replacement_pointer)

    required_characters = list(dict.fromkeys("".join(item.hangul for item in replacements)))
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    font_writes: list[dict[str, object]] = []
    changed_font_ranges: list[range] = []
    for character in required_characters:
        entry = mapping[character]
        index = entry["font_record_index"]
        assert isinstance(index, int)
        offset = FONT_BASE_OFFSET + index * RECORD_BYTES
        if not 0 <= offset <= len(rom) - RECORD_BYTES:
            raise ValueError(f"font record lies outside input ROM for U+{ord(character):04X}")
        source_record: dict[str, object] | None = None
        if args.font is not None:
            mask = make_mask(args.font, character, args.font_size, args.font_index)
            replacement_bytes = encode_4bpp(mask)
        else:
            assert exe1_k_font_bytes is not None
            replacement_bytes, source_index, source_offset = exe1_k_glyph_record(exe1_k_font_bytes, character)
            mask = exe1_k_record_to_mask(replacement_bytes)
            source_record = {
                "source_font_record_index": source_index,
                "source_rom_offset": source_offset,
                "source_range_sha256": sha256(replacement_bytes),
            }
        original_bytes = rom[offset:offset + RECORD_BYTES]
        output[offset:offset + RECORD_BYTES] = replacement_bytes
        write_preview(mask, args.preview_dir / f"glyph_U+{ord(character):04X}.png")
        changed = original_bytes != replacement_bytes
        font_write = {
            "kind": (
                "contextual_full_bank_font_record"
                if codepage_document["mode"] == CONTEXTUAL_CODEPAGE_MODE
                else "candidate_unobserved_font_record"
            ),
            "unicode_code_point": f"U+{ord(character):04X}",
            "font_record_index": index,
            "rom_offset": offset,
            "byte_length": RECORD_BYTES,
            "original_range_sha256": sha256(original_bytes),
            "replacement_range_sha256": sha256(replacement_bytes),
            "changes_stage_input": changed,
        }
        if source_record is not None:
            font_write.update(source_record)
        font_writes.append(font_write)
        if changed:
            changed_font_ranges.append(range(offset, offset + RECORD_BYTES))

    changed_within_input = [
        offset
        for offset, (before, after) in enumerate(zip(rom, output[:len(rom)], strict=True))
        if before != after
    ]
    pointer_range = range(args.source_pointer_word_offset, args.source_pointer_word_offset + 4)
    allowed_ranges = [pointer_range] + changed_font_ranges
    escaped = [offset for offset in changed_within_input if not any(offset in allowed for allowed in allowed_ranges)]
    if escaped:
        raise AssertionError(f"stage-to-output diff escaped planned ranges at 0x{escaped[0]:X}")
    if not any(offset in pointer_range for offset in changed_within_input):
        raise AssertionError("archive pointer word did not change")

    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    if args.decompressed_output is not None:
        args.decompressed_output.parent.mkdir(parents=True, exist_ok=True)
        args.decompressed_output.write_bytes(modified)
    output_digest = sha256(bytes(output))
    result = {
        "schema_version": 1,
        "kind": "non_distributable_archive_translation_draft_poc",
        "input": {"filename": args.rom.name, "sha256": input_digest, "byte_length": len(rom)},
        "base_manifest": {"filename": args.base_manifest.name, "sha256": sha256(base_manifest_bytes)},
        "translation": {
            "filename": args.translation.name,
            "sha256": sha256(translation_bytes),
            "review_state": translation_document["review_state"],
            "build_eligibility": translation_document["build_eligibility"],
        },
        "codepage": {
            "filename": args.codepage.name,
            "sha256": sha256(codepage_bytes),
            "mode": codepage_document["mode"],
            "required_hangul_glyph_count": len(required_characters),
            "required_hangul_glyphs": required_characters,
        },
        "font_source": font_source,
        "archive": {
            "source_rom_offset": args.source_offset,
            "source_capacity": args.source_capacity,
            "original_compressed_byte_length": original_compressed_length,
            "no_change_recompressed_byte_length": len(no_change_packed),
            "no_change_recompressed_sha256": sha256(no_change_packed),
            "replacement_compressed_byte_length": len(packed),
            "original_decompressed_byte_length": len(raw),
            "replacement_decompressed_byte_length": len(modified),
            "original_decompressed_sha256": sha256(raw),
            "replacement_decompressed_sha256": sha256(bytes(modified)),
            "decompressed_output": (
                {
                    "filename": args.decompressed_output.name,
                    "sha256": sha256(bytes(modified)),
                    "byte_length": len(modified),
                }
                if args.decompressed_output is not None
                else None
            ),
            "entry_count": len(table) - 1,
            "relocation": {
                "target_rom_offset": args.relocation_offset,
                "target_rom_address": replacement_pointer,
                "expanded_output_byte_length": args.expanded_size,
                "source_pointer_word_rom_offset": args.source_pointer_word_offset,
                "original_pointer": f"{expected_pointer:08X}",
                "replacement_pointer": f"{replacement_pointer:08X}",
                "original_source_preserved": True,
            },
        },
        "replacements": [
            {
                "entry_id": item.entry_id,
                "entry_index": item.entry_index,
                "source_span": [item.span_start, item.span_end],
                "source_span_byte_length": len(item.original_span),
                "replacement_byte_length": len(item.encoded),
                "byte_length_delta": item.delta,
                "replacement_sha256": sha256(item.encoded),
                "preserved_control_hex": [f"{value:02x}" for value in item.controls],
                "replacement_page_count": len(item.page_relative_offsets),
                "replacement_page_relative_offsets": list(item.page_relative_offsets),
                "original_entry_byte_length": item.entry_end - item.entry_start,
                "replacement_entry_byte_length": item.entry_end - item.entry_start + item.delta,
            }
            for item in sorted(replacements, key=lambda value: value.entry_index)
        ],
        "expected_writes": [
            {
                "kind": "archive_pointer_word",
                "rom_offset": args.source_pointer_word_offset,
                "byte_length": 4,
                "expected_original_pointer": f"{expected_pointer:08X}",
                "replacement_pointer": f"{replacement_pointer:08X}",
            },
            *font_writes,
            {
                "kind": "expanded_tail_with_relocated_archive",
                "rom_offset": len(rom),
                "byte_length": args.expanded_size - len(rom),
                "fill_byte": "ff",
                "archive_rom_offset": args.relocation_offset,
                "archive_byte_length": len(packed),
                "archive_sha256": sha256(packed),
            },
        ],
        "verification": {
            "protected_translation_fields_match_rev1_extraction": True,
            "source_control_sequences_preserved": True,
            "page_end_controls_preserved": True,
            "no_change_codec_self_roundtrip": True,
            "translated_codec_self_roundtrip": True,
            "rebuilt_archive_table_reparsed": True,
            "stage_to_output_changed_bytes_confined_to_expected_writes": True,
            "changed_byte_count_within_stage_input": len(changed_within_input),
            "appended_byte_count": len(output) - len(rom),
        },
        "output": {"filename": args.output_rom.name, "sha256": output_digest, "byte_length": len(output)},
        "limitations": [
            "This is a local, non-distributable development PoC built from machine-draft translations.",
            "The Korean wording requires human approval before any release-candidate build.",
            f"Only {len(replacements)} explicitly selected archive entries are translated; this remains a narrow development scope.",
            "The relocated loader path is previously proven, but clean-screen layout and dialogue progression remain to be verified on this exact output hash.",
            "The provisional codepage is not yet a production-wide font-slot safety proof.",
            *(
                ["EXE 1 [K] font reuse permission is recorded from the user's attestation; no documentary permission copy is stored in this workspace."]
                if args.exe1_k_font_rom is not None
                else []
            ),
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result["verification"], ensure_ascii=False, indent=2))
    print(f"output_sha256={output_digest}")


if __name__ == "__main__":
    main()
