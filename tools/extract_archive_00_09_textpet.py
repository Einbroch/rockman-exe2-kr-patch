#!/usr/bin/env python3
"""Extract and byte-roundtrip the verified EXE2 Rev 1 archive 00/09 with TextPet.

The external executable and plugin directory are explicit, hash-checked inputs.
The generated TPL is a local analysis artifact containing ROM-derived source
text; it is not a distributable project source.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import struct
import subprocess
import tempfile
from pathlib import Path

from gba_lz77 import decompress


SUPPORTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ARCHIVE_OFFSET = 7_644_292
ARCHIVE_RAW_LENGTH = 6_072
ARCHIVE_RAW_SHA256 = "92852d9c874fe0d5293d0c47920f2b987ff1de9fef232fa24489b7700a670667"
ARCHIVE_ENTRY_COUNT = 254
ARCHIVE_TABLE_OFFSET_COUNT = ARCHIVE_ENTRY_COUNT + 1
TEXTPET_EXE_SHA256 = "1a92681bc423869816cd7db0c94ad9b25da23abc0461f45784a06d5236216658"
EXE2_TABLE_SHA256 = "163ed236bf61966353d0621e7c3fd1b57692cff1129db4e8e317bb102b8037f5"
MMBN2_COMMANDS_SHA256 = "9dd059e195bb5a64f9e370bda5e1bb1eb459b6344d1b6df2a984c505015e0ebc"
TEXTPET_RELEASE = "v1.0.0"
TEXTPET_PLUGIN_COMMIT = "6c6d70561290b42d8261f6d76b03051d534c7032"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def checked_bytes(path: Path, expected_sha256: str, label: str) -> bytes:
    data = path.read_bytes()
    actual = sha256(data)
    if actual != expected_sha256:
        raise ValueError(f"{label} SHA-256 mismatch: expected {expected_sha256}, got {actual}")
    return data


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
    if table_bytes % 2 or table_bytes // 2 != ARCHIVE_TABLE_OFFSET_COUNT:
        raise ValueError("archive table does not contain the expected 255 boundary offsets")
    offsets = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, table_bytes, 2)]
    if offsets[0] != table_bytes or offsets[-1] != len(raw):
        raise ValueError("archive table boundaries disagree with the decompressed payload")
    if any(left > right for left, right in zip(offsets, offsets[1:])):
        raise ValueError("archive table offsets are not monotonic")
    return offsets


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--textpet-exe", type=Path, required=True)
    parser.add_argument("--plugins-dir", type=Path, required=True)
    parser.add_argument("--output-tpl", type=Path, required=True)
    parser.add_argument("--output-report", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    for output in (args.output_tpl, args.output_report):
        if output.exists() and not args.force:
            raise FileExistsError(f"output already exists: {output}")

    rom = checked_bytes(args.rom, SUPPORTED_ROM_SHA256, "supported Rev 1 ROM")
    checked_bytes(args.textpet_exe, TEXTPET_EXE_SHA256, "TextPet executable")
    table_path = args.plugins_dir / "exe2-utf8.tbl"
    commands_path = args.plugins_dir / "mmbn2.ini"
    table_bytes = checked_bytes(table_path, EXE2_TABLE_SHA256, "EXE2 text table")
    commands_bytes = checked_bytes(commands_path, MMBN2_COMMANDS_SHA256, "MMBN2 command database")

    raw, compressed_length = decompress(rom, ARCHIVE_OFFSET)
    if len(raw) != ARCHIVE_RAW_LENGTH or sha256(raw) != ARCHIVE_RAW_SHA256:
        raise ValueError("decompressed archive 00/09 identity mismatch")
    offsets = parse_archive_table(raw)

    archive_name = f"{ARCHIVE_OFFSET:07X}.msg"
    tpl_name = f"{ARCHIVE_OFFSET:07X}.tpl"
    with tempfile.TemporaryDirectory(prefix="exe2_archive_00_09_textpet_") as temp_name:
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
            raise FileNotFoundError(f"TextPet did not create the expected TPL: {generated_tpl}")
        tpl_bytes = generated_tpl.read_bytes()

        roundtrip_stdout = run_textpet(
            args.textpet_exe, args.plugins_dir, tpl_output, "tpl", binary_roundtrip, "bin"
        )
        rebuilt_path = binary_roundtrip / archive_name
        if not rebuilt_path.is_file():
            raise FileNotFoundError(f"TextPet did not create the roundtrip archive: {rebuilt_path}")
        rebuilt = rebuilt_path.read_bytes()
        if rebuilt != raw:
            differing = sum(left != right for left, right in zip(raw, rebuilt)) + abs(len(raw) - len(rebuilt))
            raise AssertionError(f"TextPet TPL roundtrip differs from the source archive at {differing} bytes")

    tpl_text = tpl_bytes.decode("utf-8-sig")
    script_ids = [int(value) for value in re.findall(r"(?m)^script\s+(\d+)\s+", tpl_text)]
    expected_ids = [
        index for index, (left, right) in enumerate(zip(offsets, offsets[1:])) if left < right
    ]
    if script_ids != expected_ids:
        raise AssertionError("TextPet TPL script IDs do not match the non-empty archive entries")

    args.output_tpl.parent.mkdir(parents=True, exist_ok=True)
    args.output_report.parent.mkdir(parents=True, exist_ok=True)
    args.output_tpl.write_bytes(tpl_bytes)
    report = {
        "schema_version": 1,
        "kind": "local_textpet_archive_extraction_roundtrip",
        "source": {
            "rom_filename": args.rom.name,
            "rom_sha256": SUPPORTED_ROM_SHA256,
            "archive_selector": [0, 9, 0],
            "archive_rom_offset": ARCHIVE_OFFSET,
            "compressed_byte_length": compressed_length,
            "decompressed_byte_length": len(raw),
            "decompressed_sha256": sha256(raw),
            "entry_count": len(offsets) - 1,
            "empty_entry_count": sum(left == right for left, right in zip(offsets, offsets[1:])),
        },
        "external_component": {
            "name": "TextPet",
            "release": TEXTPET_RELEASE,
            "executable_filename": args.textpet_exe.name,
            "executable_sha256": TEXTPET_EXE_SHA256,
            "plugin_commit": TEXTPET_PLUGIN_COMMIT,
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
