#!/usr/bin/env python3
"""Merge a compact EXE2 archive 00/09 translation batch safely.

The batch owns only authored translation/context fields. Protected offsets and
raw bytes are regenerated from the immutable supported Rev 1 ROM.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import struct
from pathlib import Path

from gba_lz77 import decompress


SUPPORTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ARCHIVE_OFFSET = 7_644_292
ARCHIVE_SHA256 = "92852d9c874fe0d5293d0c47920f2b987ff1de9fef232fa24489b7700a670667"
ENTRY_COUNT = 254

PROTECTED_BATCH_FIELDS = {
    "entry_id",
    "original_entry_offset",
    "original_entry_byte_length",
    "original_entry_raw_hex",
    "source_visible_raw_hex",
    "preserved_page_end_control_hex",
}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def spaced_hex(data: bytes) -> str:
    return data.hex(" ")


def archive_entries(raw: bytes) -> tuple[list[int], list[bytes]]:
    table_bytes = struct.unpack_from("<H", raw, 0)[0]
    if table_bytes != (ENTRY_COUNT + 1) * 2:
        raise ValueError("archive 00/09 table size mismatch")
    offsets = [struct.unpack_from("<H", raw, index * 2)[0] for index in range(ENTRY_COUNT + 1)]
    if offsets[0] != table_bytes or offsets[-1] != len(raw):
        raise ValueError("archive 00/09 table boundaries mismatch")
    if any(left > right for left, right in zip(offsets, offsets[1:])):
        raise ValueError("archive 00/09 offsets are not monotonic")
    return offsets, [raw[offsets[index]:offsets[index + 1]] for index in range(ENTRY_COUNT)]


def checked_span(value: object, length: int, label: str, allow_empty: bool = False) -> tuple[int, int]:
    if not isinstance(value, list) or len(value) != 2 or not all(isinstance(item, int) for item in value):
        raise ValueError(f"{label} must be a two-integer list")
    start, end = value
    if start < 0 or end > length or start > end or (start == end and not allow_empty):
        raise ValueError(f"{label} lies outside the source entry")
    return start, end


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--translation", type=Path, required=True)
    parser.add_argument("--batch", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    if sha256(rom) != SUPPORTED_ROM_SHA256:
        raise ValueError("supported EXE2 Rev 1 ROM SHA-256 mismatch")
    raw, _ = decompress(rom, ARCHIVE_OFFSET)
    if sha256(raw) != ARCHIVE_SHA256:
        raise ValueError("archive 00/09 decompressed SHA-256 mismatch")
    offsets, source_entries = archive_entries(raw)

    document = json.loads(args.translation.read_text(encoding="utf-8"))
    batch = json.loads(args.batch.read_text(encoding="utf-8"))
    if batch.get("schema_version") != 1 or batch.get("kind") != "archive_00_09_translation_batch":
        raise ValueError("unsupported translation batch schema")
    specs = batch.get("entries")
    if not isinstance(specs, list) or not specs:
        raise ValueError("translation batch contains no entries")

    existing = {int(item["entry_index"]): item for item in document.get("entries", [])}
    batch_indices: set[int] = set()
    additions: list[dict[str, object]] = []
    for spec in specs:
        if not isinstance(spec, dict):
            raise ValueError("batch entry must be an object")
        forbidden = PROTECTED_BATCH_FIELDS.intersection(spec)
        if forbidden:
            raise ValueError(f"batch entry supplies protected fields: {sorted(forbidden)}")
        index = spec.get("entry_index")
        if not isinstance(index, int) or not 0 <= index < ENTRY_COUNT:
            raise ValueError("batch entry_index is invalid")
        if index in existing or index in batch_indices:
            raise ValueError(f"entry {index} already exists or is duplicated")
        batch_indices.add(index)
        entry_raw = source_entries[index]
        visible_start, visible_end = checked_span(
            spec.get("source_visible_text_span"), len(entry_raw), f"entry {index} visible span"
        )
        page_end_start, page_end_end = checked_span(
            spec.get("preserved_page_end_control_span"),
            len(entry_raw),
            f"entry {index} page-end span",
        )
        if page_end_start != visible_end:
            raise ValueError(f"entry {index} page-end span must begin at visible span end")
        if spec.get("status") != "needs_human_review":
            raise ValueError(f"entry {index} must remain needs_human_review")
        item = {
            "entry_id": f"archive_00_09_entry_{index:04d}",
            **spec,
            "original_entry_offset": offsets[index],
            "original_entry_byte_length": len(entry_raw),
            "original_entry_raw_hex": spaced_hex(entry_raw),
            "source_visible_raw_hex": spaced_hex(entry_raw[visible_start:visible_end]),
            "preserved_page_end_control_hex": spaced_hex(entry_raw[page_end_start:page_end_end]),
        }
        additions.append(item)

    document["entries"].extend(additions)
    document["entries"].sort(key=lambda item: int(item["entry_index"]))
    replacement = batch.get("limitations_replace")
    if replacement is not None:
        if (
            not isinstance(replacement, dict)
            or set(replacement) != {"old", "new"}
            or replacement["old"] not in document.get("limitations", [])
        ):
            raise ValueError("limitations_replace does not match one current limitation")
        position = document["limitations"].index(replacement["old"])
        document["limitations"][position] = replacement["new"]

    serialized = json.dumps(document, ensure_ascii=False, indent=2) + "\n"
    temporary = args.translation.with_suffix(args.translation.suffix + ".tmp")
    temporary.write_text(serialized, encoding="utf-8", newline="\n")
    os.replace(temporary, args.translation)
    print(json.dumps({"added_entries": sorted(batch_indices), "total_entries": len(document["entries"])}, ensure_ascii=False))


if __name__ == "__main__":
    main()
