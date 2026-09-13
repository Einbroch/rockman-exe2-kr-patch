#!/usr/bin/env python3
"""Build a one-byte ED:00 runtime-effect probe from the verified active entry.

The probe is deliberately not a reinsertion tool. It changes only the byte
following the observed ED:00 prefix, keeps entry length and parser code
unchanged, and records hashes rather than source stream bytes.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_korean_glyph_poc import EXPECTED_ROM_SHA256, sha256


ENTRY_OFFSET = 0x77A2AE
ENTRY_LENGTH = 59
ENTRY_SHA256 = "e6d121a664d2014393c1787af7e9fa8716bf285754dc97a9af1b3a396f2f2138"
ARGUMENT_RELATIVE_OFFSET = 0x02
ORIGINAL_ARGUMENT_SHA256 = "f299791cddd3d6664f6670842812ef6053eb6501bd6282a476bbbf3ee91e750c"


def range_hash(data: bytes, offset: int, length: int) -> str:
    return sha256(data[offset:offset + length])


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--argument", type=lambda value: int(value, 0), default=0x13)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if not 0 <= args.argument < 0xE5:
        raise ValueError("probe argument must remain below the extended-glyph prefix range")
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")

    original = args.rom.read_bytes()
    if sha256(original) != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    if range_hash(original, ENTRY_OFFSET, ENTRY_LENGTH) != ENTRY_SHA256:
        raise ValueError("the selected message entry does not match the verified baseline")
    argument_offset = ENTRY_OFFSET + ARGUMENT_RELATIVE_OFFSET
    if range_hash(original, argument_offset, 1) != ORIGINAL_ARGUMENT_SHA256:
        raise ValueError("the ED:00 probe byte does not match the verified baseline")

    output = bytearray(original)
    output[argument_offset] = args.argument
    changed = [
        offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after
    ]
    if changed != [argument_offset]:
        raise AssertionError("output diff escapes the one-byte probe target")

    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_ed_00_runtime_effect_probe",
        "input": {"filename": args.rom.name, "sha256": sha256(original)},
        "entry": {"rom_offset": ENTRY_OFFSET, "byte_length": ENTRY_LENGTH, "sha256": ENTRY_SHA256, "length_preserved": True},
        "expected_writes": [{
            "kind": "one_byte_ed_00_following_value_probe",
            "entry_rom_offset": ENTRY_OFFSET,
            "relative_offset": ARGUMENT_RELATIVE_OFFSET,
            "rom_offset": argument_offset,
            "byte_length": 1,
            "original_range_sha256": ORIGINAL_ARGUMENT_SHA256,
            "replacement_range_sha256": sha256(bytes((args.argument,))),
        }],
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "expected_screen_result": "The same dialogue remains reachable; any visible difference is evidence of a material ED:00-prefix effect.",
        "limitations": [
            "No visible difference does not establish ED:00 semantics or frame width.",
            "Any visible difference leaves ED blocked and requires a follow-up, parameter-specific runtime trace.",
            "The output ROM is a local test artifact and is not a distribution file.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
