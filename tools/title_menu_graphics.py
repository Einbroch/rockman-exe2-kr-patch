"""Korean lettering for the two title-screen menu sprites.

The title options are not text. Encoding either Japanese label and searching the
whole ROM finds nothing, and toggling the menu changes OAM only - the tiles are
already resident. Each label is three sprites (32x16, 32x16, 16x16) sharing one
uncompressed 640-byte run, so the labels can be redrawn in place: no pointer
aims at either run, and neither run is duplicated anywhere else in the ROM.

Colours follow the original: index 3 is the letter body, index 1 is the outline
that surrounds it, index 0 stays transparent.
"""
import hashlib
from pathlib import Path

from exe1_k_font_source import ks_x_1001_ordinal
from pet_menu_graphics import unpack

WIDTH, HEIGHT = 80, 16
ADVANCE = 16
FILL, OUTLINE = 3, 1
# (rom offset, expected byte length, label)
LABELS = (
    (0x7F5E90, 640, '처음부터'),
    (0x7F6110, 640, '이어하기'),
)
# (canvas x origin, tiles wide, first tile in the 20-tile run)
SPRITES = ((0, 4, 0), (32, 4, 8), (64, 2, 16))

digest = lambda b: hashlib.sha256(b).hexdigest()


def _locate(x, y):
    """Canvas pixel -> (byte offset in the run, True when it is the low nibble)."""
    for origin, columns, first in SPRITES:
        if origin <= x < origin + columns*8:
            local_x, local_y = x - origin, y
            tile = first + (local_y//8)*columns + (local_x//8)
            return tile*32 + (local_y % 8)*4 + (local_x % 8)//2, (local_x % 2 == 0)
    raise ValueError(f'x={x} is outside the label canvas')


def _encode(canvas):
    run = bytearray(640)
    for y in range(HEIGHT):
        for x in range(WIDTH):
            offset, low = _locate(x, y)
            value = canvas[y][x] & 0xF
            run[offset] = (run[offset] & 0xF0) | value if low else (run[offset] & 0x0F) | (value << 4)
    return bytes(run)


def compose(text, master_font):
    """Lay the label out centred, then ring the letter body with the outline."""
    ink_width = (len(text)-1)*ADVANCE + 8
    if ink_width + 2 > WIDTH:
        raise ValueError(f'{text!r} does not fit the {WIDTH}px label')
    left = (WIDTH - ink_width)//2
    body = [[False]*WIDTH for _ in range(HEIGHT)]
    for index, char in enumerate(text):
        ordinal = ks_x_1001_ordinal(char)
        record = master_font[ordinal*64:(ordinal+1)*64]
        if len(record) != 64:
            raise ValueError(f'{char!r} has no master font record')
        mask = unpack(record)
        for y in range(HEIGHT):
            for x in range(8):
                if mask[y*8+x] == 3:
                    body[y][left + index*ADVANCE + x] = True
    canvas = [[0]*WIDTH for _ in range(HEIGHT)]
    for y in range(HEIGHT):
        for x in range(WIDTH):
            if body[y][x]:
                canvas[y][x] = FILL
                continue
            for dy in (-1, 0, 1):
                for dx in (-1, 0, 1):
                    ny, nx = y+dy, x+dx
                    if 0 <= ny < HEIGHT and 0 <= nx < WIDTH and body[ny][nx]:
                        canvas[y][x] = OUTLINE
                        break
                if canvas[y][x]:
                    break
    return canvas


def planned_writes(source, master_font):
    writes, records = [], []
    for offset, length, text in LABELS:
        before = source[offset:offset+length]
        if len(before) != length:
            raise ValueError(f'label run at 0x{offset:07X} is truncated')
        if set(nibble for byte in before for nibble in (byte & 0xF, byte >> 4)) - {0, FILL, OUTLINE}:
            raise ValueError(f'label run at 0x{offset:07X} uses unexpected colours')
        payload = _encode(compose(text, master_font))
        writes.append({'kind': 'graphics_asset', 'name': f'title_menu_{offset:06x}',
                       'rom_offset': offset, 'byte_length': length,
                       'expected_source_sha256': digest(before),
                       'sha256': digest(payload), 'replacement_hex': payload.hex()})
        records.append({'text': text, 'rom_offset': offset, 'byte_length': length,
                        'source_sha256': digest(before), 'sha256': digest(payload)})
    return writes, {'module_sha256': digest(Path(__file__).read_bytes()),
                    'canvas': f'{WIDTH}x{HEIGHT}', 'advance': ADVANCE,
                    'body_colour': FILL, 'outline_colour': OUTLINE,
                    'in_place': True, 'labels': records}
