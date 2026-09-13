#!/usr/bin/env python3
"""Measure language-invariant message-entry prefixes without exporting text.

The PC patch packages are only a comparative reference.  This reports lengths,
hashes, and short non-text byte-prefix templates; it never writes decoded text
or treats any byte as a confirmed opcode.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zipfile
from collections import Counter
from pathlib import Path


GBA_ROM_BASE = 0x08000000
EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
LANGUAGES = ("jap", "chs", "cht", "eng")
CONTROL_CANDIDATE_BYTES = {0xED, 0xF1, 0xF9, 0xFA}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_map(data: bytes) -> tuple[tuple[int, int, int], list[tuple[int, int, int]]]:
    if len(data) < 12 or len(data) % 4:
        raise ValueError("map must contain a three-word header followed by complete words")
    values = struct.unpack(f"<{len(data) // 4}I", data)
    count, source_start, source_end = values[:3]
    records = [tuple(values[index : index + 3]) for index in range(3, len(values), 3)]
    if len(records) != count:
        raise ValueError(f"map declares {count} records, found {len(records)}")
    return (count, source_start, source_end), records


def entry_spans(block: bytes) -> list[tuple[int, int]] | None:
    if len(block) < 2:
        return None
    table_bytes = int.from_bytes(block[:2], "little")
    if not table_bytes or table_bytes % 2 or table_bytes > len(block):
        return None
    starts = [int.from_bytes(block[index : index + 2], "little") for index in range(0, table_bytes, 2)]
    if not starts or starts[0] != table_bytes:
        return None
    # A trailing table entry may legally point at the block end and represent
    # an empty entry; retain it so this comparison matches the existing
    # runtime-entry analyzer's table rules.
    if any(start < table_bytes or start > len(block) for start in starts):
        return None
    if any(left > right for left, right in zip(starts, starts[1:])):
        return None
    unique_starts = sorted(set(starts))
    ends = {start: next((candidate for candidate in unique_starts if candidate > start), len(block)) for start in unique_starts}
    return [(start, ends[start]) for start in starts]


def common_prefix(values: list[bytes]) -> bytes:
    if not values:
        return b""
    limit = min(map(len, values))
    for index in range(limit):
        if len({value[index] for value in values}) != 1:
            return values[0][:index]
    return values[0][:limit]


def template(prefix: bytes) -> str | None:
    # A template is retained only if its first byte is already one of the known
    # cross-language control candidates.  This avoids exporting text-like bytes.
    if not prefix or prefix[0] not in CONTROL_CANDIDATE_BYTES:
        return None
    return prefix[:16].hex().upper()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--archive", type=Path, required=True)
    parser.add_argument("--state-report", type=Path, help="optional state report for runtime-observed entry marking")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    rom_digest = sha256(rom)
    if rom_digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {rom_digest}")

    observed_entries: set[str] = set()
    if args.state_report:
        state_report = json.loads(args.state_report.read_text(encoding="utf-8"))
        observed_entries = {
            hit["id"]
            for hit in state_report.get("gba_state_payload", {}).get("candidate_subentry_pointer_occurrences", [])
        }

    with zipfile.ZipFile(args.archive) as archive:
        maps = {}
        packages = {}
        for language in LANGUAGES:
            maps[language] = parse_map(archive.read(f"exe2j/data/msg/message_{language}.map"))
            packages[language] = archive.read(f"exe2j/data/msg/message_{language}.mpak")

    jap_records = maps["jap"][1]
    entries = []
    template_counts: Counter[tuple[str, bool]] = Counter()
    summary = Counter()
    for record_index, (source_address, _, source_length) in enumerate(jap_records):
        language_blocks = {}
        compatible = True
        for language in LANGUAGES:
            if record_index >= len(maps[language][1]):
                compatible = False
                break
            _, package_offset, package_length = maps[language][1][record_index]
            if package_offset + package_length > len(packages[language]):
                compatible = False
                break
            spans = entry_spans(packages[language][package_offset : package_offset + package_length])
            if spans is None:
                compatible = False
                break
            language_blocks[language] = (packages[language][package_offset : package_offset + package_length], spans)
        if not compatible:
            summary["incompatible_record_count"] += 1
            continue
        entry_counts = [len(spans) for _, spans in language_blocks.values()]
        if len(set(entry_counts)) != 1:
            summary["different_entry_count_record_count"] += 1
        summary["comparable_record_count"] += 1
        source_offset = source_address - GBA_ROM_BASE
        gba_spans = entry_spans(rom[source_offset : source_offset + source_length]) if 0 <= source_offset <= len(rom) - source_length else None
        for entry_index in range(min(entry_counts)):
            payloads = []
            for language in LANGUAGES:
                block, spans = language_blocks[language]
                start, end = spans[entry_index]
                payloads.append(block[start:end])
            prefix = common_prefix(payloads)
            entry_id = f"pc-jap-map-{record_index:04d}/entry-{entry_index:02d}"
            gba_match = False
            gba_entry_available = bool(gba_spans and entry_index < len(gba_spans))
            if gba_entry_available:
                gba_start, gba_end = gba_spans[entry_index]
                gba_entry = rom[source_offset + gba_start : source_offset + gba_end]
                gba_match = gba_entry.startswith(prefix)
            has_control_candidate = any(byte in CONTROL_CANDIDATE_BYTES for byte in prefix)
            is_runtime_observed = entry_id in observed_entries
            if prefix:
                summary["nonempty_all_language_prefix_count"] += 1
            if gba_match and prefix:
                summary["gba_matches_all_language_prefix_count"] += 1
            if gba_entry_available:
                summary["gba_comparable_entry_count"] += 1
            if has_control_candidate:
                summary["prefix_with_control_candidate_count"] += 1
            key = template(prefix)
            if key and gba_entry_available:
                template_counts[(key, gba_match)] += 1
            entries.append(
                {
                    "id": entry_id,
                    "source_rom_address": source_address + gba_spans[entry_index][0] if gba_entry_available else None,
                    "pc_all_language_common_prefix_length": len(prefix),
                    "pc_all_language_common_prefix_sha256": sha256(prefix),
                    "common_prefix_contains_control_candidate_byte": has_control_candidate,
                    "gba_entry_available": gba_entry_available,
                    "gba_entry_starts_with_common_prefix": gba_match,
                    "runtime_pointer_observed": is_runtime_observed,
                }
            )

    templates = [
        {
            "leading_common_prefix_hex_maximum_16_bytes": key,
            "gba_entry_starts_with_prefix": gba_match,
            "entry_count": count,
        }
        for (key, gba_match), count in template_counts.most_common()
    ]
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": rom_digest,
            "archive_filename": args.archive.name,
            "archive_sha256": sha256(args.archive.read_bytes()),
            "languages": list(LANGUAGES),
        },
        "summary": dict(summary),
        "leading_control_candidate_prefix_templates": templates,
        "entries": entries,
        "interpretation_notice": (
            "A common PC-package prefix is comparative evidence for language-independent data only. "
            "A GBA match strengthens preservation priority but does not confirm opcodes, parameter widths, "
            "text boundaries, glyph mapping, or runtime consumption. All bytes after the common prefix remain "
            "forbidden for automatic translation or reinsertion."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
