#!/usr/bin/env python3
"""Measure a draft archive translation against the provisional codepage."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--draft", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    draft_bytes = args.draft.read_bytes()
    draft = json.loads(draft_bytes)
    codepage_bytes = args.codepage.read_bytes()
    codepage = json.loads(codepage_bytes)
    mapping = {entry["character"]: bytes(entry["encoded_bytes"]) for entry in codepage["entries"]}
    entry_reports = []
    all_hangul: set[str] = set()
    for entry in draft["entries"]:
        pages = entry.get("proposed_pages")
        if pages is None:
            pages = [entry["proposed_layout"]]
        lines = [line for page in pages for line in page]
        line_reports = []
        for line in lines:
            encoded_bytes = 0
            glyph_count = 0
            for character in line:
                if 0xAC00 <= ord(character) <= 0xD7A3:
                    if character not in mapping:
                        raise ValueError(f"codepage has no assignment for U+{ord(character):04X}")
                    encoded_bytes += len(mapping[character])
                    all_hangul.add(character)
                else:
                    encoded_bytes += 1
                glyph_count += 1
            line_reports.append({"text": line, "glyph_count": glyph_count, "estimated_stream_bytes": encoded_bytes})
        replacement = bytearray()
        for segment in entry["replacement_segments"]:
            kind, value = next(iter(segment.items()))
            if kind == "hangul":
                for character in value:
                    if character not in mapping:
                        raise ValueError(f"codepage has no assignment for U+{ord(character):04X}")
                    replacement.extend(mapping[character])
            elif kind in ("direct_hex", "control_hex"):
                replacement.extend(bytes.fromhex(value))
            elif kind == "source_glyph_hex":
                source_glyphs = bytes.fromhex(value)
                protected_span = bytes.fromhex(entry["source_visible_raw_hex"])
                if (
                    not source_glyphs
                    or len(source_glyphs) % 2
                    or any(source_glyphs[offset] not in (0xE5, 0xE6) for offset in range(0, len(source_glyphs), 2))
                    or source_glyphs not in protected_span
                ):
                    raise ValueError(
                        f"entry {entry['entry_index']} has an invalid source_glyph_hex run"
                    )
                replacement.extend(source_glyphs)
            else:
                raise ValueError(f"unknown segment kind: {kind}")
        span_start, span_end = entry["source_visible_text_span"]
        replacement_bytes = len(replacement)
        source_bytes = span_end - span_start
        entry_reports.append({
            "entry_index": entry["entry_index"],
            "source_visible_text_byte_length": source_bytes,
            "estimated_replacement_stream_byte_length": replacement_bytes,
            "estimated_growth_bytes": replacement_bytes - source_bytes,
            "page_count": len(pages),
            "line_count": len(lines),
            "lines": line_reports,
            "status": "planned_not_reinserted",
        })

    remaining_capacity = int(codepage["remaining_capacity"])
    decision = (
        "capacity_available_but_control_preserving_reinsertion_and_runtime_layout_QA_required"
        if remaining_capacity > 0
        else "current_codepage_capacity_exhausted_font_capacity_redesign_required_before_corpus_growth"
    )
    report = {
        "schema_version": 1,
        "kind": "draft_archive_translation_capacity_plan",
        "draft": {"filename": args.draft.name, "sha256": sha256(draft_bytes)},
        "codepage": {
            "filename": args.codepage.name,
            "sha256": sha256(codepage_bytes),
            "mode": codepage["mode"],
            "mapped_hangul_count": len(codepage["entries"]),
            "remaining_capacity": remaining_capacity,
        },
        "draft_unique_hangul_count": len(all_hangul),
        "entries": entry_reports,
        "total_estimated_growth_bytes": sum(entry["estimated_growth_bytes"] for entry in entry_reports),
        "decision": decision,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
