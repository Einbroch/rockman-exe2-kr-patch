#!/usr/bin/env python3
"""Print a small, non-asset Thumb instruction listing for static auditing."""

from __future__ import annotations

import argparse
import hashlib
import struct
from pathlib import Path

from find_thumb_bl_target_refs import thumb_bl_target


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"


def h(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<H", rom, offset)[0]


def branch_target(offset: int, instruction: int, bits: int, scale: int = 1) -> int:
    displacement = (instruction & ((1 << bits) - 1)) << scale
    sign_bit = 1 << (bits + scale - 1)
    if displacement & sign_bit:
        displacement -= sign_bit << 1
    return offset + 4 + displacement


def describe(rom: bytes, offset: int) -> str:
    ins = h(rom, offset)
    nxt = h(rom, offset + 2) if offset + 4 <= len(rom) else 0
    if (ins & 0xF800, nxt & 0xF800) == (0xF000, 0xF800):
        return f"bl {thumb_bl_target(offset, ins, nxt):#08x}"
    if (ins & 0xF800) == 0xE000:
        return f"b {branch_target(offset, ins, 11, 1):#08x}"
    if (ins & 0xF000) == 0xD000:
        condition = (ins >> 8) & 0xF
        return f"b.cond{condition:X} {branch_target(offset, ins, 8, 1):#08x}"
    if (ins & 0xF800) == 0x2000:
        return f"mov r{(ins >> 8) & 7}, #{ins & 0xFF}"
    if (ins & 0xF800) == 0x2800:
        return f"cmp r{(ins >> 8) & 7}, #{ins & 0xFF}"
    if (ins & 0xF800) == 0x3000:
        return f"add r{(ins >> 8) & 7}, #{ins & 0xFF}"
    if (ins & 0xF800) == 0x3800:
        return f"sub r{(ins >> 8) & 7}, #{ins & 0xFF}"
    if (ins & 0xF800) == 0x4800:
        return f"ldr r{(ins >> 8) & 7}, [pc, #{(ins & 0xFF) * 4}]"
    if (ins & 0xF800) == 0x6800:
        return f"ldr r{ins & 7}, [r{(ins >> 3) & 7}, #{((ins >> 6) & 0x1F) * 4}]"
    if (ins & 0xF800) == 0x6000:
        return f"str r{ins & 7}, [r{(ins >> 3) & 7}, #{((ins >> 6) & 0x1F) * 4}]"
    if (ins & 0xF800) == 0x7800:
        return f"ldrb r{ins & 7}, [r{(ins >> 3) & 7}, #{(ins >> 6) & 0x1F}]"
    if (ins & 0xF800) == 0x7000:
        return f"strb r{ins & 7}, [r{(ins >> 3) & 7}, #{(ins >> 6) & 0x1F}]"
    if (ins & 0xFE00) == 0xB400:
        return "push {...}" if not (ins & 0x100) else "push {...,lr}"
    if (ins & 0xFE00) == 0xBC00:
        return "pop {...}" if not (ins & 0x100) else "pop {...,pc}"
    if ins == 0x4770:
        return "bx lr"
    if (ins & 0xFF00) == 0x4700:
        return f"bx r{(ins >> 3) & 0xF}"
    return "other"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--start", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--count", type=int, default=64)
    args = parser.parse_args()
    rom = args.rom.read_bytes()
    if hashlib.sha256(rom).hexdigest() != EXPECTED_ROM_SHA256:
        raise ValueError("unexpected ROM SHA-256")
    for offset in range(args.start, args.start + args.count * 2, 2):
        print(f"{offset:#08x}: {describe(rom, offset)}")


if __name__ == "__main__":
    main()
