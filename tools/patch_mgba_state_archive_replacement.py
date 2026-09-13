#!/usr/bin/env python3
"""Prepare an mGBA state to redraw one translated archive span from its start.

This is an explicit state intervention for renderer/layout QA.  It replaces
the verified EWRAM archive pool, moves the source cursor to the beginning of a
declared replacement, and resets the renderer's glyph/line counters so the new
text overwrites the existing page.  It does not prove a normal gameplay route.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from pathlib import Path

from gba_lz77 import decompress
from inspect_renderer_state_pointer import EWRAM_BASE, EWRAM_STATE_START, GBA_RAW_STATE_BYTES, ROM_BASE
from patch_mgba_state_archive_pool import archive_table, chunks, encode_png


POOL_ADDRESS = 0x02038800
CURRENT_POINTER_OFFSET = 0x24
BASE_POINTER_OFFSET = 0x28
ENTRY_START_POINTER_OFFSET = 0x2C
TOTAL_GLYPH_COUNT_OFFSET = 0x02
CURRENT_LINE_GLYPH_COUNT_OFFSET = 0x0E
CURRENT_LINE_INDEX_OFFSET = 0x0F


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--base-rom", type=Path, required=True)
    parser.add_argument("--patched-rom", type=Path, required=True)
    parser.add_argument("--archive-manifest", type=Path, required=True)
    parser.add_argument("--translation", type=Path, required=True)
    parser.add_argument("--entry", type=int, required=True)
    parser.add_argument("--page", type=int, default=1, help="1-based replacement page to redraw")
    parser.add_argument("--output-state", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    for source in (args.state, args.base_rom, args.patched_rom, args.archive_manifest, args.translation):
        if not source.is_file():
            raise FileNotFoundError(source)
    for output in (args.output_state, args.manifest):
        if output.exists() and not args.force:
            raise FileExistsError(f"output already exists: {output} (pass --force to replace it)")

    state_bytes = args.state.read_bytes()
    items = chunks(state_bytes)
    gbas_indices = [index for index, item in enumerate(items) if item[0] == b"gbAs"]
    if len(gbas_indices) != 1:
        raise ValueError("state must contain exactly one gbAs chunk")
    gbas_index = gbas_indices[0]
    payload = bytearray(zlib.decompress(items[gbas_index][1]))
    if len(payload) != GBA_RAW_STATE_BYTES:
        raise ValueError("unexpected mGBA GBA raw-state length")

    base_rom = args.base_rom.read_bytes()
    patched_rom = args.patched_rom.read_bytes()
    archive_manifest_bytes = args.archive_manifest.read_bytes()
    archive_manifest = json.loads(archive_manifest_bytes)
    translation_bytes = args.translation.read_bytes()
    translation = json.loads(translation_bytes)
    if sha256(patched_rom) != archive_manifest.get("output", {}).get("sha256"):
        raise ValueError("patched ROM does not match archive manifest")
    if sha256(translation_bytes) != archive_manifest.get("translation", {}).get("sha256"):
        raise ValueError("translation asset does not match archive manifest")

    archive = archive_manifest["archive"]
    base_raw, _ = decompress(base_rom, int(archive["source_rom_offset"]))
    patched_raw, _ = decompress(patched_rom, int(archive["relocation"]["target_rom_offset"]))
    base_table = archive_table(base_raw)
    patched_table = archive_table(patched_raw)
    if len(base_table) != len(patched_table):
        raise AssertionError("archive entry count changed")

    replacements = {int(item["entry_index"]): item for item in archive_manifest["replacements"]}
    translation_entries = {int(item["entry_index"]): item for item in translation["entries"]}
    if args.entry not in replacements or args.entry not in translation_entries:
        raise ValueError("selected entry is not a declared translation replacement")
    replacement = replacements[args.entry]
    translation_entry = translation_entries[args.entry]
    span = replacement.get("source_span")
    if not isinstance(span, list) or len(span) != 2:
        raise ValueError("replacement manifest has no source span")
    span_start, span_end = map(int, span)
    if translation_entry.get("source_visible_text_span") != span:
        raise ValueError("translation and archive manifest source spans differ")
    page_offsets = replacement.get("replacement_page_relative_offsets")
    page_count = replacement.get("replacement_page_count")
    if (
        not isinstance(page_offsets, list)
        or not page_offsets
        or not all(isinstance(value, int) and value >= 0 for value in page_offsets)
        or page_count != len(page_offsets)
    ):
        raise ValueError("replacement manifest has invalid page offsets")
    if not 1 <= args.page <= len(page_offsets):
        raise ValueError(f"page must be between 1 and {len(page_offsets)}")
    selected_page_offset = page_offsets[args.page - 1]

    pool_state_offset = EWRAM_STATE_START + POOL_ADDRESS - EWRAM_BASE
    observed_pool = bytes(payload[pool_state_offset:pool_state_offset + len(base_raw)])
    if observed_pool != base_raw:
        raise ValueError("source state EWRAM pool does not match the original archive")
    growth = len(patched_raw) - len(base_raw)
    overwritten_after_pool = bytes(payload[pool_state_offset + len(base_raw):pool_state_offset + len(patched_raw)])
    if growth > 0 and any(overwritten_after_pool):
        raise ValueError("translated pool growth would overwrite nonzero EWRAM state bytes")

    saved_r10 = struct.unpack_from("<I", payload, 0x20 + 10 * 4)[0]
    renderer_global_rom_offset = saved_r10 + 0x48 - ROM_BASE
    if not 0 <= renderer_global_rom_offset <= len(base_rom) - 4:
        raise ValueError("saved r10 does not resolve the renderer-state global")
    renderer_state_address = struct.unpack_from("<I", base_rom, renderer_global_rom_offset)[0]
    if not EWRAM_BASE <= renderer_state_address < EWRAM_BASE + 0x40000:
        raise ValueError("renderer state address is outside EWRAM")
    renderer_state_offset = EWRAM_STATE_START + renderer_state_address - EWRAM_BASE

    current_pointer = struct.unpack_from("<I", payload, renderer_state_offset + CURRENT_POINTER_OFFSET)[0]
    base_pointer = struct.unpack_from("<I", payload, renderer_state_offset + BASE_POINTER_OFFSET)[0]
    entry_start_pointer = struct.unpack_from("<I", payload, renderer_state_offset + ENTRY_START_POINTER_OFFSET)[0]
    if "state_observed_cursor_relative_offset" not in translation_entry:
        raise ValueError(
            f"entry {args.entry} has no state-observed cursor boundary; "
            "capture a matching gameplay state before renderer intervention"
        )
    cursor_relative = int(translation_entry["state_observed_cursor_relative_offset"])
    expected_current = POOL_ADDRESS + base_table[args.entry] + cursor_relative
    expected_start = POOL_ADDRESS + base_table[args.entry]
    if base_pointer != POOL_ADDRESS or current_pointer != expected_current or entry_start_pointer != expected_start:
        raise ValueError(
            "source state is not paused at the observed page boundary: "
            f"current=0x{current_pointer:08X}, start=0x{entry_start_pointer:08X}"
        )

    counters_before = {
        "total_glyph_count": payload[renderer_state_offset + TOTAL_GLYPH_COUNT_OFFSET],
        "current_line_glyph_count": payload[renderer_state_offset + CURRENT_LINE_GLYPH_COUNT_OFFSET],
        "current_line_index": payload[renderer_state_offset + CURRENT_LINE_INDEX_OFFSET],
    }
    payload[pool_state_offset:pool_state_offset + len(patched_raw)] = patched_raw
    patched_start = POOL_ADDRESS + patched_table[args.entry]
    patched_current = patched_start + span_start + selected_page_offset
    struct.pack_into("<I", payload, renderer_state_offset + CURRENT_POINTER_OFFSET, patched_current)
    struct.pack_into("<I", payload, renderer_state_offset + ENTRY_START_POINTER_OFFSET, patched_start)
    payload[renderer_state_offset + TOTAL_GLYPH_COUNT_OFFSET] = 0
    payload[renderer_state_offset + CURRENT_LINE_GLYPH_COUNT_OFFSET] = 0
    payload[renderer_state_offset + CURRENT_LINE_INDEX_OFFSET] = 0
    if bytes(payload[pool_state_offset:pool_state_offset + len(patched_raw)]) != patched_raw:
        raise AssertionError("patched pool verification failed")

    items[gbas_index] = (b"gbAs", zlib.compress(bytes(payload), 9))
    output_state = encode_png(items)
    args.output_state.parent.mkdir(parents=True, exist_ok=True)
    args.output_state.write_bytes(output_state)
    report = {
        "schema_version": 1,
        "kind": "intervened_mgba_archive_replacement_redraw_state",
        "input": {"filename": args.state.name, "sha256": sha256(state_bytes)},
        "base_rom": {"filename": args.base_rom.name, "sha256": sha256(base_rom)},
        "patched_rom": {"filename": args.patched_rom.name, "sha256": sha256(patched_rom)},
        "archive_manifest": {"filename": args.archive_manifest.name, "sha256": sha256(archive_manifest_bytes)},
        "translation": {"filename": args.translation.name, "sha256": sha256(translation_bytes)},
        "intervention": {
            "ewram_pool_address": f"0x{POOL_ADDRESS:08X}",
            "original_pool_sha256": sha256(base_raw),
            "replacement_pool_sha256": sha256(patched_raw),
            "replacement_pool_byte_length": len(patched_raw),
            "pool_growth_byte_length": growth,
            "overwritten_growth_region_was_zero": not any(overwritten_after_pool),
            "renderer_state_address": f"0x{renderer_state_address:08X}",
            "entry_index": args.entry,
            "replacement_page": args.page,
            "replacement_page_count": len(page_offsets),
            "replacement_page_relative_offset": selected_page_offset,
            "source_span": [span_start, span_end],
            "observed_cursor_relative_offset": cursor_relative,
            "current_pointer_before": f"0x{current_pointer:08X}",
            "current_pointer_after": f"0x{patched_current:08X}",
            "entry_start_before": f"0x{entry_start_pointer:08X}",
            "entry_start_after": f"0x{patched_start:08X}",
            "renderer_counters_before": counters_before,
            "renderer_counters_after": {
                "total_glyph_count": 0,
                "current_line_glyph_count": 0,
                "current_line_index": 0,
            },
        },
        "output": {"filename": args.output_state.name, "sha256": sha256(output_state)},
        "evidence_boundary": (
            "This explicit state intervention tests a clean redraw of the declared replacement with the actual "
            "game renderer. It does not prove that normal gameplay reaches or loads this exact ROM build; that "
            "requires a separate normal-route runtime observation."
        ),
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report["intervention"], ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
