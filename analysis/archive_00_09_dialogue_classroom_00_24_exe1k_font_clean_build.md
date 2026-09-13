# Archive 00/09 entries 0–17 and 22–24 EXE1 K font build

The clean development ROM now reinserts 21 Korean draft entries: entries 0 through 17 plus entries 22 through 24. Entries 18 through 21 are zero-length in the original archive. The new scope adds the classroom search hint, the hidden battle-chip response, and MegaMan's mail notification. Entry 25 begins a longer event chain and remains the next target.

## Build

- Supported source: `Battle Network Rockman EXE 2 (Japan) (Rev 1).gba`
- Source SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- Output: `poc/output/exe2_rev1_archive_00_09_dialogue_classroom_00_24_exe1k_font_clean_poc.gba`
- Output SHA-256: `9a1fa743f5dd2f9e0c2d833f4dd704956ba2b00d90706699dff9f5fad25acd21`
- Output size: 16,777,216 bytes
- Hangul glyphs used by structured replacements: 215
- Provisional codepage mappings: 219
- Provisional codepage remaining capacity: 37 assignments
- Relocated compressed archive: 4,916 bytes
- Runtime decompressed archive: 6,490 bytes

The primary build regenerated the ROM from the untouched supported Rev 1 source and omitted the historical `가나다` diagnostic stage. The independent verifier passed protected source-slot preservation, untranslated-entry byte identity, structured-segment reconstruction, rebuilt-table equivalence, EXE1 font-record identity, GBA header checksum, and expanded-tail checks. See `analysis/archive_00_09_dialogue_classroom_00_24_exe1k_font_clean_verification.json`.

## Translation and controls

Entry 22 retains the flag check, portrait, message-open, line, page, wait, clear, and end controls. Entry 23 retains both `waitSkip` frames (30 and 10 frames) and its two-page control sequence. Entry 24 retains the mail-add control `f2 0c 00 07`. Existing display-only annotations such as `[선택]` were removed from `proposed_pages`; the protected replacement segments and draft wording were not changed by that cleanup.

All wording remains a machine draft under the non-distributable development-input policy.

## Muted runtime verification

Mesen was launched with `display:false` and `sound:false`. A fresh reset and new-game route caused the exact final ROM to load its relocated archive. The 6,490 bytes at `0x02038800` matched the build output with zero differences.

After that natural archive load, only the active renderer cursor was redirected. Entry 22 rendered both pages, entry 23 rendered both pages, and entry 24 rendered its page. No clipping, Japanese residue, or broken glyphs were observed. This proves the exact build's renderer and progression behavior but does not prove the bypassed map-interaction routes.

The new `혹` glyph caused a read of target font record 694 at CPU address `0x086A2130`. The hit occurred at frame 8363, PC `0x08020DA6`, with `r8=694`. The record matches EXE1 K source record 2771 exactly (SHA-256 `572b931f909bafe35699366e62d116f2777bee1051ddc872251ba56bcc918732`). Full details are in `analysis/archive_00_09_dialogue_classroom_00_24_exe1k_font_runtime.json`.

## Remaining gates

- Independent human translation and terminology review
- Natural map-interaction captures for entries 22–24
- Translation and control analysis for the entry-25 event chain
- Font reuse permission or a clean-room redistributable replacement font
- Full script coverage, production-wide font-slot safety, and release-grade delta patch packaging
