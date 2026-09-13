# Archive 00/09 entries 0–13 EXE1 K font build

The clean development ROM now reinserts a continuous 14-entry Korean draft for archive 00/09 entries 0 through 13. Entries 10 through 12 add the classroom PET tutorial, the boy's friendship dialogue, and the girl's day-off dialogue. Every original line/page/choice/chapter-check control remains protected by the structured translation asset.

## Build

- Supported source: `Battle Network Rockman EXE 2 (Japan) (Rev 1).gba`
- Source SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- Output: `poc/output/exe2_rev1_archive_00_09_dialogue_classroom_00_13_exe1k_font_clean_poc.gba`
- Output SHA-256: `6f2e62545979fc3526cdf083df43d0264d0e02596fe2d0130bc8e63b86e97dda`
- Output size: 16,777,216 bytes
- Required Hangul glyphs used by the structured replacements: 162
- Relocated compressed archive: 4,606 bytes
- Runtime decompressed archive: 6,326 bytes

The independent static verifier passed all protected source-byte, control-sequence, rebuilt-table, untranslated-entry, font-record, GBA header, and expanded-tail checks. See `analysis/archive_00_09_dialogue_classroom_00_13_exe1k_font_clean_verification.json`.

## Font baseline

The build uses the 8×16 KS X 1001 pixel records from the local `Battle Network Rockman EXE 1 [K].gba` as a development reference. The source ROM SHA-256 is `c0753c1d3170f69e1eb8b03a02875ec63c5622185ac4afbb2b8688c53209d865`. This produces a thinner, game-native-looking result than the previous Gulim rasterization.

This source is not cleared for redistribution. Its authorship, license, and permission status remain unverified, so the ROM and font data are non-distributable local PoC inputs.

## Muted runtime verification

Mesen was launched with `display:false` and `sound:false`. A clean reset, title start, and new-game classroom route naturally loaded the relocated archive. The EWRAM dump at `0x02038800` matched the expected 6,326 bytes exactly, with zero differing bytes.

Focused renderer tests used a recorded classroom state plus an explicit archive/cursor intervention. Entry 10 rendered both pages and its choice; the default branch entered original entry 16, while the alternate option and B input rendered the Korean post-choice response. Entry 11 rendered both pages, and entry 12 rendered its page without clipping. This focused evidence proves the renderer and control flow, but natural chapter-gated entry selection still needs a separate capture.

The newly added `휴` glyph caused reads of target font record 617 at CPU address `0x086A0DF0`; the hit occurred at renderer PC `0x08020DA6` with `r8=617`. Its 64-byte record exactly matches EXE1 K source record 2829 (SHA-256 `4fdcf15403ebf912cc656124ed4d0c6f1ea9f234ab16def0d751cb5fec17d182`). Full runtime details are in `analysis/archive_00_09_dialogue_classroom_00_13_exe1k_font_runtime.json`.

## Remaining gates

- Independent human translation and terminology review
- Natural gameplay captures for the chapter-gated entry 10–12 routes
- Font reuse permission or a clean-room redistributable replacement font
- Full script coverage and release-grade delta patch packaging
