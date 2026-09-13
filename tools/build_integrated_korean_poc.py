#!/usr/bin/env python3
"""Build the verified Korean PoC chain from the untouched Rev 1 ROM.

This orchestrates the two bounded builders already used by the project:

1. relocate the state-observed active message block and insert 가나다 in all
   nine non-empty entries;
2. expand the ROM to 16 MiB, relocate LZ77 archive 00/09, and insert 가나다
   in its state-observed entries 2 and 13.

The intermediate ROM lives only in a temporary directory.  Component and
integrated manifests remain beside the final local test ROM.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import tempfile
from pathlib import Path


EXPECTED_ORIGINAL_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
EXPECTED_ACTIVE_SHA256 = "6fbf895d2ce778e061e89b95aa092204b110162b2dc0854ea82e613a2a014b86"
EXPECTED_FINAL_SHA256 = "25a41bfb0c6aabd3c2bd30c07c06f157b3d77dc0a1ab5fed3f9867b309357509"
EXPECTED_OUTPUT_SIZE = 0x1000000
ARCHIVE_POINTER_WORD_OFFSET = 0x228A4

ACTIVE_EDITS = (
    "0:18:가나다",
    "1:9:가나다",
    "2:19:가나다",
    "3:18:가나다",
    "4:15:가나다",
    "5:20:가나다",
    "6:18:가나다",
    "7:31:가나다",
    "8:17:가나다",
)
ARCHIVE_EDITS = (
    "2:0x14:U+AC00,U+B098,U+B2E4",
    "13:0x2B:U+AC00,U+B098,U+B2E4",
)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def run(command: list[str]) -> None:
    subprocess.run(command, check=True)


def write_ranges(component_manifest: dict[str, object]) -> list[range]:
    ranges: list[range] = []
    for write in component_manifest["expected_writes"]:
        if write["kind"] == "relocated_active_block_with_multi_entry_growth":
            start = int(write["target_rom_offset"])
            length = int(write["target_byte_length"])
        else:
            start = int(write["rom_offset"])
            length = int(write["byte_length"])
        ranges.append(range(start, start + length))
    ranges.append(range(ARCHIVE_POINTER_WORD_OFFSET, ARCHIVE_POINTER_WORD_OFFSET + 4))
    return ranges


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--policy", type=Path, required=True)
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--active-manifest", type=Path, required=True)
    parser.add_argument("--archive-manifest", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    for source in (args.rom, args.codepage, args.policy, args.font):
        if not source.is_file():
            raise FileNotFoundError(source)
    outputs = (args.output_rom, args.active_manifest, args.archive_manifest, args.manifest)
    existing = [path for path in outputs if path.exists()]
    if existing and not args.force:
        names = ", ".join(str(path) for path in existing)
        raise FileExistsError(f"output already exists: {names} (pass --force to replace it)")
    if args.force:
        for path in existing:
            if path.is_dir():
                raise IsADirectoryError(path)
            path.unlink()

    original = args.rom.read_bytes()
    original_digest = sha256(original)
    if original_digest != EXPECTED_ORIGINAL_SHA256:
        raise ValueError(f"unexpected original ROM SHA-256: {original_digest}")

    tool_dir = Path(__file__).resolve().parent
    active_builder = tool_dir / "build_active_block_multi_entry_growth_poc.py"
    archive_builder = tool_dir / "build_state_observed_lz77_archive_poc.py"
    for path in outputs:
        path.parent.mkdir(parents=True, exist_ok=True)

    with tempfile.TemporaryDirectory(prefix="exe2-integrated-") as temporary:
        temporary_dir = Path(temporary)
        active_rom = temporary_dir / "exe2_rev1_active_block_nine_entry_catalog_screened_poc.gba"
        active_command = [
            sys.executable,
            str(active_builder),
            "--rom", str(args.rom),
            "--codepage", str(args.codepage),
            "--policy", str(args.policy),
            "--allow-candidate-unobserved-codepage",
            "--font", str(args.font),
            "--output-rom", str(active_rom),
            "--manifest", str(args.active_manifest),
            "--preview-dir", str(args.preview_dir),
        ]
        for edit in ACTIVE_EDITS:
            active_command.extend(("--edit", edit))
        run(active_command)

        active_bytes = active_rom.read_bytes()
        active_digest = sha256(active_bytes)
        if active_digest != EXPECTED_ACTIVE_SHA256:
            raise AssertionError(f"active-stage ROM hash drifted: {active_digest}")

        archive_command = [
            sys.executable,
            str(archive_builder),
            "--rom", str(active_rom),
            "--expected-input-sha256", active_digest,
            "--base-manifest", str(args.active_manifest),
            "--codepage", str(args.codepage),
            "--source-offset", "0x74A484",
            "--source-capacity", "0x110C",
            "--relocation-offset", "0x800000",
            "--expanded-size", "0x1000000",
            "--source-pointer-word-offset", "0x228A4",
            "--output-rom", str(args.output_rom),
            "--manifest", str(args.archive_manifest),
        ]
        for edit in ARCHIVE_EDITS:
            archive_command.extend(("--edit", edit))
        run(archive_command)

    final = args.output_rom.read_bytes()
    final_digest = sha256(final)
    if len(final) != EXPECTED_OUTPUT_SIZE:
        raise AssertionError(f"unexpected final ROM size: {len(final)}")
    if final_digest != EXPECTED_FINAL_SHA256:
        raise AssertionError(f"final ROM hash drifted: {final_digest}")

    active_manifest_bytes = args.active_manifest.read_bytes()
    active_manifest = json.loads(active_manifest_bytes)
    archive_manifest_bytes = args.archive_manifest.read_bytes()
    archive_manifest = json.loads(archive_manifest_bytes)
    allowed_ranges = write_ranges(active_manifest)
    changed_offsets = [
        offset
        for offset, (before, after) in enumerate(zip(original, final[: len(original)], strict=True))
        if before != after
    ]
    escaped = [offset for offset in changed_offsets if not any(offset in allowed for allowed in allowed_ranges)]
    if escaped:
        raise AssertionError(f"final diff escaped planned ranges at 0x{escaped[0]:X}")

    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_integrated_korean_poc_build",
        "input": {"filename": args.rom.name, "sha256": original_digest, "byte_length": len(original)},
        "stages": [
            {
                "name": "active_block_nine_entry_growth",
                "builder": active_builder.name,
                "manifest": {"filename": args.active_manifest.name, "sha256": sha256(active_manifest_bytes)},
                "output_sha256": EXPECTED_ACTIVE_SHA256,
                "edits": list(ACTIVE_EDITS),
                "intermediate_rom_retained": False,
            },
            {
                "name": "state_observed_lz77_archive_growth",
                "builder": archive_builder.name,
                "manifest": {"filename": args.archive_manifest.name, "sha256": sha256(archive_manifest_bytes)},
                "output_sha256": final_digest,
                "edits": list(ARCHIVE_EDITS),
                "archive": archive_manifest["archive"],
            },
        ],
        "verification": {
            "original_to_final_changed_byte_count_within_8mib": len(changed_offsets),
            "changed_bytes_confined_to_declared_write_ranges": True,
            "final_byte_length": len(final),
            "matches_runtime_validated_rom_sha256": True,
            "runtime_validated_rom_sha256": EXPECTED_FINAL_SHA256,
        },
        "output": {"filename": args.output_rom.name, "sha256": final_digest},
        "limitations": [
            "This is a local test ROM and is not a distributable patch.",
            "Runtime archive loading is proven for this exact output hash, but direct rendering of archive entries 2 and 13 remains to be captured.",
            "The provisional three-glyph codepage is not a production-wide font-slot safety proof.",
        ],
    }
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(manifest["verification"], ensure_ascii=False, indent=2))
    print(f"output_sha256={final_digest}")


if __name__ == "__main__":
    main()
