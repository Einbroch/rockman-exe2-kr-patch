#!/usr/bin/env python3
"""Count high control-byte footprints in protected translation candidate blocks.

The output is aggregate metadata only. It never stores candidate IDs, script
bytes, decoded Japanese text, glyphs, or any other game asset.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
FIRST_CONTROL = 0xE7
LAST_CONTROL = 0xFF


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--workspace", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    digest = sha256(rom)
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")
    workspace = json.loads(args.workspace.read_text(encoding="utf-8"))
    if workspace.get("source", {}).get("rom_sha256") != EXPECTED_ROM_SHA256:
        raise ValueError("workspace does not identify the supported Rev 1 ROM")

    block_footprint_counts: Counter[int] = Counter()
    block_counts: Counter[int] = Counter()
    verified_blocks = 0
    ranges: list[tuple[int, int]] = []
    for block in workspace.get("blocks", []):
        offset = block["source_rom_offset"]
        length = block["source_byte_length"]
        if not isinstance(offset, int) or not isinstance(length, int) or offset < 0 or length <= 0:
            raise ValueError("workspace block has an invalid source range")
        data = rom[offset:offset + length]
        if len(data) != length or sha256(data) != block["source_sha256"]:
            raise ValueError("workspace block does not match the verified ROM")
        verified_blocks += 1
        ranges.append((offset, offset + length))
        present = {value for value in data if FIRST_CONTROL <= value <= LAST_CONTROL}
        block_counts.update(present)
        block_footprint_counts.update(value for value in data if FIRST_CONTROL <= value <= LAST_CONTROL)

    merged_ranges: list[tuple[int, int]] = []
    for start, end in sorted(ranges):
        if merged_ranges and start <= merged_ranges[-1][1]:
            merged_ranges[-1] = (merged_ranges[-1][0], max(merged_ranges[-1][1], end))
        else:
            merged_ranges.append((start, end))
    unique_counts: Counter[int] = Counter()
    for start, end in merged_ranges:
        unique_counts.update(value for value in rom[start:end] if FIRST_CONTROL <= value <= LAST_CONTROL)

    opcodes = [
        {
            "opcode": opcode,
            "block_footprint_occurrence_count": block_footprint_counts[opcode],
            "blocks_with_occurrence": block_counts[opcode],
            "unique_rom_occurrence_count": unique_counts[opcode],
        }
        for opcode in range(FIRST_CONTROL, LAST_CONTROL + 1)
    ]
    report = {
        "schema_version": 1,
        "input": {
            "rom_filename": args.rom.name,
            "rom_sha256": digest,
            "workspace_filename": args.workspace.name,
            "workspace_sha256": sha256(args.workspace.read_bytes()),
        },
        "scope": {
            "verified_candidate_block_count": verified_blocks,
            "unique_covered_range_count": len(merged_ranges),
            "unique_covered_byte_count": sum(end - start for start, end in merged_ranges),
            "opcode_range": [FIRST_CONTROL, LAST_CONTROL],
        },
        "opcodes": opcodes,
        "interpretation_notice": (
            "The block-footprint count includes overlapping candidate ranges; the unique-ROM count scans their merged "
            "physical coverage once. Neither count is a decoded command parse and neither may infer operand lengths, "
            "command names, or editable boundaries."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
