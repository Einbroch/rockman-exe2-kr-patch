#!/usr/bin/env python3
"""Relocate the verified active message block without changing its contents.

This is a prerequisite probe for any future variable-length entry experiment.
It copies the known active block to a validated constant-padding candidate and
updates its one statically observed literal pointer.  No message bytes inside
the copied block are changed.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ROM_BASE = 0x08000000
BLOCK_OFFSET = 0x77A298
BLOCK_LENGTH = 525
BLOCK_SHA256 = "e48bab039cbc1c73b7147b7808e51552ad0482156ab7d962653b22dbb6505416"
POINTER_LITERAL_OFFSET = 0x0C84E4
TARGET_OFFSET = 0x7FF970
TARGET_FILL = 0xFF


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")
    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    block = original[BLOCK_OFFSET:BLOCK_OFFSET + BLOCK_LENGTH]
    if len(block) != BLOCK_LENGTH:
        raise ValueError("active block lies outside ROM")
    if sha256(block) != BLOCK_SHA256:
        raise ValueError("active block differs from verified baseline")
    if TARGET_OFFSET % 4 or TARGET_OFFSET + BLOCK_LENGTH > len(original):
        raise ValueError("relocation target is not an in-ROM aligned range")
    target_original = original[TARGET_OFFSET:TARGET_OFFSET + BLOCK_LENGTH]
    if any(value != TARGET_FILL for value in target_original):
        raise ValueError("relocation target does not retain its validated constant fill")
    original_pointer = struct.unpack_from("<I", original, POINTER_LITERAL_OFFSET)[0]
    if original_pointer != ROM_BASE + BLOCK_OFFSET:
        raise ValueError("active block literal does not match verified baseline")

    output = bytearray(original)
    output[TARGET_OFFSET:TARGET_OFFSET + BLOCK_LENGTH] = block
    struct.pack_into("<I", output, POINTER_LITERAL_OFFSET, ROM_BASE + TARGET_OFFSET)
    expected_writes = [
        {
            "kind": "relocated_unchanged_active_block",
            "source_rom_offset": BLOCK_OFFSET,
            "source_byte_length": BLOCK_LENGTH,
            "source_sha256": sha256(block),
            "target_rom_offset": TARGET_OFFSET,
            "target_byte_length": BLOCK_LENGTH,
            "target_original_fill_byte": f"{TARGET_FILL:02X}",
        },
        {
            "kind": "active_block_pointer_literal",
            "rom_offset": POINTER_LITERAL_OFFSET,
            "byte_length": 4,
            "original_pointer": f"{original_pointer:08X}",
            "replacement_pointer": f"{ROM_BASE + TARGET_OFFSET:08X}",
        },
    ]
    allowed_ranges = [
        range(TARGET_OFFSET, TARGET_OFFSET + BLOCK_LENGTH),
        range(POINTER_LITERAL_OFFSET, POINTER_LITERAL_OFFSET + 4),
    ]
    changed = [offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after]
    if not changed or not all(any(offset in allowed for allowed in allowed_ranges) for offset in changed):
        raise AssertionError("output diff escapes relocation write ranges")
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_active_block_relocation_probe",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "expected_writes": expected_writes,
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "The original dialogue should behave identically, demonstrating that this observed call path accepts the relocated unchanged block.",
        "limitations": [
            "A successful screen only validates this block and pointer route in the tested state.",
            "It does not establish that entry offsets are writable boundaries or authorize variable-length text yet.",
            "The output ROM is a local test artifact and is not a distribution file.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
