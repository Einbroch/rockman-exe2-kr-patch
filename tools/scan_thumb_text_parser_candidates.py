#!/usr/bin/env python3
"""Locate *candidate* Thumb byte-stream dispatch loops in a GBA ROM.

This deliberately decodes only a small, auditable subset of Thumb-1.  A match
means that a nearby byte load, pointer increment, and high-byte comparison were
found; it does not prove that the code is reachable or is the text renderer.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path


EXPECTED_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
CONTROL_BYTES = (0xED, 0xF1, 0xF9, 0xFA)


def decode(word: int) -> str | None:
    if word & 0xF800 == 0x7800:
        return f"LDRB r{word & 7}, [r{word >> 3 & 7}, #{word >> 6 & 0x1F}]"
    if word & 0xF800 == 0x2800:
        return f"CMP r{word >> 8 & 7}, #{word & 0xFF:#04x}"
    if word & 0xF800 == 0x3000:
        return f"ADD r{word >> 8 & 7}, #{word & 0xFF:#04x}"
    if word & 0xFE00 == 0x1C00:
        return f"ADD r{word & 7}, r{word >> 3 & 7}, #{word >> 6 & 7}"
    if word & 0xFF00 == 0xB500:
        return "PUSH {..., lr}"
    if word & 0xFF00 == 0xBD00:
        return "POP {..., pc}"
    if word & 0xFF87 == 0x4700:
        return "BX register"
    if word & 0xF000 == 0xD000:
        return "conditional branch"
    return None


def is_byte_load(word: int) -> bool:
    # LDRB Rd,[Rb,#imm5] only.  Register-offset forms are intentionally not
    # included, keeping every result independently inspectable.
    return word & 0xF800 == 0x7800


def is_increment(word: int) -> bool:
    if word & 0xF800 == 0x3000:
        return word & 0xFF in (1, 2, 3)
    if word & 0xFE00 == 0x1C00:
        return word >> 6 & 7 in (1, 2, 3)
    return False


def context(words: list[int], center: int, radius: int = 8) -> list[dict[str, object]]:
    result = []
    for index in range(max(0, center - radius), min(len(words), center + radius + 1)):
        word = words[index]
        result.append(
            {
                "rom_offset": index * 2,
                "word_hex": f"{word:04X}",
                "decoded_subset": decode(word),
            }
        )
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--scan-end", type=lambda value: int(value, 0), default=0x200000,
                        help="exclusive ROM offset; defaults to first 2 MiB")
    args = parser.parse_args()

    data = args.rom.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != EXPECTED_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")
    scan_end = min(max(0, args.scan_end), len(data)) & ~1
    words = list(struct.unpack(f"<{scan_end // 2}H", data[:scan_end]))

    comparisons = []
    exact_control_comparisons = []
    for index, word in enumerate(words):
        if word & 0xF800 != 0x2800:
            continue
        immediate = word & 0xFF
        if immediate < 0x80:
            continue
        prior = words[max(0, index - 12):index]
        following = words[index + 1:min(len(words), index + 13)]
        byte_load_count = sum(is_byte_load(value) for value in prior)
        increment_count = sum(is_increment(value) for value in prior + following)
        if not byte_load_count or not increment_count:
            continue
        item = {
            "cmp_rom_offset": index * 2,
            "register": word >> 8 & 7,
            "immediate": immediate,
            "nearby_ldr_byte_count": byte_load_count,
            "nearby_small_increment_count": increment_count,
            "context": context(words, index),
        }
        comparisons.append(item)
        if immediate in CONTROL_BYTES:
            exact_control_comparisons.append(item)

    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest, "scanned_rom_range": [0, scan_end]},
        "control_bytes_under_test": [f"{value:02X}" for value in CONTROL_BYTES],
        "high_byte_comparison_candidates": comparisons,
        "exact_control_byte_comparison_candidates": exact_control_comparisons,
        "interpretation": (
            "A candidate has a Thumb immediate high-byte comparison plus at least one nearby "
            "immediate LDRB and a small ADD. It is only a structural shortlist: code/data "
            "classification, reachability, byte-stream identity, and opcode semantics are unverified."
        ),
        "limitation": (
            "The scan does not decode register-offset loads, ARM code, comparison-via-subtract, "
            "table dispatch, or indirect calls; an empty exact list is not evidence of absence."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
