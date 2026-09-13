#!/usr/bin/env python3
"""Build a non-distributable context-selected 741-record font-bank PoC.

The original Rev 1 font bank is restored for ordinary Japanese text.  A full
copy of the current development font bank is placed in expanded ROM and is
selected only while the renderer cursor lies in one declared translated
archive-entry interval.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


SUPPORTED_ORIGINAL_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ROM_BASE = 0x08000000
FONT_BASE_OFFSET = 0x006973B0
FONT_RECORD_BYTES = 64
FONT_RECORD_COUNT = 741
FONT_BANK_BYTES = FONT_RECORD_BYTES * FONT_RECORD_COUNT
HOOK_OFFSET = 0x00020D84
CONTINUATION_OFFSET = 0x00020D8C
EXPECTED_HOOK_SOURCE = bytes.fromhex("88 46 78 48 89 01 40 18")


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_json(path: Path) -> dict[str, object]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"JSON root must be an object: {path}")
    return value


def archive_offsets(raw: bytes) -> list[int]:
    if len(raw) < 2:
        raise ValueError("decompressed archive is too short")
    table_bytes = struct.unpack_from("<H", raw, 0)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(raw):
        raise ValueError("decompressed archive has an invalid offset table")
    values = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, table_bytes, 2)]
    if values[0] != table_bytes or any(left > right for left, right in zip(values, values[1:])):
        raise ValueError("decompressed archive offset table is not monotonic")
    if values[-1] != len(raw):
        raise ValueError("decompressed archive table does not cover the full payload")
    return values


def make_trampoline(
    trampoline_offset: int,
    context_start: int,
    context_end: int,
    alternate_font_base: int,
) -> bytes:
    """Return a fixed Thumb-1 trampoline plus its aligned literal pool."""
    halfwords = [
        0x4688,  # mov r8, r1 (first overwritten instruction)
        0x4A06,  # ldr r2, =context_start
        0x4294,  # cmp r4, r2
        0xD304,  # blo original_base
        0x4A05,  # ldr r2, =context_end
        0x4294,  # cmp r4, r2
        0xD201,  # bhs original_base
        0x4805,  # ldr r0, =alternate_font_base
        0xE000,  # b resolved_base
        0x4805,  # original_base: ldr r0, =original_font_base
        0x0189,  # resolved_base: lsl r1, r1, #6
        0x1840,  # add r0, r0, r1
        0x4B04,  # ldr r3, =continuation|1
        0x4718,  # bx r3
    ]
    code = struct.pack("<14H", *halfwords)
    if (trampoline_offset + len(code)) % 4:
        raise AssertionError("trampoline literal pool is not word aligned")
    literals = struct.pack(
        "<5I",
        context_start,
        context_end,
        alternate_font_base,
        ROM_BASE + FONT_BASE_OFFSET,
        ROM_BASE + CONTINUATION_OFFSET + 1,
    )
    result = code + literals
    if len(result) != 48:
        raise AssertionError("unexpected trampoline size")
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--original-rom", type=Path, required=True)
    parser.add_argument("--integrated-manifest", type=Path, required=True)
    parser.add_argument("--archive-manifest", type=Path, required=True)
    parser.add_argument("--permission-record", type=Path, required=True)
    parser.add_argument("--codepage", type=Path, required=True)
    parser.add_argument("--decompressed-archive", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--alternate-bank-offset", type=lambda value: int(value, 0), default=0x00810000)
    parser.add_argument("--trampoline-offset", type=lambda value: int(value, 0), default=0x0081C000)
    parser.add_argument("--ewram-archive-base", type=lambda value: int(value, 0), default=0x02038800)
    parser.add_argument("--context-first-entry", type=int, default=0)
    parser.add_argument("--context-end-entry-exclusive", type=int, default=32)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output exists: {args.output_rom}")

    current = args.rom.read_bytes()
    original = args.original_rom.read_bytes()
    current_sha = sha256(current)
    original_sha = sha256(original)
    if original_sha != SUPPORTED_ORIGINAL_SHA256 or len(original) != 0x800000:
        raise ValueError("original ROM is not the supported untouched Rev 1 image")
    if len(current) != 0x1000000:
        raise ValueError("input development ROM must be exactly 16 MiB")
    if current[HOOK_OFFSET:HOOK_OFFSET + len(EXPECTED_HOOK_SOURCE)] != EXPECTED_HOOK_SOURCE:
        raise ValueError("font-indexer hook source bytes do not match Rev 1")

    integrated_bytes = args.integrated_manifest.read_bytes()
    integrated = read_json(args.integrated_manifest)
    if integrated.get("output", {}).get("sha256") != current_sha:
        raise ValueError("integrated manifest does not attest to the input ROM")
    archive_manifest_bytes = args.archive_manifest.read_bytes()
    archive_manifest = read_json(args.archive_manifest)
    if archive_manifest.get("output", {}).get("sha256") != current_sha:
        raise ValueError("archive manifest does not attest to the input ROM")

    permission_bytes = args.permission_record.read_bytes()
    permission = read_json(args.permission_record)
    if permission.get("kind") != "third_party_font_permission_record":
        raise ValueError("permission record has an unexpected kind")
    permission_status = permission.get("adopted_effect", {}).get("font_reuse_permission_status")
    documentary_copy_stored = permission.get("human_attestation", {}).get(
        "documentary_permission_copy_stored_in_workspace"
    )
    if permission.get("state") != "adopted" or permission_status != "permission_received_user_attested":
        raise ValueError("permission record does not authorize the declared font reuse")
    declared_permission = archive_manifest.get("font_source", {}).get("permission_record", {})
    if declared_permission.get("sha256") != sha256(permission_bytes):
        raise ValueError("archive manifest and permission record do not match")

    codepage_bytes = args.codepage.read_bytes()
    codepage = read_json(args.codepage)
    if codepage.get("kind") != "provisional_korean_codepage":
        raise ValueError("codepage has an unexpected kind")
    mapping_indices = [entry.get("font_record_index") for entry in codepage.get("entries", [])]
    if not mapping_indices or not all(isinstance(index, int) and 0 <= index < FONT_RECORD_COUNT for index in mapping_indices):
        raise ValueError("codepage contains an invalid font record index")
    if len(mapping_indices) != len(set(mapping_indices)):
        raise ValueError("codepage reuses a font record index")

    archive_bytes = args.decompressed_archive.read_bytes()
    offsets = archive_offsets(archive_bytes)
    first = args.context_first_entry
    end = args.context_end_entry_exclusive
    if not 0 <= first < end < len(offsets):
        raise ValueError("declared contextual entry interval is outside the archive table")
    context_start = args.ewram_archive_base + offsets[first]
    context_end = args.ewram_archive_base + offsets[end]

    bank_offset = args.alternate_bank_offset
    trampoline_offset = args.trampoline_offset
    bank_end = bank_offset + FONT_BANK_BYTES
    trampoline = make_trampoline(
        trampoline_offset,
        context_start,
        context_end,
        ROM_BASE + bank_offset,
    )
    trampoline_end = trampoline_offset + len(trampoline)
    if not (0x800000 <= bank_offset < bank_end <= len(current)):
        raise ValueError("alternate font bank is outside expanded ROM")
    if not (bank_end <= trampoline_offset and trampoline_end <= len(current)):
        raise ValueError("trampoline overlaps the font bank or lies outside ROM")
    for start, stop, label in (
        (bank_offset, bank_end, "alternate font bank"),
        (trampoline_offset, trampoline_end, "trampoline"),
    ):
        if any(value != 0xFF for value in current[start:stop]):
            raise ValueError(f"{label} target is not clean expanded-ROM fill")

    original_bank = original[FONT_BASE_OFFSET:FONT_BASE_OFFSET + FONT_BANK_BYTES]
    current_bank = current[FONT_BASE_OFFSET:FONT_BASE_OFFSET + FONT_BANK_BYTES]
    if len(original_bank) != FONT_BANK_BYTES or len(current_bank) != FONT_BANK_BYTES:
        raise AssertionError("font bank slice is incomplete")
    output = bytearray(current)
    output[FONT_BASE_OFFSET:FONT_BASE_OFFSET + FONT_BANK_BYTES] = original_bank
    output[bank_offset:bank_end] = current_bank
    output[trampoline_offset:trampoline_end] = trampoline
    hook = struct.pack("<HHI", 0x4B00, 0x4718, ROM_BASE + trampoline_offset + 1)
    output[HOOK_OFFSET:HOOK_OFFSET + len(hook)] = hook

    # Every declared Korean record must survive byte-for-byte in the alternate bank.
    for index in mapping_indices:
        source_start = FONT_BASE_OFFSET + index * FONT_RECORD_BYTES
        alternate_start = bank_offset + index * FONT_RECORD_BYTES
        if output[alternate_start:alternate_start + FONT_RECORD_BYTES] != current[source_start:source_start + FONT_RECORD_BYTES]:
            raise AssertionError(f"alternate font record mismatch at index {index}")
    if output[FONT_BASE_OFFSET:FONT_BASE_OFFSET + FONT_BANK_BYTES] != original_bank:
        raise AssertionError("ordinary font bank was not restored exactly")

    changed_prefix = [
        offset for offset, (before, after) in enumerate(zip(current[:0x800000], output[:0x800000], strict=True))
        if before != after
    ]
    allowed_prefix = range(HOOK_OFFSET, HOOK_OFFSET + len(hook))
    font_range = range(FONT_BASE_OFFSET, FONT_BASE_OFFSET + FONT_BANK_BYTES)
    if not changed_prefix or not all(offset in allowed_prefix or offset in font_range for offset in changed_prefix):
        raise AssertionError("input-to-output changes escape the hook and restored font bank")

    output_bytes = bytes(output)
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output_bytes)
    report = {
        "schema_version": 1,
        "kind": "non_distributable_context_selected_full_font_bank_poc",
        "input": {"filename": args.rom.name, "sha256": current_sha, "byte_length": len(current)},
        "original": {"filename": args.original_rom.name, "sha256": original_sha},
        "integrated_manifest": {"filename": args.integrated_manifest.name, "sha256": sha256(integrated_bytes)},
        "archive_manifest": {"filename": args.archive_manifest.name, "sha256": sha256(archive_manifest_bytes)},
        "permission_record": {
            "filename": args.permission_record.name,
            "sha256": sha256(permission_bytes),
            "status": permission_status,
            "documentary_copy_stored": documentary_copy_stored,
        },
        "codepage": {
            "filename": args.codepage.name,
            "sha256": sha256(codepage_bytes),
            "mapped_record_count": len(mapping_indices),
        },
        "context": {
            "archive_filename": args.decompressed_archive.name,
            "archive_sha256": sha256(archive_bytes),
            "ewram_archive_base": f"0x{args.ewram_archive_base:08X}",
            "first_entry_inclusive": first,
            "end_entry_exclusive": end,
            "cursor_start_inclusive": f"0x{context_start:08X}",
            "cursor_end_exclusive": f"0x{context_end:08X}",
        },
        "font_banks": {
            "record_count": FONT_RECORD_COUNT,
            "record_byte_length": FONT_RECORD_BYTES,
            "ordinary_original_bank_rom_offset": FONT_BASE_OFFSET,
            "ordinary_original_bank_sha256": sha256(original_bank),
            "alternate_context_bank_rom_offset": bank_offset,
            "alternate_context_bank_sha256": sha256(current_bank),
        },
        "hook": {
            "rom_offset": HOOK_OFFSET,
            "byte_length": len(hook),
            "replacement_hex": hook.hex(" "),
            "trampoline_rom_offset": trampoline_offset,
            "trampoline_byte_length": len(trampoline),
            "trampoline_sha256": sha256(trampoline),
            "continuation_rom_offset": CONTINUATION_OFFSET,
        },
        "verification": {
            "ordinary_font_bank_restored_exactly": True,
            "all_declared_korean_records_copied_to_alternate_bank": True,
            "input_prefix_changes_confined_to_hook_and_font_restore": True,
            "expanded_targets_were_ff": True,
            "archive_payload_unchanged": True,
        },
        "output": {"filename": args.output_rom.name, "sha256": sha256(output_bytes), "byte_length": len(output_bytes)},
        "limitations": [
            (
                "The context predicate is proven only for archive 00/09 entries "
                f"{first} through {end - 1} at the declared EWRAM load address."
            ),
            (
                f"This PoC uses the separately compiled {len(mapping_indices)}-record contextual codepage; "
                "each expanded translation range still requires focused runtime QA."
            ),
            "Permission is recorded from the project user's attestation; no documentary permission copy is stored in the workspace.",
            "The output is a local development ROM, not a distributable patch.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report["verification"], indent=2))
    print(f"output_sha256={report['output']['sha256']}")


if __name__ == "__main__":
    main()
