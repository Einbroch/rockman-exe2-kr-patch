#!/usr/bin/env python3
"""Read the 8x16 Korean glyph records from the identified EXE 1 [K] ROM.

This module treats the patched ROM as an external, local-only reference asset.
It never copies the source ROM into the project and does not grant distribution
rights for the extracted glyph records.
"""

from __future__ import annotations

import hashlib
from pathlib import Path

from PIL import Image


EXPECTED_SHA256 = "c0753c1d3170f69e1eb8b03a02875ec63c5622185ac4afbb2b8688c53209d865"
EXPECTED_TITLE = b"ROCKMAN_EXE\x00"
EXPECTED_GAME_CODE = b"AREJ"
FONT_BASE_OFFSET = 0x80016C
FONT_RECORD_BYTES = 64
HANGUL_BASE_INDEX = 512
KS_X_1001_HANGUL_COUNT = 2350


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_source(path: Path) -> bytes:
    data = path.read_bytes()
    digest = sha256(data)
    if digest != EXPECTED_SHA256:
        raise ValueError(f"unexpected EXE 1 [K] ROM SHA-256: {digest}")
    if data[0xA0:0xAC] != EXPECTED_TITLE or data[0xAC:0xB0] != EXPECTED_GAME_CODE:
        raise ValueError("EXE 1 [K] ROM header identity differs from the analyzed source")
    required_end = FONT_BASE_OFFSET + (HANGUL_BASE_INDEX + KS_X_1001_HANGUL_COUNT) * FONT_RECORD_BYTES
    if required_end > len(data):
        raise ValueError("EXE 1 [K] ROM does not contain the complete analyzed Hangul font range")
    return data


def ks_x_1001_ordinal(character: str) -> int:
    if len(character) != 1:
        raise ValueError("font lookup requires exactly one character")
    try:
        encoded = character.encode("euc_kr")
    except UnicodeEncodeError as error:
        raise ValueError(f"EXE 1 [K] font has no KS X 1001 glyph for {character!r}") from error
    if len(encoded) != 2 or not (0xB0 <= encoded[0] <= 0xC8 and 0xA1 <= encoded[1] <= 0xFE):
        raise ValueError(f"EXE 1 [K] font has no KS X 1001 Hangul glyph for {character!r}")
    ordinal = (encoded[0] - 0xB0) * 94 + (encoded[1] - 0xA1)
    if not 0 <= ordinal < KS_X_1001_HANGUL_COUNT:
        raise AssertionError("calculated KS X 1001 ordinal lies outside the Hangul repertoire")
    return ordinal


def glyph_record(source: bytes, character: str) -> tuple[bytes, int, int]:
    ordinal = ks_x_1001_ordinal(character)
    source_index = HANGUL_BASE_INDEX + ordinal
    offset = FONT_BASE_OFFSET + source_index * FONT_RECORD_BYTES
    record = source[offset:offset + FONT_RECORD_BYTES]
    if len(record) != FONT_RECORD_BYTES:
        raise ValueError(f"incomplete EXE 1 [K] glyph record for {character!r}")
    nibble_values = {value for byte in record for value in (byte & 0x0F, byte >> 4)}
    if not nibble_values <= {1, 3} or 3 not in nibble_values:
        raise ValueError(
            f"EXE 1 [K] glyph {character!r} uses an unexpected or empty palette set: {sorted(nibble_values)}"
        )
    return record, source_index, offset


def record_to_mask(record: bytes) -> Image.Image:
    if len(record) != FONT_RECORD_BYTES:
        raise ValueError("font record must be exactly 64 bytes")
    mask = Image.new("1", (8, 16), 0)
    cursor = 0
    for tile_y in (0, 8):
        for y in range(tile_y, tile_y + 8):
            for x in range(0, 8, 2):
                value = record[cursor]
                cursor += 1
                mask.putpixel((x, y), 1 if (value & 0x0F) == 3 else 0)
                mask.putpixel((x + 1, y), 1 if (value >> 4) == 3 else 0)
    return mask
