#!/usr/bin/env python3
"""Build a protected translation batch from a verified EXE2 TextPet archive."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import struct
from pathlib import Path

from gba_lz77 import decompress


SUPPORTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def archive_offsets(raw: bytes) -> list[int]:
    table_size = struct.unpack_from("<H", raw, 0)[0]
    if table_size < 4 or table_size % 2 or table_size > len(raw):
        raise ValueError("invalid archive boundary table")
    offsets = [struct.unpack_from("<H", raw, pos)[0] for pos in range(0, table_size, 2)]
    if offsets[0] != table_size or offsets[-1] != len(raw):
        raise ValueError("archive boundary table does not cover the payload")
    if any(left > right for left, right in zip(offsets, offsets[1:])):
        raise ValueError("archive boundary table is not monotonic")
    return offsets


def script_blocks(tpl: str) -> list[tuple[int, str]]:
    return [
        (int(match.group(1)), match.group(0))
        for match in re.finditer(r"(?ms)^script\s+(\d+)\s+mmbn2\s+\{.*?^\}", tpl)
    ]


def visible_text(block: str) -> str:
    values: list[str] = []
    for triple, single in re.findall(r'(?s)"""(.*?)"""|"([^"\r\n]*)"', block):
        value = triple if triple else single
        value = " / ".join(line.strip() for line in value.splitlines() if line.strip())
        if value:
            values.append(value)
    return " // ".join(values)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--archive-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--selector", required=True)
    parser.add_argument("--tpl", type=Path, required=True)
    parser.add_argument("--authored", type=Path, required=True)
    parser.add_argument("--batch-size", type=int, default=100)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    if args.output.exists() and not args.force:
        raise FileExistsError(args.output)

    rom = args.rom.read_bytes()
    if sha256(rom) != SUPPORTED_ROM_SHA256:
        raise ValueError("supported Rev 1 ROM SHA-256 mismatch")
    raw, compressed_length = decompress(rom, args.archive_offset)
    offsets = archive_offsets(raw)
    tpl_bytes = args.tpl.read_bytes()
    tpl = tpl_bytes.decode("utf-8-sig")
    blocks = script_blocks(tpl)
    text_blocks = [(entry_id, block) for entry_id, block in blocks if '"' in block]
    selected = text_blocks[: args.batch_size]
    expected_ids = [entry_id for entry_id, _ in selected]

    authored = json.loads(args.authored.read_text(encoding="utf-8"))
    authored_entries = authored.get("entries", [])
    authored_ids = [entry["entry_index"] for entry in authored_entries]
    if len(authored_entries) != args.batch_size:
        raise ValueError(f"authored entry count is {len(authored_entries)}, expected {args.batch_size}")
    if authored_ids != expected_ids:
        raise ValueError(f"authored IDs differ from the first {args.batch_size} text-bearing IDs")
    if len(set(authored_ids)) != len(authored_ids):
        raise ValueError("authored entry IDs are not unique")
    if any(not entry.get("draft_translation", "").strip() for entry in authored_entries):
        raise ValueError("one or more draft translations are empty")

    authored_by_id = {entry["entry_index"]: entry for entry in authored_entries}
    output_entries = []
    for entry_id, block in selected:
        left, right = offsets[entry_id], offsets[entry_id + 1]
        entry_raw = raw[left:right]
        draft = authored_by_id[entry_id]
        output_entries.append(
            {
                "entry_id": f"archive_00_11_entry_{entry_id:04d}",
                "entry_index": entry_id,
                "source_entry_offset": left,
                "source_entry_byte_length": len(entry_raw),
                "source_entry_sha256": sha256(entry_raw),
                "source_entry_raw_hex": entry_raw.hex(" "),
                "source_tpl_block_sha256": sha256(block.encode("utf-8")),
                "source_text_transcription": visible_text(block),
                "draft_translation": draft["draft_translation"],
                "status": draft.get("status", "machine_draft_needs_human_review"),
                "review_notes": draft.get("review_notes", []),
            }
        )

    result = {
        "schema_version": 1,
        "kind": "protected_textpet_archive_translation_batch",
        "archive": {
            "selector": args.selector,
            "source_rom_offset": args.archive_offset,
            "source_rom_sha256": SUPPORTED_ROM_SHA256,
            "compressed_byte_length": compressed_length,
            "decompressed_byte_length": len(raw),
            "decompressed_sha256": sha256(raw),
            "tpl_filename": args.tpl.name,
            "tpl_sha256": sha256(tpl_bytes),
        },
        "batch": {
            "batch_number": authored.get("batch_number", 1),
            "unit": "text-bearing archive entries",
            "requested_size": args.batch_size,
            "actual_size": len(output_entries),
            "source_order_preserved": True,
            "first_entry_index": expected_ids[0],
            "last_entry_index": expected_ids[-1],
            "control_only_entries_excluded": [
                entry_id for entry_id, block in blocks if entry_id <= expected_ids[-1] and '"' not in block
            ],
        },
        "translation": {
            "source_language": "ja",
            "target_language": "ko",
            "review_state": "machine_draft_needs_human_review",
            "rom_application_state": "not_yet_reinserted",
            "control_code_policy": "source TPL blocks and raw entry bytes are protected; translations are semantic drafts only",
        },
        "entries": output_entries,
        "validation": {
            "authored_count_matches_requested_size": True,
            "authored_ids_match_first_text_bearing_ids": True,
            "authored_ids_unique": True,
            "draft_translations_nonempty": True,
            "passed": True,
        },
        "distribution": {
            "local_analysis_only": True,
            "contains_rom_derived_source_text": True,
            "eligible_for_distribution": False,
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"output": str(args.output), "entry_count": len(output_entries), "passed": True}, ensure_ascii=False))


if __name__ == "__main__":
    main()
