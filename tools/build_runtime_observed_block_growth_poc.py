#!/usr/bin/env python3
"""Build a bounded growth PoC for one state-observed message block.

The input block must be present in the verified structural catalog, have a
state-observed source pointer or a 32-byte exact state-resident fragment in
the supplied state report, and have either a direct PC-relative literal
consumer or an explicitly allowed contiguous pointer-table candidate. This
tool relocates only that block, preserves all original entry bytes, adds
declared E5/E6 Korean glyph pairs at direct-glyph/control boundaries, and
updates every literal word that names the block start.
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


ROM_BASE = 0x08000000


@dataclass(frozen=True)
class Edit:
    entry_index: int
    relative_offset: int
    message: str
    insertion: bytes
    original_insert_offset: int


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_table(block: bytes) -> list[int]:
    if len(block) < 4:
        raise ValueError("block is too short for a table")
    table_bytes = struct.unpack_from("<H", block)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(block):
        raise ValueError("block does not begin with a valid u16 offset table")
    table = [struct.unpack_from("<H", block, offset)[0] for offset in range(0, table_bytes, 2)]
    if table[0] != table_bytes or any(left > right for left, right in zip(table, table[1:])):
        raise ValueError("block offset table is not monotonic")
    return table


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
    insertion = bytes(byte for character in message for byte in mapping[character]["encoded_bytes"])
    if not insertion or len(insertion) % 2:
        raise ValueError("Korean text must encode to complete E5/E6 pairs")
    insert_offset = entry_start + relative_offset
    if not entry_start < insert_offset < entry_end:
        raise ValueError("edit insertion lies outside its entry")
    return Edit(entry_index, relative_offset, message, insertion, insert_offset)


def require_state_observation(report: dict[str, object], block_id: str) -> str:
    payload = report.get("gba_state_payload")
    if not isinstance(payload, dict):
        raise ValueError("state report does not contain a decoded GBA payload")
    pointer_matches = payload.get("candidate_source_pointer_occurrences")
    if isinstance(pointer_matches, list) and any(
        isinstance(match, dict)
        and match.get("id") == block_id
        and int(match.get("source_pointer_le_occurrence_count", 0)) > 0
        for match in pointer_matches
    ):
        return "source_pointer"
    fragment_matches = payload.get("candidate_catalog_fragment_matches_minimum_32_bytes")
    if isinstance(fragment_matches, list) and any(
        isinstance(match, dict)
        and match.get("id") == block_id
        and int(match.get("matched_byte_length", 0)) >= 32
        for match in fragment_matches
    ):
        return "exact_catalog_fragment"
    automatic_fragment_matches = payload.get("automatic_catalog_fragment_matches")
    if isinstance(automatic_fragment_matches, list) and any(
        isinstance(match, dict)
        and match.get("id") == block_id
        and int(match.get("matched_byte_length", 0)) >= 35
        and match.get("table_entry_index") is not None
        for match in automatic_fragment_matches
    ):
        return "automatic_exact_catalog_fragment"
    raise ValueError("block has no state-observed source pointer or exact catalog fragment in the supplied report")


def find_record(catalog: dict[str, object], block_id: str) -> dict[str, object]:
    records = catalog.get("records")
    if not isinstance(records, list):
        raise ValueError("catalog has no records")
    for record in records:
        if isinstance(record, dict) and record.get("id") == block_id:
            return record
    raise ValueError("block id is absent from the catalog")


def find_pointer_consumer_offsets(
    audit: dict[str, object],
    census: dict[str, object] | None,
    pointer_table_audit: dict[str, object] | None,
    block_id: str,
    allow_candidate_pointer_table: bool,
) -> tuple[list[int], str]:
    rows = audit.get("blocks_with_direct_pc_relative_literal_load")
    if not isinstance(rows, list):
        raise ValueError("literal audit has no direct-literal block rows")
    for row in rows:
        if isinstance(row, dict) and row.get("id") == block_id:
            references = row.get("literal_load_references")
            if not isinstance(references, list):
                break
            offsets = sorted({int(reference["literal_offset"]) for reference in references if isinstance(reference, dict)})
            if offsets:
                return offsets, "direct_pc_relative_literal"
    if not allow_candidate_pointer_table:
        raise ValueError("block has no direct PC-relative literal consumer in the audit")
    if not isinstance(census, dict):
        raise ValueError("candidate pointer-table mode requires --pointer-census")
    if not isinstance(pointer_table_audit, dict):
        raise ValueError("candidate pointer-table mode requires --pointer-table-audit")
    row = next(
        (item for item in census.get("records", []) if isinstance(item, dict) and item.get("id") == block_id),
        None,
    )
    if not isinstance(row, dict):
        raise ValueError("pointer census has no row for the selected block")
    offsets = [int(value) for value in row.get("unclassified_or_data_pointer_word_rom_offsets", [])]
    table_offsets = {
        offset
        for table in census.get("candidate_contiguous_unclassified_pointer_table_runs", [])
        if isinstance(table, dict) and int(table.get("word_count", 0)) >= 2
        for offset in range(int(table["start_rom_offset"]), int(table["end_rom_offset_exclusive"]), 4)
    }
    if not offsets or any(offset not in table_offsets for offset in offsets):
        raise ValueError("selected block has no fully bounded contiguous pointer-table candidate")
    audited_table_offsets = {
        offset
        for table in pointer_table_audit.get("tables", [])
        if isinstance(table, dict) and int(table.get("pc_relative_literal_consumer_count", 0)) > 0
        for offset in range(int(table["start_rom_offset"]), int(table["end_rom_offset_exclusive"]), 4)
    }
    if any(offset not in audited_table_offsets for offset in offsets):
        raise ValueError("candidate pointer table has no audited PC-relative code consumer")
    return sorted(set(offsets)), "candidate_contiguous_pointer_table"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--expected-input-sha256", required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--literal-audit", type=Path, required=True)
    parser.add_argument("--pointer-census", type=Path)
    parser.add_argument("--pointer-table-audit", type=Path)
    parser.add_argument("--state-report", type=Path, required=True)
    parser.add_argument("--block-id", required=True)
    parser.add_argument("--target-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--policy", type=Path, required=True)
    parser.add_argument("--edit", action="append", required=True)
    parser.add_argument("--allow-candidate-unobserved-codepage", action="store_true")
    parser.add_argument("--allow-candidate-pointer-table", action="store_true")
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

    original = args.rom.read_bytes()
    if sha256(original).lower() != args.expected_input_sha256.lower():
        raise ValueError("input ROM SHA-256 differs from the declared base")
    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    audit = json.loads(args.literal_audit.read_text(encoding="utf-8"))
    census = json.loads(args.pointer_census.read_text(encoding="utf-8")) if args.pointer_census else None
    pointer_table_audit = (
        json.loads(args.pointer_table_audit.read_text(encoding="utf-8")) if args.pointer_table_audit else None
    )
    state_report = json.loads(args.state_report.read_text(encoding="utf-8"))
    state_evidence_kind = require_state_observation(state_report, args.block_id)
    record = find_record(catalog, args.block_id)
    block_offset = int(record["source_rom_offset"])
    block_length = int(record["byte_length"])
    block = original[block_offset:block_offset + block_length]
    if len(block) != block_length or sha256(block) != record["source_sha256"]:
        raise ValueError("catalogued source block differs from the declared base ROM")
    table = parse_table(block)
    literal_offsets, consumer_kind = find_pointer_consumer_offsets(
        audit, census, pointer_table_audit, args.block_id, args.allow_candidate_pointer_table
    )
    expected_pointer = ROM_BASE + block_offset
    for literal_offset in literal_offsets:
        if not 0 <= literal_offset <= len(original) - 4:
            raise ValueError("audited literal offset is outside the input ROM")
        if struct.unpack_from("<I", original, literal_offset)[0] != expected_pointer:
            raise ValueError("audited literal word differs from the source block pointer")

    mapping, policy_sha256, codepage_mode = load_mapping(
        args.codepage, args.policy, args.allow_candidate_unobserved_codepage
    )
    edits = [parse_edit(value, table, mapping) for value in args.edit]
    if len({edit.entry_index for edit in edits}) != len(edits):
        raise ValueError("only one insertion per table entry is allowed in this PoC")
    for edit in edits:
        if not block[edit.original_insert_offset - 1] < 0xE5 or not block[edit.original_insert_offset] >= 0xE5:
            raise ValueError("an edit insertion is not at a verified direct-glyph/control boundary")
    total_inserted = sum(len(edit.insertion) for edit in edits)
    target_end = args.target_offset + block_length + total_inserted
    if args.target_offset % 4 or target_end > len(original):
        raise ValueError("relocation target is not an aligned in-ROM range")
    fill = original[args.target_offset]
    if any(value != fill for value in original[args.target_offset:target_end]):
        raise ValueError("relocation target is not constant padding in the declared base ROM")

    relocated = bytearray(block)
    for edit in sorted(edits, key=lambda item: item.original_insert_offset, reverse=True):
        relocated[edit.original_insert_offset:edit.original_insert_offset] = edit.insertion
    shifted_offsets = []
    for index, offset in enumerate(table):
        delta = sum(len(edit.insertion) for edit in edits if edit.entry_index < index)
        shifted_offsets.append(offset + delta)
    for index, offset in enumerate(shifted_offsets):
        struct.pack_into("<H", relocated, index * 2, offset)
    if len(relocated) != block_length + total_inserted:
        raise AssertionError("unexpected relocated block size")

    output = bytearray(original)
    output[args.target_offset:target_end] = relocated
    for literal_offset in literal_offsets:
        struct.pack_into("<I", output, literal_offset, ROM_BASE + args.target_offset)
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    selected_characters = list(dict.fromkeys("".join(edit.message for edit in edits)))
    font_writes = []
    for character in selected_characters:
        entry = mapping[character]
        index = entry["font_record_index"]
        glyph_data = encode_4bpp(make_mask(args.font, character, args.font_size))
        glyph_offset = FONT_BASE_OFFSET + index * RECORD_BYTES
        output[glyph_offset:glyph_offset + RECORD_BYTES] = glyph_data
        write_preview(make_mask(args.font, character, args.font_size), args.preview_dir / f"glyph_U+{ord(character):04X}.png")
        font_writes.append({
            "kind": "candidate_unobserved_font_record",
            "unicode_code_point": entry["unicode_code_point"],
            "font_record_index": index,
            "rom_offset": glyph_offset,
            "byte_length": RECORD_BYTES,
            "base_range_sha256": sha256(original[glyph_offset:glyph_offset + RECORD_BYTES]),
            "replacement_range_sha256": sha256(glyph_data),
        })
    edit_metadata = [
        {
            "entry_index": edit.entry_index,
            "entry_base_byte_length": table[edit.entry_index + 1] - table[edit.entry_index],
            "entry_relocated_byte_length": shifted_offsets[edit.entry_index + 1] - shifted_offsets[edit.entry_index],
            "inserted_glyph_stream_byte_length": len(edit.insertion),
        }
        for edit in sorted(edits, key=lambda item: item.entry_index)
    ]
    allowed_ranges = [range(args.target_offset, target_end)]
    allowed_ranges.extend(range(offset, offset + 4) for offset in literal_offsets)
    allowed_ranges.extend(range(item["rom_offset"], item["rom_offset"] + item["byte_length"]) for item in font_writes)
    changed = [offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after]
    if not changed or not all(any(offset in allowed for allowed in allowed_ranges) for offset in changed):
        raise AssertionError("output diff escapes planned-write ranges")

    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_runtime_observed_block_growth_poc",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "state_evidence": {"filename": args.state_report.name, "sha256": sha256(args.state_report.read_bytes()), "block_id": args.block_id, "kind": state_evidence_kind},
        "catalog": {"filename": args.catalog.name, "sha256": sha256(args.catalog.read_bytes())},
        "literal_audit": {"filename": args.literal_audit.name, "sha256": sha256(args.literal_audit.read_bytes()), "literal_word_rom_offsets": literal_offsets},
        "pointer_census": (
            {"filename": args.pointer_census.name, "sha256": sha256(args.pointer_census.read_bytes())}
            if args.pointer_census else None
        ),
        "pointer_table_audit": (
            {"filename": args.pointer_table_audit.name, "sha256": sha256(args.pointer_table_audit.read_bytes())}
            if args.pointer_table_audit else None
        ),
        "codepage": {"filename": args.codepage.name, "sha256": sha256(args.codepage.read_bytes()), "mode": codepage_mode, "written_glyph_record_count": len(font_writes)},
        "policy": {"filename": args.policy.name, "sha256": policy_sha256},
        "font_source": {"filename": args.font.name, "sha256": sha256(args.font.read_bytes()), "embedded_in_project": False},
        "expected_writes": [{
            "kind": "relocated_runtime_observed_block_with_growth",
            "block_id": args.block_id,
            "source_rom_offset": block_offset,
            "source_byte_length": block_length,
            "source_sha256": sha256(block),
            "target_rom_offset": args.target_offset,
            "target_byte_length": len(relocated),
            "target_fill_byte": f"{fill:02X}",
            "edited_entries": edit_metadata,
            "total_inserted_glyph_stream_byte_length": total_inserted,
        }, {
            "kind": (
                "block_pointer_literals" if consumer_kind == "direct_pc_relative_literal"
                else "candidate_contiguous_pointer_table_words"
            ),
            "consumer_kind": consumer_kind,
            "literal_word_rom_offsets": literal_offsets,
            "replacement_pointer": f"{ROM_BASE + args.target_offset:08X}",
        }] + font_writes,
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "The state-observed block displays each declared inserted marker and later entries continue through the recalculated offset table.",
        "limitations": [
            "This proves only the declared edits in one state-observed block.",
            "It does not establish global message-boundary or font-slot safety.",
            "The output ROM is a local test artifact and is not a distribution file.",
        ] + ([
            "Candidate pointer-table mode proves only an exact runtime-observed block and bounded table-word updates; "
            "it does not establish the table's semantic type or global consumer coverage.",
        ] if consumer_kind == "candidate_contiguous_pointer_table" else []),
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
