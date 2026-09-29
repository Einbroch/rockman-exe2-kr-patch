"""Korean title logo (배틀 네트워크 >> / 록맨 에그제) on the title screen's BG3.

The title loader at 0x0801C868 queues three DMA copies for BG3, each named by
exactly one literal in that function: the 8bpp tileset 0x087F7A70 (0x1600
words = 352 tiles) to VRAM 0x06000040, so tileset tile k is VRAM tile k+1 and
VRAM tile 0 stays blank; the 32x20 map 0x087FEA70 (0x140 words) into the screen
buffer that becomes BG3's screen block 0xF800; and the palette 0x087F7870 (240
colours, shared with BG1 and BG2), which this module leaves alone. BG0-BG2 take
their characters from 0x06008000, so BG3 may use VRAM tiles 1..511.

The logo is one picture in that tileset - バトルネットワーク >> over ロックマン
エグゼ on one black sticker, with the ring, the 2 and the grid around it - so it
is redrawn as a whole. The original layer is decoded from the ROM, the pixels of
title_logo_ko_overlay.png are laid over it (index 255 keeps the original
pixel), and the result is cut into tiles again with identical tiles merged.
Like the original map, the new one never names VRAM tile 0 (the loader does not
fill it) and never sets the flip bits. The new
tileset and map go to clean expanded ROM and the loader's tileset literal, word
count and map literal are pointed at them. The original tileset and map bytes
stay where they were.

The overlay is drawn from the Korean box-art logo (the big letters, redrawn in
the original's gradient, black outline and white rim), the 배틀 네트워크 subtitle
in hand-drawn two-pixel-stroke glyphs, and the grid and ring restored where the
Japanese sticker used to stand; it only uses colours the original layer uses.
"""
import hashlib
import struct
from pathlib import Path

from PIL import Image

ROM_BASE = 0x08000000
TILESET_LITERAL, VRAM_LITERAL, WORDS_LITERAL = 0x1C914, 0x1C918, 0x1C91C
MAP_LITERAL, MAP_WORDS_LITERAL = 0x1C964, 0x1C96C
TILESET, TILE_COUNT = 0x7F7A70, 352
MAP, MAP_WIDTH, MAP_HEIGHT = 0x7FEA70, 32, 20
TILE_BYTES = 64
VRAM_TILESET = 0x06000040
VRAM_TILE_LIMIT = 512            # BG0-BG2 characters begin at 0x06008000
SCREEN_WIDTH, SCREEN_HEIGHT = 240, 160
RELOCATED_TILESET = 0x900000
RELOCATED_MAP = 0x908000
OVERLAY = Path(__file__).with_name('title_logo_ko_overlay.png')
KEEP = 255
SOURCE_LAYER_SHA256 = '7f4e3dfc790b5ff457569b996850b3b4abd9a922dcfd31ce59ecb9826c3ff5f0'

digest = lambda data: hashlib.sha256(data).hexdigest()


def _flip(tile, h, v):
    rows = [tile[y * 8:(y + 1) * 8] for y in range(8)]
    if v:
        rows.reverse()
    if h:
        rows = [row[::-1] for row in rows]
    return b''.join(rows)


def decode_layer(rom):
    """BG3 as the loader leaves it: 160 rows of 256 palette indices."""
    tiles = rom[TILESET:TILESET + TILE_COUNT * TILE_BYTES]
    entries = struct.unpack_from(f'<{MAP_WIDTH * MAP_HEIGHT}H', rom, MAP)
    return _render(tiles, entries)


def _render(tiles, entries):
    layer = [bytearray(MAP_WIDTH * 8) for _ in range(MAP_HEIGHT * 8)]
    for cell, entry in enumerate(entries):
        index = entry & 0x3FF
        if index == 0:
            continue
        start = (index - 1) * TILE_BYTES
        if start + TILE_BYTES > len(tiles):
            raise ValueError(f'map cell {cell} names tile {index} beyond the tileset')
        tile = _flip(tiles[start:start + TILE_BYTES], entry & 0x400, entry & 0x800)
        cy, cx = divmod(cell, MAP_WIDTH)
        for y in range(8):
            layer[cy * 8 + y][cx * 8:cx * 8 + 8] = tile[y * 8:(y + 1) * 8]
    return layer


