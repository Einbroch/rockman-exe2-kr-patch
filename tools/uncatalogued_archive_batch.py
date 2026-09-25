#!/usr/bin/env python3
"""Turn the archives the catalogue missed into one protected translation batch.

`scan_text_archives.py` finds archives the catalogue never listed - text the
game reaches through a code literal rather than the pointer tables the
catalogue was built from. Translating them means giving the build the same
protected batch shape it already validates: source entry hashes, the TPL block
hash, and the translated text.

The text is carried literal by literal. Every quoted literal of an entry's
source TPL is a slot, and a translation replaces slots in place, so every
control stays exactly where the source has it. The prose grammar the
catalogued batches use (`/`, `//`, `[tag]`) cannot say that: it has no way to
keep an option's trailing newline or space, to leave two literals on one line
around a sound effect, or to keep a literal's leading space. Drafted in it, a
choice window either round-trips by luck or moves text between slots.

  dump   write one work file per archive: each entry's source literals and
         hashes, and a slot list to translate into (kept across re-dumps).
  build  read the work files back, check every filled entry against the
         source it replaces, and emit the single batch the build consumes.
"""
from __future__ import annotations

import argparse
import json
import re
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import build_semantic_translation_dev_rom as B
from gba_lz77 import decompress
from dialogue_layout import QUOTE_RE, literal
from layout_byte_verifier import table_mapping
import choice_layout
from static_submenu_tables import printed_chip_names

JAPANESE = re.compile(r"[぀-ヿ一-鿿]")
# Kana and kanji a finished slot must not keep. The middle dot and the long
# vowel mark stay: they are how this translation writes ellipses and dashes.
LEFTOVER = re.compile(r"[ぁ-ゖァ-ヺ一-鿿]")
HANGUL = re.compile(r"[가-힣]")
STATUS = "machine_draft_needs_human_review"
DEFAULT_PLUGINS = Path("external/TextPet-plugins-6c6d705/"
                       "TextPet-6c6d70561290b42d8261f6d76b03051d534c7032/TextPet/plugins")


def entries_of(tpl_text: str):
    for match in B.SCRIPT_RE.finditer(tpl_text):
        yield int(match.group(1)), match.group(0)



def source_payload(rom: bytes, offset: int, storage: str, stored: int, payload=None) -> bytes:
    """The archive bytes the boundary table describes, as the game sees them.

    A compressed archive is decompressed first; the stream length is checked
    against the one recorded, and bytes past the table's declared end are cut
    off here and left to the build, which carries them inside the blob.
    """
    if storage == "lz77":
        data, length = decompress(rom, offset)
        if length != stored:
            raise SystemExit("compressed length at 0x%07X changed" % offset)
    else:
        data = rom[offset:offset + stored]
    return data[:payload] if payload else data


def substituted(block: str, values: list[str]) -> str:
    """The block with each literal replaced, written independently of the build."""
    pieces, cursor = [], 0
    for match, value in zip(QUOTE_RE.finditer(block), values):
        pieces.append(block[cursor:match.start()])
        pieces.append(match.group(0) if value == literal(match) else B.layout_quote(value))
        cursor = match.end()
    pieces.append(block[cursor:])
    return "".join(pieces)


