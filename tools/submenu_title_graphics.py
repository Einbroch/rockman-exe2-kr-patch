"""Rev 1 shared submenu tile-bank extension and bounded Korean map edits.

The 08025B76 loader copies this bank to 06000020. The next lowest
independent upload begins at 06003400 (library stars). Never cross it.
Existing tiles remain intact outside the explicitly inventoried lettering.
"""
import hashlib
import struct
from pathlib import Path
from exe1_k_font_source import ks_x_1001_ordinal
from pet_menu_graphics import unpack, pack

BANK = 0x7DA0DC
SIZE = 0x2D20
RELOC = 0x950000
FIRST_NEW_TILE = 0x16A
LIMIT_TILE = 0x1A0
HEADERS = (
    (0x7DD09C, 11, 4, '폴더'),
    (0x7DD59C, 12, 7, '배낭'),
    (0x7DDC54, 15, 7, '칩 폴더'),
    (0x7DE154, 12, 10, '데이터 라이브러리'),
    (0x7DE954, 15, 2, '메모'),
    (0x7DEFA4, 13, 4, '이메일'),
    (0x7DF2A4, 12, 6, '키 아이템'),
    (0x7DF5A4, 13, 4, '통신'),
    (0x7E0154, 13, 3, '저장'),
    (0x7E0454, 12, 5, '서브칩'),
)
digest = lambda b: hashlib.sha256(b).hexdigest()


