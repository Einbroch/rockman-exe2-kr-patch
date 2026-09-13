#!/usr/bin/env python3
"""Wrap and decode EXE2 raw-archive physical continuations with TextPet."""

from __future__ import annotations

import argparse
import json
import shutil
import struct
import subprocess
import tempfile
from pathlib import Path

from build_semantic_translation_dev_rom import (
    directory_argument,
    find_raw_physical_continuations,
    load_batches,
    load_source_archive,
    sha256,
)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-rom", type=Path, required=True)
    parser.add_argument("--translations-dir", type=Path, required=True)
    parser.add_argument("--analysis-dir", type=Path, required=True)
    parser.add_argument("--textpet-exe", type=Path, required=True)
    parser.add_argument("--plugins-dir", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--report", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if (args.output_dir.exists() or args.report.exists()) and not args.force:
        raise FileExistsError("output already exists")
    if args.output_dir.exists():
        shutil.rmtree(args.output_dir)

    rom = args.source_rom.read_bytes()
    _, archives, _ = load_batches(args.translations_dir)
    source_raw = {selector: load_source_archive(rom, metadata) for selector, metadata in archives.items()}
    source_tpl = {
        selector: (args.analysis_dir / metadata["tpl_filename"]).read_bytes()
        for selector, metadata in archives.items()
    }
    continuations = find_raw_physical_continuations(rom, archives, source_raw, source_tpl)
    records: list[dict] = []
    args.output_dir.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="tmp-exe2-continuation-extract-", dir=args.output_dir.parent) as temp_name:
        temp = Path(temp_name)
        binary_dir = temp / "bin"
        plugins_dir = temp / "plugins"
        binary_dir.mkdir()
        shutil.copytree(args.plugins_dir, plugins_dir)
        for selector, continuation in continuations.items():
            payload = continuation["payload"]
            total_length = 4 + len(payload)
            if total_length > 0xFFFF:
                raise ValueError(f"{selector}: wrapped continuation is too large")
            wrapped = struct.pack("<HH", 4, total_length) + payload
            filename = f"{int(continuation['source_rom_offset']):07X}.msg"
            (binary_dir / filename).write_bytes(wrapped)
            records.append({
                "selector": selector,
                "source_rom_offset": continuation["source_rom_offset"],
                "source_byte_length": len(payload),
                "source_sha256": continuation["source_sha256"],
                "wrapped_filename": filename,
                "wrapped_sha256": sha256(wrapped),
            })
        args.output_dir.mkdir()
        command = [
            str(args.textpet_exe.resolve()), "silent",
            "load-plugins", directory_argument(plugins_dir),
            "game", "exe2",
            "read-text-archives", directory_argument(binary_dir), "-f", "bin",
            "write-text-archives", directory_argument(args.output_dir), "-f", "tpl",
        ]
        result = subprocess.run(command, capture_output=True, text=True, encoding="utf-8")
        if result.returncode or "Done." not in result.stdout:
            raise RuntimeError(f"TextPet continuation extraction failed\n{result.stdout}\n{result.stderr}")

    for record in records:
        tpl_path = args.output_dir / (Path(record["wrapped_filename"]).stem + ".tpl")
        if not tpl_path.is_file():
            raise FileNotFoundError(tpl_path)
        record["tpl_filename"] = tpl_path.name
        record["tpl_sha256"] = sha256(tpl_path.read_bytes())
    report = {
        "schema_version": 1,
        "kind": "exe2_raw_physical_continuation_tpl_catalog",
        "continuation_count": len(records),
        "records": records,
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"continuation_count": len(records), "output_dir": str(args.output_dir)}, indent=2))


if __name__ == "__main__":
    main()
