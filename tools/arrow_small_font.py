"""Authored 7x6 Korean pixel lettering for the small navigation arrows.

These are native tiled UI glyph masks, not rescaled 8x16 dialogue glyphs.
Advance is 8 pixels. The caller centers the line inside the original arrow.
"""
GLYPHS = {
    '메': ('1110101','1010101','1011101','1010101','1110101','0000101'),
    '모': ('0111110','0100010','0111110','0001000','0001000','1111111'),
    '라': ('1111010','0001010','1111011','1000010','1111010','0000010'),
    '이': ('0110001','1001001','1001001','1001001','0110001','0000001'),
    '브': ('0100010','0111110','0100010','0111110','0000000','1111111'),
    '러': ('1111001','0001001','1111011','1000001','1111001','0000001'),
    '리': ('1111001','0001001','1111001','1000001','1111001','0000001'),
    '케': ('1110101','0010101','1110101','0011101','0010101','0000101'),
    '데': ('1110101','1000101','1001101','1000101','1110101','0000101'),
    '스': ('0001000','0010100','0100010','1000001','0000000','1111111'),
    '크': ('0111110','0000010','0111110','0000010','0000000','1111111'),
}


def render(text, width, left=None):
    assert all(c in GLYPHS for c in text)
    ink_width=len(text)*8-1
    assert ink_width < width
    left=(width-ink_width)//2 if left is None else left
    assert 0 <= left and left+ink_width <= width
    pixels=[False]*(width*8)
    for i,c in enumerate(text):
        rows=GLYPHS[c]
        assert len(rows)==6 and all(len(row)==7 for row in rows)
        for y,row in enumerate(rows):
            for x,v in enumerate(row):
                if v=='1':pixels[y*width+left+i*8+x]=True
    # Match the original P.A lettering baseline: rows 0..5 are ink,
    # row 6 is orange padding and row 7 is the untouched outer edge.
    assert not any(pixels[-2*width:])
    return pixels
