#!/usr/bin/env python3
"""Count selected Korean code-page byte pairs across a whole ROM.

The output is metadata-only: record indices and occurrence counts. It never
emits source text, glyphs, or the byte pairs themselves.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    codepage_bytes = args.codepage.read_bytes()
    codepage = json.loads(codepage_bytes)
    rows = []
    for entry in codepage.get("entries", []):
        encoded = entry.get("encoded_bytes")
        index = entry.get("font_record_index")
        if not isinstance(index, int) or not isinstance(encoded, list) or len(encoded) != 2:
            raise ValueError("codepage entry is not a two-byte E5/E6 mapping")
        pair = bytes(encoded)
        rows.append(
            {
                "font_record_index": index,
                "unicode_code_point": entry.get("unicode_code_point"),
                "full_rom_nonoverlapping_pair_occurrence_count": rom.count(pair),
            }
        )
    rows.sort(key=lambda row: row["font_record_index"])
    report = {
        "schema_version": 1,
        "kind": "selected_codepage_full_rom_pair_occurrence_audit",
        "input": {"filename": args.rom.name, "sha256": sha256(rom), "byte_length": len(rom)},
        "codepage": {"filename": args.codepage.name, "sha256": sha256(codepage_bytes)},
        "summary": {
            "selected_record_count": len(rows),
            "records_with_no_full_rom_pair_occurrence": sum(
                row["full_rom_nonoverlapping_pair_occurrence_count"] == 0 for row in rows
            ),
            "records_with_any_full_rom_pair_occurrence": sum(
                row["full_rom_nonoverlapping_pair_occurrence_count"] > 0 for row in rows
            ),
        },
        "records": rows,
        "interpretation_notice": (
            "Absence of a raw two-byte pair in the ROM is a stronger screening signal than a scoped catalog scan, "
            "but it does not prove a font record is unreferenced by non-text code or generated data."
        ),
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Selected code-page full-ROM pair audit",
        "",
        "Metadata-only audit; no source game text, glyphs, or code pairs are included.",
        "",
        f"- Selected records: {report['summary']['selected_record_count']}",
        f"- Records with no raw pair occurrence across the ROM: {report['summary']['records_with_no_full_rom_pair_occurrence']}",
        f"- Records with one or more raw pair occurrences: {report['summary']['records_with_any_full_rom_pair_occurrence']}",
        "",
        report["interpretation_notice"],
    ]
    args.output_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
