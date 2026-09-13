#!/usr/bin/env python3
"""Independently audit one protected multi-archive semantic translation batch."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import struct
import subprocess
import sys
import tempfile
from collections import Counter
from pathlib import Path

from gba_lz77 import decompress


SUPPORTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
HANGUL_RE = re.compile(r"[가-힣]")
KANA_RE = re.compile(r"[ぁ-ゖァ-ヺ]")
TAG_RE = re.compile(r"\[([A-Za-z]+)(?:\s+([^\]]+))?\]")
TRACKED_COMMANDS = {"wait", "waitSkip", "printItem", "printChip", "printCode", "textSpeed"}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def boundary_offsets(raw: bytes) -> list[int]:
    table_size = struct.unpack_from("<H", raw, 0)[0]
    offsets = [struct.unpack_from("<H", raw, pos)[0] for pos in range(0, table_size, 2)]
    if table_size < 4 or table_size % 2 or offsets[0] != table_size or offsets[-1] != len(raw):
        raise ValueError("invalid archive boundary table")
    if any(a > b for a, b in zip(offsets, offsets[1:])):
        raise ValueError("non-monotonic archive boundary table")
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
    boundary_offsets(raw)
    return raw, stored_length, storage


def script_blocks(tpl: str) -> dict[int, str]:
    return {
        int(match.group(1)): match.group(0)
        for match in re.finditer(r"(?ms)^script\s+(\d+)\s+mmbn2s?\s+\{.*?^\}", tpl)
    }


def text_script_ids(tpl: str) -> list[int]:
    return [entry_id for entry_id, block in script_blocks(tpl).items() if '"' in block]


def source_tracked_commands(block: str) -> Counter[tuple[str, str]]:
    result: Counter[tuple[str, str]] = Counter()
    patterns = {
        "wait": r"(?m)^\s*wait\s*$\s*frames\s*=\s*([^\s]+)",
        "waitSkip": r"(?m)^\s*waitSkip\s*$\s*frames\s*=\s*([^\s]+)",
        "printItem": r"(?ms)^\s*printItem\s*$.*?^\s*item\s*=\s*([^\s]+)",
        "printChip": r"(?ms)^\s*printChip\s*$.*?^\s*chip\s*=\s*([^\s]+)",
        "printCode": r"(?ms)^\s*printCode\s*$.*?^\s*code\s*=\s*([^\s]+)",
        "textSpeed": r"(?m)^\s*textSpeed\s*$\s*delay\s*=\s*([^\s]+)",
    }
    for name, pattern in patterns.items():
        for value in re.findall(pattern, block):
            result[(name, value)] += 1
    return result


def authored_tracked_commands(text: str) -> tuple[Counter[tuple[str, str]], list[str]]:
    result: Counter[tuple[str, str]] = Counter()
    unknown: list[str] = []
    arg_names = {"printItem": "item", "printChip": "chip", "printCode": "code", "textSpeed": "delay"}
    for match in TAG_RE.finditer(text):
        name, raw_arg = match.group(1), (match.group(2) or "").strip()
        if name not in TRACKED_COMMANDS:
            unknown.append(match.group(0))
            continue
        if name in {"wait", "waitSkip"}:
            value = raw_arg
        else:
            prefix = arg_names[name] + "="
            value = raw_arg[len(prefix):] if raw_arg.startswith(prefix) else ""
        if not value:
            unknown.append(match.group(0))
        else:
            result[(name, value)] += 1
    return result, unknown


def stable_keys(batch: dict) -> list[tuple[str, int]]:
    default_selector = batch.get("archive", {}).get("selector")
    return [
        (entry.get("selector", default_selector), int(entry["entry_index"]))
        for entry in batch["entries"]
    ]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--plan", type=Path, required=True)
    parser.add_argument("--authored", type=Path, required=True)
    parser.add_argument("--protected", type=Path, required=True)
    parser.add_argument("--builder", type=Path, required=True)
    parser.add_argument("--prior-protected", type=Path, action="append", default=[])
    parser.add_argument("--hangul-source", type=Path, action="append", default=[])
    parser.add_argument("--font-capacity", type=int, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    if sha256(rom) != SUPPORTED_ROM_SHA256:
        raise ValueError("supported Rev 1 ROM SHA-256 mismatch")
    plan = json.loads(args.plan.read_text(encoding="utf-8"))
    authored = json.loads(args.authored.read_text(encoding="utf-8"))
    protected = json.loads(args.protected.read_text(encoding="utf-8"))
    batch_number = int(authored["batch_number"])

    expected_keys: list[tuple[str, int]] = []
    archive_state: dict[str, dict] = {}
    blocks_by_selector: dict[str, dict[int, str]] = {}
    raw_by_selector: dict[str, tuple[bytes, list[int]]] = {}
    roundtrip_checks: list[bool] = []
    archives_output: list[dict] = []
    remaining: dict[str, int] = {}

    for archive in plan["archives"]:
        selector = archive["selector"]
        offset = int(archive["archive_offset"])
        raw, stored_length, storage = load_archive(rom, archive)
        offsets = boundary_offsets(raw)
        tpl_path = (args.plan.parent / archive["tpl_path"]).resolve()
        tpl_bytes = tpl_path.read_bytes()
        tpl = tpl_bytes.decode("utf-8-sig")
        blocks = script_blocks(tpl)
        ids = [entry_id for entry_id, block in blocks.items() if '"' in block]
        start, count = int(archive["text_entry_start"]), int(archive["text_entry_count"])
        selected_ids = ids[start:start + count]
        if len(selected_ids) != count:
            raise ValueError(f"{selector}: incomplete planned slice")
        expected_keys.extend((selector, entry_id) for entry_id in selected_ids)
        blocks_by_selector[selector] = blocks
        raw_by_selector[selector] = (raw, offsets)
        remaining[selector] = len(ids) - start - count
        report_path = tpl_path.with_name(tpl_path.stem + "_roundtrip.json")
        report = json.loads(report_path.read_text(encoding="utf-8"))
        roundtrip_ok = bool(report["roundtrip"]["source_byte_identical"])
        roundtrip_ok &= report["source"]["decompressed_sha256"] == sha256(raw)
        roundtrip_ok &= report["output"]["tpl_sha256"] == sha256(tpl_bytes)
        roundtrip_checks.append(roundtrip_ok)
        archives_output.append({
            "selector": selector,
            "rom_offset": offset,
            "storage": storage,
            "stored_byte_length": stored_length,
            "compressed_byte_length": stored_length if storage == "lz77" else None,
            "decompressed_sha256": sha256(raw),
            "tpl_sha256": sha256(tpl_bytes),
            "selected_text_entry_count": count,
            "last_selected_entry_index": selected_ids[-1],
            "remaining_text_entries": remaining[selector],
            "textpet_roundtrip_byte_identical": roundtrip_ok,
        })
        archive_state[selector] = {"ids": ids}

    authored_entries = authored["entries"]
    authored_keys = [(entry["selector"], int(entry["entry_index"])) for entry in authored_entries]
    protected_keys = stable_keys(protected)
    raw_length_ok = raw_hex_ok = raw_hash_ok = block_hash_ok = True
    controls_recognized = controls_exact = True
    control_mismatches: list[dict] = []
    protected_by_key = {key: entry for key, entry in zip(protected_keys, protected["entries"])}
    authored_by_key = {key: entry for key, entry in zip(authored_keys, authored_entries)}

    for key in expected_keys:
        selector, entry_id = key
        entry = protected_by_key[key]
        raw, offsets = raw_by_selector[selector]
        entry_raw = raw[offsets[entry_id]:offsets[entry_id + 1]]
        block = blocks_by_selector[selector][entry_id]
        raw_length_ok &= entry["source_entry_byte_length"] == len(entry_raw)
        raw_hex_ok &= entry["source_entry_raw_hex"] == entry_raw.hex(" ")
        raw_hash_ok &= entry["source_entry_sha256"] == sha256(entry_raw)
        block_hash_ok &= entry["source_tpl_block_sha256"] == sha256(block.encode("utf-8"))
        authored_controls, unknown = authored_tracked_commands(authored_by_key[key]["draft_translation"])
        source_controls = source_tracked_commands(block)
        controls_recognized &= not unknown
        controls_exact &= authored_controls == source_controls
        if unknown or authored_controls != source_controls:
            control_mismatches.append({
                "selector": selector,
                "entry_index": entry_id,
                "unknown_tags": unknown,
                "authored": [list(item) + [count] for item, count in authored_controls.items()],
                "source": [list(item) + [count] for item, count in source_controls.items()],
            })

    # Keep the deterministic rebuild probe inside the active title workspace.
    with tempfile.TemporaryDirectory(
        prefix="tmp-exe2-batch-audit-", dir=args.output.parent
    ) as temp_dir:
        rebuilt_path = Path(temp_dir) / args.protected.name
        child_env = os.environ.copy()
        child_env["PYTHONIOENCODING"] = "utf-8"
        subprocess.run([
            sys.executable, str(args.builder), "--rom", str(args.rom), "--plan", str(args.plan),
            "--authored", str(args.authored), "--output", str(rebuilt_path)
        ], check=True, capture_output=True, text=True, encoding="utf-8", env=child_env)
        deterministic_rebuild_ok = rebuilt_path.read_bytes() == args.protected.read_bytes()

    all_keys: list[tuple[str, int]] = []
    for path in [*args.prior_protected, args.protected]:
        all_keys.extend(stable_keys(json.loads(path.read_text(encoding="utf-8"))))

    hangul: set[str] = set()
    for path in args.hangul_source:
        data = json.loads(path.read_text(encoding="utf-8"))
        for entry in data.get("entries", []):
            hangul.update(HANGUL_RE.findall(str(entry.get("draft_translation", entry.get("translation", "")))))
    batch_hangul = set(HANGUL_RE.findall("".join(entry["draft_translation"] for entry in authored_entries)))
    hangul.update(batch_hangul)
    remaining_capacity = args.font_capacity - len(hangul)

    checks = {
        "plan_count_matches_100": len(expected_keys) == int(plan["batch_size"]) == 100,
        "authored_keys_match_planned_source_order": authored_keys == expected_keys,
        "protected_keys_match_planned_source_order": protected_keys == expected_keys,
        "authored_keys_are_unique": len(set(authored_keys)) == len(authored_keys),
        "stable_ids_across_all_100_entry_batches_are_unique": len(set(all_keys)) == len(all_keys),
        "all_source_archive_roundtrips_are_byte_identical": all(roundtrip_checks),
        "source_entry_lengths_match_rom_archives": raw_length_ok,
        "source_entry_raw_hex_matches_rom_archives": raw_hex_ok,
        "source_entry_sha256_values_match_rom_archives": raw_hash_ok,
        "source_tpl_block_sha256_values_match_byte_preserving_tpl_decode": block_hash_ok,
        "all_draft_translations_are_nonempty": all(entry["draft_translation"].strip() for entry in authored_entries),
        "japanese_kana_residual_check_passed": not any(KANA_RE.search(entry["draft_translation"]) for entry in authored_entries),
        "all_authored_control_tags_are_recognized": controls_recognized,
        "all_tracked_inline_source_commands_are_exactly_represented": controls_exact,
        "deterministic_rebuild_is_byte_identical": deterministic_rebuild_ok,
    }
    structure_passed = all(checks.values())
    capacity_passed = remaining_capacity >= 0
    result = {
        "schema_version": 1,
        "kind": "static_multi_archive_translation_batch_audit",
        "source_rom_sha256": SUPPORTED_ROM_SHA256,
        "inputs": {
            "plan_sha256": sha256(args.plan.read_bytes()),
            "authored_translation_sha256": sha256(args.authored.read_bytes()),
            "protected_batch_sha256": sha256(args.protected.read_bytes()),
            "batch_builder_sha256": sha256(args.builder.read_bytes()),
        },
        "scope": {
            "requested_text_bearing_entry_count": int(plan["batch_size"]),
            "actual_text_bearing_entry_count": len(protected["entries"]),
            "archive_entry_counts": {archive["selector"]: int(archive["text_entry_count"]) for archive in plan["archives"]},
            "remaining_text_entries": remaining,
        },
        "archives": archives_output,
        "checks": checks,
        "control_mismatches": control_mismatches,
        "font_repertoire_projection": {
            "batch_distinct_hangul_syllables": len(batch_hangul),
            "completed_100_entry_batch_count": batch_number,
            "projected_combined_distinct_hangul_syllables": len(hangul),
            "contextual_font_bank_capacity": args.font_capacity,
            "projected_remaining_capacity": remaining_capacity,
            "capacity_check_passed": capacity_passed,
            "overflow_distinct_hangul_syllables": max(0, -remaining_capacity),
        },
        "state": {
            "translation_review": "machine_draft_needs_human_review",
            "rom_reinsertion": "blocked_by_contextual_font_bank_capacity" if not capacity_passed else "not_yet_performed",
            "emulator_test": "deferred_by_user_request",
            "release_or_rom_build_eligible": False,
        },
        "protected_translation_structure_passed": structure_passed,
        "build_capacity_passed": capacity_passed,
        "passed": structure_passed and capacity_passed,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({
        "output": str(args.output),
        "structure_passed": structure_passed,
        "capacity_passed": capacity_passed,
        "projected_hangul": len(hangul),
        "remaining_capacity": remaining_capacity,
    }, ensure_ascii=False))


if __name__ == "__main__":
    main()