def planned_writes(source, master_font):
    assert struct.unpack_from('<III', source, 0x25F70) == (0x08000000+BANK, 0x06000020, SIZE//4)
    original = source[BANK:BANK+SIZE]
    assert len(original) == SIZE and pack(unpack(original)) == original
    bank = bytearray(original)
    # These old backpack-title tiles have exactly one map consumer each,
    # wholly inside the seven-column title which this module replaces.
    reusable = (0x24,0x26,0x27,0x28,0x29,0x31,0x32,0x35,0x36,0x37)
    for index in reusable:
        needle = struct.pack('<H',0x4000|index)
        refs = [i for i in range(0x7DD09C,0x7E1308,2) if source[i:i+2] == needle]
        assert len(refs) == 1 and any(0x7DD59C+y*64+24 <= refs[0] < 0x7DD59C+y*64+38 for y in (0,1))
    changed_original_tiles = set()
    generated = {}
    receipts = {}
    def glyph(char, header):
        ordinal = ks_x_1001_ordinal(char)
        record = master_font[ordinal*64:(ordinal+1)*64]
        assert len(record) == 64 and set(unpack(record)) <= {1, 3}
        receipts[char] = {'character':char, 'ordinal':ordinal, 'source_record_sha256':digest(record)}
        if not header:
            return unpack(record)
        mask = unpack(record)
        pixels = [14]*128
        for i, v in enumerate(mask):
            if v == 3 and i%8 < 7 and i//8 < 15:
                pixels[i+9] = 3
        for i, v in enumerate(mask):
            if v == 3: pixels[i] = 6
        return pixels
    def tile(payload):
        if payload not in generated:
            extra = len(generated)-(LIMIT_TILE-FIRST_NEW_TILE)
            if extra < 0:
                index = FIRST_NEW_TILE + len(generated)
                bank.extend(payload)
            else:
                assert extra < len(reusable), 'Submenu lettering tile budget exceeded'
                index = reusable[extra]
                offset = (index-1)*32
                bank[offset:offset+32] = payload
                changed_original_tiles.add(index)
            generated[payload] = index
        return generated[payload]
    writes = []
    def write(offset, payload, name, old=None, source_offset=None, kind='graphics_asset'):
        before = source[offset:offset+len(payload)] if old is None else old
        entry = {'kind':kind, 'name':name, 'rom_offset':offset, 'byte_length':len(payload),
                 'expected_source_sha256':digest(before), 'sha256':digest(payload), 'replacement_hex':payload.hex()}
        if source_offset is not None:
            entry.update(source_rom_offset=source_offset, source_byte_length=len(before))
        writes.append(entry)
    for base, x, width, label in HEADERS:
        # Communication fixed labels also occupy this same map. Preserve all
        # other cells, including dynamic counters, frame, icon and palette.
        size = 0x580 if base == 0x7DF5A4 else 128
        before = list(struct.unpack_from('<'+str(size//2)+'H', source, base))
        result = before.copy()
        editable = set()
        def put(x, y, width, text, header=True):
            assert len(text) <= width
            for half in (0, 1):
                for dx, char in enumerate(text.ljust(width)):
                    cell = (y+half)*32+x+dx
                    editable.add(cell)
                    assert before[cell] & 0xFC00 == 0x4000
                    index = (6 if header else 0x1C) if char == ' ' else tile(pack(glyph(char,header)[half*64:(half+1)*64]))
                    result[cell] = 0x4000 | index
        put(x, 0, width, label)
        if base == 0x7DD09C:
            put(19, 0, 2, '장')
        if base == 0x7DF5A4:
            # BG2 numeric rows cover y=5..6 and 9..10, including their
            # backgrounds. Keep the full 16px labels above those strips.
            put(19, 3, 7, '보유 칩', False)
            put(19, 7, 2, '전적', False)
            # Erase the remainder of the original one-row battle-record label.
            for dx in range(21,27):
                editable.add(8*32+dx); result[8*32+dx] = 0x401C
            put(27, 5, 2, '장', False)
            put(22, 9, 2, '승', False)
            put(27, 9, 2, '패', False)
        assert all(a == b for i,(a,b) in enumerate(zip(before,result)) if i not in editable)
        write(base, struct.pack('<'+str(len(result))+'H', *result), f'submenu_map_{base:06x}')
    # PA memo lettering is 8 pixels tall, on the existing orange arrow.
    # Retain its top border row and change only original ink-bearing cells.
    small_labels = [(0x48,'메'), (0x49,'모')]
    small_labels += list(zip((0x14,0x15,0x16),'배낭 '))
    small_labels += list(zip(range(0x2B,0x30),'칩 폴더 '))
    small_labels += list(zip(range(0x50,0x56),'라이브러리 '))
    for index, char in small_labels:
        offset = (index-1)*32
        old = unpack(original[offset:offset+32])
        mask = [1]*128 if char == ' ' else glyph(char,False)
        pixels = old.copy()
        for y in range(7):
            for x in range(8):
                pos = (y+1)*8+x
                if old[pos] in (12,15):
                    pixels[pos] = 15 if any(mask[sy*8+x] == 3 for sy in (y*2+1,y*2+2)) else 12
        bank[offset:offset+32] = pack(pixels)
        changed_original_tiles.add(index)
    protected = bytearray(bank[:SIZE])
    for index in changed_original_tiles:
        offset = (index-1)*32
        protected[offset:offset+32] = original[offset:offset+32]
    assert protected == original
    assert 0x20+len(bank) <= 0x3400
    write(RELOC, bytes(bank), 'submenu_extended_tile_bank', original, BANK, 'static_table_asset')
    for offset, value in ((0x25F70,0x08000000+RELOC), (0x25F78,len(bank)//4)):
        writes.append({'kind':'static_table_pointer', 'name':'submenu_bank_loader', 'rom_offset':offset,
                       'expected_source_hex':source[offset:offset+4].hex(), 'replacement_hex':struct.pack('<I',value).hex()})
    return writes, {'module_sha256':digest(Path(__file__).read_bytes()), 'headers':[x[3] for x in HEADERS],
                    'fixed_labels':['보유 칩','전적','장','승','패','P.A 메모','배낭','칩 폴더','라이브러리'],
                    'source_bank_sha256':digest(original), 'bank_sha256':digest(bank),
                    'source_rom_offset':BANK, 'relocated_rom_offset':RELOC,
                    'vram_start':0x06000020, 'vram_end_exclusive':0x06000020+len(bank),
                    'next_independent_upload':0x06003400, 'generated_tile_count':len(generated),
                    'new_tile_count':(len(bank)-SIZE)//32,
                    'changed_original_lettering_tiles':sorted(changed_original_tiles),
                    'glyph_sources':sorted(receipts.values(),key=lambda x:x['character']),
                    'protected_pixels_preserved':True, 'protected_map_cells_preserved':True}