def dump(args: argparse.Namespace) -> None:
    rom = args.source_rom.read_bytes()
    # read_text translates CRLF to LF on Windows; the build decodes the raw
    # bytes, so the block hashes only agree if this reads them the same way.
    tpl_text = (args.analysis_dir / args.tpl).read_bytes().decode("utf-8-sig")
    payload = None
    if args.storage == "lz77":
        data, stored = decompress(rom, args.rom_offset)
        args.byte_length = stored
        # The table's own last value, read directly: the stream may run past it.
        size = struct.unpack_from("<H", data, 0)[0]
        end = struct.unpack_from("<%dH" % (size // 2), data, 0)[-1]
        payload = end if end < len(data) else None
    raw = source_payload(rom, args.rom_offset, args.storage, args.byte_length, payload)
    offsets = B.archive_offsets(raw)
    work_file = args.work_file[0]
    prior = {}
    if work_file.is_file():
        for item in json.loads(work_file.read_text(encoding="utf-8"))["entries"]:
            prior[item["entry_index"]] = item
    rows = []
    for entry_index, block in entries_of(tpl_text):
        if entry_index + 1 >= len(offsets):
            continue
        source_entry = raw[offsets[entry_index]:offsets[entry_index + 1]]
        source_literals = [literal(q) for q in QUOTE_RE.finditer(block)]
        japanese = sum(len(JAPANESE.findall(value)) for value in source_literals)
        if not japanese:
            continue
        block_hash = B.sha256(block.encode("utf-8"))
        kept = prior.get(entry_index, {})
        translated = kept.get("translated_literals", [])
        if translated and kept.get("source_tpl_block_sha256") != block_hash:
            raise SystemExit("entry %d: source changed under an existing translation" % entry_index)
        rows.append({
            "entry_index": entry_index,
            "entry_id": "%s_entry_%04d" % (args.entry_prefix, entry_index),
            "source_entry_offset": offsets[entry_index],
            "source_entry_byte_length": len(source_entry),
            "source_entry_sha256": B.sha256(source_entry),
            "source_entry_raw_hex": source_entry.hex(" "),
            "source_tpl_block_sha256": block_hash,
            "japanese_characters": japanese,
            "source_literals": source_literals,
            "translated_literals": translated,
        })
    work_file.parent.mkdir(parents=True, exist_ok=True)
    work_file.write_text(json.dumps({
        "schema_version": 2,
        "kind": "exe2_uncatalogued_archive_translation_workfile",
        "selector": args.selector,
        "entry_prefix": args.entry_prefix,
        "rom_offset": args.rom_offset,
        "storage": args.storage,
        "byte_length": args.byte_length,
        **({"payload_byte_length": payload} if payload else {}),
        "tpl_filename": args.tpl,
        "entry_count": len(rows),
        "entries": rows,
    }, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
    print(json.dumps({
        "selector": args.selector,
        "entries_with_japanese": len(rows),
        "translated": sum(1 for row in rows if row["translated_literals"]),
        "japanese_characters": sum(row["japanese_characters"] for row in rows),
    }, ensure_ascii=False))


def check_entry(block: str, row: dict, encodable: set[str], name_width=None) -> list[str]:
    """Every reason this filled entry cannot ship; empty when it can."""
    problems = []
    source_literals = [literal(q) for q in QUOTE_RE.finditer(block)]
    values = [value.translate(B.PUNCTUATION_NORMALIZATION) for value in row["translated_literals"]]
    if source_literals != row["source_literals"]:
        return ["source literals differ from the work file"]
    if len(values) != len(source_literals):
        return ["%d slots for %d source literals" % (len(values), len(source_literals))]
    for index, value in enumerate(values):
        if not value:
            problems.append("slot %d is empty; TextPet rejects an empty literal" % index)
        if LEFTOVER.search(value):
            problems.append("slot %d keeps Japanese: %r" % (index, value))
        missing = sorted({c for c in value if c not in encodable and not HANGUL.match(c)})
        if missing:
            problems.append("slot %d has characters the table cannot encode: %r" % (index, missing))
    if problems:
        return problems
    text = substituted(block, values)
    built, _ = B.substitute_literals(block, row["translated_literals"], row["entry_id"])
    # The build's substitution and this one are written separately; the
    # literals they produce have to agree before either is trusted.
    if [literal(q) for q in QUOTE_RE.finditer(built)] != [literal(q) for q in QUOTE_RE.finditer(text)]:
        problems.append("build substitution disagrees with the independent one")
    # The same rule the build gates on: choices kept in their slots, pages
    # inside the window the source draws.
    problems.extend(choice_layout.problems(block, text, name_width))
    return problems


def build(args: argparse.Namespace) -> None:
    rom = args.source_rom.read_bytes()
    mapping = table_mapping((args.plugins_dir / "exe2-utf8.tbl").read_text(encoding="utf-8-sig"))
    encodable = {key for key in mapping if len(key) == 1}
    # Printed names at the width the build gates on - the translated item
    # names of 00/359 and the relocated chip table - not the table's widest.
    catalogued, _, _ = B.load_batches(args.translations_dir, apply_slots=False)
    name_width = choice_layout.name_widths(
        {index: B.translated_text(entry) for (selector, index), entry in catalogued.items()
         if selector == "00/359"},
        printed_chip_names(rom))
    archives, entries, problems = [], [], []
    for work_file in args.work_file:
        work = json.loads(work_file.read_text(encoding="utf-8"))
        if work.get("schema_version") != 2:
            raise SystemExit("%s: not a literal work file" % work_file)
        storage = work.get("storage", "raw")
        raw = source_payload(rom, work["rom_offset"], storage, work["byte_length"],
                             work.get("payload_byte_length"))
        tpl_path = args.analysis_dir / work["tpl_filename"]
        blocks = dict(entries_of(tpl_path.read_bytes().decode("utf-8-sig")))
        filled = 0
        for row in work["entries"]:
            if not row["translated_literals"]:
                continue
            block = blocks[row["entry_index"]]
            if B.sha256(block.encode("utf-8")) != row["source_tpl_block_sha256"]:
                problems.append("%s: source TPL block changed" % row["entry_id"])
                continue
            found = check_entry(block, row, encodable, name_width)
            if found:
                problems.extend("%s: %s" % (row["entry_id"], item) for item in found)
                continue
            filled += 1
            entries.append({
                "entry_id": row["entry_id"],
                "selector": work["selector"],
                "entry_index": row["entry_index"],
                "source_entry_offset": row["source_entry_offset"],
                "source_entry_byte_length": row["source_entry_byte_length"],
                "source_entry_sha256": row["source_entry_sha256"],
                "source_entry_raw_hex": row["source_entry_raw_hex"],
                "source_tpl_block_sha256": row["source_tpl_block_sha256"],
                "source_literals": row["source_literals"],
                "translated_literals": row["translated_literals"],
                # For reading only; the build prints translated_literals.
                "draft_translation": " | ".join(value.replace("\n", " / ")
                                                for value in row["translated_literals"]),
                "status": STATUS,
                "review_notes": "uncatalogued archive reached by code literal; "
                                "translated slot by slot; machine draft",
            })
        if not filled:
            continue
        archives.append({
            "selector": work["selector"],
            "archive_offset": work["rom_offset"],
            "storage": storage,
            "stored_byte_length": work["byte_length"],
            **({"payload_byte_length": work["payload_byte_length"]}
               if work.get("payload_byte_length") else {}),
            "decompressed_sha256": B.sha256(raw),
            "tpl_filename": work["tpl_filename"],
            "tpl_sha256": B.sha256(tpl_path.read_bytes()),
        })
    if problems:
        raise SystemExit("rejected:\n  " + "\n  ".join(problems))
    document = {
        "schema_version": 2,
        "kind": "protected_multi_archive_textpet_translation_batch",
        "archives": archives,
        "entries": entries,
        "validation": {"passed": True,
                       "checks": ["source entry hash", "source TPL block hash",
                                  "one translated literal per source literal",
                                  "no kana or kanji left in a filled slot",
                                  "every character encodable by the table or Hangul",
                                  "build substitution agrees with an independent one",
                                  "every page inside the window the source draws",
                                  "no choice left blank or grown (choice_layout)"]},
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(document, ensure_ascii=False, indent=1) + "\n",
                           encoding="utf-8")
    print(json.dumps({"archives": len(archives), "entries": len(entries),
                      "output": str(args.output)}, ensure_ascii=False, indent=2))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("dump", "build"))
    parser.add_argument("--source-rom", type=Path, required=True)
    parser.add_argument("--analysis-dir", type=Path, default=Path("analysis"))
    parser.add_argument("--plugins-dir", type=Path, default=DEFAULT_PLUGINS)
    parser.add_argument("--translations-dir", type=Path, default=Path("translations"))
    parser.add_argument("--tpl", help="dump: TPL path under the analysis directory")
    parser.add_argument("--selector")
    parser.add_argument("--entry-prefix")
    parser.add_argument("--rom-offset", type=lambda x: int(x, 0))
    parser.add_argument("--byte-length", type=lambda x: int(x, 0),
                        help="dump: stored length of a raw archive (a compressed one reads its own)")
    parser.add_argument("--storage", choices=("raw", "lz77"), default="raw")
    parser.add_argument("--work-file", type=Path, action="append", required=True,
                        help="dump: the one work file to write; build: every work file to read")
    parser.add_argument("--output", type=Path,
                        default=Path("translations/archive_uncatalogued_batch_0080.json"))
    args = parser.parse_args()
    if args.mode == "dump":
        if len(args.work_file) != 1 or None in (args.tpl, args.selector, args.entry_prefix,
                                                 args.rom_offset) or (
                args.storage == "raw" and args.byte_length is None):
            parser.error("dump takes one --work-file and the --tpl, --selector, "
                         "--entry-prefix, --rom-offset and --byte-length of its archive")
        dump(args)
    else:
        build(args)


if __name__ == "__main__":
    main()
