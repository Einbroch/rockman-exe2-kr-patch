# Dialogue-state VRAM graphics probe

Target: `Battle Network Rockman EXE 2 (Japan) (Rev 1).gba`, SHA-256
`1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.
State: `Battle Network Rockman EXE 2 (Japan) (Rev 1).ss1`, SHA-256
`819619baf8bef2360c6e2c55fa9adc6fc669932478cb6f20bc2b1907113f6914`.

## Observations

The state has mode 0 with BG0--BG3 enabled. Three complete BIOS-LZ77 0x10
ROM streams exactly match VRAM. Their 4bpp tile ranges are in active tilemaps:

| ROM file offset | VRAM offset | Tiles | Active background |
|---:|---:|---:|---|
| 4,271,628 | 0 | 188 | BG1 |
| 4,273,912 | 6,016 | 198 | BG2 |
| 4,276,820 | 16,384 | 65 | BG3 |

Each range has one blank tile; all three otherwise use all sixteen palette
indices and have comparatively dense tile data. This is not enough to classify
any range as a dialogue font. The measurements deliberately omit tiles,
palettes, and screenshots.

A second pass searched every validated LZ77 stream for aligned runs of at
least eight matching 4bpp tiles in VRAM, ignoring low-diversity repeated-tile
runs. It found only the same three complete streams above: no additional
partial compressed-font candidate was observed in this state.

## Consequence

This is negative evidence for the narrow hypothesis that the visible dialogue
glyphs are supplied by another validated LZ77 graphics stream resident in
VRAM. It does **not** show that these backgrounds are not font layers, that a
font is absent, or how graphics are loaded. Plausible remaining routes include
uncompressed graphics, runtime-generated/copy-based tiles, OBJ graphics, and
a different game state.

The next discriminating observation is a second savestate with different
dialogue glyphs at the same screen layout, or a debugger read watchpoint on
the observed dialogue-entry pointer. Either can distinguish changing glyph
tiles from static UI layers without modifying the ROM.