def encode_layer(layer, attributes):
    """Cut a 256x160 layer into merged tiles; attributes keeps each cell's bits 12-15."""
    tileset, known, entries = bytearray(), {}, []
    for cell in range(MAP_WIDTH * MAP_HEIGHT):
        cy, cx = divmod(cell, MAP_WIDTH)
        tile = b''.join(bytes(layer[cy * 8 + y][cx * 8:cx * 8 + 8]) for y in range(8))
        if tile not in known:
            known[tile] = len(known) + 1        # VRAM tile number: tileset tile + 1
            tileset += tile
        entries.append(attributes[cell] | known[tile])
    return bytes(tileset), entries


def compose(source):
    """(original layer, new layer): the overlay laid over the decoded ROM layer."""
    original = decode_layer(source)
    image = Image.open(OVERLAY)
    if image.mode != 'P' or image.size != (SCREEN_WIDTH, SCREEN_HEIGHT):
        raise ValueError(f'{OVERLAY.name} must be a {SCREEN_WIDTH}x{SCREEN_HEIGHT} indexed image')
    overlay = image.tobytes()
    palette_in_use = {value for row in original for value in row}
    layer = [bytearray(row) for row in original]
    for y in range(SCREEN_HEIGHT):
        for x in range(SCREEN_WIDTH):
            value = overlay[y * SCREEN_WIDTH + x]
            if value == KEEP:
                continue
            if value not in palette_in_use:
                raise ValueError(f'overlay pixel ({x},{y}) uses colour {value}, which the logo layer never uses')
            layer[y][x] = value
    return original, layer


def planned_writes(source, master_font=None):
    del master_font                  # the lettering is drawn in the overlay
    literals = struct.unpack_from('<3I', source, TILESET_LITERAL)
    if literals != (ROM_BASE + TILESET, VRAM_TILESET, TILE_COUNT * TILE_BYTES // 4):
        raise ValueError('title loader no longer copies the logo tileset it was written for')
    if struct.unpack_from('<I', source, MAP_LITERAL)[0] != ROM_BASE + MAP:
        raise ValueError('title loader no longer copies the logo map it was written for')
    if struct.unpack_from('<I', source, MAP_WORDS_LITERAL)[0] != MAP_WIDTH * MAP_HEIGHT // 2:
        raise ValueError('title loader copies a map of a different size')
    source_entries = struct.unpack_from(f'<{MAP_WIDTH * MAP_HEIGHT}H', source, MAP)
    original, layer = compose(source)
    source_layer = b''.join(bytes(row) for row in original)
    if digest(source_layer) != SOURCE_LAYER_SHA256:
        raise ValueError('decoded title logo layer differs from the one the overlay was drawn on')
    tileset, entries = encode_layer(layer, [entry & 0xF000 for entry in source_entries])
    tile_count = len(tileset) // TILE_BYTES
    if tile_count + 1 > VRAM_TILE_LIMIT:
        raise ValueError(f'logo needs {tile_count} tiles; VRAM tiles 1..{VRAM_TILE_LIMIT - 1} are free')
    map_bytes = struct.pack(f'<{len(entries)}H', *entries)
    if _render(tileset, entries) != layer:
        raise AssertionError('re-tiled logo does not reproduce the composed layer')
    writes = []
    for offset, payload, name in ((RELOCATED_TILESET, tileset, 'title_logo_tileset'),
                                  (RELOCATED_MAP, map_bytes, 'title_logo_map')):
        writes.append({'kind': 'static_table_asset', 'name': name, 'rom_offset': offset,
                       'byte_length': len(payload), 'sha256': digest(payload),
                       'replacement_hex': payload.hex()})
    for offset, value in ((TILESET_LITERAL, ROM_BASE + RELOCATED_TILESET),
                          (WORDS_LITERAL, len(tileset) // 4),
                          (MAP_LITERAL, ROM_BASE + RELOCATED_MAP)):
        writes.append({'kind': 'static_table_pointer', 'name': 'title_logo_loader', 'rom_offset': offset,
                       'expected_source_hex': source[offset:offset + 4].hex(),
                       'replacement_hex': struct.pack('<I', value).hex()})
    changed = sum(a != b for old, new in zip(original, layer) for a, b in zip(old, new))
    return writes, {'module_sha256': digest(Path(__file__).read_bytes()),
                    'overlay_sha256': digest(OVERLAY.read_bytes()),
                    'source_layer_sha256': SOURCE_LAYER_SHA256,
                    'layer_sha256': digest(b''.join(bytes(row) for row in layer)),
                    'changed_pixels': changed,
                    'source_tile_count': TILE_COUNT, 'tile_count': tile_count,
                    'vram_tile_limit': VRAM_TILE_LIMIT,
                    'tileset_rom_offset': RELOCATED_TILESET, 'map_rom_offset': RELOCATED_MAP,
                    'palette_untouched': True}
