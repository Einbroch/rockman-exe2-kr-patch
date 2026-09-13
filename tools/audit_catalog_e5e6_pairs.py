#!/usr/bin/env python3
"""Screen E5/E6 glyph records against the extracted message-catalog scope.

The report is metadata-only.  It emits record indices and aggregate counts,
never source text, source bytes, or the E5/E6 byte pairs themselves.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
E5_FIRST, E5_LAST = 0xE5, 0x1E4
E6_FIRST, E6_LAST = 0x1E5, 0x2E4


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def pair_for_index(index: int) -> bytes:
    if E5_FIRST <= index <= E5_LAST:
        return bytes((0xE5, index - E5_FIRST))
    if E6_FIRST <= index <= E6_LAST:
        return bytes((0xE6, index - E6_FIRST))
    raise ValueError(f"unsupported font-record index {index}")


def bounded_slice(rom: bytes, offset: object, length: object) -> bytes:
    if not isinstance(offset, int) or not isinstance(length, int) or offset < 0 or length < 0:
        raise ValueError("catalog range is invalid")
    end = offset + length
    if end > len(rom):
        raise ValueError("catalog range exceeds ROM")
    return rom[offset:end]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-md", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    if sha256(rom) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    catalog_bytes = args.catalog.read_bytes()
    catalog = json.loads(catalog_bytes)
    records = catalog.get("records")
    if not isinstance(records, list):
        raise ValueError("catalog has no record list")

    record_spans = []
    entry_spans = []
    for record in records:
        if not isinstance(record, dict):
            raise ValueError("catalog record is invalid")
        record_spans.append(bounded_slice(rom, record.get("source_rom_offset"), record.get("byte_length")))
        subentries = record.get("subentries", [])
        if not isinstance(subentries, list):
            raise ValueError("catalog subentries are invalid")
        for entry in subentries:
            if not isinstance(entry, dict):
                raise ValueError("catalog subentry is invalid")
            entry_spans.append(bounded_slice(rom, entry.get("source_rom_offset"), entry.get("byte_length")))

    rows = []
    for index in range(E5_FIRST, E6_LAST + 1):
        pair = pair_for_index(index)
        record_hits = sum(span.count(pair) for span in record_spans)
        entry_hits = sum(span.count(pair) for span in entry_spans)
        rows.append(
            {
                "font_record_index": index,
                "catalog_record_raw_pair_occurrence_count": record_hits,
                "catalog_entry_raw_pair_occurrence_count": entry_hits,
            }
        )

    no_record_hits = [row["font_record_index"] for row in rows if row["catalog_record_raw_pair_occurrence_count"] == 0]
    no_entry_hits = [row["font_record_index"] for row in rows if row["catalog_entry_raw_pair_occurrence_count"] == 0]
    report = {
        "schema_version": 1,
        "kind": "catalog_scoped_e5e6_raw_pair_screen",
        "input": {"filename": args.rom.name, "sha256": sha256(rom)},
        "catalog": {"filename": args.catalog.name, "sha256": sha256(catalog_bytes), "record_count": len(record_spans), "subentry_count": len(entry_spans)},
        "summary": {
            "font_record_range": [E5_FIRST, E6_LAST],
            "candidate_record_count": len(rows),
            "records_with_no_catalog_record_raw_pair_occurrence": len(no_record_hits),
            "records_with_no_catalog_entry_raw_pair_occurrence": len(no_entry_hits),
            "no_catalog_record_raw_pair_observed_record_indices": no_record_hits,
            "no_catalog_entry_raw_pair_observed_record_indices": no_entry_hits,
        },
        "records": rows,
        "interpretation_notice": (
            "This is a screening result for the catalogued text scope only. A zero raw-pair count does not prove "
            "that the font record is unreferenced by uncatalogued text, non-text data, code, or runtime-generated input."
        ),
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Catalog-scoped E5/E6 raw-pair screen",
        "",
        "Metadata-only report; no source game text, glyphs, or byte pairs are included.",
        "",
        f"- Catalog blocks: {len(record_spans)}",
        f"- Catalog subentries: {len(entry_spans)}",
        f"- Candidate E5/E6 records: {len(rows)}",
        f"- Records with no raw pair in catalog blocks: {len(no_record_hits)}",
        f"- Records with no raw pair in catalog subentries: {len(no_entry_hits)}",
        "",
        report["interpretation_notice"],
    ]
    args.output_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
