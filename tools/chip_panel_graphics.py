"""Korean lettering for the custom screen's OK and ADD message panels.

The panel beside the chip grid shows a 64x56 picture: a chip's artwork, or -
when the cursor rests on OK or ADD - a message drawn as a picture. The three
messages are uncompressed 4bpp images in image slots of the chip data table
(records 304-309 and 313 point at them): 0x71C490 ADDITIONAL CHIP DATA,
0x71CB90 CHIP DATA TRANSMISSION, 0x71E090 NO DATA SELECTED. Encoding the
Japanese and searching the ROM finds nothing because it was never text.

Each image is redrawn in place - same size, same palette, the English heading
and the corner ornament untouched - with its Japanese lines replaced by two
lines of the master Hangul font. Colours follow the original: index 1 is the
panel, 3 the message letters.
"""
import hashlib
from pathlib import Path

from exe1_k_font_source import ks_x_1001_ordinal
from pet_menu_graphics import unpack

WIDTH, HEIGHT = 64, 56
BYTE_LENGTH = WIDTH * HEIGHT // 2
PANEL, LETTER = 1, 3
MESSAGE_COLOURS = {2, 3, 13}
ORNAMENT = {14, 15}
ADVANCE, SPACE = 8, 4
INK_TOP, INK_BOTTOM = 1, 14          # rows the master Hangul glyphs ink
LINE_PITCH = 15                      # a line's ink height plus one clear row
# The ornament's highlight is drawn in the letter colour; a line that ends
# right beside it reads as if the ornament were more letters.
ORNAMENT_MARGIN = 6
# The master font has no Latin '!'; a 2px stroke matching the glyph height,
# one clear column after the previous glyph so it does not read as part of it.
BANG = {(x, y) for x in (1, 2) for y in list(range(2, 11)) + [13, 14]}
BANG_ADVANCE = 4
# (rom offset, source sha256, first row below the English heading's ink, lines)
PANELS = (
    (0x71C490, "548c6b1156c50db170a3c822888cea3bd801ae9069e2b33af56fcd5c96b09d59", 20,
     ("칩을 버린 만큼", "폴더 오픈!")),
    (0x71CB90, "a40393a7b2ca33c40f796dbee7884b0727453db039b8ff16f5825eadd2ca3346", 21,
     ("칩 데이터를", "전송합니다")),
    (0x71E090, "a70c3537dc6285205e5cab7e54b36c5a8f8311c93fe80438690f0d0004efc39d", 19,
     ("칩이 선택되지", "않았습니다")),
)

digest = lambda data: hashlib.sha256(data).hexdigest()


def _offset(x, y):
    """Canvas pixel -> (byte offset, True for the low nibble); 8 tiles per row."""
    tile = (y // 8) * (WIDTH // 8) + x // 8
    return tile * 32 + (y % 8) * 4 + (x % 8) // 2, x % 2 == 0


def decode(image):
    canvas = [[0] * WIDTH for _ in range(HEIGHT)]
    for y in range(HEIGHT):
        for x in range(WIDTH):
            at, low = _offset(x, y)
            canvas[y][x] = image[at] & 0xF if low else image[at] >> 4
    return canvas


def encode(canvas):
    out = bytearray(BYTE_LENGTH)
    for y in range(HEIGHT):
        for x in range(WIDTH):
            at, low = _offset(x, y)
            value = canvas[y][x] & 0xF
            out[at] = (out[at] & 0xF0) | value if low else (out[at] & 0x0F) | (value << 4)
    return bytes(out)


def _line_pixels(text, master_font):
    """Ink pixels of one line laid out from x=0, and the line's advance width."""
    pixels, cursor = set(), 0
    for char in text:
        if char == " ":
            cursor += SPACE
            continue
        if char == "!":
            pixels |= {(cursor + x, y) for x, y in BANG}
            cursor += BANG_ADVANCE
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
        cursor += ADVANCE
    return pixels, cursor


def compose(image, first_row, lines, master_font, reference):
    """Clear the Japanese lines, restore the ornament under them, draw the Korean.

    `reference` is the TRANSMISSION panel: its message stays clear of the
    corner ornament, and the other two panels carry the identical ornament
    except where ADD's last word was drawn over it.
    """
    canvas = decode(image)
    ornament_x = []
    for y in range(HEIGHT):
        xs = [x for x in range(WIDTH) if reference[y][x] in ORNAMENT]
        ornament_x.append(min(xs) if xs else WIDTH)
    for y in range(first_row, HEIGHT):
        for x in range(WIDTH):
            if canvas[y][x] not in MESSAGE_COLOURS:
                continue
            if reference[y][x] in ORNAMENT:
                canvas[y][x] = reference[y][x]
            elif x < ornament_x[y]:
                canvas[y][x] = PANEL
    for number, text in enumerate(lines):
        top = first_row + 1 + number * LINE_PITCH
        pixels, advance = _line_pixels(text, master_font)
        rows = range(top, top + INK_BOTTOM - INK_TOP + 1)
        room = min(ornament_x[y] for y in rows)
        room = WIDTH if room == WIDTH else room - ORNAMENT_MARGIN
        left = (room - advance) // 2
        for x, y in pixels:
            cx, cy = left + x, top + (y - INK_TOP)
            if not (first_row <= cy < HEIGHT and 0 <= cx < ornament_x[cy]):
                raise ValueError(f"{text!r} does not fit the panel below its heading")
            if canvas[cy][cx] != PANEL:
                raise ValueError(f"{text!r} would draw over the heading or ornament")
            canvas[cy][cx] = LETTER
    return encode(canvas)


REFERENCE = 0x71CB90


def planned_writes(source, master_font):
    writes, records = [], []
    reference_sha = next(sha for offset, sha, _, _ in PANELS if offset == REFERENCE)
    reference_image = source[REFERENCE:REFERENCE + BYTE_LENGTH]
    if digest(reference_image) != reference_sha:
        raise ValueError("reference panel image is not the expected source")
    reference = decode(reference_image)
    for offset, source_sha, first_row, lines in PANELS:
        before = source[offset:offset + BYTE_LENGTH]
        if digest(before) != source_sha:
            raise ValueError(f"panel image at 0x{offset:07X} is not the expected source")
        if encode(decode(before)) != before:
            raise AssertionError("panel image does not round-trip")
        payload = compose(before, first_row, lines, master_font, reference)
        writes.append({"kind": "graphics_asset", "name": f"chip_panel_{offset:06x}",
                       "rom_offset": offset, "byte_length": BYTE_LENGTH,
                       "expected_source_sha256": source_sha,
                       "sha256": digest(payload), "replacement_hex": payload.hex()})
        records.append({"lines": list(lines), "rom_offset": offset,
                        "source_sha256": source_sha, "sha256": digest(payload)})
    return writes, {"module_sha256": digest(Path(__file__).read_bytes()),
                    "canvas": f"{WIDTH}x{HEIGHT}", "in_place": True,
                    "letter_colour": LETTER, "panels": records}
