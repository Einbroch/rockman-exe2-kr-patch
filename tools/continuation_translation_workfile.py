#!/usr/bin/env python3
"""Dump each physical continuation's literals for translation, and build the set back.

A continuation is a script the game runs past the length its archive's boundary
table declares. The build preserves those bytes verbatim, which is why they stay
Japanese on screen. Translating one means rewriting only the quoted literals of
its TPL - every control, its order and the literal count stay exactly as the
source has them, so the recompiled tail keeps the same shape.

Two modes:

  dump   write a work file listing every translatable continuation with its
         source literals, their measured widths and an empty slot per literal.
  build  read that work file back, emit one translated TPL per filled entry and
         the protected record set the build validates against.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from dialogue_layout import (QUOTE_RE, fits, literal, measure, measure_groups, quote,
                             ROWS, WIDTH)

JAPANESE = re.compile(r"[぀-ヿ一-鿿]")
# Above this a "continuation" is not a script tail but the whole gap to the next
# catalogued archive, holding archives this pipeline has not catalogued. Wrapping
# one as a single message would misdescribe it, so it stays verbatim.
SCRIPT_TAIL_LIMIT = 512
STATUS = "machine_draft_needs_human_review"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def dump(args: argparse.Namespace) -> None:
    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    existing = {}
    if args.work_file.is_file():
        existing = {item["tpl_filename"]: item
                    for item in json.loads(args.work_file.read_text(encoding="utf-8"))["entries"]}
    entries = []
    for record in catalog["records"]:
        if record["source_byte_length"] > SCRIPT_TAIL_LIMIT:
            continue
        tpl_path = args.tpl_dir / record["tpl_filename"]
        text = tpl_path.read_text(encoding="utf-8-sig")
        source_literals = [literal(q) for q in QUOTE_RE.finditer(text)]
        if not any(JAPANESE.search(value) for value in source_literals):
            continue
        prior = existing.get(record["tpl_filename"], {})
        entries.append({
            "selector": record["selector"],
            "tpl_filename": record["tpl_filename"],
            "source_rom_offset": record["source_rom_offset"],
            "source_byte_length": record["source_byte_length"],
            "source_sha256": record["source_sha256"],
            # A bulk gap's head: the script alone, the rest of the gap pinned too.
            **{key: record[key] for key in ("head_of_gap", "gap_byte_length", "gap_sha256")
               if key in record},
            "source_tpl_sha256": record["tpl_sha256"],
            "source_literals": source_literals,
            "source_pages": [
                {"slots": page["slots"], "metrics": page["source"]}
                for page in measure_groups(text, list(QUOTE_RE.finditer(text)),
                                           source_literals, source_literals)],
            "translated_literals": prior.get("translated_literals", []),
        })
    args.work_file.parent.mkdir(parents=True, exist_ok=True)
    args.work_file.write_text(json.dumps({
        "schema_version": 1,
        "kind": "exe2_physical_continuation_translation_workfile",
        "window": {"cells": WIDTH, "rows": ROWS},
        "entry_count": len(entries),
        "translated_count": sum(1 for item in entries if item["translated_literals"]),
        "entries": entries,
    }, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
    print(json.dumps({"entries": len(entries),
                      "translated": sum(1 for item in entries if item["translated_literals"]),
                      "japanese_characters": sum(
                          len(JAPANESE.findall("".join(item["source_literals"]))) for item in entries)},
                     ensure_ascii=False, indent=2))


def render(text: str, source_literals: list[str], translated: list[str]) -> str:
    """Replace each quoted literal in order, leaving every control untouched."""
    pieces, cursor, index = [], 0, 0
    for match in QUOTE_RE.finditer(text):
        pieces.append(text[cursor:match.start()])
        value = translated[index]
        pieces.append(match.group(0) if value == source_literals[index] else quote(value))
        cursor = match.end()
        index += 1
    pieces.append(text[cursor:])
    result = "".join(pieces)
    assert QUOTE_RE.sub("<TEXT>", result) == QUOTE_RE.sub("<TEXT>", text)
    return result


def build(args: argparse.Namespace) -> None:
    work = json.loads(args.work_file.read_text(encoding="utf-8"))
    kept = json.loads(args.existing.read_text(encoding="utf-8")) if args.existing.is_file() else None
    records, written, problems = [], 0, []
    for item in work["entries"]:
        translated = item["translated_literals"]
        if not translated:
            continue
        source_literals = item["source_literals"]
        if len(translated) != len(source_literals):
            problems.append(f"{item['selector']}: {len(translated)} literals for "
                            f"{len(source_literals)} in the source")
            continue
        text = (args.tpl_dir / item["tpl_filename"]).read_text(encoding="utf-8-sig")
        # A tail can hold more than one page. Measuring the whole thing as
        # one would reject a perfectly good two-page tail, so group it the
        # same way the dialogue layout does and judge each page.
        pages = measure_groups(text, list(QUOTE_RE.finditer(text)), translated, source_literals)
        overrun = [page for page in pages
                   if not fits(page["shipped"]) and fits(page["source"])]
        if overrun:
            page = overrun[0]
            problems.append(
                f"{item['selector']} page {page['slots']}: "
                f"{page['shipped']['rows']}x{max(page['shipped']['columns'])} "
                f"exceeds the {WIDTH}x{ROWS} window "
                f"(source {page['source']['rows']}x{max(page['source']['columns'])})")
            continue
        out_name = "physical_continuation_%s.tpl" % item["selector"].replace("/", "_")
        out_path = args.translations_dir / out_name
        payload = render(text, source_literals, translated).encode("utf-8-sig")
        out_path.write_bytes(payload)
        written += 1
        records.append({
            "selector": item["selector"],
            "source_rom_offset": item["source_rom_offset"],
            "source_byte_length": item["source_byte_length"],
            "source_sha256": item["source_sha256"],
            **{key: item[key] for key in ("head_of_gap", "gap_byte_length", "gap_sha256")
               if key in item},
            "source_tpl_filename": item["tpl_filename"],
            "source_tpl_sha256": item["source_tpl_sha256"],
            "translated_tpl_filename": out_name,
            "translated_tpl_sha256": sha256(payload),
            "translation": " ".join(value.strip() for value in translated if value.strip()),
            "status": STATUS,
        })
    if problems:
        raise SystemExit("translated continuations rejected:\n  " + "\n  ".join(problems))
    # A tail inside a decompressed buffer has no ROM offset; those sort last.
    records.sort(key=lambda record: (record["source_rom_offset"] is None,
                                     record["source_rom_offset"] or 0, record["selector"]))
    document = {
        "schema_version": (kept or {}).get("schema_version", 1),
        "kind": "protected_exe2_physical_continuation_translation_set",
        "record_count": len(records),
        "records": records,
    }
    args.output.write_text(json.dumps(document, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"translated_tpl_written": written, "records": len(records)},
                     ensure_ascii=False, indent=2))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("dump", "build"))
    parser.add_argument("--catalog", type=Path,
                        default=Path("analysis/physical_continuation_tpl_catalog_v5.json"))
    parser.add_argument("--tpl-dir", type=Path, default=Path("analysis/physical_continuation_tpl"))
    parser.add_argument("--translations-dir", type=Path, default=Path("translations"))
    parser.add_argument("--work-file", type=Path,
                        default=Path("translations/physical_continuation_workfile.json"))
    parser.add_argument("--existing", type=Path,
                        default=Path("translations/physical_continuation_translations.json"))
    parser.add_argument("--output", type=Path,
                        default=Path("translations/physical_continuation_translations.json"))
    args = parser.parse_args()
    (dump if args.mode == "dump" else build)(args)


if __name__ == "__main__":
    main()
