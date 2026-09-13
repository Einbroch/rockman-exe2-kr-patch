#!/usr/bin/env python3
"""Find EXE2 scripts whose numeric jump target is outside their archive table."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

from build_semantic_translation_dev_rom import SCRIPT_RE, archive_offsets, load_batches, load_source_archive


JUMP_RE = re.compile(r"\bjump\s+target\s*=\s*(\d+)")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-rom", type=Path, required=True)
    parser.add_argument("--translations-dir", type=Path, required=True)
    parser.add_argument("--analysis-dir", type=Path, required=True)
    parser.add_argument("--report", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if args.report.exists() and not args.force:
        raise FileExistsError(args.report)

    source = args.source_rom.read_bytes()
    _, archives, _ = load_batches(args.translations_dir)
    ordered = sorted(archives.items(), key=lambda item: int(item[1]["archive_offset"]))
    results: list[dict] = []
    for position, (selector, metadata) in enumerate(ordered):
        raw = load_source_archive(source, metadata)
        entry_count = len(archive_offsets(raw)) - 1
        tpl = (args.analysis_dir / metadata["tpl_filename"]).read_bytes().decode("utf-8-sig")
        for script_match in SCRIPT_RE.finditer(tpl):
            entry_index = int(script_match.group(1))
            for jump_match in JUMP_RE.finditer(script_match.group(0)):
                target = int(jump_match.group(1))
                if target < entry_count:
                    continue
                source_offset = int(metadata["archive_offset"])
                core_end = source_offset + len(raw)
                next_offset = None
                next_selector = None
                if position + 1 < len(ordered):
                    next_selector, next_metadata = ordered[position + 1]
                    next_offset = int(next_metadata["archive_offset"])
                results.append({
                    "selector": selector,
                    "storage": metadata["storage"],
                    "entry_count": entry_count,
                    "entry_index": entry_index,
                    "jump_target": target,
                    "source_rom_offset": source_offset,
                    "source_core_byte_length": len(raw),
                    "source_core_end": core_end,
                    "next_catalog_selector": next_selector,
                    "next_catalog_source_rom_offset": next_offset,
                    "gap_to_next_catalog_archive": None if next_offset is None else next_offset - core_end,
                })

    report = {
        "schema_version": 1,
        "kind": "exe2_out_of_table_jump_audit",
        "archive_count": len(archives),
        "finding_count": len(results),
        "findings": results,
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
