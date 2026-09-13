#!/usr/bin/env python3
"""Move one already-relocated PoC block to verified constant padding.

This is a bounded chain-maintenance step: it validates the prior manifest,
copies the existing relocated bytes unchanged, repoints only its declared
literal words, restores the vacated range to its recorded fill byte, and
rejects any unplanned output difference.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


ROM_BASE = 0x08000000


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--expected-input-sha256", required=True)
    parser.add_argument("--prior-manifest", type=Path, required=True)
    parser.add_argument("--new-target-offset", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()
    if args.output_rom.exists():
        raise FileExistsError(f"output already exists: {args.output_rom}")

    source = args.rom.read_bytes()
    if digest(source).lower() != args.expected_input_sha256.lower():
        raise ValueError("input ROM SHA-256 differs from the declared base")
    prior_bytes = args.prior_manifest.read_bytes()
    prior = json.loads(prior_bytes)
    if prior.get("output", {}).get("sha256") != digest(source):
        raise ValueError("prior manifest does not attest to this input ROM")
    writes = prior.get("expected_writes", [])
    relocation = next((item for item in writes if item.get("kind", "").startswith("relocated_")), None)
    literals = next((item for item in writes if item.get("kind") == "block_pointer_literals"), None)
    if not isinstance(relocation, dict) or not isinstance(literals, dict):
        raise ValueError("prior manifest lacks a relocated block and its literal words")
    old_target = int(relocation["target_rom_offset"])
    byte_length = int(relocation["target_byte_length"])
    fill = int(str(relocation["target_fill_byte"]), 16)
    literal_offsets = [int(value) for value in literals["literal_word_rom_offsets"]]
    old_pointer = ROM_BASE + old_target
    if args.new_target_offset % 4:
        raise ValueError("new target must be 4-byte aligned")
    new_end = args.new_target_offset + byte_length
    old_end = old_target + byte_length
    if not (0 <= old_target < old_end <= len(source) and 0 <= args.new_target_offset < new_end <= len(source)):
        raise ValueError("relocation range is outside the input ROM")
    if not (new_end <= old_target or old_end <= args.new_target_offset):
        raise ValueError("new target overlaps the prior relocated range")
    if any(value != fill for value in source[args.new_target_offset:new_end]):
        raise ValueError("new target is not constant padding with the prior recorded fill byte")
    for offset in literal_offsets:
        if struct.unpack_from("<I", source, offset)[0] != old_pointer:
            raise ValueError("a prior literal word no longer points at the declared relocated block")

    payload = source[old_target:old_end]
    output = bytearray(source)
    output[args.new_target_offset:new_end] = payload
    output[old_target:old_end] = bytes([fill]) * byte_length
    for offset in literal_offsets:
        struct.pack_into("<I", output, offset, ROM_BASE + args.new_target_offset)
    allowed = [range(old_target, old_end), range(args.new_target_offset, new_end)]
    allowed.extend(range(offset, offset + 4) for offset in literal_offsets)
    changed = [offset for offset, (before, after) in enumerate(zip(source, output, strict=True)) if before != after]
    if not changed or not all(any(offset in region for region in allowed) for offset in changed):
        raise AssertionError("output diff escapes planned relocation ranges")

    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_chained_poc_block_repack",
        "input": {"filename": args.rom.name, "sha256": digest(source)},
        "prior_manifest": {"filename": args.prior_manifest.name, "sha256": digest(prior_bytes)},
        "moved_block": {
            "block_id": relocation["block_id"],
            "old_target_rom_offset": old_target,
            "new_target_rom_offset": args.new_target_offset,
            "byte_length": byte_length,
            "payload_sha256": digest(payload),
            "vacated_fill_byte": f"{fill:02X}",
            "literal_word_rom_offsets": literal_offsets,
        },
        "changed_byte_count": len(changed),
        "output": {"filename": args.output_rom.name, "sha256": digest(bytes(output))},
        "limitations": [
            "This only repacks an already validated PoC block.",
            "It is an internal derived input for a subsequent bounded PoC build, not a distribution artifact.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
