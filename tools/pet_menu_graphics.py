"""Same-size Korean PET labels in Rev 1's existing 4bpp graphics and maps.

08024DB8 uploads 7D7FBC..7D8A7C to VRAM C800..D2C0 (86 tiles).
08024F30 selects one of four 13x20 maps, then 08001870 copies it to BG0.
Only label-exclusive tiles and x=2..10/y=1..18 map cells may change.
Palettes, cursor, borders, numbers, load addresses/sizes remain unchanged.
"""
import hashlib
import struct
from pathlib import Path
from exe1_k_font_source import ks_x_1001_ordinal

TILES = 0x7D7FBC
TILE_SIZE = 0xAC0
MAPS = (0x7D8ADC, 0x7D8CE4, 0x7D8EEC, 0x7D90F4)
MAP_SIZE = 13*20*2
LABELS = ('칩 폴더', '서브칩', '데이터 라이브러리', '록맨', '이메일',
          '키 아이템', '통신', '저장', '돌아가기')
TILES_SHA = '42fb50f87809f7efac6cc3fd6fd8d256b6f93a7900ff9d9dcb1bad08776c46de'
MAPS_SHA = 'e7f880aa1ad98d8179b919372a50af5cb7096612220ab36831cdf97a5e744c5d'
digest = lambda data: hashlib.sha256(data).hexdigest()


def unpack(data):
    return [p for b in data for p in (b & 15, b >> 4)]


def pack(pixels):
    assert len(pixels) % 2 == 0 and all(0 <= x <= 15 for x in pixels)
    return bytes(a | b << 4 for a, b in zip(pixels[::2], pixels[1::2]))


def editable(cell):
    return 2 <= cell % 13 <= 10 and 1 <= cell // 13 <= 18


def planned_writes(source, master_font):
    original_tiles = source[TILES:TILES+TILE_SIZE]
    assert digest(original_tiles) == TILES_SHA
    assert digest(source[MAPS[0]:MAPS[-1]+MAP_SIZE]) == MAPS_SHA
    assert pack(unpack(original_tiles)) == original_tiles  # unchanged round trip
    # Verify the actual source loader and its only direct tile-asset reference.
    assert struct.unpack_from('<III', source, 0x24DD8) == (0x08000000+TILES, 0x0600C800, TILE_SIZE//4)
    assert struct.unpack_from('<4I', source, 0x24F70) == tuple(0x08000000+b for b in MAPS)
    pointer = struct.pack('<I', 0x08000000+TILES)
    assert [i for i in range(0, len(source)-3, 4) if source[i:i+4] == pointer] == [0x24DD8]
    maps = [list(struct.unpack_from('<260H', source, b)) for b in MAPS]
    inside, outside = set(), set()
    for base, m in zip(MAPS, maps):
        assert struct.pack('<260H', *m) == source[base:base+MAP_SIZE]
        for cell, value in enumerate(m):
            (inside if editable(cell) else outside).add(value & 1023)
    slots = sorted(inside-outside)
    assert len(slots) == 64 and all(0x240 <= x < 0x296 for x in slots)
    blank = original_tiles[(0x246-0x240)*32:(0x247-0x240)*32]
    assert blank == b'\xee'*32  # exact text-free native menu background
    generated = {blank: 0x246}
    tiles = bytearray(original_tiles)
    glyphs = {}
    font_receipts = []
    for char in sorted(set(''.join(LABELS)) - {' '}):
        ordinal = ks_x_1001_ordinal(char)
        record = master_font[ordinal*64:(ordinal+1)*64]
        assert len(record) == 64 and set(unpack(record)) <= {1, 3}
        mask = unpack(record)
        pixels = [14]*128
        # Keep every native EXE1 ink pixel. Original PET text uses foreground
        # palette 6, shadow 3, background 14. Clip only the optional shadow.
        for pos, value in enumerate(mask):
            if value == 3 and pos % 8 < 7 and pos // 8 < 15:
                pixels[pos+9] = 3
        for pos, value in enumerate(mask):
            if value == 3:
                pixels[pos] = 6
        assert [v == 6 for v in pixels] == [v == 3 for v in mask]
        glyphs[char] = pixels
        font_receipts.append({'character':char, 'ordinal':ordinal, 'source_record_sha256':digest(record)})
    rows = []
    for label in LABELS:
        assert len(label) <= 9
        row = []
        for half in (0, 1):
            for char in label.ljust(9):
                payload = blank if char == ' ' else pack(glyphs[char][half*64:(half+1)*64])
                if payload not in generated:
                    assert len(generated)-1 < len(slots), 'PET label tile budget exceeded'
                    slot = slots[len(generated)-1]
                    generated[payload] = slot
                    offset = (slot-0x240)*32
                    tiles[offset:offset+32] = payload
                row.append(generated[payload])
        rows.append(row)
    for tile in set(range(0x240,0x296))-set(slots):
        offset = (tile-0x240)*32
        assert tiles[offset:offset+32] == original_tiles[offset:offset+32]
    writes = []
    def write(offset, payload, name):
        before = source[offset:offset+len(payload)]
        writes.append({'kind':'graphics_asset', 'name':name, 'rom_offset':offset,
                       'byte_length':len(payload), 'expected_source_sha256':digest(before),
                       'sha256':digest(payload), 'replacement_hex':payload.hex()})
    write(TILES, bytes(tiles), 'pet_menu_label_tiles')
    variants = []
    for base, original_map in zip(MAPS, maps):
        result = original_map.copy()
        palettes = []
        for row, indices in enumerate(rows):
            positions = [(1+row*2+half)*13+2+x for half in (0,1) for x in range(9)]
            attrs = {original_map[i] & 0xFC00 for i in positions if original_map[i]&1023 != 0x246}
            assert len(attrs) == 1 and next(iter(attrs)) in (0xD000, 0xE000)
            attr = attrs.pop()
            palettes.append(attr >> 12)
            for cell, tile in zip(positions, indices):
                result[cell] = tile | (0xD000 if tile==0x246 else attr)
        assert all(before == after for i,(before,after) in enumerate(zip(original_map,result)) if not editable(i))
        write(base, struct.pack('<260H', *result), f'pet_menu_map_{base:06x}')
        variants.append({'rom_offset':base,'label_palettes':palettes,'label_count':len(rows)})
    report = {'module_sha256':digest(Path(__file__).read_bytes()), 'labels':list(LABELS),
              'variant_count':4,'label_variant_count':36,'variants':variants,
              'glyph_sources':font_receipts,'generated_tile_count':len(generated)-1,
              'available_label_exclusive_tiles':len(slots),'allocation_growth_bytes':0,
              'unchanged_roundtrip':True,'protected_tiles_maps_palettes_preserved':True,
              'loader':{'entry':0x08024DB0,'source':0x08000000+TILES,'destination':0x0600C800,'byte_length':TILE_SIZE},
              'map_selector':0x08024F30,'map_copy':0x08001870,
              'scope':'PET main-menu labels only; submenus and message prompts are separate text populations'}
    return writes, report
