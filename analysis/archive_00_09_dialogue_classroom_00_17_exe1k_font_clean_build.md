# Archive 00/09 entries 0–17 EXE1 K font build

The clean development ROM now reinserts a continuous 18-entry Korean draft for archive 00/09 entries 0 through 17. Entries 14 and 15 add MegaMan's school-exit reminders, entry 16 adds the PET-explanation choice, and entry 17 adds all six explanation pages. Entries 18 through 21 are zero-length in the original archive, so entry 22 is the next non-empty target.

## Build

- Supported source: `Battle Network Rockman EXE 2 (Japan) (Rev 1).gba`
- Source SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- Output: `poc/output/exe2_rev1_archive_00_09_dialogue_classroom_00_17_exe1k_font_clean_poc.gba`
- Output SHA-256: `ba857911c6a027e6fa5615296b979bef2342c933b67c777d116f7b7fc29bcd3e`
- Output size: 16,777,216 bytes
- Hangul glyphs used by structured replacements: 200
- Provisional codepage remaining capacity: 52 assignments
- Relocated compressed archive: 4,893 bytes
- Runtime decompressed archive: 6,460 bytes

The independent static verifier passed protected source-slot, untranslated-entry identity, structured-segment reconstruction, rebuilt-table, font-record, GBA checksum, and expanded-tail checks. See `analysis/archive_00_09_dialogue_classroom_00_17_exe1k_font_clean_verification.json`.

## Structured source glyph segment

Entry 17 preserves the game's source glyphs for `PErsonal Terminal`. The new `source_glyph_hex` segment type accepts only complete E5/E6 pairs that are byte-identical to one contiguous run in the protected source entry. The planner, builder, and independent verifier all enforce that rule. The character name on page 6 is encoded as Hangul `록맨`, not copied Japanese glyph bytes.

An intermediate, now-superseded build exposed a Japanese `ロックマン` residue on page 6. That defect was rejected, the segment was corrected, and the ROM was rebuilt from the untouched Rev 1 source. The final six-page capture contains `록맨` and no observed Japanese residue.

## Font baseline

The build uses the 8×16 KS X 1001 pixel records from the local `Battle Network Rockman EXE 1 [K].gba` as a development reference. Its SHA-256 is `c0753c1d3170f69e1eb8b03a02875ec63c5622185ac4afbb2b8688c53209d865`. The source's authorship, license, and redistribution permission remain unverified, so it is a non-distributable local PoC input.

## Muted runtime verification

Mesen was launched with `display:false` and `sound:false`. A clean reset and new-game route loaded the relocated archive from the exact final ROM. The EWRAM bytes at `0x02038800` matched the expected 6,460-byte decompressed archive with zero differences.

Focused tests used recorded classroom states plus explicit archive/cursor interventions. Entries 14 and 15 rendered without clipping. Entry 16's alternate option and B input both closed the dialogue normally. Its default branch entered entry 17, whose six pages displayed correctly, including `PErsonal Terminal` and `록맨`. This focused evidence proves exact-ROM rendering and branch behavior, while natural gameplay selection of these entries remains a separate evidence gate.

The newly added `개` glyph caused reads of target font record 620 at CPU address `0x086A0EB0`. The renderer hit occurred at frame 3287, PC `0x08020DA6`, with `r8=620`. The 64-byte record matches EXE1 K source record 530 exactly (SHA-256 `c9f1e623f7ba7e47a132482d3bfa22d75d7e4f922f3e4a72ecee523d92b24141`). Full details are in `analysis/archive_00_09_dialogue_classroom_00_17_exe1k_font_runtime.json`.

## Remaining gates

- Independent human translation and terminology review
- Natural gameplay captures for entries 14–17
- Font reuse permission or a clean-room redistributable replacement font
- Full script coverage, production-wide slot-safety proof, and release-grade delta patch packaging
