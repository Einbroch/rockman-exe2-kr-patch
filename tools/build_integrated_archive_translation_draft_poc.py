#!/usr/bin/env python3
"""Rebuild the integrated Korean translation-draft PoC from untouched Rev 1.

This is the single development entry point for the currently selected scope:
the proven nine-entry active block plus the explicitly selected archive 00/09
dialogue entries. The translation remains a machine draft and the output is
explicitly non-distributable.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import tempfile
from pathlib import Path

from gba_lz77 import decompress


EXPECTED_ORIGINAL_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
EXPECTED_ACTIVE_SHA256 = "6fbf895d2ce778e061e89b95aa092204b110162b2dc0854ea82e613a2a014b86"
EXPECTED_ORIGINAL_SIZE = 0x800000
EXPECTED_OUTPUT_SIZE = 0x1000000
RELOCATION_OFFSET = 0x800000

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


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def run(command: list[str]) -> None:
    subprocess.run(command, check=True)


def write_range(write: dict[str, object]) -> range | None:
    kind = write.get("kind")
    if kind == "relocated_active_block_with_multi_entry_growth":
        start = write.get("target_rom_offset")
        length = write.get("target_byte_length")
    elif kind == "expanded_tail_with_relocated_archive":
        return None
    else:
        start = write.get("rom_offset")
        length = write.get("byte_length")
    if not isinstance(start, int) or not isinstance(length, int) or start < 0 or length <= 0:
        raise ValueError(f"invalid expected write: {write}")
    return range(start, start + length)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--policy", type=Path, required=True)
    parser.add_argument("--translation", type=Path, required=True)
    font_group = parser.add_mutually_exclusive_group(required=True)
    font_group.add_argument("--font", type=Path)
    font_group.add_argument(
        "--exe1-k-font-rom",
        type=Path,
        help="Use the verified external EXE 1 [K] KS X 1001 pixel-font records.",
    )
    parser.add_argument(
        "--font-permission-record",
        type=Path,
        help="User-attested permission record for the EXE 1 [K] font source.",
    )
    parser.add_argument("--font-index", type=int, default=0)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--active-manifest", type=Path, required=True)
    parser.add_argument("--archive-manifest", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument(
        "--decompressed-output",
        type=Path,
        help="Optional exact rebuilt decompressed archive for runtime memory verification.",
    )
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument(
        "--omit-active-probe",
        action="store_true",
        help="Explicitly select the clean default: omit the historical nine-entry 가나다 diagnostic stage.",
    )
    parser.add_argument(
        "--include-active-probe",
        action="store_true",
        help="Opt in to the historical nine-entry 가나다 diagnostic stage; never use this for a clean translation test ROM.",
    )
    parser.add_argument("--force", action="store_true")
    parser.add_argument(
        "--allow-contextual-full-bank",
        action="store_true",
        help="Allow a context-reserved full 0..740 codepage for a subsequently wrapped contextual font-bank build.",
    )
    args = parser.parse_args()
    if args.omit_active_probe and args.include_active_probe:
        parser.error("--omit-active-probe and --include-active-probe are mutually exclusive")
    if args.font_index < 0:
        parser.error("--font-index must be non-negative")
    omit_active_probe = not args.include_active_probe
    if args.include_active_probe and args.exe1_k_font_rom is not None:
        parser.error("--exe1-k-font-rom is supported only by the clean --omit-active-probe composition")
    if args.font is not None and args.font_permission_record is not None:
        parser.error("--font-permission-record applies only to --exe1-k-font-rom")
    if args.exe1_k_font_rom is not None and args.font_permission_record is None:
        parser.error("--exe1-k-font-rom requires --font-permission-record")

    font_path = args.font if args.font is not None else args.exe1_k_font_rom
    assert font_path is not None
    for source in (args.rom, args.codepage, args.policy, args.translation, font_path):
        if not source.is_file():
            raise FileNotFoundError(source)
    outputs = tuple(
        path
        for path in (
            args.output_rom,
            args.active_manifest,
            args.archive_manifest,
            args.manifest,
            args.decompressed_output,
        )
        if path is not None
    )
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
    if original_digest != EXPECTED_ORIGINAL_SHA256 or len(original) != EXPECTED_ORIGINAL_SIZE:
        raise ValueError(f"unexpected original Rev 1 ROM: size={len(original)} sha256={original_digest}")

    tool_dir = Path(__file__).resolve().parent
    active_builder = tool_dir / "build_active_block_multi_entry_growth_poc.py"
    archive_builder = tool_dir / "build_archive_translation_draft_poc.py"
    for path in outputs:
        path.parent.mkdir(parents=True, exist_ok=True)

    with tempfile.TemporaryDirectory(prefix="exe2-translation-draft-") as temporary:
        temporary_dir = Path(temporary)
        active_rom = temporary_dir / "exe2_rev1_active_block_stage.gba"
        if omit_active_probe:
            active_rom = args.rom
            active_digest = original_digest
            clean_base_manifest = {
                "schema_version": 1,
                "kind": "untouched_rev1_archive_translation_base",
                "input": {"filename": args.rom.name, "sha256": original_digest, "byte_length": len(original)},
                "expected_writes": [],
                "output": {"filename": args.rom.name, "sha256": original_digest, "byte_length": len(original)},
                "verification": {"diagnostic_active_block_edits_omitted": True},
            }
            args.active_manifest.write_text(
                json.dumps(clean_base_manifest, ensure_ascii=False, indent=2) + "\n",
                encoding="utf-8",
            )
        else:
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
                "--preview-dir", str(args.preview_dir / "active_block"),
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
            "--translation", str(args.translation),
            "--source-offset", "0x74A484",
            "--source-capacity", "0x110C",
            "--relocation-offset", "0x800000",
            "--expanded-size", "0x1000000",
            "--source-pointer-word-offset", "0x228A4",
            "--output-rom", str(args.output_rom),
            "--manifest", str(args.archive_manifest),
            "--preview-dir", str(args.preview_dir / "archive_00_09"),
        ]
        if args.decompressed_output is not None:
            archive_command.extend(("--decompressed-output", str(args.decompressed_output)))
        if args.allow_contextual_full_bank:
            archive_command.append("--allow-contextual-full-bank")
        if args.font is not None:
            archive_command.extend(("--font", str(args.font), "--font-index", str(args.font_index)))
        else:
            assert args.exe1_k_font_rom is not None
            assert args.font_permission_record is not None
            archive_command.extend((
                "--exe1-k-font-rom", str(args.exe1_k_font_rom),
                "--font-permission-record", str(args.font_permission_record),
            ))
        run(archive_command)

    final = args.output_rom.read_bytes()
    final_digest = sha256(final)
    if len(final) != EXPECTED_OUTPUT_SIZE:
        raise AssertionError(f"unexpected final ROM size: {len(final)}")

    active_manifest_bytes = args.active_manifest.read_bytes()
    archive_manifest_bytes = args.archive_manifest.read_bytes()
    active_manifest = json.loads(active_manifest_bytes)
    archive_manifest = json.loads(archive_manifest_bytes)
    expected_base_digest = original_digest if omit_active_probe else EXPECTED_ACTIVE_SHA256
    if active_manifest.get("output", {}).get("sha256") != expected_base_digest:
        raise AssertionError("base manifest does not identify the selected archive-builder input")
    if archive_manifest.get("output", {}).get("sha256") != final_digest:
        raise AssertionError("archive manifest does not identify the final output")

    allowed_ranges: list[range] = []
    for component in (active_manifest, archive_manifest):
        for write in component.get("expected_writes", []):
            if not isinstance(write, dict):
                raise ValueError("component manifest contains a non-object expected write")
            current = write_range(write)
            if current is not None and current.start < len(original):
                allowed_ranges.append(range(current.start, min(current.stop, len(original))))
    changed_offsets = [
        offset
        for offset, (before, after) in enumerate(zip(original, final[:len(original)], strict=True))
        if before != after
    ]
    escaped = [offset for offset in changed_offsets if not any(offset in allowed for allowed in allowed_ranges)]
    if escaped:
        raise AssertionError(f"original-to-final diff escaped declared writes at 0x{escaped[0]:X}")

    archive = archive_manifest["archive"]
    packed_length = archive["replacement_compressed_byte_length"]
    expected_packed_hash = next(
        write["archive_sha256"]
        for write in archive_manifest["expected_writes"]
        if write["kind"] == "expanded_tail_with_relocated_archive"
    )
    packed = final[RELOCATION_OFFSET:RELOCATION_OFFSET + packed_length]
    if sha256(packed) != expected_packed_hash:
        raise AssertionError("final relocated archive bytes differ from the archive manifest")
    relocated_raw, consumed = decompress(final, RELOCATION_OFFSET)
    if consumed != packed_length or sha256(relocated_raw) != archive["replacement_decompressed_sha256"]:
        raise AssertionError("final relocated archive does not decode to the verified replacement")
    if any(value != 0xFF for value in final[RELOCATION_OFFSET + packed_length:]):
        raise AssertionError("unplanned bytes exist after the relocated archive in the expanded tail")

    translation_bytes = args.translation.read_bytes()
    codepage_bytes = args.codepage.read_bytes()
    policy_bytes = args.policy.read_bytes()
    stages = []
    if omit_active_probe:
        stages.append(
            {
                "name": "untouched_rev1_base",
                "manifest": {"filename": args.active_manifest.name, "sha256": sha256(active_manifest_bytes)},
                "output_sha256": original_digest,
                "diagnostic_active_block_edits_omitted": True,
            }
        )
    else:
        stages.append(
            {
                "name": "active_block_nine_entry_growth",
                "builder": active_builder.name,
                "manifest": {"filename": args.active_manifest.name, "sha256": sha256(active_manifest_bytes)},
                "output_sha256": EXPECTED_ACTIVE_SHA256,
                "edits": list(ACTIVE_EDITS),
                "intermediate_rom_retained": False,
            }
        )
    stages.append(
        {
            "name": "archive_00_09_translation_draft",
            "builder": archive_builder.name,
            "manifest": {"filename": args.archive_manifest.name, "sha256": sha256(archive_manifest_bytes)},
            "output_sha256": final_digest,
            "replacements": archive_manifest["replacements"],
        }
    )

    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_integrated_archive_translation_draft_poc_build",
        "input": {"filename": args.rom.name, "sha256": original_digest, "byte_length": len(original)},
        "translation": {
            "filename": args.translation.name,
            "sha256": sha256(translation_bytes),
            "review_state": "machine_draft_needs_human_review",
            "release_candidate_eligible": False,
        },
        "codepage": {"filename": args.codepage.name, "sha256": sha256(codepage_bytes)},
        "font_source": archive_manifest["font_source"],
        "policy": {"filename": args.policy.name, "sha256": sha256(policy_bytes)},
        "stages": stages,
        "verification": {
            "rebuilt_from_untouched_rev1": True,
            "diagnostic_active_block_edits_omitted": omit_active_probe,
            "active_intermediate_hash_matches_verified_stage": None if omit_active_probe else True,
            "original_to_final_changed_byte_count_within_8mib": len(changed_offsets),
            "changed_bytes_confined_to_component_expected_writes": True,
            "relocated_archive_bytes_match_component_manifest": True,
            "relocated_archive_decodes_to_verified_replacement": True,
            "expanded_tail_outside_archive_is_ff": True,
            "final_byte_length": len(final),
        },
        "output": {"filename": args.output_rom.name, "sha256": final_digest, "byte_length": len(final)},
        "limitations": [
            "This full ROM is a local test artifact and is not a distributable patch.",
            "The selected Korean wording is a machine draft that still needs human approval.",
            f"Only {len(archive_manifest['replacements'])} explicitly selected archive entries are translated; this is not a complete-game Korean patch.",
            "Clean-screen layout and dialogue progression remain to be verified on this exact output hash.",
        ],
    }
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(manifest["verification"], ensure_ascii=False, indent=2))
    print(f"output_sha256={final_digest}")


if __name__ == "__main__":
    main()
