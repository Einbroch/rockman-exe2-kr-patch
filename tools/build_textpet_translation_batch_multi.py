#!/usr/bin/env python3
"""Build one protected EXE2 translation batch spanning verified TextPet archives."""

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
        raise ValueError("archive boundary table does not cover payload")
    if any(left > right for left, right in zip(offsets, offsets[1:])):
        raise ValueError("archive boundary table is not monotonic")
    return offsets


def load_archive(rom: bytes, archive: dict) -> tuple[bytes, int, str]:
    offset = int(archive["archive_offset"])
    storage = archive.get("storage", "lz77")
    if storage == "lz77":
        raw, stored_length = decompress(rom, offset)
    elif storage == "raw":
        if offset < 0 or offset + 2 > len(rom):
            raise ValueError("raw archive offset is outside the ROM")
        table_size = struct.unpack_from("<H", rom, offset)[0]
        if table_size < 4 or table_size % 2 or offset + table_size > len(rom):
            raise ValueError("raw archive has no valid leading boundary table")
        stored_length = struct.unpack_from("<H", rom, offset + table_size - 2)[0]
        expected_length = int(archive["raw_byte_length"])
        if stored_length != expected_length:
            raise ValueError(
                f"{archive['selector']}: raw archive byte length is {stored_length}, expected {expected_length}"
            )
        raw = rom[offset : offset + stored_length]
    else:
        raise ValueError(f"unsupported archive storage: {storage}")
    archive_offsets(raw)
    return raw, stored_length, storage


def script_blocks(tpl: str) -> list[tuple[int, str]]:
    return [
        (int(match.group(1)), match.group(0))
        for match in re.finditer(r"(?ms)^script\s+(\d+)\s+mmbn2s?\s+\{.*?^\}", tpl)
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
    parser.add_argument("--plan", type=Path, required=True)
    parser.add_argument("--authored", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    if args.output.exists() and not args.force:
        raise FileExistsError(args.output)
    rom = args.rom.read_bytes()
    if sha256(rom) != SUPPORTED_ROM_SHA256:
        raise ValueError("supported Rev 1 ROM SHA-256 mismatch")

    plan = json.loads(args.plan.read_text(encoding="utf-8"))
    authored = json.loads(args.authored.read_text(encoding="utf-8"))
    requested_size = int(plan["batch_size"])
    selected: list[dict] = []
    archive_metadata: list[dict] = []

    for archive in plan["archives"]:
        selector = archive["selector"]
        offset = int(archive["archive_offset"])
        tpl_path = (args.plan.parent / archive["tpl_path"]).resolve()
        raw, stored_length, storage = load_archive(rom, archive)
        offsets = archive_offsets(raw)
        tpl_bytes = tpl_path.read_bytes()
        tpl = tpl_bytes.decode("utf-8-sig")
        blocks = script_blocks(tpl)
        text_blocks = [(entry_id, block) for entry_id, block in blocks if '"' in block]
        start = int(archive["text_entry_start"])
        count = int(archive["text_entry_count"])
        chosen = text_blocks[start : start + count]
        if len(chosen) != count:
            raise ValueError(f"{selector}: requested text slice is incomplete")
        for entry_id, block in chosen:
            selected.append(
                {
                    "selector": selector,
                    "archive_offset": offset,
                    "raw": raw,
                    "offsets": offsets,
                    "entry_index": entry_id,
                    "block": block,
                }
            )
        archive_metadata.append(
            {
                "selector": selector,
                "archive_offset": offset,
                "storage": storage,
                "stored_byte_length": stored_length,
                "compressed_byte_length": stored_length if storage == "lz77" else None,
                "decompressed_byte_length": len(raw),
                "decompressed_sha256": sha256(raw),
                "tpl_filename": tpl_path.name,
                "tpl_sha256": sha256(tpl_bytes),
                "text_entry_start": start,
                "selected_text_entry_count": count,
                "selected_entry_indices": [entry_id for entry_id, _ in chosen],
                "remaining_text_entries_after_slice": len(text_blocks) - start - count,
            }
        )

    if len(selected) != requested_size:
        raise ValueError(f"plan selects {len(selected)} entries, expected {requested_size}")
    authored_entries = authored.get("entries", [])
    authored_keys = [(entry["selector"], int(entry["entry_index"])) for entry in authored_entries]
    expected_keys = [(entry["selector"], entry["entry_index"]) for entry in selected]
    if len(authored_entries) != requested_size:
        raise ValueError(f"authored count is {len(authored_entries)}, expected {requested_size}")
    if authored_keys != expected_keys:
        raise ValueError("authored archive/entry keys differ from the planned source order")
    if len(set(authored_keys)) != len(authored_keys):
        raise ValueError("authored archive/entry keys are not unique")
    if any(not entry.get("draft_translation", "").strip() for entry in authored_entries):
        raise ValueError("one or more draft translations are empty")

    output_entries = []
    for source, draft in zip(selected, authored_entries):
        entry_id = source["entry_index"]
        left = source["offsets"][entry_id]
        right = source["offsets"][entry_id + 1]
        entry_raw = source["raw"][left:right]
        selector_slug = source["selector"].replace("/", "_")
        output_entries.append(
            {
                "entry_id": f"archive_{selector_slug}_entry_{entry_id:04d}",
                "selector": source["selector"],
                "entry_index": entry_id,
                "source_entry_offset": left,
                "source_entry_byte_length": len(entry_raw),
                "source_entry_sha256": sha256(entry_raw),
                "source_entry_raw_hex": entry_raw.hex(" "),
                "source_tpl_block_sha256": sha256(source["block"].encode("utf-8")),
                "source_text_transcription": visible_text(source["block"]),
                "draft_translation": draft["draft_translation"],
                "status": draft.get("status", "machine_draft_needs_human_review"),
                "review_notes": draft.get("review_notes", []),
            }
        )

    result = {
        "schema_version": 1,
        "kind": "protected_multi_archive_textpet_translation_batch",
        "source_rom_sha256": SUPPORTED_ROM_SHA256,
        "batch": {
            "batch_number": authored.get("batch_number"),
            "unit": "text-bearing archive entries",
            "requested_size": requested_size,
            "actual_size": len(output_entries),
            "source_order_preserved_within_plan": True,
            "plan_filename": args.plan.name,
            "plan_sha256": sha256(args.plan.read_bytes()),
        },
        "archives": archive_metadata,
        "translation": {
            "source_language": "ja",
            "target_language": "ko",
            "review_state": "machine_draft_needs_human_review",
            "rom_application_state": "not_yet_reinserted",
            "control_code_policy": "source TPL blocks and raw entry bytes are protected; translations are semantic drafts only",
        },
        "entries": output_entries,
        "validation": {
            "plan_count_matches_requested_size": True,
            "authored_count_matches_requested_size": True,
            "authored_keys_match_plan": True,
            "authored_keys_unique": True,
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
