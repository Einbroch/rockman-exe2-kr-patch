#!/usr/bin/env python3
"""Attribute a savestate screenshot region to text-background layers.

The tool renders only enough GBA text-background pixels in memory to count
layer attribution. It writes coordinates and aggregate counts, never tiles,
palette values, or a reconstructed image.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from collections import Counter
from pathlib import Path

from analyze_state_bg_layout import IO_STATE_OFFSET, VRAM_BYTES, VRAM_STATE_OFFSET, load_state, map_dimensions


PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
PALETTE_STATE_OFFSET = 0x800
SCREEN_WIDTH = 240
SCREEN_HEIGHT = 160


def parse_png_rgb(path: Path) -> tuple[int, int, list[tuple[int, int, int]]]:
    raw = path.read_bytes()
    if not raw.startswith(PNG_SIGNATURE):
        raise ValueError("input is not PNG-backed")
    position = len(PNG_SIGNATURE)
    image_header = None
    idat = bytearray()
    while position + 12 <= len(raw):
        length = struct.unpack_from(">I", raw, position)[0]
        kind = raw[position + 4 : position + 8]
        start = position + 8
        end = start + length
        if end + 4 > len(raw):
            raise ValueError("truncated PNG chunk")
        if kind == b"IHDR":
            image_header = raw[start:end]
        elif kind == b"IDAT":
            idat.extend(raw[start:end])
        elif kind == b"IEND":
            break
        position = end + 4
    if image_header is None or len(image_header) != 13:
        raise ValueError("missing or invalid IHDR")
    width, height, bit_depth, color_type, compression, filtering, interlace = struct.unpack(">IIBBBBB", image_header)
    if (bit_depth, color_type, compression, filtering, interlace) not in {(8, 2, 0, 0, 0), (8, 6, 0, 0, 0)}:
        raise ValueError("unsupported PNG format")
    channels = 3 if color_type == 2 else 4
    stride = width * channels
    encoded = zlib.decompress(idat)
    if len(encoded) != height * (stride + 1):
        raise ValueError("unexpected PNG scanline size")
    rows = []
    previous = bytearray(stride)
    at = 0
    for _ in range(height):
        filter_type = encoded[at]
        at += 1
        current = bytearray(encoded[at : at + stride])
        at += stride
        for index in range(stride):
            left = current[index - channels] if index >= channels else 0
            above = previous[index]
            upper_left = previous[index - channels] if index >= channels else 0
            if filter_type == 1:
                current[index] = (current[index] + left) & 0xFF
            elif filter_type == 2:
                current[index] = (current[index] + above) & 0xFF
            elif filter_type == 3:
                current[index] = (current[index] + ((left + above) // 2)) & 0xFF
            elif filter_type == 4:
                predictor = left + above - upper_left
                distances = (abs(predictor - left), abs(predictor - above), abs(predictor - upper_left))
                current[index] = (current[index] + (left, above, upper_left)[distances.index(min(distances))]) & 0xFF
            elif filter_type != 0:
                raise ValueError(f"unsupported PNG filter {filter_type}")
        rows.append(current)
        previous = current
    pixels = []
    for row in rows:
        for index in range(0, stride, channels):
            pixels.append((row[index], row[index + 1], row[index + 2]))
    return width, height, pixels


def rgb_from_bgr555(value: int) -> tuple[int, int, int]:
    return ((value & 31) * 255 // 31, ((value >> 5) & 31) * 255 // 31, ((value >> 10) & 31) * 255 // 31)


def text_bg_pixel(vram: bytes, palette: bytes, control: int, hofs: int, vofs: int, x: int, y: int):
    char_base = ((control >> 2) & 3) * 0x4000
    screen_base = ((control >> 8) & 0x1F) * 0x800
    color_8bpp = bool(control & 0x80)
    if color_8bpp:
        return None
    width_tiles, height_tiles = map_dimensions((control >> 14) & 3)
    x = (x + hofs) % (width_tiles * 8)
    y = (y + vofs) % (height_tiles * 8)
    block_x, block_y = x // 256, y // 256
    blocks_per_row = width_tiles // 32
    map_block = block_y * blocks_per_row + block_x
    entry_offset = screen_base + map_block * 0x800 + ((y % 256) // 8 * 32 + (x % 256) // 8) * 2
    if entry_offset + 2 > len(vram):
        return None
    entry = struct.unpack_from("<H", vram, entry_offset)[0]
    tile_x, tile_y = (x % 8), (y % 8)
    if entry & 0x400:
        tile_x = 7 - tile_x
    if entry & 0x800:
        tile_y = 7 - tile_y
    tile_offset = char_base + (entry & 0x3FF) * 32 + tile_y * 4 + tile_x // 2
    if tile_offset >= len(vram):
        return None
    packed = vram[tile_offset]
    color_index = packed >> 4 if tile_x & 1 else packed & 0x0F
    if color_index == 0:
        return None
    palette_index = ((entry >> 12) & 0xF) * 16 + color_index
    color = rgb_from_bgr555(struct.unpack_from("<H", palette, palette_index * 2)[0])
    return color, entry & 0x3FF, palette_index


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--region", default="32,104,208,148", help="x0,y0,x1,y1; x1/y1 are exclusive")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    try:
        x0, y0, x1, y1 = (int(value, 0) for value in args.region.split(","))
    except ValueError as error:
        raise ValueError("region must have four integer coordinates") from error
    if not (0 <= x0 < x1 <= SCREEN_WIDTH and 0 <= y0 < y1 <= SCREEN_HEIGHT):
        raise ValueError("region lies outside the GBA screen")

    payload = load_state(args.state)
    io = payload[IO_STATE_OFFSET : IO_STATE_OFFSET + 0x400]
    vram = payload[VRAM_STATE_OFFSET : VRAM_STATE_OFFSET + VRAM_BYTES]
    palette = payload[PALETTE_STATE_OFFSET : PALETTE_STATE_OFFSET + 0x400]
    image_width, image_height, screenshot = parse_png_rgb(args.state)
    if (image_width, image_height) != (SCREEN_WIDTH, SCREEN_HEIGHT):
        raise ValueError("unexpected screenshot dimensions")
    dispcnt = struct.unpack_from("<H", io, 0)[0]
    if (dispcnt & 7) != 0:
        raise ValueError("this probe currently supports display mode 0 only")
    backgrounds = []
    for bg in range(4):
        control = struct.unpack_from("<H", io, 0x8 + bg * 2)[0]
        backgrounds.append(
            {
                "background": bg,
                "enabled": bool(dispcnt & (1 << (8 + bg))),
                "priority": control & 3,
                "control_register": control,
                "horizontal_offset": struct.unpack_from("<H", io, 0x10 + bg * 4)[0] & 0x1FF,
                "vertical_offset": struct.unpack_from("<H", io, 0x12 + bg * 4)[0] & 0x1FF,
            }
        )

    coverage = {bg["background"]: 0 for bg in backgrounds}
    topmost = Counter()
    dark_topmost = Counter()
    tile_indices = {bg["background"]: Counter() for bg in backgrounds}
    palette_indices = {bg["background"]: Counter() for bg in backgrounds}
    topmost_tile_usage = {bg["background"]: Counter() for bg in backgrounds}
    topmost_tile_dark_usage = {bg["background"]: Counter() for bg in backgrounds}
    screenshot_matches = 0
    composited_pixels = 0
    for y in range(y0, y1):
        for x in range(x0, x1):
            candidates = []
            for bg in backgrounds:
                if not bg["enabled"]:
                    continue
                item = text_bg_pixel(vram, palette, bg["control_register"], bg["horizontal_offset"], bg["vertical_offset"], x, y)
                if item is None:
                    continue
                color, tile, palette_index = item
                coverage[bg["background"]] += 1
                tile_indices[bg["background"]][tile] += 1
                palette_indices[bg["background"]][palette_index] += 1
                candidates.append((bg["priority"], bg["background"], color, tile, palette_index))
            if candidates:
                _, winner, color, tile, palette_index = min(candidates)
                composited_pixels += 1
                topmost[winner] += 1
                topmost_tile_usage[winner][(tile, palette_index // 16)] += 1
                screen_color = screenshot[y * SCREEN_WIDTH + x]
                if screen_color == color:
                    screenshot_matches += 1
                if max(screen_color) <= 64:
                    dark_topmost[winner] += 1
                    topmost_tile_dark_usage[winner][(tile, palette_index // 16)] += 1
    report_backgrounds = []
    for bg in backgrounds:
        number = bg["background"]
        char_base = ((bg["control_register"] >> 2) & 3) * 0x4000
        usage_items = []
        for (tile, palette_bank), visible_count in topmost_tile_usage[number].items():
            tile_offset = char_base + tile * 32
            tile_bytes = vram[tile_offset : tile_offset + 32]
            usage_items.append(
                {
                    "tile_index": tile,
                    "palette_bank": palette_bank,
                    "topmost_region_pixel_count": visible_count,
                    "topmost_dark_screenshot_pixel_count": topmost_tile_dark_usage[number][(tile, palette_bank)],
                    "tile_pattern_sha256": hashlib.sha256(tile_bytes).hexdigest(),
                }
            )
        usage_items.sort(key=lambda item: (-item["topmost_dark_screenshot_pixel_count"], -item["topmost_region_pixel_count"], item["tile_index"]))
        report_backgrounds.append(
            {
                **bg,
                "nontransparent_region_pixel_count": coverage[number],
                "topmost_region_pixel_count": topmost[number],
                "topmost_dark_screenshot_pixel_count": dark_topmost[number],
                "distinct_region_tile_index_count": len(tile_indices[number]),
                "distinct_region_palette_index_count": len(palette_indices[number]),
                "topmost_region_tile_usage": usage_items,
            }
        )
    report = {
        "schema_version": 1,
        "input": {
            "state_filename": args.state.name,
            "state_sha256": hashlib.sha256(args.state.read_bytes()).hexdigest(),
        },
        "region": {"x0": x0, "y0": y0, "x1_exclusive": x1, "y1_exclusive": y1, "pixel_count": (x1 - x0) * (y1 - y0)},
        "display_control_register": dispcnt,
        "backgrounds": report_backgrounds,
        "background_only_composited_region_pixel_count": composited_pixels,
        "background_only_screenshot_rgb_exact_match_count": screenshot_matches,
        "interpretation_notice": (
            "Attribution uses only mode-0 text backgrounds and ignores OBJ, windows, blending, and backdrop effects. "
            "It identifies a candidate contributing layer in this state, not a proven dialogue renderer or font source."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
