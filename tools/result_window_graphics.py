"""Korean lettering for the three battle result windows.

After a battle the loader at 0x08011C60 draws one of three windows on BG3:
0 virus busting, 1 net battle WINNER, 2 net battle LOSER. Each type has its own
uncompressed 4bpp tileset (table at 0x11CD8: source, VRAM 0x06008020, word
count) and its own uncompressed 24x17 tile map (table at 0x11D10), copied whole
into place. The labels - デリートタイム, バスティングレベル and the LOSER line -
are pictures in those tilesets, which is why translating the 00/355 strings of
the same words changed nothing on screen.

The two labels of a window share some lower-half tiles (glyph bottoms that
happen to be identical), so a label cannot be redrawn tile by tile. Each label
is re-lettered as one strip and re-tiled instead: every tile that only label
cells use becomes free space, the strips are cut into tiles, identical tiles
are merged, blank ones point back at the window's own fill tile, and the label
cells of the map are pointed at the result. Everything outside the label
cells renders exactly as before, and that is checked pixel for pixel.
"""
import hashlib
import struct
from pathlib import Path

from exe1_k_font_source import ks_x_1001_ordinal
from pet_menu_graphics import unpack

MAP_WIDTH, MAP_HEIGHT = 24, 17
MAP_BYTES = MAP_WIDTH * MAP_HEIGHT * 2
TILE_TABLE, MAP_TABLE = 0x11CD8, 0x11D10
VRAM_TILE_BASE = 0x06008020          # the tileset's first tile is VRAM tile 1
FIRST_TILE = 1
BAR, BOX = "bar", "box"
# Bar labels: letters 1 on the dark bar 5, outlined in 5 where they rise out
# of the bar, with a D shadow below and to the right over the window colour E.
BAR_LETTER, BAR_OUTLINE, BAR_SHADOW, WINDOW_COLOUR = 1, 5, 13, 14
# The LOSER line: plain dark letters F on the beige box.
BOX_LETTER = 15
# Bar letters get one extra column: their outlines would otherwise touch.
BAR_ADVANCE, BOX_ADVANCE, SPACE, LEFT_MARGIN = 9, 8, 4, 2
INK_TOP, INK_BOTTOM = 1, 14
# (window, tileset sha256, map sha256, strips); a strip is
# (top map row, first column, columns, text, style)
WINDOWS = (
    ("virus", "ddf81d8c0fc576c55f76fbafb1f634456b6c3019b42478117cc1725b1ee6c5d2",
     "568a838401bc5885ef472d6067e80080a4daf152f8116619377198bbc97adbbc",
     ((3, 3, 7, "딜리트 타임", BAR), (6, 3, 9, "버스팅 레벨", BAR))),
    ("winner", "8f80dea66b2bbfc9ab49747c59e8a0ef2a3ade2fed6088d577313a5f4a86be84",
     "4eacdb5ed86693521dbe4e2ce3c4fd8beb2e897d86f930e6a5902a66bb599b96",
     ((3, 3, 7, "딜리트 타임", BAR), (6, 3, 9, "버스팅 레벨", BAR))),
    ("loser", "10337af1bc9ff174acce6ee59216507368c7a1484150e6cf6593470283d44084",
     "c581fef8c1f7f11889d1424f56add6869ba6fe9a9bc85bc724df2246ed7155e9",
     ((5, 4, 16, "칩 데이터를 잃었습니다...", BOX),)),
)
DOT = {(x, y) for x in (0, 1) for y in (12, 13)}
DOT_ADVANCE = 3

digest = lambda data: hashlib.sha256(data).hexdigest()


