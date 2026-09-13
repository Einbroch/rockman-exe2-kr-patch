#!/usr/bin/env python3
"""Build a non-distributable one-glyph Korean visibility PoC ROM copy.

This replaces exactly one already-addressable 8x16/4bpp font record in a copy
of the verified Rev 1 ROM.  It does not edit the source ROM, scripts, pointer
tables, or control-code handlers.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
FONT_BASE_OFFSET = 0x6973B0
RECORD_BYTES = 64
CELL_WIDTH = 8
CELL_HEIGHT = 16
POC_RECORD_INDEX = 0xE9
BACKGROUND_INDEX = 1
FOREGROUND_INDEX = 3


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def make_mask(font_path: Path, character: str, font_size: int, font_index: int = 0) -> Image.Image:
    """Rasterize one Unicode character into an 8x16 monochrome cell.

    The source font remains external to the project.  The deliberately
    non-uniform final resize is a PoC-only fit test for this fixed GBA cell.
    """
    font = ImageFont.truetype(str(font_path), font_size, index=font_index)
    canvas = Image.new("L", (font_size * 3, font_size * 3), 0)
    draw = ImageDraw.Draw(canvas)
    draw.text((font_size, font_size), character, font=font, fill=255, anchor="la")
    bbox = canvas.getbbox()
    if bbox is None:
        raise ValueError("the selected font produced an empty glyph")
    glyph = canvas.crop(bbox)
    fitted = glyph.resize((CELL_WIDTH, 14), Image.Resampling.LANCZOS)
    mask = Image.new("1", (CELL_WIDTH, CELL_HEIGHT), 0)
    thresholded = fitted.point(lambda value: 255 if value >= 96 else 0, mode="1")
    mask.paste(thresholded, (0, 1))
    return mask


def encode_4bpp(mask: Image.Image) -> bytes:
    """Encode top and bottom 8x8 GBA 4bpp tiles, low nibble first."""
    if mask.size != (CELL_WIDTH, CELL_HEIGHT):
        raise ValueError("unexpected glyph mask dimensions")
    encoded = bytearray()
    for tile_y in (0, 8):
        for y in range(tile_y, tile_y + 8):
            for x in range(0, CELL_WIDTH, 2):
                low = FOREGROUND_INDEX if mask.getpixel((x, y)) else BACKGROUND_INDEX
                high = FOREGROUND_INDEX if mask.getpixel((x + 1, y)) else BACKGROUND_INDEX
                encoded.append(low | (high << 4))
    if len(encoded) != RECORD_BYTES:
        raise AssertionError("unexpected encoded glyph size")
    return bytes(encoded)


def write_preview(mask: Image.Image, output: Path) -> None:
    scale = 16
    preview = Image.new("RGB", (CELL_WIDTH * scale, CELL_HEIGHT * scale), (30, 30, 30))
    pixels = preview.load()
    for y in range(CELL_HEIGHT):
        for x in range(CELL_WIDTH):
            colour = (245, 245, 245) if mask.getpixel((x, y)) else (80, 80, 80)
            for yy in range(y * scale, (y + 1) * scale):
                for xx in range(x * scale, (x + 1) * scale):
                    pixels[xx, yy] = colour
    output.parent.mkdir(parents=True, exist_ok=True)
    preview.save(output)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--font-index", type=int, default=0)
    parser.add_argument("--character", default="가")
    parser.add_argument("--record-index", type=lambda value: int(value, 0), default=POC_RECORD_INDEX)
    parser.add_argument("--font-size", type=int, default=16)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    if len(args.character) != 1:
        raise ValueError("--character must be exactly one Unicode code point")
    if not args.font.is_file():
        raise ValueError(f"font file not found: {args.font}")
    if args.output_rom.exists() and not args.force:
        raise FileExistsError(f"output already exists: {args.output_rom} (pass --force to replace it)")

    original = args.rom.read_bytes()
    original_digest = sha256(original)
    if original_digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {original_digest}")
    record_offset = FONT_BASE_OFFSET + args.record_index * RECORD_BYTES
    if not 0 <= record_offset <= len(original) - RECORD_BYTES:
        raise ValueError("record index lies outside the ROM")

    if args.font_index < 0:
        raise ValueError("--font-index must be non-negative")
    selected_font = ImageFont.truetype(str(args.font), args.font_size, index=args.font_index)
    family, style = selected_font.getname()
    mask = make_mask(args.font, args.character, args.font_size, args.font_index)
    replacement = encode_4bpp(mask)
    output = bytearray(original)
    output[record_offset:record_offset + RECORD_BYTES] = replacement
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    write_preview(mask, args.preview)

    diff_positions = [
        offset for offset, (before, after) in enumerate(zip(original, output, strict=True)) if before != after
    ]
    if not diff_positions or not all(record_offset <= offset < record_offset + RECORD_BYTES for offset in diff_positions):
        raise AssertionError("output diff escapes the planned font-record range")

    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_korean_glyph_visibility_poc",
        "input": {"filename": args.rom.name, "sha256": original_digest},
        "font_source": {
            "filename": args.font.name,
            "sha256": sha256(args.font.read_bytes()),
            "face_index": args.font_index,
            "family": family,
            "style": style,
            "embedded_in_project": False,
        },
        "glyph": {
            "unicode_code_point": f"U+{ord(args.character):04X}",
            "cell_pixels": [CELL_WIDTH, CELL_HEIGHT],
            "tile_format": "two_vertical_8x8_gba_4bpp_tiles_low_nibble_first",
            "background_palette_index": BACKGROUND_INDEX,
            "foreground_palette_index": FOREGROUND_INDEX,
        },
        "expected_write": {
            "record_index": args.record_index,
            "rom_offset": record_offset,
            "byte_length": RECORD_BYTES,
            "original_range_sha256": sha256(original[record_offset:record_offset + RECORD_BYTES]),
            "replacement_range_sha256": sha256(replacement),
            "changed_byte_count": len(diff_positions),
        },
        "output": {"filename": args.output_rom.name, "sha256": sha256(bytes(output))},
        "limitations": [
            "This PoC changes one existing glyph record only; it does not add a Korean text encoding.",
            "The output ROM and preview are local test artifacts and are not distribution files.",
            "A fresh dialogue redraw is required because the supplied state can retain a prior VRAM glyph cache.",
        ],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
