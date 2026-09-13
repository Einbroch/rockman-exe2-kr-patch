#!/usr/bin/env python3
"""Minimal deterministic GBA BIOS LZ77 (type 0x10) codec helpers."""

from __future__ import annotations


def decompress(data: bytes, source_offset: int = 0) -> tuple[bytes, int]:
    if not 0 <= source_offset <= len(data) - 4 or data[source_offset] != 0x10:
        raise ValueError("source is not a GBA LZ77 0x10 stream")
    output_length = int.from_bytes(data[source_offset + 1 : source_offset + 4], "little")
    source = source_offset + 4
    output = bytearray()
    while len(output) < output_length:
        if source >= len(data):
            raise ValueError("truncated LZ77 flags")
        flags = data[source]
        source += 1
        for bit in range(7, -1, -1):
            if len(output) >= output_length:
                break
            if flags & (1 << bit):
                if source + 2 > len(data):
                    raise ValueError("truncated LZ77 back-reference")
                first, second = data[source], data[source + 1]
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
                if source >= len(data):
                    raise ValueError("truncated LZ77 literal")
                output.append(data[source])
                source += 1
    return bytes(output), source - source_offset


def compress(raw: bytes) -> bytes:
    if len(raw) > 0xFFFFFF:
        raise ValueError("GBA LZ77 length field is 24-bit")
    output = bytearray((0x10, len(raw) & 0xFF, (len(raw) >> 8) & 0xFF, (len(raw) >> 16) & 0xFF))
    position = 0
    while position < len(raw):
        flag_position = len(output)
        output.append(0)
        flags = 0
        for bit in range(7, -1, -1):
            if position >= len(raw):
                break
            best_length = 0
            best_displacement = 0
            window_start = max(0, position - 0x1000)
            maximum = min(18, len(raw) - position)
            for candidate in range(position - 1, window_start - 1, -1):
                length = 0
                while length < maximum and raw[candidate + length] == raw[position + length]:
                    length += 1
                if length >= 3 and length > best_length:
                    best_length = length
                    best_displacement = position - candidate - 1
                    if length == maximum:
                        break
            if best_length >= 3:
                flags |= 1 << bit
                output.append(((best_length - 3) << 4) | (best_displacement >> 8))
                output.append(best_displacement & 0xFF)
                position += best_length
            else:
                output.append(raw[position])
                position += 1
        output[flag_position] = flags
    return bytes(output)