def tile_pixels(block):
    return [[(block[y * 4 + x // 2] >> 4) if x & 1 else (block[y * 4 + x // 2] & 15)
             for x in range(8)] for y in range(8)]


def tile_bytes(pixels):
    out = bytearray(32)
    for y in range(8):
        for x in range(8):
            value = pixels[y][x] & 0xF
            at = y * 4 + x // 2
            out[at] |= value << 4 if x & 1 else value
    return bytes(out)


def _letters(text, master_font, advance):
    """Letter pixels of a line laid out from x=0, and its advance width."""
    pixels, cursor = set(), 0
    for char in text:
        if char == " ":
            cursor += SPACE
            continue
        if char == ".":
            pixels |= {(cursor + x, y) for x, y in DOT}
            cursor += DOT_ADVANCE
            continue
        ordinal = ks_x_1001_ordinal(char)
        record = master_font[ordinal * 64:(ordinal + 1) * 64]
        if len(record) != 64:
            raise ValueError(f"{char!r} has no master font record")
        mask = unpack(record)
        for y in range(16):
            for x in range(8):
                if mask[y * 8 + x] == 3:
                    if not INK_TOP <= y <= INK_BOTTOM:
                        raise ValueError(f"{char!r} inks outside rows {INK_TOP}..{INK_BOTTOM}")
                    pixels.add((cursor + x, y))
        cursor += advance
    return pixels, cursor


def render_strip(background, text, style, master_font):
    """Letter a strip whose blank background is given; returns the new pixels."""
    height, width = len(background), len(background[0])
    canvas = [row[:] for row in background]
    # Hangul keeps the master font's single-pixel strokes: doubled, as the
    # katakana were, its closed shapes fill in; the outline carries the weight.
    letters, advance = _letters(text, master_font, BAR_ADVANCE if style == BAR else BOX_ADVANCE)
    left = LEFT_MARGIN if style == BAR else (width - advance) // 2
    body = {(left + x, y) for x, y in letters}
    if any(not (0 <= x < width and 0 <= y < height) for x, y in body):
        raise ValueError(f"{text!r} does not fit its {width}px strip")
    if style == BOX:
        for x, y in body:
            canvas[y][x] = BOX_LETTER
        return canvas
    outline = set()
    for x, y in body:
        for dx in (-1, 0, 1):
            for dy in (-1, 0, 1):
                point = (x + dx, y + dy)
                if point not in body and 0 <= point[0] < width and 0 <= point[1] < height:
                    outline.add(point)
    for x, y in outline:
        canvas[y][x] = BAR_OUTLINE
    for x, y in body:
        canvas[y][x] = BAR_LETTER
    for x, y in outline | body:
        sx, sy = x + 1, y + 1
        if sx < width and sy < height and (sx, sy) not in body | outline \
                and canvas[sy][sx] == WINDOW_COLOUR:
            canvas[sy][sx] = BAR_SHADOW
    return canvas


def _window(source, index, master_font):
    name, tiles_sha, map_sha, strips = WINDOWS[index]
    src, dst, words = struct.unpack_from("<3I", source, TILE_TABLE + 12 * index)
    map_at = struct.unpack_from("<I", source, MAP_TABLE + 4 * index)[0] - 0x08000000
    if dst != VRAM_TILE_BASE:
        raise ValueError(f"{name}: tileset is not loaded where this module assumes")
    tiles_at, tiles_len = src - 0x08000000, words * 4
    original = source[tiles_at:tiles_at + tiles_len]
    map_bytes = source[map_at:map_at + MAP_BYTES]
    if digest(original) != tiles_sha or digest(map_bytes) != map_sha:
        raise ValueError(f"{name}: result window tiles or map are not the expected source")
    tileset = bytearray(original)
    entries = list(struct.unpack(f"<{MAP_WIDTH * MAP_HEIGHT}H", map_bytes))
    count = tiles_len // 32

    def block(data, tile):
        index = tile - FIRST_TILE
        return bytes(data[index * 32:(index + 1) * 32]) if 0 <= index < count else None

    label_cells = {(top + half, first + column)
                   for top, first, columns, _, _ in strips
                   for half in (0, 1) for column in range(columns)}
    elsewhere = {entries[r * MAP_WIDTH + c] & 0x3FF for r in range(MAP_HEIGHT)
                 for c in range(MAP_WIDTH) if (r, c) not in label_cells}
    free = sorted({entries[r * MAP_WIDTH + c] & 0x3FF for r, c in label_cells} - elsewhere)
    if any(entries[r * MAP_WIDTH + c] & 0x0C00 for r, c in label_cells):
        raise ValueError(f"{name}: a label cell is flipped")
    new_cells = {}
    for top, first, columns, text, style in strips:
        beside = first + columns if style == BAR else first - 1
        fills = [entries[(top + half) * MAP_WIDTH + beside] & 0x3FF for half in (0, 1)]
        if any(fill not in elsewhere for fill in fills):
            raise ValueError(f"{name}: the strip's fill tile is not the window's own")
        halves = [tile_pixels(block(original, fill)) for fill in fills]
        background = [[halves[y // 8][y % 8][x % 8] for x in range(columns * 8)] for y in range(16)]
        canvas = render_strip(background, text, style, master_font)
        for column in range(columns):
            for half in (0, 1):
                pixels = [canvas[half * 8 + y][column * 8:(column + 1) * 8] for y in range(8)]
                new_cells[(top + half, first + column)] = tile_bytes(pixels)
    reuse = {block(original, tile): tile for tile in sorted(elsewhere) if block(original, tile)}
    assigned, pool = {}, iter(free)
    new_entries = entries[:]
    for cell in sorted(new_cells):
        data = new_cells[cell]
        tile = reuse.get(data) or assigned.get(data)
        if tile is None:
            tile = next(pool, None)
            if tile is None:
                raise ValueError(f"{name}: the new labels need more tiles than the old ones free")
            assigned[data] = tile
            tileset[(tile - FIRST_TILE) * 32:(tile - FIRST_TILE + 1) * 32] = data
        r, c = cell
        new_entries[r * MAP_WIDTH + c] = (entries[r * MAP_WIDTH + c] & 0xF000) | tile
    for r in range(MAP_HEIGHT):
        for c in range(MAP_WIDTH):
            before, after = entries[r * MAP_WIDTH + c], new_entries[r * MAP_WIDTH + c]
            if (r, c) in label_cells:
                if block(tileset, after & 0x3FF) != new_cells[(r, c)]:
                    raise AssertionError(f"{name}: label cell {r},{c} does not draw its strip")
            elif before != after or block(original, before & 0x3FF) != block(tileset, after & 0x3FF):
                raise AssertionError(f"{name}: cell {r},{c} outside the labels changed")
    new_map = struct.pack(f"<{MAP_WIDTH * MAP_HEIGHT}H", *new_entries)
    report = {"window": name, "labels": [strip[3] for strip in strips],
              "free_tiles": len(free), "tiles_used": len(assigned),
              "tileset_sha256": digest(bytes(tileset)), "map_sha256": digest(new_map)}
    return (tiles_at, original, bytes(tileset)), (map_at, map_bytes, new_map), report


def planned_writes(source, master_font):
    writes, reports = [], []
    for index in range(len(WINDOWS)):
        tiles, map_, report = _window(source, index, master_font)
        for kind, (offset, before, after) in (("tiles", tiles), ("map", map_)):
            writes.append({"kind": "graphics_asset",
                           "name": f"result_window_{WINDOWS[index][0]}_{kind}",
                           "rom_offset": offset, "byte_length": len(after),
                           "expected_source_sha256": digest(before),
                           "sha256": digest(after), "replacement_hex": after.hex()})
        reports.append(report)
    return writes, {"module_sha256": digest(Path(__file__).read_bytes()),
                    "in_place": True, "windows": reports}
