#!/usr/bin/env python3
"""Find every text archive the ROM points at, and say which the catalogue misses.

The catalogue came from particular pointer tables, so text the game reaches some
other way was never extracted and stays Japanese however much of the catalogue
gets translated - the tutorial battle lines and the battle-result labels are
both in such a region.

Shape alone does not identify an archive: a u16 boundary table is just rising
numbers, and rising numbers occur by accident often enough that a shape scan
finds mostly noise. What does identify one is that something points at it. The
build already relies on this - it relocates an archive by rewriting every
aligned u32 literal equal to its address - so scanning for those literals finds
archives on exactly the terms the build can act on. Recovering all 383
catalogued archives is this scan's own check that the criterion holds.
"""
from __future__ import annotations

import argparse
import collections
import json
import struct
import subprocess
import shutil
import tempfile
from pathlib import Path

ROM_BASE = 0x08000000
MIN_TABLE, MAX_TABLE = 4, 4096
MAX_ARCHIVE = 0x10000


def boundary_table(rom: bytes, offset: int):
    """The archive's boundary table at this offset, or None if the shape fails.

    The first value is the table's own size in bytes, which is what separates a
    table from a run of rising numbers that happens to start anywhere.
    """
    if offset + 2 > len(rom):
        return None
    size = struct.unpack_from("<H", rom, offset)[0]
    if size < MIN_TABLE or size % 2 or size > MAX_TABLE or offset + size > len(rom):
        return None
    values = list(struct.unpack_from("<%dH" % (size // 2), rom, offset))
    if values[0] != size or values != sorted(values):
        return None
    if values[-1] <= size or values[-1] > MAX_ARCHIVE or offset + values[-1] > len(rom):
        return None
    return values


def pointer_targets(rom: bytes) -> collections.Counter:
    targets: collections.Counter = collections.Counter()
    for at in range(0, len(rom) - 4, 4):
        value = struct.unpack_from("<I", rom, at)[0]
        if ROM_BASE <= value < ROM_BASE + len(rom) and not value & 1:
            targets[value - ROM_BASE] += 1
    return targets


def decode(textpet: Path, plugins: Path, rom: bytes, archives: list[dict], out_dir: Path) -> None:
    """Let TextPet decode each archive, so the report carries its text, not a guess."""
    out_dir.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="exe2-uncat-") as name:
        temp = Path(name)
        binary, plugin_copy = temp / "bin", temp / "plugins"
        binary.mkdir()
        shutil.copytree(plugins, plugin_copy)
        # One at a time: TextPet aborts the whole run on the first file it
        # cannot read, and a candidate it rejects is itself an answer - a shape
        # match that will not decode was rising numbers, not an archive.
        for item in archives:
            offset, length = item["rom_offset"], item["byte_length"]
            for stale in binary.glob("*.msg"):
                stale.unlink()
            (binary / ("%07X.msg" % offset)).write_bytes(rom[offset:offset + length])
            command = [
                str(textpet.resolve()), "silent",
                "load-plugins", str(plugin_copy.resolve()) + "\\",
                "game", "exe2",
                "read-text-archives", str(binary.resolve()) + "\\", "-f", "bin",
                "write-text-archives", str(out_dir.resolve()) + "\\", "-f", "tpl",
            ]
            result = subprocess.run(command, capture_output=True, text=True, encoding="utf-8")
            path = out_dir / ("%07X.tpl" % offset)
            item["decoded"] = not (result.returncode
                                   or "Done." not in (result.stdout or "")
                                   or not path.is_file())
            if item["decoded"]:
                item["tpl_filename"] = path.name


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--report", type=Path, required=True)
    parser.add_argument("--min-entries", type=int, default=3)
    parser.add_argument("--textpet-exe", type=Path)
    parser.add_argument("--plugins-dir", type=Path)
    parser.add_argument("--tpl-dir", type=Path)
    args = parser.parse_args()

    rom = args.source_rom.read_bytes()
    manifest = json.loads(args.manifest.read_text(encoding="utf-8"))
    catalogued = {int(item["source_rom_offset"]): item["selector"] for item in manifest["archives"]}
    targets = pointer_targets(rom)

    found, missed = [], []
    for offset, selector in sorted(catalogued.items()):
        (found if offset in targets else missed).append(selector)
    if missed:
        raise SystemExit("this criterion does not reach %d catalogued archives: %s"
                         % (len(missed), missed[:8]))

    uncatalogued = []
    for offset, references in sorted(targets.items()):
        if offset in catalogued:
            continue
        values = boundary_table(rom, offset)
        if values is None or len(values) - 1 < args.min_entries:
            continue
        uncatalogued.append({
            "rom_offset": offset,
            "entry_count": len(values) - 1,
            "byte_length": values[-1],
            "pointer_reference_count": references,
        })
    if args.textpet_exe and args.plugins_dir and args.tpl_dir:
        decode(args.textpet_exe, args.plugins_dir, rom, uncatalogued, args.tpl_dir)

    report = {
        "schema_version": 1,
        "kind": "exe2_pointer_reachable_text_archive_scan",
        "criterion": "aligned u32 literal in ROM plus a valid boundary table",
        "catalogued_recovered": len(found),
        "catalogued_total": len(catalogued),
        "uncatalogued_count": len(uncatalogued),
        "uncatalogued_decoded": sum(1 for item in uncatalogued if item.get("decoded")),
        "uncatalogued_byte_total": sum(item["byte_length"] for item in uncatalogued
                                       if item.get("decoded", True)),
        "uncatalogued": uncatalogued,
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
    print(json.dumps({key: report[key] for key in
                      ("catalogued_recovered", "catalogued_total", "uncatalogued_count",
                       "uncatalogued_decoded", "uncatalogued_byte_total")}, indent=2))


if __name__ == "__main__":
    main()
