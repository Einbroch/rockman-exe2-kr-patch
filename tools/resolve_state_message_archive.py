#!/usr/bin/env python3
"""Resolve and verify the LZ77 message archive selected in an mGBA state.

The output contains metadata, offsets, hashes, and comparison counts only.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

from inspect_renderer_state_pointer import EWRAM_BASE, EWRAM_STATE_START, ROM_BASE, state_payload


POOL_ADDRESS = 0x02038800


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def rom_u32(rom: bytes, address: int) -> int:
    offset = address - ROM_BASE
    if not 0 <= offset <= len(rom) - 4:
        raise ValueError(f"ROM address is outside input: {address:#010x}")
    return struct.unpack_from("<I", rom, offset)[0]


def gba_lz77_decompress(rom: bytes, source_offset: int) -> tuple[bytes, int]:
    if not 0 <= source_offset <= len(rom) - 4 or rom[source_offset] != 0x10:
        raise ValueError("source is not a GBA LZ77 0x10 stream")
    output_length = int.from_bytes(rom[source_offset + 1 : source_offset + 4], "little")
    source = source_offset + 4
    output = bytearray()
    while len(output) < output_length:
        if source >= len(rom):
            raise ValueError("truncated LZ77 flag byte")
        flags = rom[source]
        source += 1
        for bit in range(7, -1, -1):
            if len(output) >= output_length:
                break
            if flags & (1 << bit):
                if source + 2 > len(rom):
                    raise ValueError("truncated LZ77 back-reference")
                first, second = rom[source], rom[source + 1]
                source += 2
                length = (first >> 4) + 3
                displacement = ((first & 0x0F) << 8) | second
                copy_from = len(output) - displacement - 1
                if copy_from < 0:
                    raise ValueError("invalid LZ77 displacement")
                for _ in range(length):
                    output.append(output[copy_from])
                    copy_from += 1
                    if len(output) >= output_length:
                        break
            else:
                if source >= len(rom):
                    raise ValueError("truncated LZ77 literal")
                output.append(rom[source])
                source += 1
    return bytes(output), source - source_offset


def resolve_archive_source(rom: bytes, selector: tuple[int, int, int]) -> tuple[int, str]:
    major, minor, tertiary = selector
    if major == 0 and minor == 0 and tertiary >= 0x30:
        return rom_u32(rom, ROM_BASE + 0x20B04), "special_0_0_tertiary_ge_0x30"
    if major < 0x80:
        root_address, normalized = ROM_BASE + 0x22804, major
        route = "primary"
    elif major < 0xF0:
        root_address, normalized = ROM_BASE + 0x22828, major - 0x80
        route = "secondary"
    else:
        root_address, normalized = ROM_BASE + 0x2287C, major - 0xF0
        route = "tertiary"
    row_address = rom_u32(rom, root_address + normalized * 4)
    return rom_u32(rom, row_address + minor * 4), route


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    payload = state_payload(args.input)
    rom = args.rom.read_bytes()
    r10 = struct.unpack_from("<I", payload, 0x20 + 10 * 4)[0]
    game_state_address = rom_u32(rom, r10 + 8)
    if not EWRAM_BASE <= game_state_address < EWRAM_BASE + 0x40000:
        raise ValueError("game-state global does not point into EWRAM")
    game_state_offset = EWRAM_STATE_START + game_state_address - EWRAM_BASE
    selector = tuple(payload[game_state_offset + relative] for relative in (4, 5, 6))
    source_address, route = resolve_archive_source(rom, selector)
    source_offset = source_address - ROM_BASE
    decompressed, compressed_length = gba_lz77_decompress(rom, source_offset)
    pool_offset = EWRAM_STATE_START + POOL_ADDRESS - EWRAM_BASE
    observed = payload[pool_offset : pool_offset + len(decompressed)]
    differing = [index for index, (left, right) in enumerate(zip(decompressed, observed, strict=True)) if left != right]
    report = {
        "schema_version": 1,
        "kind": "state_selected_lz77_message_archive",
        "input": {"filename": args.input.name, "sha256": sha256(args.input.read_bytes())},
        "state_payload": {"sha256": sha256(payload), "byte_length": len(payload)},
        "rom": {"filename": args.rom.name, "sha256": sha256(rom)},
        "selector": {"major": selector[0], "minor": selector[1], "tertiary": selector[2], "route": route},
        "archive": {
            "source_rom_offset": source_offset,
            "source_rom_address": source_address,
            "compressed_byte_length": compressed_length,
            "compressed_sha256": sha256(rom[source_offset : source_offset + compressed_length]),
            "decompressed_byte_length": len(decompressed),
            "decompressed_sha256": sha256(decompressed),
        },
        "observed_pool": {
            "ewram_address": POOL_ADDRESS,
            "byte_length": len(observed),
            "sha256": sha256(observed),
            "exactly_matches_decompressed_archive": not differing,
            "differing_byte_count": len(differing),
            "first_differing_relative_offsets": differing[:16],
        },
        "interpretation_notice": (
            "An exact match proves that the saved EWRAM message pool is the BIOS-LZ77 output of the selected ROM "
            "archive. It does not by itself identify every entry's on-screen context or authorize growth beyond "
            "the compressed source range."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
