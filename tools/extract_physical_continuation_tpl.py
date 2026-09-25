#!/usr/bin/env python3
"""Wrap and decode EXE2 raw-archive physical continuations with TextPet.

A continuation is the bytes between an archive's declared end and the next
catalogued archive. Most are one script tail and are decoded whole. A bulk gap
(longer than a script tail) is usually one tail script followed by unrelated
data - graphics, maps, other tables. Only its head is a script: TextPet decodes
a bounded prefix, the script is cut after its first terminating command, the
cut is recompiled, and it must come back byte for byte as the start of the gap.
That head alone is catalogued, so it can be translated like any other tail.
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import struct
import subprocess
import tempfile
from pathlib import Path

from build_semantic_translation_dev_rom import (
    TERMINAL_EMPTY_SCRIPTS,
    archive_offsets,
    continuation_archive_name,
    directory_argument,
    find_raw_physical_continuations,
    load_batches,
    load_source_archive,
    sha256,
)
from continuation_translation_workfile import SCRIPT_TAIL_LIMIT


# TextPet wraps each tail as one message; the header length field is 16-bit.
MAX_WRAPPED = 0xFFFF
# How much of a bulk gap is decoded to find its head script.
HEAD_PROBE = 0x400
# Commands the command database marks "ends = always".
TERMINATORS = ("end", "waitHold", "startFixedBattle", "startShop")
COMMAND_LINE = re.compile(r"^\t([A-Za-z][A-Za-z0-9]*)\s*$")


def wrap(payload: bytes) -> bytes:
    return struct.pack("<HH", 4, 4 + len(payload)) + payload


def textpet(executable: Path, plugins: Path, source: Path, destination: Path, source_format: str,
            destination_format: str) -> None:
    command = [
        str(executable.resolve()), "silent",
        "load-plugins", directory_argument(plugins),
        "game", "exe2",
        "read-text-archives", directory_argument(source), "-f", source_format,
        "write-text-archives", directory_argument(destination), "-f", destination_format,
    ]
    result = subprocess.run(command, capture_output=True, text=True, encoding="utf-8")
    if result.returncode or "Done." not in result.stdout:
        raise RuntimeError(f"TextPet continuation extraction failed\n{result.stdout}\n{result.stderr}")


def script_head(tpl_text: str) -> str | None:
    """The TPL with script 0 cut after its first terminating command, or None."""
    lines = tpl_text.splitlines(keepends=True)
    start = next(i for i, line in enumerate(lines) if line.startswith("script 0 "))
    in_heredoc = False
    for i in range(start + 1, len(lines)):
        stripped = lines[i].strip()
        if stripped == '"""':
            in_heredoc = not in_heredoc
            continue
        if in_heredoc or stripped.startswith('"'):
            continue
        if stripped == "}":
            return None
        match = COMMAND_LINE.match(lines[i].rstrip("\r\n"))
        if match and match.group(1) in TERMINATORS:
            end = i + 1
            while end < len(lines) and lines[end].startswith("\t\t"):
                end += 1
            newline = "\r\n" if lines[i].endswith("\r\n") else "\n"
            return "".join(lines[:end]) + "}" + newline
    return None


