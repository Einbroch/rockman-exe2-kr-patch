#!/usr/bin/env python3
"""Emit a bounded, non-asset Thumb instruction listing for code-path audits."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

from capstone import CS_ARCH_ARM, CS_MODE_THUMB, Cs


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
GBA_ROM_BASE = 0x08000000


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--start", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--length", type=lambda value: int(value, 0), required=True)
    args = parser.parse_args()

    rom = args.rom.read_bytes()
    if hashlib.sha256(rom).hexdigest() != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    if args.start < GBA_ROM_BASE:
        raise ValueError("start must be a GBA CPU ROM address")
    offset = args.start - GBA_ROM_BASE
    if offset + args.length > len(rom):
        raise ValueError("window exceeds ROM")

    engine = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    for insn in engine.disasm(rom[offset : offset + args.length], args.start):
        print(f"0x{insn.address:08X}: {insn.mnemonic:<8} {insn.op_str}")


if __name__ == "__main__":
    main()
