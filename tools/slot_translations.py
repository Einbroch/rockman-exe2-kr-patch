#!/usr/bin/env python3
"""Carry the entries whose drafts disagree with the source's slots, literal by literal.

The build's window gate (choice_layout) refuses a draft that moves text
between a question and its choices, or whose page outgrows the window the
source draws, printed names counted at their real width. Finding option
boundaries the way the source does fixes most choice entries; the ones this
set carries still disagree with the source - a page break written as a line
break, a question's line break taken for a choice, a line break the grammar
drops beside a printed name - so they are authored slot by slot.

Each record supersedes one entry's draft and pins that draft by hash: an edit
to the draft stops the build until the slots are reviewed again.

  build  check every authored entry against its source and write the set.
"""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import build_semantic_translation_dev_rom as B
import choice_layout
from static_submenu_tables import printed_chip_names
import uncatalogued_archive_batch as U
from dialogue_layout import QUOTE_RE, literal
from layout_byte_verifier import table_mapping


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("build",))
    parser.add_argument("--translations-dir", type=Path, default=Path("translations"))
    parser.add_argument("--analysis-dir", type=Path, default=Path("analysis"))
    parser.add_argument("--source-rom", type=Path,
                        default=Path("Battle Network Rockman EXE 2 (Japan) (Rev 1).gba"))
    parser.add_argument("--plugins-dir", type=Path, default=U.DEFAULT_PLUGINS)
    parser.add_argument("--authoring", type=Path,
                        default=Path("translations/slot_authoring.json"))
    args = parser.parse_args()
    output = args.translations_dir / B.SLOT_TRANSLATION_FILENAME

    authored = json.loads(args.authoring.read_text(encoding="utf-8"))["entries"]
    entries, archives, _ = B.load_batches(args.translations_dir, apply_slots=False)
    by_id = {entry["entry_id"]: (key, entry) for key, entry in entries.items()}
    mapping = table_mapping((args.plugins_dir / "exe2-utf8.tbl").read_text(encoding="utf-8-sig"))
    encodable = {key for key in mapping if len(key) == 1}
    # The same widths the build gates on: printed names as the game draws them.
    name_width = choice_layout.name_widths(
        {index: B.translated_text(entry) for (selector, index), entry in entries.items()
         if selector == "00/359"},
        printed_chip_names(args.source_rom.read_bytes()))
    blocks: dict[str, dict[int, str]] = {}
    records, problems = [], []
    for entry_id, translated in sorted(authored.items()):
        if entry_id not in by_id:
            problems.append("%s: no such protected entry" % entry_id)
            continue
        (selector, index), entry = by_id[entry_id]
        if "translated_literals" in entry:
            problems.append("%s: already carries literal slots" % entry_id)
            continue
        if selector not in blocks:
            text = (args.analysis_dir / archives[selector]["tpl_filename"]).read_bytes().decode("utf-8-sig")
            blocks[selector] = {int(m.group(1)): m.group(0) for m in B.SCRIPT_RE.finditer(text)}
        block = blocks[selector][index]
        if B.sha256(block.encode("utf-8")) != entry["source_tpl_block_sha256"]:
            problems.append("%s: source TPL block changed" % entry_id)
            continue
        source_literals = [literal(q) for q in QUOTE_RE.finditer(block)]
        row = {"entry_id": entry_id, "source_literals": source_literals,
               "translated_literals": translated}
        found = U.check_entry(block, row, encodable, name_width)
        if found:
            problems.extend("%s: %s" % (entry_id, item) for item in found)
            continue
        records.append({
            "entry_id": entry_id,
            "selector": selector,
            "entry_index": index,
            "source_tpl_block_sha256": entry["source_tpl_block_sha256"],
            "superseded_draft_sha256": B.sha256(entry["draft_translation"].encode("utf-8")),
            "superseded_draft": entry["draft_translation"],
            "source_literals": source_literals,
            "translated_literals": translated,
            "status": U.STATUS,
        })
    if problems:
        raise SystemExit("rejected:\n  " + "\n  ".join(problems))
    document = {
        "schema_version": 1,
        "kind": B.SLOT_TRANSLATION_KIND,
        "record_count": len(records),
        "records": records,
        "validation": {"passed": True,
                       "checks": ["protected entry exists and has no literal slots yet",
                                  "source TPL block hash", "superseded draft pinned by hash",
                                  "one translated literal per source literal",
                                  "no kana or kanji left", "every character encodable",
                                  "build substitution agrees with an independent one",
                                  "choice_layout: no choice blank or grown, pages inside the window"]},
    }
    output.write_text(json.dumps(document, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
    print(json.dumps({"records": len(records), "output": str(output)}, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