def bulk_heads(bulk: dict[str, dict], executable: Path, plugins: Path, temp: Path) -> dict[str, bytes]:
    """The head script of each bulk gap, proven by recompiling it; gaps without one are left out."""
    probe_bin, probe_tpl, head_tpl, head_bin = (temp / name for name in ("probe_bin", "probe_tpl", "head_tpl", "head_bin"))
    for folder in (probe_bin, probe_tpl, head_tpl, head_bin):
        folder.mkdir()
    names = {selector: continuation_archive_name(continuation) for selector, continuation in bulk.items()}
    for selector, continuation in bulk.items():
        (probe_bin / f"{names[selector]}.msg").write_bytes(wrap(continuation["payload"][:HEAD_PROBE]))
    textpet(executable, plugins, probe_bin, probe_tpl, "bin", "tpl")
    cut = {}
    for selector, name in names.items():
        head = script_head((probe_tpl / f"{name}.tpl").read_bytes().decode("utf-8-sig"))
        if head is not None:
            (head_tpl / f"{name}.tpl").write_bytes(head.encode("utf-8-sig"))
            cut[selector] = name
    if not cut:
        return {}
    textpet(executable, plugins, head_tpl, head_bin, "tpl", "bin")
    heads = {}
    for selector, name in cut.items():
        message = (head_bin / f"{name}.msg").read_bytes()
        offsets = archive_offsets(message)
        head = message[offsets[0]:offsets[1]]
        payload = bulk[selector]["payload"]
        # The recompiled head has to be the gap's own first bytes, exactly.
        if not head or len(head) >= len(payload) or not payload.startswith(head):
            raise ValueError(f"{selector}: recompiled head script is not the start of its gap")
        heads[selector] = head
    return heads


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
    loaded = {selector: load_source_archive(rom, metadata)
              for selector, metadata in archives.items()}
    source_raw = {selector: raw for selector, (raw, _) in loaded.items()}
    source_trailing = {selector: trailing for selector, (_, trailing) in loaded.items()}
    source_tpl = {
        selector: (args.analysis_dir / metadata["tpl_filename"]).read_bytes()
        for selector, metadata in archives.items()
    }
    skipped: list[dict] = []
    continuations = find_raw_physical_continuations(
        rom, archives, source_raw, source_tpl, source_trailing)
    records: list[dict] = []
    args.output_dir.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="tmp-exe2-continuation-extract-", dir=args.output_dir.parent) as temp_name:
        temp = Path(temp_name)
        binary_dir = temp / "bin"
        plugins_dir = temp / "plugins"
        binary_dir.mkdir()
        shutil.copytree(args.plugins_dir, plugins_dir)
        bulk = {}
        for selector, continuation in continuations.items():
            payload = continuation["payload"]
            # A terminal empty script inside a decompressed buffer has no
            # text in it to translate; it is carried verbatim.
            if continuation.get("source_rom_offset") is None and payload in TERMINAL_EMPTY_SCRIPTS:
                skipped.append({"selector": selector, "source_rom_offset": None,
                                "source_byte_length": len(payload),
                                "reason": "not a decodable script tail"})
                continue
            if len(payload) > SCRIPT_TAIL_LIMIT:
                bulk[selector] = continuation
        heads = bulk_heads(bulk, args.textpet_exe, plugins_dir, temp) if bulk else {}
        for selector, continuation in continuations.items():
            payload = continuation["payload"]
            if any(item["selector"] == selector for item in skipped):
                continue
            extra = {}
            if selector in bulk:
                if selector not in heads:
                    skipped.append({"selector": selector,
                                    "source_rom_offset": continuation.get("source_rom_offset"),
                                    "source_byte_length": len(payload),
                                    "reason": "bulk gap with no terminated head script"})
                    continue
                # Only the head is a script; the rest of the gap stays verbatim.
                extra = {"head_of_gap": True, "gap_byte_length": len(payload),
                         "gap_sha256": continuation["source_sha256"]}
                payload = heads[selector]
            wrapped = wrap(payload)
            filename = f"{continuation_archive_name(continuation)}.msg"
            (binary_dir / filename).write_bytes(wrapped)
            records.append({
                "selector": selector,
                "source_rom_offset": continuation["source_rom_offset"],
                "source_byte_length": len(payload),
                "source_sha256": sha256(payload),
                **extra,
                "wrapped_filename": filename,
                "wrapped_sha256": sha256(wrapped),
            })
        args.output_dir.mkdir()
        textpet(args.textpet_exe, plugins_dir, binary_dir, args.output_dir, "bin", "tpl")

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
        "skipped_count": len(skipped),
        "skipped": skipped,
        "records": records,
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"continuation_count": len(records), "skipped_count": len(skipped),
                      "bulk_heads": len(heads), "output_dir": str(args.output_dir)}, indent=2))


if __name__ == "__main__":
    main()
