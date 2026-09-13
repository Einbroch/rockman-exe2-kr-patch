#!/usr/bin/env python3
"""Extract one EXE2 Rev 1 message archive and prove TextPet round-trip identity."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import struct
import subprocess
import tempfile
from pathlib import Path

from gba_lz77 import decompress


SUPPORTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
TEXTPET_EXE_SHA256 = "1a92681bc423869816cd7db0c94ad9b25da23abc0461f45784a06d5236216658"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def directory_argument(path: Path) -> str:
    value = str(path.resolve())
    return value if value.endswith(("/", "\\")) else value + "\\"


def run_textpet(executable: Path, plugins: Path, source: Path, source_format: str,
                destination: Path, destination_format: str) -> str:
    command = [
        str(executable.resolve()),
        "silent",
        "load-plugins", directory_argument(plugins),
        "game", "exe2",
        "read-text-archives", directory_argument(source), "-f", source_format,
        "write-text-archives", directory_argument(destination), "-f", destination_format,
    ]
    result = subprocess.run(command, check=False, capture_output=True, text=True, encoding="utf-8")
    if result.returncode != 0:
        raise RuntimeError(
            f"TextPet failed with exit code {result.returncode}\nSTDOUT:\n{result.stdout}\nSTDERR:\n{result.stderr}"
        )
    return result.stdout


def parse_archive_table(raw: bytes) -> list[int]:
    if len(raw) < 2:
        raise ValueError("archive is too short")
    table_bytes = struct.unpack_from("<H", raw, 0)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(raw):
        raise ValueError("archive has no valid leading 16-bit boundary table")
    offsets = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, table_bytes, 2)]
    if offsets[0] != table_bytes or offsets[-1] != len(raw):
        raise ValueError("archive table boundaries disagree with the decompressed payload")
    if any(left > right for left, right in zip(offsets, offsets[1:])):
        raise ValueError("archive table offsets are not monotonic")
    return offsets


def raw_archive_at(rom: bytes, offset: int, expected_length: int | None) -> bytes:
    if offset < 0 or offset + 2 > len(rom):
        raise ValueError("raw archive offset is outside the ROM")
    table_bytes = struct.unpack_from("<H", rom, offset)[0]
    if table_bytes < 4 or table_bytes % 2 or offset + table_bytes > len(rom):
        raise ValueError("raw archive has no valid leading 16-bit boundary table")
    payload_length = struct.unpack_from("<H", rom, offset + table_bytes - 2)[0]
    if payload_length < table_bytes or offset + payload_length > len(rom):
        raise ValueError("raw archive boundary table points outside the ROM")
    if expected_length is not None and payload_length != expected_length:
        raise ValueError(
            f"raw archive byte length is {payload_length}, expected {expected_length}"
        )
    raw = rom[offset : offset + payload_length]
    parse_archive_table(raw)
    return raw


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--archive-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--selector", required=True, help="Stable label such as 00/11")
    parser.add_argument("--storage", choices=("lz77", "raw"), default="lz77")
    parser.add_argument("--raw-byte-length", type=int)
    parser.add_argument("--textpet-exe", type=Path, required=True)
    parser.add_argument("--plugins-dir", type=Path, required=True)
    parser.add_argument("--output-tpl", type=Path, required=True)
    parser.add_argument("--output-report", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    for output in (args.output_tpl, args.output_report):
        if output.exists() and not args.force:
            raise FileExistsError(f"output already exists: {output}")

    rom = args.rom.read_bytes()
    if sha256(rom) != SUPPORTED_ROM_SHA256:
        raise ValueError("supported Rev 1 ROM SHA-256 mismatch")
    if sha256(args.textpet_exe.read_bytes()) != TEXTPET_EXE_SHA256:
        raise ValueError("TextPet executable SHA-256 mismatch")
    table_path = args.plugins_dir / "exe2-utf8.tbl"
    commands_path = args.plugins_dir / "mmbn2.ini"
    table_bytes = table_path.read_bytes()
    commands_bytes = commands_path.read_bytes()

    if args.storage == "lz77":
        if args.raw_byte_length is not None:
            raise ValueError("--raw-byte-length is valid only with --storage raw")
        raw, stored_length = decompress(rom, args.archive_offset)
    else:
        raw = raw_archive_at(rom, args.archive_offset, args.raw_byte_length)
        stored_length = len(raw)
    offsets = parse_archive_table(raw)
    archive_name = f"{args.archive_offset:07X}.msg"
    tpl_name = f"{args.archive_offset:07X}.tpl"
    # Keep transient TextPet files inside the active title workspace rather
    # than the host-wide temporary directory.
    with tempfile.TemporaryDirectory(
        prefix="tmp-exe2-textpet-", dir=args.output_tpl.parent
    ) as temp_name:
        temp = Path(temp_name)
        binary_input = temp / "binary_input"
        tpl_output = temp / "tpl_output"
        binary_roundtrip = temp / "binary_roundtrip"
        for directory in (binary_input, tpl_output, binary_roundtrip):
            directory.mkdir()
        (binary_input / archive_name).write_bytes(raw)
        extract_stdout = run_textpet(
            args.textpet_exe, args.plugins_dir, binary_input, "bin", tpl_output, "tpl"
        )
        generated_tpl = tpl_output / tpl_name
        if not generated_tpl.is_file():
            raise FileNotFoundError(generated_tpl)
        tpl_bytes = generated_tpl.read_bytes()
        roundtrip_stdout = run_textpet(
            args.textpet_exe, args.plugins_dir, tpl_output, "tpl", binary_roundtrip, "bin"
        )
        rebuilt = (binary_roundtrip / archive_name).read_bytes()
        if rebuilt != raw:
            differing = sum(left != right for left, right in zip(raw, rebuilt)) + abs(len(raw) - len(rebuilt))
            raise AssertionError(f"TextPet round-trip differs from source at {differing} bytes")

    tpl_text = tpl_bytes.decode("utf-8-sig")
    script_ids = [int(value) for value in re.findall(r"(?m)^script\s+(\d+)\s+", tpl_text)]
    expected_ids = [
        index for index, (left, right) in enumerate(zip(offsets, offsets[1:])) if left < right
    ]
    if script_ids != expected_ids:
        raise AssertionError("TPL script IDs differ from the non-empty archive entries")

    args.output_tpl.parent.mkdir(parents=True, exist_ok=True)
    args.output_report.parent.mkdir(parents=True, exist_ok=True)
    args.output_tpl.write_bytes(tpl_bytes)
    report = {
        "schema_version": 1,
        "kind": "local_textpet_archive_extraction_roundtrip",
        "source": {
            "rom_filename": args.rom.name,
            "rom_sha256": SUPPORTED_ROM_SHA256,
            "archive_selector": args.selector,
            "archive_rom_offset": args.archive_offset,
            "storage": args.storage,
            "stored_byte_length": stored_length,
            "compressed_byte_length": stored_length if args.storage == "lz77" else None,
            "decompressed_byte_length": len(raw),
            "decompressed_sha256": sha256(raw),
            "entry_count": len(offsets) - 1,
            "non_empty_entry_count": len(expected_ids),
            "empty_entry_count": len(offsets) - 1 - len(expected_ids),
        },
        "external_component": {
            "textpet_filename": args.textpet_exe.name,
            "textpet_sha256": TEXTPET_EXE_SHA256,
            "table_filename": table_path.name,
            "table_sha256": sha256(table_bytes),
            "command_database_filename": commands_path.name,
            "command_database_sha256": sha256(commands_bytes),
        },
        "output": {
            "tpl_filename": args.output_tpl.name,
            "tpl_sha256": sha256(tpl_bytes),
            "non_empty_script_count": len(script_ids),
            "non_empty_script_ids_match_table": True,
        },
        "roundtrip": {
            "textpet_extract_completed": "Done." in extract_stdout,
            "textpet_rebuild_completed": "Done." in roundtrip_stdout,
            "rebuilt_byte_length": len(rebuilt),
            "rebuilt_sha256": sha256(rebuilt),
            "source_byte_identical": True,
        },
        "distribution": {
            "local_analysis_only": True,
            "contains_rom_derived_source_text": True,
            "eligible_for_distribution": False,
        },
        "passed": True,
    }
    args.output_report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
