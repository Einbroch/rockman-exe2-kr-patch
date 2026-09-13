# Rev 1 translation workspace

`rev1_message_candidates.json` is a protected structural candidate workspace
seeded from the verified 427-block Rev 1 catalog. It stores stable IDs,
coordinates, lengths, and source hashes only; it does not include copied ROM
bytes or decoded game text.

All entries begin as `blocked_control_spec`. They are not translation or build
inputs until the relevant message decoder and control-token boundaries are
verified. `tools/validate_translation_workspace.py` verifies every protected
range against the immutable supported ROM before future editing or reinsertion
steps can consume it.

`archive_00_09_dialogue_draft.json` is a separate, bounded draft for entries
0 through 17 and 22 through 24 used by the LZ77 archive PoC. Protected
entry bytes, replacement spans, direct glyph bytes, and control bytes are kept
separate. It can be selected only by the explicitly non-distributable
development builder; it is not eligible for a release-candidate build because
the wording still needs human review. Entries 0 and 1 came from the
byte-identical full archive extraction and form a direct jump chain. Entry 1
contains four pages; its page clears, line breaks, final key wait, and inline
30-frame `waitSkip` command are preserved as structured controls. Entries 2
through 4 form another verified jump chain. Entry 5 is a one-page greeting
whose terminating jump into choice-bearing entry 6 is preserved. Entry 6
keeps the original opaque option-layout and select frames byte-for-byte and
has passed natural-route tests for both options and B continuation. Entry 7
keeps the repeated choice frame byte-for-byte; a muted exact-ROM focused test
rendered its Korean text, reached entry 8 through the default option, repeated
entry 7 through the alternate option, and matched the original B-input
behavior. Entry 13 covers all four visible pages, with page and line controls
preserved as structured segments. Entry 8 adds the four-page folding-fan
collection explanation and its two explicit option branches; entry 9 adds the
negative response while preserving the inline 30-frame wait. Both explicit
branches passed a muted exact-ROM focused test. Entry 10 adds the classroom PET
tutorial and preserves its two-option select frame and post-choice continuation.
Entries 11 and 12 preserve their original chapter-check prefixes while adding
the boy's friendship dialogue and the girl's day-off dialogue. Muted exact-ROM
focused tests rendered all entry 10–12 pages and entry 10's two options plus B
continuation. Entries 14 and 15 add MegaMan's school-exit reminders. Entry 16
keeps the original two-option frame and jumps to entry 17 only through its
default branch; the alternate branch and B input both close the dialogue.
Entry 17 contains six PET-explanation pages. Its Latin expansion is represented
by the typed `source_glyph_hex` segment, which accepts only complete E5/E6 glyph
pairs copied byte-identically from a declared protected source span. This keeps
`PErsonal Terminal` in the game's source glyphs without treating those bytes as
unvalidated free-form text. Exact-ROM muted tests rendered entries 14 and 15,
both entry-16 exit paths, and all six entry-17 pages. Entries 18 through 21 are
zero-length in the source archive. Entries 22 through 24 add the classroom
search hint, hidden battle-chip response, and MegaMan's mail notification.
Their two-page, two-page, and one-page flows passed exact-ROM muted rendering
after a natural fresh-boot archive load. Entry 25 is the next translation target
and begins a longer event chain. The current Hangul repertoire is compiled in
`poc/output/korean_codepage_archive_00_09_dialogue_classroom_00_24_draft.json` while preserving every
assignment in the earlier catalog-screened PoC codepage.

The current development candidate copies all 215 Hangul records actually used
by the structured replacements from
the local `Battle Network Rockman EXE 1 [K].gba` KS X 1001 8×16 pixel font.
That ROM's SHA-256 is
`c0753c1d3170f69e1eb8b03a02875ec63c5622185ac4afbb2b8688c53209d865`.
Its authorship, license, and redistribution permission are not verified, so it
is a non-distributable local reference only. The prior Gulim and Malgun
candidates remain historical evidence rather than the latest build input.

`tools/build_integrated_archive_translation_draft_poc.py` rebuilds the current
translation test ROM from the untouched supported Rev 1 ROM. It validates the
translation asset against a fresh extraction, preserves the declared control
sequence, recalculates all later archive offsets, installs the required glyphs,
and records every component write in manifests under `poc/output/`. The clean
archive-only composition is the default. The historical nine-entry `가나다`
active-block diagnostic stage is available only through the explicit
`--include-active-probe` option and must not be used for translation QA.

## 100-entry translation batches

`translation_batch_policy.json` fixes the user-requested working unit at 100
text-bearing archive entries. Control-only and zero-length entries do not
consume a translation slot.

`archive_00_11_batch_0001_authored.json` contains the first semantic Korean
draft for archive 00/11. `tools/build_textpet_translation_batch.py` combines
that authored layer with protected data regenerated from the supported Rev 1
ROM and the byte-identical TextPet extraction. The resulting
`archive_00_11_batch_0001_100.json` contains exactly 100 text-bearing entries,
from script 0 through script 199 in source order; control-only scripts 6, 11,
13, and 14 are excluded. Every protected raw-entry hash and TPL-block hash has
passed static verification, as have the explicitly authored wait/item/chip/code
tokens. Eleven text-bearing entries remain in archive 00/11 for the next batch.

This batch is a machine draft awaiting language and layout review. It has not
yet been reinserted into the ROM. Emulator testing remains deferred while the
general translation pass continues.

`archive_batch_0002_100.json` is the second protected 100-entry batch. It spans
the final 11 text entries in archive 00/11, all 42 text entries in archive
00/12, and the first 47 text entries in archive 00/13. The source-order plan is
stored in `archive_batch_0002_plan.json`, while authored Korean wording remains
separate in `archive_batch_0002_authored.json`. All three archive extractions
round-trip byte-identically through TextPet, and the batch passed raw-entry,
TPL-block, control-token, key-order, uniqueness, and nonempty-translation
checks. Archives 00/11 and 00/12 now have complete semantic drafts; 107 text
entries remain in archive 00/13. Including the earlier 70-entry archive 00/09
draft, the project now has 270 semantic draft entries.

The combined draft repertoire is projected at 628 of 713 contextual font-bank
slots, leaving 85. This is sufficient for the current second batch but is an
explicit capacity risk for later batches; it does not authorize silent glyph
substitution or prose rewriting.

`archive_batch_0003_100.json` is the third protected 100-entry batch. It uses
the next 100 text-bearing entries from archive 00/13, beginning at source-order
ordinal 47 (script 65) and ending at script 224. The immutable source archive,
entry bytes, TPL blocks, and authored `wait`, `waitSkip`, item, chip, and code
tokens all passed static verification. Seven text-bearing entries remain in
archive 00/13: 225, 226, 227, 228, 229, 235, and 236.

Including archive 00/09 and the first three 100-entry batches, the project now
has 370 semantic draft entries. The projected combined Hangul repertoire is
667 of 713 contextual font-bank slots, leaving 46. This remains a development
projection only; the batch has not been reinserted or tested in an emulator.

`archive_batch_0004_100.json` is the fourth protected 100-entry batch. It
contains the final seven text entries in archive 00/13, all 42 in archive
00/14, all 27 in archive 00/15, and the first 24 in archive 00/16. All four
archives round-trip byte-identically through TextPet, and the protected entry,
TPL-block, ordering, uniqueness, Japanese-kana residual, and authored control
token checks passed.

The project now has 470 semantic draft entries. Archives 00/13, 00/14, and
00/15 have complete semantic drafts; 59 text entries remain in archive 00/16.
The projected combined Hangul repertoire is 690 of 713 contextual font-bank
slots, leaving 23. The fourth batch still fits, but the next 100-entry batch has
a high risk of exceeding the current font-bank design. Translation wording
must not be silently shortened or substituted to avoid that engineering limit.

`archive_batch_0005_100.json` is the fifth protected 100-entry batch. It
contains the final 59 text entries in archive 00/16, all 37 text entries in
archive 00/17, and the first four text entries in archive 00/18. Archives
00/16 and 00/17 now have complete semantic drafts; 17 text entries remain in
archive 00/18. The plan and authored wording are kept separately in
`archive_batch_0005_plan.json` and `archive_batch_0005_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
five 100-entry batches, Japanese-kana residual scan, tracked inline control
commands, and deterministic rebuild passed static verification. Including the
earlier 70-entry archive 00/09 draft, the project now has 570 semantic draft
entries.

The projected combined Hangul repertoire is 728 syllables against the current
713-slot contextual font bank, an overflow of 15 distinct syllables. The
translation wording remains intact and in `machine_draft_needs_human_review`
state. ROM reinsertion is blocked until the font-capacity design is expanded
or an explicit, reviewed wording decision changes the repertoire; emulator
testing remains deferred.

`archive_batch_0006_100.json` is the sixth protected 100-entry batch. It
contains the final 17 text entries in archive 00/18, all 46 text entries in
archive 00/19, and the first 37 text entries in archive 00/20. Archives 00/18
and 00/19 now have complete semantic drafts; 24 text entries remain in archive
00/20. The source-order plan and authored wording are stored separately in
`archive_batch_0006_plan.json` and `archive_batch_0006_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all six
100-entry batches, Japanese-kana residual scan, exact tracked inline control
commands, and deterministic rebuild passed static verification. Including the
earlier 70-entry archive 00/09 draft, the project now has 670 semantic draft
entries.

The projected combined Hangul repertoire is 767 syllables against the current
713-slot contextual font bank, an overflow of 54 distinct syllables. Wording
was not shortened or substituted to fit the technical limit. ROM reinsertion
therefore remains blocked pending a larger font-capacity design, and emulator
testing remains deferred.

`archive_batch_0007_100.json` is the seventh protected 100-entry batch. It
contains the final 24 text entries in archive 00/20, all 41 text entries in
archive 00/21, and the first 35 text entries in archive 00/22. Archives 00/20
and 00/21 now have complete semantic drafts; 69 text entries remain in archive
00/22. The source-order plan and authored wording are stored separately in
`archive_batch_0007_plan.json` and `archive_batch_0007_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
seven 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed static verification.
Including the earlier 70-entry archive 00/09 draft, the project now has 770
semantic draft entries.

The projected combined Hangul repertoire is 788 syllables against the current
713-slot contextual font bank, an overflow of 75 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0008_100.json` is the eighth protected 100-entry batch. It
contains the final 69 text entries in archive 00/22 and the first 31 text
entries in archive 00/23. Archive 00/22 now has a complete semantic draft;
9 text entries remain in archive 00/23. The source-order plan and authored
wording are stored separately in `archive_batch_0008_plan.json` and
`archive_batch_0008_authored.json`.

Both source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
eight 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed static verification.
Including the earlier 70-entry archive 00/09 draft, the project now has 870
semantic draft entries.

The projected combined Hangul repertoire is 803 syllables against the current
713-slot contextual font bank, an overflow of 90 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0009_100.json` is the ninth protected 100-entry batch. It
contains the final 9 text entries in archive 00/23, all 88 text-bearing
entries in archive 00/24, and the first 3 text entries in archive 00/25.
Archives 00/23 and 00/24 now have complete semantic drafts; 59 text entries
remain in archive 00/25. The source-order plan and authored wording are stored
separately in `archive_batch_0009_plan.json` and
`archive_batch_0009_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
nine 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed static verification.
Including the earlier 70-entry archive 00/09 draft, the project now has 970
semantic draft entries.

The projected combined Hangul repertoire is 817 syllables against the current
713-slot contextual font bank, an overflow of 104 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0010_100.json` is the tenth protected 100-entry batch. It
contains the final 59 text entries in archive 00/25, all 20 text entries in
archive 00/26, and the first 21 text entries in archive 00/27. Archives 00/25
and 00/26 now have complete semantic drafts; 90 text entries remain in archive
00/27. The source-order plan and authored wording are stored separately in
`archive_batch_0010_plan.json` and `archive_batch_0010_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all ten
100-entry batches, Japanese-kana residual scan, exact tracked inline control
commands, and deterministic rebuild passed static verification. Including the
earlier 70-entry archive 00/09 draft, the project now has 1,070 semantic draft
entries.

The projected combined Hangul repertoire is 836 syllables against the current
713-slot contextual font bank, an overflow of 123 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0011_100.json` is the eleventh protected 100-entry batch. It
contains the final 90 text entries in archive 00/27 and the first 10 text
entries in archive 00/28. Archive 00/27 now has a complete semantic draft;
39 text entries remain in archive 00/28. The source-order plan and authored
wording are stored separately in `archive_batch_0011_plan.json` and
`archive_batch_0011_authored.json`.

Both source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
eleven 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed static verification.
Including the earlier 70-entry archive 00/09 draft, the project now has 1,170
semantic draft entries.

The projected combined Hangul repertoire is 843 syllables against the current
713-slot contextual font bank, an overflow of 130 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0012_100.json` is the twelfth protected 100-entry batch. It
contains the final 39 text entries in archive 00/28, all 60 text-bearing
entries in archive 00/29, and the first text entry in archive 00/30. Archives
00/28 and 00/29 now have complete semantic drafts; 90 text entries remain in
archive 00/30. The source-order plan and authored wording are stored
separately in `archive_batch_0012_plan.json` and
`archive_batch_0012_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twelve 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed static verification.
Including the earlier 70-entry archive 00/09 draft, the project now has 1,270
semantic draft entries.

The projected combined Hangul repertoire is 867 syllables against the current
713-slot contextual font bank, an overflow of 154 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0013_100.json` is the thirteenth protected 100-entry batch. It
contains the final 90 text entries in archive 00/30 and the first 10 text
entries in archive 00/31. Archive 00/30 now has a complete semantic draft;
75 text entries remain in archive 00/31. The source-order plan and authored
wording are stored separately in `archive_batch_0013_plan.json` and
`archive_batch_0013_authored.json`.

Both source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
thirteen 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed static verification.
Including the earlier 70-entry archive 00/09 draft, the project now has 1,370
semantic draft entries.

The projected combined Hangul repertoire is 881 syllables against the current
713-slot contextual font bank, an overflow of 168 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0014_100.json` is the fourteenth protected 100-entry batch. It
contains the final 75 text entries in archive 00/31, all 22 text-bearing
entries in archive 00/32, and the first three text entries in archive 00/33.
Archives 00/31 and 00/32 now have complete semantic drafts; 68 text entries
remain in archive 00/33. The source-order plan and authored wording are stored
separately in `archive_batch_0014_plan.json` and
`archive_batch_0014_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
fourteen 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed static verification.
Including the earlier 70-entry archive 00/09 draft, the project now has 1,470
semantic draft entries.

The projected combined Hangul repertoire is 905 syllables against the current
713-slot contextual font bank, an overflow of 192 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0015_100.json` is the fifteenth protected 100-entry batch. It
contains the final 68 text entries in archive 00/33, all 28 text-bearing
entries in archive 00/34, and the first four text entries in archive 00/35.
Archives 00/33 and 00/34 now have complete semantic drafts; 37 text entries
remain in archive 00/35. The source-order plan and authored wording are stored
separately in `archive_batch_0015_plan.json` and
`archive_batch_0015_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
fifteen 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed static verification.
Including the earlier 70-entry archive 00/09 draft, the project now has 1,570
semantic draft entries.

The projected combined Hangul repertoire is 915 syllables against the current
713-slot contextual font bank, an overflow of 202 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0016_100.json` is the sixteenth protected 100-entry batch. It
contains the final 37 text entries in archive 00/35, all text-bearing entries
in archives 00/37 through 00/41, and the first 10 text entries in archive
00/43. Archive 00/35 and archives 00/37 through 00/41 now have complete
semantic drafts; three text entries remain in archive 00/43. Archives 00/36
and 00/42 contain no text-bearing script entries. The source-order plan and
authored wording are stored separately in `archive_batch_0016_plan.json` and
`archive_batch_0016_authored.json`.

All seven selected source archives round-trip byte-identically through
TextPet; the two empty intervening archives also passed byte-identical
round-trip verification. The protected raw-entry and TPL hashes, planned
ordering, stable IDs across all sixteen 100-entry batches, Japanese-kana
residual scan, exact tracked inline control commands, and deterministic
rebuild passed all 15 static checks. Including the earlier 70-entry archive
00/09 draft, the project now has 1,670 semantic draft entries.

The projected combined Hangul repertoire is 931 syllables against the current
713-slot contextual font bank, an overflow of 218 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0017_100.json` is the seventeenth protected 100-entry batch. It
contains the final three text entries in archive 00/43, all 10 text-bearing
entries in archive 00/44, all 82 text-bearing entries in archive 00/45, and
the first five text entries in archive 00/46. Archives 00/43 through 00/45 now
have complete semantic drafts; 69 text entries remain in archive 00/46. The
source-order plan and authored wording are stored separately in
`archive_batch_0017_plan.json` and `archive_batch_0017_authored.json`.

All four source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
seventeen 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed all 15 static checks.
Including the earlier 70-entry archive 00/09 draft, the project now has 1,770
semantic draft entries.

The projected combined Hangul repertoire is 951 syllables against the current
713-slot contextual font bank, an overflow of 238 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0018_100.json` is the eighteenth protected 100-entry batch. It
contains the final 69 text entries in archive 00/46 and the first 31 text
entries in archive 00/47. Archive 00/46 now has a complete semantic draft;
24 text entries remain in archive 00/47. The source-order plan and authored
wording are stored separately in `archive_batch_0018_plan.json` and
`archive_batch_0018_authored.json`.

Both source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
eighteen 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed all 15 static checks.
Including the earlier 70-entry archive 00/09 draft, the project now has 1,870
semantic draft entries.

The projected combined Hangul repertoire is 965 syllables against the current
713-slot contextual font bank, an overflow of 252 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0019_100.json` is the nineteenth protected 100-entry batch. It
contains the final 24 text entries in archive 00/47 and all text-bearing
entries in archives 00/48 through 00/59. Archives 00/47 through 00/59 now have
complete semantic drafts. The source-order plan and authored wording are
stored separately in `archive_batch_0019_plan.json` and
`archive_batch_0019_authored.json`.

All thirteen source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
nineteen 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed all 15 static checks.
Including the earlier 70-entry archive 00/09 draft, the project now has 1,970
semantic draft entries.

The projected combined Hangul repertoire is 966 syllables against the current
713-slot contextual font bank, an overflow of 253 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0020_100.json` is the twentieth protected 100-entry batch. It
contains all text-bearing entries in archives 00/60 through 00/76 and the
first four text entries in archive 00/77. Archives 00/60 through 00/76 now
have complete semantic drafts; two text entries remain in archive 00/77. The
source-order plan and authored wording are stored separately in
`archive_batch_0020_plan.json` and `archive_batch_0020_authored.json`.

All eighteen source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twenty 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed all 15 static checks.
Including the earlier 70-entry archive 00/09 draft, the project now has 2,070
semantic draft entries.

The projected combined Hangul repertoire is 973 syllables against the current
713-slot contextual font bank, an overflow of 260 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0021_100.json` is the twenty-first protected 100-entry batch.
It contains the final two text entries in archive 00/77, all text-bearing
entries in archives 00/78 through 00/83, and the first six text entries in
archive 00/84. Archives 00/77 through 00/83 now have complete semantic drafts;
10 text entries remain in archive 00/84. The source-order plan and authored
wording are stored separately in `archive_batch_0021_plan.json` and
`archive_batch_0021_authored.json`.

All eight source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twenty-one 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. Including the earlier 70-entry archive 00/09 draft, the project now
has 2,170 semantic draft entries.

The projected combined Hangul repertoire is 984 syllables against the current
713-slot contextual font bank, an overflow of 271 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0022_100.json` is the twenty-second protected 100-entry batch.
It contains the final 10 text entries in archive 00/84, all text-bearing
entries in archives 00/85 through 00/91, and the first nine text entries in
archive 00/92. Archives 00/84 through 00/91 now have complete semantic drafts;
three text entries remain in archive 00/92. The source-order plan and authored
wording are stored separately in `archive_batch_0022_plan.json` and
`archive_batch_0022_authored.json`.

All nine source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twenty-two 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. Four bandit-recovery messages retain protected `printBuffer` commands
and carry explicit review notes for dynamic zenny placement. Including the
earlier 70-entry archive 00/09 draft, the project now has 2,270 semantic draft
entries.

The projected combined Hangul repertoire is 986 syllables against the current
713-slot contextual font bank, an overflow of 273 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0023_100.json` is the twenty-third protected 100-entry batch.
It contains the final three text entries in archive 00/92, all text-bearing
entries in archives 00/93 through 00/97 and 00/99 through 00/112, and the
first two text entries in archive 00/113. Archives 00/92 through 00/112 now
have complete semantic drafts; archive 00/98 contains no text-bearing script
entries, and 11 text entries remain in archive 00/113. The source-order plan
and authored wording are stored separately in `archive_batch_0023_plan.json`
and `archive_batch_0023_authored.json`.

All twenty-one selected source archives round-trip byte-identically through
TextPet; the empty archive 00/98 also passed byte-identical round-trip
verification. The protected raw-entry and TPL hashes, planned ordering,
stable IDs across all twenty-three 100-entry batches, Japanese-kana residual
scan, exact tracked inline control commands, and deterministic rebuild passed
all 15 static checks. The SSS-license keyword retains a review note for later
integration with its answer input or choices. Including the earlier 70-entry
archive 00/09 draft, the project now has 2,370 semantic draft entries.

The projected combined Hangul repertoire is 992 syllables against the current
713-slot contextual font bank, an overflow of 279 distinct syllables. Wording
was preserved without capacity-driven shortening. ROM reinsertion remains
blocked pending a larger font-capacity design, and emulator testing remains
deferred.

`archive_batch_0024_100.json` is the twenty-fourth protected 100-entry batch.
It contains the final 11 text entries in archive 00/113, all text-bearing
entries in archives 00/114 through 00/126, and the first 17 text entries in
archive 00/127. Archives 00/113 through 00/126 now have complete semantic
drafts; 51 text entries remain in archive 00/127. The source-order plan and
authored wording are stored separately in `archive_batch_0024_plan.json` and
`archive_batch_0024_authored.json`.

All fifteen source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twenty-four 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. The long mascot-bear event preserves both text-speed changes and both
timed waits. Including the earlier 70-entry archive 00/09 draft, the project
now has 2,470 semantic draft entries.

The projected combined Hangul repertoire is 1,001 syllables against the
current 713-slot contextual font bank, an overflow of 288 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0025_100.json` is the twenty-fifth protected 100-entry batch.
It contains the final 51 text entries in archive 00/127, all 47 text-bearing
entries in archive 00/128, and the first two text entries in archive 00/129.
Archives 00/127 and 00/128 now have complete semantic drafts; 46 text entries
remain in archive 00/129. The source-order plan and authored wording are
stored separately in `archive_batch_0025_plan.json` and
`archive_batch_0025_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twenty-five 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. Two random-zenny messages retain protected `printBuffer` commands and
explicit dynamic-value review notes; one GutsMan wordplay line is also marked
for contextual review. Including the earlier 70-entry archive 00/09 draft,
the project now has 2,570 semantic draft entries.

The projected combined Hangul repertoire is 1,006 syllables against the
current 713-slot contextual font bank, an overflow of 293 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0026_100.json` is the twenty-sixth protected 100-entry batch.
It contains the final 46 text entries in archive 00/129, all 26 text-bearing
entries in archive 00/130, and the first 28 text entries in archive 00/131.
Archives 00/129 and 00/130 now have complete semantic drafts; 79 text entries
remain in archive 00/131. The source-order plan and authored wording are
stored separately in `archive_batch_0026_plan.json` and
`archive_batch_0026_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twenty-six 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. The random-chip and random-zenny messages retain protected dynamic
value commands and explicit review notes. The GutsMan speech pattern and the
five timed waits in the highest-rank license notice remain represented in the
draft. Including the earlier 70-entry archive 00/09 draft, the project now has
2,670 semantic draft entries.

The projected combined Hangul repertoire is 1,014 syllables against the
current 713-slot contextual font bank, an overflow of 301 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0027_100.json` is the twenty-seventh protected 100-entry batch.
It contains the final 79 text entries in archive 00/131, all 10 text-bearing
entries in archive 00/132, and the first 11 text entries in archive 00/133.
Archives 00/131 and 00/132 now have complete semantic drafts; 27 text entries
remain in archive 00/133. The source-order plan and authored wording are
stored separately in `archive_batch_0027_plan.json` and
`archive_batch_0027_authored.json`.

All three source archives round-trip byte-identically through TextPet. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twenty-seven 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. The independent reread aligned `ネット事件` and `ネット社会` with the
existing `네트워크 사건` and `네트워크 사회` terminology and restored the
six-dot timed pauses in the relevant license and plug-out scenes. Including
the earlier 70-entry archive 00/09 draft, the project now has 2,770 semantic
draft entries.

The projected combined Hangul repertoire is 1,018 syllables against the
current 713-slot contextual font bank, an overflow of 305 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0028_100.json` is the twenty-eighth protected 100-entry batch.
It contains the final 27 text entries in archive 00/133, all 19 text-bearing
entries in archive 00/134, all 44 text-bearing entries in archive 00/136, and
the first 10 text entries in archive 00/137. Archives 00/133, 00/134, and
00/136 now have complete semantic drafts; one text entry remains in archive
00/137. Archive 00/135 contains no text-bearing entries and was skipped only
after its independent byte-identical TextPet round-trip. The source-order plan
and authored wording are stored separately in `archive_batch_0028_plan.json`
and `archive_batch_0028_authored.json`.

All four selected source archives round-trip byte-identically through TextPet.
The protected raw-entry and TPL hashes, planned ordering, stable IDs across all
twenty-eight 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. Three random-zenny messages retain explicit dynamic-value review notes,
and the unusual slogan that turns `Kotobuki` into a greeting is marked for
contextual review. Including the earlier 70-entry archive 00/09 draft, the
project now has 2,870 semantic draft entries.

The projected combined Hangul repertoire is 1,021 syllables against the
current 713-slot contextual font bank, an overflow of 308 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0029_100.json` is the twenty-ninth protected 100-entry batch.
It contains the final text entry in archive 00/137, all text-bearing entries
in archives 00/138 through 00/140, all text-bearing entries in archives 00/142
and 00/143, and the first 16 text entries in archive 00/144. Archives 00/137
through 00/140, 00/142, and 00/143 now have complete semantic drafts; eight
text entries remain in archive 00/144. Archive 00/141 contains no text-bearing
entries and was skipped only after its independent byte-identical TextPet
round-trip. The source-order plan and authored wording are stored separately
in `archive_batch_0029_plan.json` and `archive_batch_0029_authored.json`.

All seven selected source archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all twenty-nine 100-entry batches, Japanese-kana residual scan, exact
tracked inline control commands, and deterministic rebuild passed all 15
static checks. Three random-zenny messages retain explicit dynamic-value
review notes. The independently reread draft also preserves the hostile
rhetorical question in archive 00/138 and records the context-based completion
of the deliberately truncated Gospel request. Including the earlier 70-entry
archive 00/09 draft, the project now has 2,970 semantic draft entries.

The projected combined Hangul repertoire is 1,023 syllables against the
current 713-slot contextual font bank, an overflow of 310 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0030_100.json` is the thirtieth protected 100-entry batch. It
contains the final eight text entries in archive 00/144, all 51 text-bearing
entries in archive 00/145, all 35 text-bearing entries in archive 00/146, and
the first six text entries in archive 00/147. Archives 00/144 through 00/146
now have complete semantic drafts; five text entries remain in archive 00/147.
The source-order plan and authored wording are stored separately in
`archive_batch_0030_plan.json` and `archive_batch_0030_authored.json`.

All four selected source archives round-trip byte-identically through TextPet.
The protected raw-entry and TPL hashes, planned ordering, stable IDs across all
thirty 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed all 15 static checks. Five
random-zenny messages retain explicit dynamic-value review notes. The
independent reread also records the underworld-doctor term, the deliberately
boastful locksmith relationship, the provisional `Ura Kotobuki` place name,
and preserves the slow-speech joke with both text-speed changes. Including the
earlier 70-entry archive 00/09 draft, the project now has 3,070 semantic draft
entries.

The projected combined Hangul repertoire is 1,024 syllables against the
current 713-slot contextual font bank, an overflow of 311 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0031_100.json` is the thirty-first protected 100-entry batch.
It contains the final five text entries in archive 00/147, all 65 text-bearing
entries in archive 00/148, all 22 text-bearing entries in archive 00/149, and
the first eight text entries in archive 00/150. Archives 00/147 through 00/149
now have complete semantic drafts; 12 text entries remain in archive 00/150.
The source-order plan and authored wording are stored separately in
`archive_batch_0031_plan.json` and `archive_batch_0031_authored.json`.

All four selected source archives round-trip byte-identically through TextPet.
The protected raw-entry and TPL hashes, planned ordering, stable IDs across all
thirty-one 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed all 15 static checks. Two
random-zenny messages retain explicit dynamic-value review notes. The complete
chip-trade pair preserves both chip and code parameters, while the security,
dark-doctor clue, and comic pause sequences preserve every timed wait. The
independent reread also aligned the emergency-alert terminology with the prior
`비상 경계 태세` wording. Including the earlier 70-entry archive 00/09 draft,
the project now has 3,170 semantic draft entries.

The projected combined Hangul repertoire is 1,030 syllables against the
current 713-slot contextual font bank, an overflow of 317 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0032_100.json` is the thirty-second protected 100-entry batch.
It contains the final 12 text entries in archive 00/150, all text-bearing
entries in archives 00/151 through 00/154, and the first six text entries in
archive 00/155. Archives 00/150 through 00/154 now have complete semantic
drafts; 17 text entries remain in archive 00/155. The source-order plan and
authored wording are stored separately in `archive_batch_0032_plan.json` and
`archive_batch_0032_authored.json`.

All six selected source archives round-trip byte-identically through TextPet.
The protected raw-entry and TPL hashes, planned ordering, stable IDs across all
thirty-two 100-entry batches, Japanese-kana residual scan, exact tracked inline
control commands, and deterministic rebuild passed all 15 static checks.
Twelve random-zenny messages retain explicit dynamic-value review notes. The
independent reread preserved the three `blue fragment` progression clue, the
130-chip gate condition, all security-cube item parameters, and the established
`블랙 내비스` terminology. The improvised threat sound in archive 00/154 is
recorded as a reviewed adaptive rendering. Including the earlier 70-entry
archive 00/09 draft, the project now has 3,270 semantic draft entries.

The projected combined Hangul repertoire is 1,032 syllables against the
current 713-slot contextual font bank, an overflow of 319 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0033_100.json` is the thirty-third protected 100-entry batch.
It contains the final 17 text entries in archive 00/155, all text-bearing
entries in archives 00/156 through 00/159, and the first 13 text entries in
archive 00/160. Archives 00/155 through 00/159 now have complete semantic
drafts; 28 text entries remain in archive 00/160. The source-order plan and
authored wording are stored separately in `archive_batch_0033_plan.json` and
`archive_batch_0033_authored.json`.

All six selected source archives round-trip byte-identically through TextPet.
The protected raw-entry and TPL hashes, planned ordering, stable IDs across all
thirty-three 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. Nine random-zenny messages retain explicit dynamic-value review notes.
The independent reread preserved every security-cube item parameter, the
rank-based door conditions, fixed chip-and-code rewards, and the 10000-zenny
dark-doctor information route. Including the earlier 70-entry archive 00/09
draft, the project now has 3,370 semantic draft entries.

The projected combined Hangul repertoire is 1,034 syllables against the
current 713-slot contextual font bank, an overflow of 321 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0034_100.json` is the thirty-fourth protected 100-entry batch.
It contains the final 28 text entries in archive 00/160, all text-bearing
entries in archives 00/161 through 00/167, and the first two text entries in
archive 00/168. Archives 00/160 through 00/167 now have complete semantic
drafts; two text entries remain in archive 00/168. The source-order plan and
authored wording are stored separately in `archive_batch_0034_plan.json` and
`archive_batch_0034_authored.json`.

All nine selected source archives round-trip byte-identically through TextPet.
Archive 00/161 is the final selected LZ77 archive; archives 00/162 through
00/168 use the newly verified direct-ROM boundary-table storage path. The
protected raw-entry and TPL hashes, planned ordering, stable IDs across all
thirty-four 100-entry batches, Japanese-kana residual scan, exact tracked
inline control commands, and deterministic rebuild passed all 15 static
checks. The opening scene's intentionally interrupted speech remains visibly
fragmented, while all item, chip, code, bell, and dramatic-pause controls are
preserved. Including the earlier 70-entry archive 00/09 draft, the project now
has 3,470 semantic draft entries.

The projected combined Hangul repertoire is 1,044 syllables against the
current 713-slot contextual font bank, an overflow of 331 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0035_100.json` is the thirty-fifth protected 100-entry batch.
It contains the final two text entries in archive 00/168, all text-bearing
entries in archives 00/169 through 00/178, and the first nine text entries in
archive 00/179. Archives 00/168 through 00/178 now have complete semantic
drafts; three text entries remain in archive 00/179. The source-order plan and
authored wording are stored separately in `archive_batch_0035_plan.json` and
`archive_batch_0035_authored.json`.

All twelve selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all thirty-five 100-entry batches, Japanese-kana residual scan, exact
tracked inline control commands, and deterministic rebuild passed all 15
static checks. The gas-water-heater incident keeps Glide's polite speech,
GutsMan's characteristic endings, the branching fan clue, and every alarm,
pause, and item parameter. Including the earlier 70-entry archive 00/09 draft,
the project now has 3,570 semantic draft entries.

The projected combined Hangul repertoire is 1,048 syllables against the
current 713-slot contextual font bank, an overflow of 335 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0036_100.json` is the thirty-sixth protected 100-entry batch.
It contains the final three text entries in archive 00/179, all text-bearing
entries in archives 00/180 through 00/187, 00/189, and 00/191, and the first
four text entries in archive 00/192. Catalog entries 00/188 and 00/190 are
two-byte non-text records and remain intentionally absent. Archives 00/179
through 00/191 now have complete semantic drafts for every text-bearing
archive; four text entries remain in archive 00/192. The source-order plan and
authored wording are stored separately in `archive_batch_0036_plan.json` and
`archive_batch_0036_authored.json`.

All twelve selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all thirty-six 100-entry batches, Japanese-kana residual scan, exact
tracked inline control commands, and deterministic rebuild passed all 15
static checks. The batch preserves AirMan's drawn-out speech, Gospel's timed
execution scene, established Marine Harbor and NetBattler terminology, and the
item-bearing license invitation. Including the earlier 70-entry archive 00/09
draft, the project now has 3,670 semantic draft entries.

The projected combined Hangul repertoire is 1,054 syllables against the
current 713-slot contextual font bank, an overflow of 341 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0037_100.json` is the thirty-seventh protected 100-entry batch.
It contains the final four text entries in archive 00/192, all text-bearing
entries in archives 00/193 through 00/204, and the first seven text entries in
archive 00/205. Archives 00/192 through 00/204 now have complete semantic
drafts; three text entries remain in archive 00/205. The source-order plan and
authored wording are stored separately in `archive_batch_0037_plan.json` and
`archive_batch_0037_authored.json`.

All fourteen selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all thirty-seven 100-entry batches, Japanese-kana residual scan, exact
tracked inline control commands, and deterministic rebuild passed all 15
static checks. The batch preserves the three-part campsite choice, the dam
detonation instructions, QuickMan's countdown, both text-speed changes, and
the established Okuden Valley, Hayami Daisuke, and Official NetBattler terms.
Including the earlier 70-entry archive 00/09 draft, the project now has 3,770
semantic draft entries.

The projected combined Hangul repertoire is 1,060 syllables against the
current 713-slot contextual font bank, an overflow of 347 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0038_100.json` is the thirty-eighth protected 100-entry batch.
It contains the final three text entries in archive 00/205, all text-bearing
entries in archives 00/206 through 00/219, and the first four text entries in
archive 00/220. Archives 00/205 through 00/219 now have complete semantic
drafts; 12 text entries remain in archive 00/220. The two command-only scripts
at the end of archive 00/206 contain no displayed string and were deliberately
excluded from the translation count. The source-order plan and authored
wording are stored separately in `archive_batch_0038_plan.json` and
`archive_batch_0038_authored.json`.

All sixteen selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all thirty-eight 100-entry batches, Japanese-kana residual scan, exact
tracked inline control commands, and deterministic rebuild passed all 15
static checks. The independent reread preserves both license-test routes,
every dynamic item parameter, the timed Gospel and Dark Miyabi scene, the
established Ajina and Official NetBattler terminology, and the source's
symbol-only unintelligible line. Including the earlier 70-entry archive 00/09
draft, the project now has 3,870 semantic draft entries.

The projected combined Hangul repertoire is 1,061 syllables against the
current 713-slot contextual font bank, an overflow of 348 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0039_100.json` is the thirty-ninth protected 100-entry batch.
It contains the final 12 text entries in archive 00/220, all text-bearing
entries in archives 00/221 through 00/226 and 00/228 through 00/236. Catalog
entry 00/227 is a two-byte non-text record and was intentionally excluded.
Archives 00/220 through 00/236 now have complete semantic drafts for every
text-bearing archive. The next batch begins with archive 00/237. The
source-order plan and authored wording are stored separately in
`archive_batch_0039_plan.json` and `archive_batch_0039_authored.json`.

All sixteen selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all thirty-nine 100-entry batches, Japanese-kana residual scan, exact
tracked inline control commands, and deterministic rebuild passed all 15
static checks. The independent reread preserves CutMan and ShadowMan naming,
the first-class emergency-alert wording, both dynamic Change.bat item tokens,
the Ajina national-treasure security sequence, and the seed-and-sprout metaphor
for MegaMan's new program. Including the earlier 70-entry archive 00/09 draft,
the project now has 3,970 semantic draft entries.

The projected combined Hangul repertoire is 1,065 syllables against the
current 713-slot contextual font bank, an overflow of 352 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0040_100.json` is the fortieth protected 100-entry batch. It
contains all text-bearing entries in archives 00/237 through 00/243 and the
first text entry in archive 00/244. Archives 00/237 through 00/243 now have
complete semantic drafts; 22 text entries remain in archive 00/244, where the
next batch begins at text entry 1. The source-order plan and authored wording
are stored separately in `archive_batch_0040_plan.json` and
`archive_batch_0040_authored.json`.

All eight selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty 100-entry batches, Japanese-kana residual scan, all eight
timed control commands, and deterministic rebuild passed all 15 static
checks. The independent reread preserves the Mother Computer intrusion,
Official NetBattler comedy sequence, Blues and ShadowMan confrontation,
Ultimate Blaster attack, and Dark Miyabi naming. Including the earlier
70-entry archive 00/09 draft, the project now has 4,070 semantic draft
entries.

The projected combined Hangul repertoire is 1,074 syllables against the
current 713-slot contextual font bank, an overflow of 361 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0041_100.json` is the forty-first protected 100-entry batch. It
contains the final 22 text entries in archive 00/244 and all text-bearing
entries in archives 00/245 through 00/249. Archives 00/244 through 00/249 now
have complete semantic drafts, and the next batch begins with archive 00/250.
Two command-only scripts in archive 00/245 contain no displayed string and
were deliberately excluded from the translation count. The source-order plan
and authored wording are stored separately in `archive_batch_0041_plan.json`
and `archive_batch_0041_authored.json`.

All six selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-one 100-entry batches, Japanese-kana residual scan, all 22
tracked item and timing commands, and deterministic rebuild passed all 15
static checks. The independent reread preserves the post-ShadowMan scene,
three-part license examination, Gospel administrator meeting, Official
NetBattler world-headquarters invitation, PET confiscation, and Amerope
airport comedy sequence. Including the earlier 70-entry archive 00/09 draft,
the project now has 4,170 semantic draft entries.

The projected combined Hangul repertoire remains 1,074 syllables against the
current 713-slot contextual font bank, an overflow of 361 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0042_100.json` is the forty-second protected 100-entry batch.
It contains all text-bearing entries in archives 00/250 through 00/257 and the
first 18 text entries in archive 00/258. Archives 00/250 through 00/257 now
have complete semantic drafts; one text entry remains in archive 00/258, where
the next batch begins at text entry 18. The source-order plan and authored
wording are stored separately in `archive_batch_0042_plan.json` and
`archive_batch_0042_authored.json`.

All nine selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-two 100-entry batches, Japanese-kana residual scan, all 38
tracked timing, text-speed, and dynamic-item commands, and deterministic
rebuild passed all 15 static checks. The independent reread preserves the
Amerope arrival and robbery, Lan and MegaMan's argument and reconciliation,
Higure's distinctive verbal tic, passport recovery, and the opening of the
Official NetBattler conference. Including the earlier 70-entry archive 00/09
draft, the project now has 4,270 semantic draft entries.

The projected combined Hangul repertoire is 1,077 syllables against the
current 713-slot contextual font bank, an overflow of 364 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0043_100.json` is the forty-third protected 100-entry batch. It
contains the final text entry in archive 00/258, all text-bearing entries in
archives 00/259 through 00/266, and the first 11 text entries in archive
00/267. Archives 00/258 through 00/266 now have complete semantic drafts;
eight text entries remain in archive 00/267, where the next batch begins at
text entry 11. The source-order plan and authored wording are stored
separately in `archive_batch_0043_plan.json` and
`archive_batch_0043_authored.json`.

All ten selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-three 100-entry batches, Japanese-kana residual scan, all 46
tracked timing, text-speed, and dynamic-item commands, and deterministic
rebuild passed all 15 static checks. The independent reread preserves the
castle trap sequence, Johnson, Princess, and KnightMan scenes, the Royal
Wrecking Ball attack name, Raul's appearance, the false accusation against
Enzan, and the opening Blues battle. Including the earlier 70-entry archive
00/09 draft, the project now has 4,370 semantic draft entries.

The projected combined Hangul repertoire is 1,082 syllables against the
current 713-slot contextual font bank, an overflow of 369 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0044_100.json` is the forty-fourth protected 100-entry batch.
It contains the final eight text entries in archive 00/267 and all
text-bearing entries in archives 00/268 through 00/277. Archives 00/267
through 00/277 now have complete semantic drafts, and the next batch begins
with archive 00/278. The source-order plan and authored wording are stored
separately in `archive_batch_0044_plan.json` and
`archive_batch_0044_authored.json`.

All eleven selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-four 100-entry batches, Japanese-kana residual scan, all 17
tracked timing commands, and deterministic rebuild passed all 15 static
checks. The independent reread preserves the Princess Pride and KnightMan
confrontation, Creamland's historical motive, the rescue aftermath, Chaud's
Blues reconstruction, the return to Japan, the airport reunion, and the
opening return-flight scenes. It also corrected the direction of Mayl's
welcome-back line before the protected batch was finalized. Including the
earlier 70-entry archive 00/09 draft, the project now has 4,470 semantic draft
entries.

The projected combined Hangul repertoire is 1,087 syllables against the
current 713-slot contextual font bank, an overflow of 374 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0045_100.json` is the forty-fifth protected 100-entry batch. It
contains all text-bearing entries in archives 00/278 through 00/291 and the
first two text entries in archive 00/292. Archives 00/278 through 00/291 now
have complete semantic drafts; six text entries remain in archive 00/292,
where the next batch begins at text entry 2. The source-order plan and
authored wording are stored separately in `archive_batch_0045_plan.json` and
`archive_batch_0045_authored.json`.

All fifteen selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-five 100-entry batches, Japanese-kana residual scan, all five
tracked text-speed and timing commands, and deterministic rebuild passed all
15 static checks. The independent reread preserves the poisonous-spider
incident, the improvised trap sequence, the passenger secrecy requirement,
the escalating in-flight emergency, the right-engine and tail-control faults,
the magnetic-field effect on MegaMan, and the cabin-pressure alarm. The coined
spider name `メアカモッサドクグモ` is provisionally rendered as
`붉은눈털북숭이독거미`, with its literal visual traits retained. Including the
earlier 70-entry archive 00/09 draft, the project now has 4,570 semantic draft
entries.

The projected combined Hangul repertoire is 1,094 syllables against the
current 713-slot contextual font bank, an overflow of 381 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0046_100.json` is the forty-sixth protected 100-entry batch. It
contains the final six text entries in archive 00/292 and all text-bearing
entries in archives 00/293 through 00/301. Archives 00/292 through 00/301 now
have complete semantic drafts, and the next batch begins with archive 00/302.
The source-order plan and authored wording are stored separately in
`archive_batch_0046_plan.json` and `archive_batch_0046_authored.json`.

All ten selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-six 100-entry batches, Japanese-kana residual scan, all eight
tracked timing and dynamic-item commands, and deterministic rebuild passed all
15 static checks. The independent reread preserves the throttle and landing-
gear emergencies, Gauss Magnetz and MagnetMan's hijacking plot, the High Power
Program theft, Gauss's motive and Gospel role, the arrest and safe landing,
the worldwide natural disasters, Roll's disappearance, and the ice-virus and
Environmental Maintenance System explanation. It also corrected the
entomologist's imperative while escorting Gauss before the protected batch was
finalized. Including the earlier 70-entry archive 00/09 draft, the project now
has 4,670 semantic draft entries.

The projected combined Hangul repertoire is 1,095 syllables against the
current 713-slot contextual font bank, an overflow of 382 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0047_100.json` is the forty-seventh protected 100-entry batch.
It contains all text-bearing entries in archives 00/302 through 00/311 and the
first four text entries in archive 00/312. Archives 00/302 through 00/311 now
have complete semantic drafts; ten text entries remain in archive 00/312,
where the next batch begins at text entry 4. The source-order plan and authored
wording are stored separately in `archive_batch_0047_plan.json` and
`archive_batch_0047_authored.json`.

All eleven selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-seven 100-entry batches, Japanese-kana residual scan, all 28
tracked timing and dynamic-item commands, and deterministic rebuild passed all
15 static checks. The independent reread preserves the Gospel headquarters
clue, the Blue Fragment pursuit, the FreezeMan confrontation, the ice-virus
incident's resolution, Lan's return home, the survival-battle examination, and
the opening investigation into Gospel's continued activity. It also refined
Mom's voice, menu-choice wording, and the placement of staged ellipses before
the protected batch was finalized. Including the earlier 70-entry archive
00/09 draft, the project now has 4,770 semantic draft entries.

The projected combined Hangul repertoire is 1,096 syllables against the
current 713-slot contextual font bank, an overflow of 383 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0048_100.json` is the forty-eighth protected 100-entry batch.
It contains the final ten text entries in archive 00/312, all text-bearing
entries in archives 00/313 through 00/318, and the first six text entries in
archive 00/319. Archives 00/312 through 00/318 now have complete semantic
drafts; two text entries remain in archive 00/319, where the next batch begins
at text entry 6. The source-order plan and authored wording are stored
separately in `archive_batch_0048_plan.json` and
`archive_batch_0048_authored.json`.

All eight selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-eight 100-entry batches, Japanese-kana residual scan, all 30
tracked timing and dynamic-item commands, and deterministic rebuild passed all
15 static checks. The independent reread preserves the investigation of
Kotobuki Town, the electromagnetic-wave hazard and protective equipment,
Lan's decision to accept the final mission, the reveal of MegaMan as his older
brother, Dex, Mayl, and Yai's assistance, the apartment-network distortion,
and the triple battle against the automated Navi copies. It also corrected
Dad's explanatory voice, Yai's wording, electromagnetic-wave exposure, and a
dynamic-item particle dependency before the protected batch was finalized.
Including the earlier 70-entry archive 00/09 draft, the project now has 4,870
semantic draft entries.

The projected combined Hangul repertoire is 1,100 syllables against the
current 713-slot contextual font bank, an overflow of 387 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0049_100.json` is the forty-ninth protected 100-entry batch. It
contains the final two text entries in archive 00/319, all text-bearing entries
in archives 00/320 through 00/327, and the first ten text entries in archive
00/328. Archives 00/319 through 00/327 now have complete semantic drafts;
eleven text entries remain in archive 00/328, where the next batch begins at
text entry 10. The source-order plan and authored wording are stored separately
in `archive_batch_0049_plan.json` and `archive_batch_0049_authored.json`.

All ten selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all forty-nine 100-entry batches, Japanese-kana residual scan, all 64
tracked timing commands, and deterministic rebuild passed all 15 static
checks. The independent reread preserves the escalating electromagnetic-wave
hazard, the control-program battles, the first confrontation with Gospel's
leader, the Ultimate Navi offer, the copied Roll, GutsMan, and Glide sequence,
the real Navi and operator reunion, Blues's intervention, and Chaud's arrival.
It also corrected Gospel's leader voice, the diversionary-force terminology,
Roll's apology, and MegaMan's injury wording before the protected batch was
finalized. Including the earlier 70-entry archive 00/09 draft, the project now
has 4,970 semantic draft entries.

The projected combined Hangul repertoire is 1,103 syllables against the
current 713-slot contextual font bank, an overflow of 390 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0050_100.json` is the fiftieth protected 100-entry batch. It
contains the final eleven text entries in archive 00/328, all text-bearing
entries in archives 00/329 through 00/332, and the first twelve text entries in
archive 00/333. Archives 00/328 through 00/332 now have complete semantic
drafts; eight text entries remain in archive 00/333, where the next batch
begins at text entry 12. The source-order plan and authored wording are stored
separately in `archive_batch_0050_plan.json` and
`archive_batch_0050_authored.json`.

All six selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all fifty 100-entry batches, Japanese-kana residual scan, all 112
tracked timing commands, and deterministic rebuild passed all 15 static
checks. The independent reread preserves the Forte Project reveal, the first
Forte battle, Gospel's child operator and Cyber Suit reveal, the escalating
server power and electromagnetic-wave danger, Mayl's promise scene, the bug-
fusion defect, Dad's warning, and Lan recognizing Saito's voice. It corrected
Forte's chip-data activation meaning, Mayl's emotional wording, Dad's voice,
and one over-counted waitSkip command before the protected batch was finalized.
Including the earlier 70-entry archive 00/09 draft, the project now has 5,070
semantic draft entries.

The projected combined Hangul repertoire remains 1,103 syllables against the
current 713-slot contextual font bank, an overflow of 390 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0051_100.json` is the fifty-first protected 100-entry batch. It
contains the final eight text entries in archive 00/333, all forty text entries
in archive 00/334, and the first fifty-two text entries in archive 00/336.
Archives 00/333 and 00/334 now have complete semantic drafts; fifty text
entries remain in archive 00/336, where the next batch begins at text entry 52.
The source-order plan and authored wording are stored separately in
`archive_batch_0051_plan.json` and `archive_batch_0051_authored.json`.

All three selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all fifty-one 100-entry batches, Japanese-kana residual scan, all 66
tracked timing commands, and deterministic rebuild passed all 15 static
checks. The independent reread preserves Lan and MegaMan's full-synchro scene,
Gospel's defeat, the account of Sean's isolation, Lan's promise to become his
first friend, and the campsite epilogue with Dex, Yai, Higsby, Lan's parents,
Mayl, and Chaud. It also restored the clipped opening address as natural Korean
and retained Higsby's established `말입죠` speech pattern before the protected
batch was finalized. Including the earlier 70-entry archive 00/09 draft, the
project now has 5,170 semantic draft entries.

The projected combined Hangul repertoire is 1,104 syllables against the
current 713-slot contextual font bank, an overflow of 391 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0052_100.json` is the fifty-second protected 100-entry batch.
It contains the final fifty text entries in archive 00/336, both non-empty text
entries in archive 00/337, all text entries in archives 00/338 through 00/343,
and the first eight text entries in archive 00/344. Archives 00/336 through
00/343 now have complete semantic drafts; ten text entries remain in archive
00/344, where the next batch begins at text entry 8. The source-order plan and
authored wording are stored separately in `archive_batch_0052_plan.json` and
`archive_batch_0052_authored.json`.

All nine selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all fifty-two 100-entry batches, Japanese-kana residual scan, all 38
tracked timing, speed, and dynamic-item commands, and deterministic rebuild
passed all 15 static checks. The independent reread preserves Lan and Chaud's
rival scene, the warning that Gospel's leader may have been manipulated, the
camping epilogue and homework punch line, two license examinations, and the
PharaohMan, NapalmMan, and chosen-one trials. It also corrected a mixed-script
NapalmMan name, the sea-scent clue, Dad's collective work reference, and Mom's
address to Dad before the protected batch was finalized. Including the earlier
70-entry archive 00/09 draft, the project now has 5,270 semantic draft entries.

The projected combined Hangul repertoire is 1,106 syllables against the
current 713-slot contextual font bank, an overflow of 393 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0053_100.json` is the fifty-third protected 100-entry batch. It
contains the final ten text entries in archive 00/344, all text entries in
archives 00/345 through 00/351 except the empty archive 00/348, and the first
eight text entries in archive 00/352. Archives 00/344 through 00/351 now have
complete semantic drafts; two text entries remain in archive 00/352, where the
next batch begins at text entry 8. The source-order plan and authored wording
are stored separately in `archive_batch_0053_plan.json` and
`archive_batch_0053_authored.json`.

All eight selected direct-ROM archives round-trip byte-identically through
TextPet. The protected raw-entry and TPL hashes, planned ordering, stable IDs
across all fifty-three 100-entry batches, Japanese-kana residual scan, all 13
tracked timing commands, and deterministic rebuild passed all 15 static
checks. The independent reread preserves PlanetMan's WWW revival plan, the
real Forte encounter and strong-one wave terminology, the homework program,
and the battle-chip, chip-code, AreaSteal, WideSword, and Folder Open tutorial
sequence. It also corrected Forte's outside-world wording, the six-beat silent
pause, and the established Custom Screen terminology before the protected
batch was finalized. Including the earlier 70-entry archive 00/09 draft, the
project now has 5,370 semantic draft entries.

The projected combined Hangul repertoire is 1,110 syllables against the
current 713-slot contextual font bank, an overflow of 397 distinct syllables.
Wording was preserved without capacity-driven shortening. ROM reinsertion
remains blocked pending a larger font-capacity design, and emulator testing
remains deferred.

`archive_batch_0054_100.json` is the fifty-fourth protected 100-entry batch.
It contains the final two tutorial entries in archive 00/352 and the first 98
text-bearing entries in archive 00/353. Archive 00/352 now has complete
semantic drafts. Archive 00/353 has 80 text-bearing entries remaining, and the
next batch begins at text-entry position 98 (script entry 98). The source-order
plan and authored wording are stored separately in
`archive_batch_0054_plan.json` and `archive_batch_0054_authored.json`.

Archive 00/353 uses TextPet's short-string `mmbn2s` script dialect rather than
the dialogue-oriented `mmbn2` spelling. The batch builder and independent
auditor now accept both exact dialects; a batch-53 regression rebuild remained
byte-identical. Both selected direct-ROM archives round-trip byte-identically
through TextPet. Protected raw-entry and TPL hashes, planned ordering, stable
IDs across all fifty-four 100-entry batches, Japanese-kana residual scan,
control preservation, and deterministic rebuild passed all 15 static checks.
The new enemy-name candidates and their source IDs are recorded in
`glossary.tsv`. Including the earlier 70-entry archive 00/09 draft, the project
now has 5,470 semantic draft entries.

The projected combined Hangul repertoire is 1,114 syllables against the
current 713-slot contextual font bank, an overflow of 401 distinct syllables.
Wording and proper-name distinctions were preserved without capacity-driven
shortening. ROM reinsertion remains blocked pending a larger font-capacity
design, and emulator testing remains deferred.

`archive_batch_0055_100.json` is the fifty-fifth protected 100-entry batch. It
contains the final 80 text-bearing name entries in archive 00/353 and the first
20 text-bearing staff-credit entries in archive 00/354. Archive 00/353 now has
complete semantic drafts. Archive 00/354 has 40 text-bearing entries remaining,
and the next batch begins at text-entry position 20 (script entry 54,
`しんがき ひでかず`). The source-order plan and authored wording are stored
separately in `archive_batch_0055_plan.json` and
`archive_batch_0055_authored.json`.

Archive 00/354 was resolved from catalog record `pc-jap-map-0215` at ROM offset
8327808. Its leading boundary table establishes a 1,005-byte direct-ROM
archive, and all 149 raw entries round-trip byte-identically through TextPet.
Both selected archives, protected raw-entry and TPL hashes, planned ordering,
stable IDs across all fifty-five 100-entry batches, Japanese-kana residual
scan, control preservation, and deterministic rebuild passed all 15 static
checks. All 100 source terms also matched the accumulated `glossary.tsv`
without missing or conflicting entries. Including the earlier 70-entry archive
00/09 draft, the project now has 5,570 semantic draft entries.

The projected combined Hangul repertoire is 1,117 syllables against the
current 713-slot contextual font bank, an overflow of 404 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0056_100.json` is the fifty-sixth protected 100-entry batch. It
contains the final 40 text-bearing staff-credit entries in archive 00/354 and
the first 60 text-bearing statistics and battle-record entries in archive
00/355. Archive 00/354 now has complete semantic drafts. Archive 00/355 has two
text-bearing entries remaining, and the next batch begins at text-entry
position 60 (script entry 64, `9`). The source-order plan and authored wording
are stored separately in `archive_batch_0056_plan.json` and
`archive_batch_0056_authored.json`.

Archive 00/355 was resolved from catalog record `pc-jap-map-0216` at ROM offset
8331376. Its leading boundary table establishes a 635-byte direct-ROM archive
with 66 raw entries, of which 62 are non-empty, and it round-trips
byte-identically through TextPet. Both selected archives, protected raw-entry
and TPL hashes, planned ordering, stable IDs across all fifty-six 100-entry
batches, Japanese-kana residual scan, control preservation, and deterministic
rebuild passed all 15 static checks. The glossary reread found 67 literal
registered matches plus one documented dynamic `printBuffer` marker, with no
unapproved conflict. Dynamic level, record, time, and count fields retain
explicit semantic review notes so their display placeholders cannot be
mistaken for literal reinsertion text. Including the earlier 70-entry archive
00/09 draft, the project now has 5,670 semantic draft entries.

The projected combined Hangul repertoire is 1,119 syllables against the
current 713-slot contextual font bank, an overflow of 406 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0057_100.json` is the fifty-seventh protected 100-entry batch.
It contains the final two numeric entries in archive 00/355, all 21
text-bearing entries in archive 00/356, and the first 77 entries in archive
00/357. Archives 00/355 and 00/356 now have complete semantic drafts. Archive
00/357 has 18 text-bearing entries remaining, and the next batch begins at
text-entry position 77 (script entry 77, `「キャノン *」ゲット!`). The
source-order plan and authored wording are stored separately in
`archive_batch_0057_plan.json` and `archive_batch_0057_authored.json`.

Archive 00/356 was resolved from catalog record `pc-jap-map-0217` at ROM offset
8288952. Its leading boundary table establishes a 1,221-byte direct-ROM
archive with 23 non-empty scripts, two of which are command-only. Archive
00/357 was resolved from `pc-jap-map-0218` at ROM offset 7566700 and has 95
non-empty scripts in a 2,224-byte direct-ROM archive. Both new archives
round-trip byte-identically through TextPet. Protected raw-entry and TPL
hashes, planned ordering, stable IDs across all fifty-seven 100-entry batches,
Japanese-kana residual scan, 81 tracked dynamic and timing commands, and the
deterministic rebuild passed all 15 static checks. The independent terminology
reread found no mismatch among the newly registered chip-trader, retro-chip,
exam, and energy-item terms. The 70 dynamic item-acquisition lines use the
particle-neutral `획득: 「[printItem ...]」` form while retaining every exact
item ID. Including the earlier 70-entry archive 00/09 draft, the project now
has 5,770 semantic draft entries.

The projected combined Hangul repertoire remains 1,119 syllables against the
current 713-slot contextual font bank, an overflow of 406 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0058_100.json` is the fifty-eighth protected 100-entry batch. It
contains the final 18 text-bearing entries in archive 00/357 and the first 82
text-bearing item-description entries in archive 00/358. Archive 00/357 now
has complete semantic drafts. Archive 00/358 has 83 text-bearing entries
remaining, and the next batch begins at text-entry position 82 (script entry
82, Yai's PC passcode-file description). The source-order plan and authored
wording are stored separately in `archive_batch_0058_plan.json` and
`archive_batch_0058_authored.json`.

Archive 00/358 was resolved from catalog record `pc-jap-map-0219` at ROM offset
7560600. Its leading boundary table establishes a 6,042-byte direct-ROM
archive with 168 non-empty scripts and 165 text-bearing entries. It round-trips
byte-identically through TextPet. Protected raw-entry and TPL hashes, planned
ordering, stable IDs across all fifty-eight 100-entry batches, Japanese-kana
residual scan, all 94 tracked immediate-display and dynamic-item commands, and
the deterministic rebuild passed all 15 static checks. The independent reread
confirmed the established character, location, organization, license, chip,
and currency spellings with no glossary conflict. The protected item-count
`printBuffer` position in entry 69 remains explicitly marked as semantic-only.
Including the earlier 70-entry archive 00/09 draft, the project now has 5,870
semantic draft entries.

The projected combined Hangul repertoire is 1,120 syllables against the
current 713-slot contextual font bank, an overflow of 407 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0059_100.json` is the fifty-ninth protected 100-entry batch. It
contains the final 83 text-bearing item-description entries in archive 00/358
and the first 17 item-name entries in archive 00/359. Archive 00/358 now has
complete semantic drafts. Archive 00/359 has 129 text-bearing entries
remaining, and the next batch begins at text-entry position 17 (script entry
17, `ワルのデータB`). The source-order plan and authored wording are stored
separately in `archive_batch_0059_plan.json` and
`archive_batch_0059_authored.json`.

Archive 00/359 was resolved from catalog record `pc-jap-map-0220` at ROM offset
7559132. Its leading boundary table establishes a 1,466-byte direct-ROM
archive with 159 non-empty scripts and 146 text-bearing entries. It round-trips
byte-identically through TextPet. Protected raw-entry and TPL hashes, planned
ordering, stable IDs across all fifty-nine 100-entry batches, Japanese-kana
residual scan, all 83 tracked immediate-display commands, and the
deterministic rebuild passed all 15 static checks. The independent reread
matched the PC passcodes, transport tickets, upgrade and subchip descriptions,
used electromagnetic-bit descriptions, and the first item names with no
glossary conflict. Including the earlier 70-entry archive 00/09 draft, the
project now has 5,970 semantic draft entries.

The projected combined Hangul repertoire remains 1,120 syllables against the
current 713-slot contextual font bank, an overflow of 407 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0060_100.json` is the sixtieth protected 100-entry batch. It
contains item-name entries 17 through 116 in archive 00/359. Archive 00/359
has 29 text-bearing entries remaining, and the next batch begins at
text-entry position 117 (script entry 117, `オープンロック`). The source-order
plan and authored wording are stored separately in
`archive_batch_0060_plan.json` and `archive_batch_0060_authored.json`.

The verified 1,466-byte archive 00/359 still round-trips byte-identically
through TextPet. Protected raw-entry and TPL hashes, planned ordering, stable
IDs across all sixty 100-entry batches, Japanese-kana residual scan, and the
deterministic rebuild passed all 15 static checks. The independent terminology
reread matched 76 registered item names exactly, preserved all 24 unused
`ITEMxx` placeholders, and found no duplicate glossary source or terminology
conflict. Including the earlier 70-entry archive 00/09 draft, the project now
has 6,070 semantic draft entries.

The projected combined Hangul repertoire remains 1,120 syllables against the
current 713-slot contextual font bank, an overflow of 407 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0061_100.json` is the sixty-first protected 100-entry batch. It
contains the final 29 text-bearing item and style names in archive 00/359 and
the first 71 location names in archive 00/362. Archive 00/359 now has complete
semantic drafts. Archive 00/362 has 91 text-bearing entries remaining, and the
next batch begins at text-entry position 71 (script entry 95,
`マンションの電脳1`). The source-order plan and authored wording are stored
separately in `archive_batch_0061_plan.json` and
`archive_batch_0061_authored.json`.

Catalog records `pc-jap-map-0221` and `pc-jap-map-0222`, corresponding to
00/360 and 00/361, are non-text assets and were excluded rather than forced
through the message parser. The next script-like record `pc-jap-map-0223` was
resolved as archive 00/362 at ROM offset 8231124. Its final leading boundary
establishes a 2,046-byte direct-ROM archive with 192 scripts, 162 of which are
non-empty, and it round-trips byte-identically through TextPet. Protected
raw-entry and TPL hashes, planned ordering, stable IDs across all sixty-one
100-entry batches, Japanese-kana residual scan, and the deterministic rebuild
passed all 15 static checks. The independent terminology reread matched all 90
non-placeholder names, preserved ten unused `ITEMxx` placeholders, and found
no duplicate glossary source or terminology conflict. `サイトスタイル` is
recorded as `사이토 스타일`, reflecting Hikari Saito rather than the generic
word “site.” Including the earlier 70-entry archive 00/09 draft, the project
now has 6,170 semantic draft entries.

The projected combined Hangul repertoire is 1,121 syllables against the
current 713-slot contextual font bank, an overflow of 408 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0062_100.json` is the sixty-second protected 100-entry batch. It
contains the final 91 location-name entries in archive 00/362 and the first
nine text-bearing Program Advance chip-combination entries in archive 00/363.
Archive 00/362 now has complete semantic drafts. Archive 00/363 has 67
text-bearing entries remaining, and the next batch begins at text-entry
position 9 (script entry 15, `スプレッドガン M / スプレッドガン N /
スプレッドガン O`). The source-order plan and authored wording are stored
separately in `archive_batch_0062_plan.json` and
`archive_batch_0062_authored.json`.

Archive 00/363 was resolved from catalog record `pc-jap-map-0224` at ROM offset
8276232. Its leading boundary table establishes a 2,716-byte direct-ROM
archive with 159 non-empty scripts and 76 text-bearing entries, and it
round-trips byte-identically through TextPet. Protected raw-entry and TPL
hashes, planned ordering, stable IDs across all sixty-two 100-entry batches,
Japanese-kana residual scan, tracked command preservation, and the
deterministic rebuild passed all 15 static checks. The independent terminology
reread matched all 91 location names and the Cannon, HiCannon, and M-Cannon
chip-name tokens with no duplicate glossary source or terminology conflict.
Including the earlier 70-entry archive 00/09 draft, the project now has 6,270
semantic draft entries.

The projected combined Hangul repertoire remains 1,121 syllables against the
current 713-slot contextual font bank, an overflow of 408 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0063_100.json` is the sixty-third protected 100-entry batch. It
contains the final 67 text-bearing Program Advance chip-combination entries in
archive 00/363, all eight text-bearing entries in archive 00/364, all five in
archive 00/365, and the first 20 text-bearing hint-dialogue entries in archive
00/366. Archives 00/363, 00/364, and 00/365 now have complete semantic drafts.
Archive 00/366 has 65 text-bearing entries remaining, and the next batch begins
at text-entry position 20 (script entry 40, `とりあえず
いっけんらくちゃくだね / そろそろ ウチにかえる?`). The source-order
plan and authored wording are stored separately in
`archive_batch_0063_plan.json` and `archive_batch_0063_authored.json`.

Archive 00/364 was resolved from catalog record `pc-jap-map-0225` at ROM offset
7569716 as a 658-byte direct-ROM archive with 13 non-empty scripts and eight
text-bearing entries. Archive 00/365 was resolved from `pc-jap-map-0226` at ROM
offset 7570412 as a 251-byte direct-ROM archive with five non-empty,
text-bearing scripts. Archive 00/366 was resolved from `pc-jap-map-0227` at ROM
offset 7570720 as a 4,350-byte direct-ROM archive with 88 non-empty scripts and
85 text-bearing entries. All three archives round-trip byte-identically through
TextPet. Protected raw-entry and TPL hashes, planned ordering, stable IDs across
all sixty-three 100-entry batches, Japanese-kana residual scan, tracked command
preservation, and the deterministic rebuild passed all 15 static checks. The
independent terminology reread matched every Program Advance chip token and the
established PET, Akihara, Official Square, Yai, Dex, and fan terms with no
duplicate glossary source or terminology conflict. Including the earlier
70-entry archive 00/09 draft, the project now has 6,370 semantic draft entries.

The projected combined Hangul repertoire is 1,123 syllables against the current
713-slot contextual font bank, an overflow of 410 distinct syllables. ROM
reinsertion remains blocked pending a larger font-capacity design, and emulator
testing remains deferred.

`archive_batch_0064_100.json` is the sixty-fourth protected 100-entry batch. It
contains the final 65 text-bearing hint-dialogue entries in archive 00/366 and
the first 35 text-bearing entries in archive 00/367. Archive 00/366 now has
complete semantic drafts. Archive 00/367 has 32 text-bearing entries remaining,
and the next batch begins at text-entry position 35 (script entry 132,
`オフィシャルのナビたちの ためにも / マザーコンピュータを /
ぜったい、まもりぬこう!`). The source-order plan and authored wording are
stored separately in `archive_batch_0064_plan.json` and
`archive_batch_0064_authored.json`.

Archive 00/367 was resolved from catalog record `pc-jap-map-0228` at ROM offset
7575108. Its leading boundary table establishes a 3,426-byte direct-ROM archive
with 69 non-empty scripts and 67 text-bearing entries, and it round-trips
byte-identically through TextPet. Protected raw-entry and TPL hashes, planned
ordering, stable IDs across all sixty-four 100-entry batches, Japanese-kana
residual scan, tracked command preservation, and the deterministic rebuild
passed all 15 static checks. The independent reread found no different Korean
wording among exact duplicate source hints and matched the established
Official Center, Marine Harbor, Ajina, Undernet, Gospel, Dark Doctor,
blue-fragment, and character terms without a glossary conflict. Including the
earlier 70-entry archive 00/09 draft, the project now has 6,470 semantic draft
entries.

The projected combined Hangul repertoire remains 1,123 syllables against the
current 713-slot contextual font bank, an overflow of 410 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0065_100.json` is the sixty-fifth protected 100-entry batch. It
contains the final 32 text-bearing hint-dialogue entries in archive 00/367, all
65 text-bearing entries in archive 00/368, and the first three text-bearing
entries in archive 00/369. Archives 00/367 and 00/368 now have complete semantic
drafts. Archive 00/369 has 28 text-bearing entries remaining, and the next batch
begins at text-entry position 3 (script entry 146, `PETが ない・・・ /
ロックマンと はなせない・・・`). The source-order plan and independently
authored wording are stored separately in `archive_batch_0065_plan.json` and
`archive_batch_0065_authored.json`.

Archive 00/368 was resolved from catalog record `pc-jap-map-0229` at ROM offset
7578572. Its leading boundary table establishes a 3,393-byte direct-ROM archive
with 68 non-empty scripts and 65 text-bearing entries. Archive 00/369 was
resolved from `pc-jap-map-0230` at ROM offset 7582000 as a 2,023-byte direct-ROM
archive with 33 non-empty scripts and 31 text-bearing entries. Both archives
round-trip byte-identically through TextPet. Eighty-two exact duplicate source
hints reuse their existing Korean wording; the remaining eighteen entries were
translated and independently reread from Japanese. Protected raw-entry and TPL
hashes, planned ordering, stable IDs across all sixty-five 100-entry batches,
Japanese-kana residual scan, tracked command preservation, exact-source Korean
consistency, and the deterministic rebuild passed all 15 static checks. The
glossary adds the established `기폭 장치` and `기폭 프로그램` forms without a
duplicate source. Including the earlier 70-entry archive 00/09 draft, the
project now has 6,570 semantic draft entries, with an estimated 1,179 entries
remaining in the verified extraction population.

The projected combined Hangul repertoire remains 1,123 syllables against the
current 713-slot contextual font bank, an overflow of 410 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0066_100.json` is the sixty-sixth protected 100-entry batch. It
contains the final 28 text-bearing hint-dialogue entries in archive 00/369, all
37 text-bearing entries in archive 00/370, and the first 35 text-bearing entries
in archive 00/371. Archives 00/369 and 00/370 now have complete semantic drafts.
Archive 00/371 has 11 text-bearing entries remaining, and the next batch begins
at text-entry position 35 (script entry 215, `カギしょくにんさんの /
おにいさんのトコロに もどろう`). The source-order plan and independently
authored wording are stored separately in `archive_batch_0066_plan.json` and
`archive_batch_0066_authored.json`.

Archive 00/370 was resolved from catalog record `pc-jap-map-0231` at ROM offset
7584060. Its leading boundary table establishes a 2,330-byte direct-ROM archive
with 37 non-empty, text-bearing scripts. Archive 00/371 was resolved from
`pc-jap-map-0232` at ROM offset 7586428 as a 2,834-byte direct-ROM archive with
47 non-empty scripts and 46 text-bearing entries. Both archives round-trip
byte-identically through TextPet. Sixty-five entries reuse Korean wording from
earlier protected batches, ten repeated source hints reuse wording established
earlier in this batch, and the remaining 25 entries were translated and
independently reread from Japanese. Protected raw-entry and TPL hashes, planned
ordering, stable IDs across all sixty-six 100-entry batches, Japanese-kana
residual scan, tracked command preservation, exact-source Korean consistency,
and the deterministic rebuild passed all 15 static checks. The glossary adds
the established `짐` and `프린세스 씨` forms without a duplicate source.
Including the earlier 70-entry archive 00/09 draft, the project now has 6,670
semantic draft entries, with an estimated 1,079 entries remaining in the
verified extraction population.

The projected combined Hangul repertoire remains 1,123 syllables against the
current 713-slot contextual font bank, an overflow of 410 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0067_100.json` is the sixty-seventh protected 100-entry batch. It
contains the final 11 text-bearing entries in archive 00/371, all text-bearing
entries in archives 00/372 through 00/378, and the first text-bearing entry in
archive 00/379. Archives 00/371 through 00/378 now have complete semantic
drafts. Archive 00/379 has five text-bearing entries remaining, and the next
batch begins at text-entry position 1 (script entry 180, `ロックマン、
うよくエンジンプログラムを / さがすんだ!!`). The source-order plan and
independently authored wording are stored separately in
`archive_batch_0067_plan.json` and `archive_batch_0067_authored.json`.

Archive 00/372 was resolved from catalog record `pc-jap-map-0233` at ROM offset
7589300 as a 2,621-byte direct-ROM archive with 45 non-empty, text-bearing
scripts. Archives 00/373 through 00/379 were resolved from catalog records
`pc-jap-map-0234` through `pc-jap-map-0240` at ROM offsets 7591956 through
7596268; their boundary tables establish raw lengths of 1,068, 1,053, 356, 456,
576, 631, and 686 bytes, with 11, 10, 6, 5, 7, 4, and 6 text-bearing entries.
All eight new archives round-trip byte-identically through TextPet. Forty-three
entries reuse Korean wording from earlier protected batches, six repeated
source hints reuse wording established earlier in this batch, and the remaining
51 entries were translated and independently reread from Japanese. Protected
raw-entry and TPL hashes, planned ordering, stable IDs across all sixty-seven
100-entry batches, Japanese-kana residual scan, tracked command preservation,
exact-source Korean consistency, and the deterministic rebuild passed all 15
static checks. The glossary adds the aircraft-control program, gas water heater,
ventilation fan, and security-door terms without a duplicate source. Including
the earlier 70-entry archive 00/09 draft, the project now has 6,770 semantic
draft entries, with an estimated 979 entries remaining in the verified
extraction population.

The projected combined Hangul repertoire remains 1,123 syllables against the
current 713-slot contextual font bank, an overflow of 410 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0068_100.json` is the sixty-eighth protected 100-entry batch. It
contains the final five text-bearing entries in archive 00/379, all eight in
archive 00/380, all 80 in archive 00/381, and the first seven in archive 00/382.
Archives 00/379 through 00/381 now have complete semantic drafts. Archive
00/382 has 23 text-bearing entries remaining, and the next batch begins at
text-entry position 7 (script entry 51, `このニオイは・・・ // あらびきだね!!
// なんてね! じょうだんだよ`). The source-order plan and independently
authored wording are stored separately in `archive_batch_0068_plan.json` and
`archive_batch_0068_authored.json`.

Archives 00/380 through 00/382 were resolved from catalog records
`pc-jap-map-0241` through `pc-jap-map-0243` at ROM offsets 7596988, 7597932,
and 7602224. Their boundary tables establish direct-ROM lengths of 900, 4,251,
and 1,749 bytes with 8, 80, and 30 text-bearing scripts. All three new archives,
plus the resumed archive 00/379, round-trip byte-identically through TextPet.
Two exact repeated sources reuse established Korean wording, and the remaining
98 entries were translated and independently reread from Japanese. Protected
raw-entry and TPL hashes, planned ordering, stable IDs across all sixty-eight
100-entry batches, Japanese-kana residual scan, tracked command preservation,
exact-source Korean consistency, and the deterministic rebuild passed all 15
static checks. The glossary adds the citizen NetBattler, information-board,
control-panel, and electronic-piano terms without a duplicate source. Including
the earlier 70-entry archive 00/09 draft, the project now has 6,870 semantic
draft entries, with an estimated 879 entries remaining in the verified
extraction population.

The projected combined Hangul repertoire is 1,124 syllables against the current
713-slot contextual font bank, an overflow of 411 distinct syllables. ROM
reinsertion remains blocked pending a larger font-capacity design, and emulator
testing remains deferred.

`archive_batch_0069_100.json` is the sixty-ninth protected 100-entry batch. It
contains the final 23 text-bearing entries in archive 00/382 and the first 77
text-bearing entries in archive 00/383. Archive 00/382 now has a complete
semantic draft. Archive 00/383 has four text-bearing entries remaining, and the
next batch begins at text-entry position 77 (script entry 227, `今日は もう
ねちゃうか`). The source-order plan and independently authored wording are
stored separately in `archive_batch_0069_plan.json` and
`archive_batch_0069_authored.json`.

Archive 00/383 was resolved from catalog record `pc-jap-map-0244` at ROM offset
7603976. Its boundary table establishes a 4,359-byte direct-ROM archive with 81
text-bearing scripts, and the extracted archive round-trips byte-identically
through TextPet. Seventy exact repeated sources reuse established Korean
wording, while the remaining 30 entries were translated and independently
reread from Japanese. Protected raw-entry and TPL hashes, planned ordering,
stable IDs across all sixty-nine 100-entry batches, Japanese-kana residual
scan, tracked command preservation, exact-source Korean consistency, and the
deterministic rebuild passed all 15 static checks. The glossary adds the airport
timetable and diversion-operation terms without a duplicate source. Including
the earlier 70-entry archive 00/09 draft, the project now has 6,970 semantic
draft entries, with an estimated 779 entries remaining in the verified
extraction population.

The projected combined Hangul repertoire remains 1,124 syllables against the
current 713-slot contextual font bank, an overflow of 411 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0070_100.json` is the seventieth protected 100-entry batch. It
contains the final four text-bearing entries in archive 00/383, all 56 in
archive 00/384, and the first 40 in archive 00/385. Archives 00/383 and 00/384
now have complete semantic drafts. Archive 00/385 has 27 text-bearing entries
remaining, and the next batch begins at text-entry position 40 (script entry
180, `さ、じゅんびが できたら / くうこうに むかうか`). The source-order
plan and independently authored wording are stored separately in
`archive_batch_0070_plan.json` and `archive_batch_0070_authored.json`.

Archives 00/384 and 00/385 were resolved from catalog records
`pc-jap-map-0245` and `pc-jap-map-0246` at ROM offsets 7608376 and 7611452.
Their boundary tables establish direct-ROM lengths of 3,036 and 3,587 bytes
with 56 and 67 text-bearing scripts. Both new archives, plus the resumed
archive 00/383, round-trip byte-identically through TextPet. Eighty-nine exact
repeated sources reuse established Korean wording, while the remaining 11
entries were translated and independently reread from Japanese. Protected
raw-entry and TPL hashes, planned ordering, stable IDs across all seventy
100-entry batches, Japanese-kana residual scan, tracked command preservation,
exact-source Korean consistency, and the deterministic rebuild passed all 15
static checks. The glossary adds the Gospel-base, Gospel-hideout, and cyber-tree
terms without a duplicate source. Including the earlier 70-entry archive 00/09
draft, the project now has 7,070 semantic draft entries, with an estimated 679
entries remaining in the verified extraction population.

The projected combined Hangul repertoire remains 1,124 syllables against the
current 713-slot contextual font bank, an overflow of 411 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0071_100.json` is the seventy-first protected 100-entry batch.
It contains the final 27 text-bearing entries in archive 00/385, all 36 in
archive 00/386, all 29 in archive 00/387, and the first eight in archive
00/388. Archives 00/385 through 00/387 now have complete semantic drafts.
Archive 00/388 has eight text-bearing entries remaining, and the next batch
begins at text-entry position 8 (script entry 8, `あれ・・・ゼニーがたりないよ`).
The source-order plan and independently authored wording are stored separately
in `archive_batch_0071_plan.json` and `archive_batch_0071_authored.json`.

Archives 00/386 through 00/388 were resolved from catalog records
`pc-jap-map-0247` through `pc-jap-map-0249` at ROM offsets 7615080, 7617396,
and 8283120. Their boundary tables establish direct-ROM lengths of 2,274,
1,921, and 642 bytes with 36, 29, and 16 text-bearing scripts. All three new
archives, plus the resumed archive 00/385, round-trip byte-identically through
TextPet. Eighty-two exact repeated sources reuse established Korean wording,
while the remaining 18 entries were translated and independently reread from
Japanese. Protected raw-entry and TPL hashes, planned ordering, stable IDs
across all seventy-one 100-entry batches, Japanese-kana residual scan, tracked
command preservation, exact-source Korean consistency, and the deterministic
rebuild passed all 15 static checks. No new glossary term was required for this
batch, and the glossary retains no duplicate source. Including the earlier
70-entry archive 00/09 draft, the project now has 7,170 semantic draft entries,
with an estimated 579 entries remaining in the verified extraction population.

The projected combined Hangul repertoire remains 1,124 syllables against the
current 713-slot contextual font bank, an overflow of 411 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0072_100.json` is the seventy-second protected 100-entry batch.
It contains the final eight text-bearing entries in archive 00/388, all 16 in
each of archives 00/389 through 00/393, and the first 12 in archive 00/394.
Archives 00/388 through 00/393 now have complete semantic drafts. Archive
00/394 has 148 text-bearing entries remaining, and the next batch begins at
text-entry position 12 (script entry 12, `PETの サブ画面で 見れる /
「データライブラリ」は / バトルチップの ずかん みたいなものさ`). The
source-order plan and independently authored wording are stored separately in
`archive_batch_0072_plan.json` and `archive_batch_0072_authored.json`.

Archives 00/389 through 00/393 were resolved from catalog records
`pc-jap-map-0250` through `pc-jap-map-0254` at ROM offsets 8283784, 8284448,
8285112, 8285776, and 8286440. The first four are 642-byte direct-ROM
archives, while 00/393 is a 687-byte direct-ROM archive; each contains 16
text-bearing scripts. Archive 00/394 was resolved from catalog record
`pc-jap-map-0255` at ROM offset 7619324 as a 9,542-byte GBA LZ77 stream that
decompresses to a 13,408-byte archive with 160 text-bearing scripts. All six
new archives, plus the resumed archive 00/388, round-trip byte-identically
through TextPet. Thirty-six exact repeated sources reuse established Korean
wording, while the remaining 64 entries were translated and independently
reread from Japanese. Protected raw-entry and TPL hashes, planned ordering,
stable IDs across all seventy-two 100-entry batches, Japanese-kana residual
scan, tracked command preservation, exact-source Korean consistency, and the
deterministic rebuild passed all 15 static checks. The glossary adds the
Hikari and Sakurai family references, DenCity, chip-folder, virus-busting,
plug-in, delete, license, DenGas, and Ayanokoji-family terms without a duplicate
source. Including the earlier 70-entry archive 00/09 draft, the project now has
7,270 semantic draft entries, with an estimated 479 entries remaining in the
verified extraction population.

The projected combined Hangul repertoire remains 1,124 syllables against the
current 713-slot contextual font bank, an overflow of 411 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0073_100.json` is the seventy-third protected 100-entry batch.
It contains text-entry positions 12 through 111 in archive 00/394, ending at
script entry 146. Archive 00/394 has 48 text-bearing entries remaining, and the
next batch begins at text-entry position 112 (script entry 147,
`はぁ~、タイクツだな~`). The source-order plan and independently authored
wording are stored separately in `archive_batch_0073_plan.json` and
`archive_batch_0073_authored.json`.

The batch reuses the byte-identical 13,408-byte TextPet extraction of archive
00/394 from the 9,542-byte GBA LZ77 stream at ROM offset 7619324. One
control-qualified exact repeated source reuses established Korean wording,
while the remaining 99 entries were translated and independently reread from
Japanese. Protected raw-entry and TPL hashes, planned ordering, stable IDs
across all seventy-three 100-entry batches, Japanese-kana residual scan,
tracked command preservation, exact-source Korean consistency, and the
deterministic rebuild passed all 15 static checks. The glossary adds the
enhancement-program, regular-chip, PanelOut1, NetMerchant, NetMafia, mail-pal,
regular-memory, plug-out, Official-Navi, and PET-battery terms
without a duplicate source. Including the earlier 70-entry archive 00/09
draft, the project now has 7,370 semantic draft entries, with an estimated 379
entries remaining in the verified extraction population.

The projected combined Hangul repertoire is now 1,129 syllables against the
current 713-slot contextual font bank, an overflow of 416 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0074_100.json` is the seventy-fourth protected 100-entry batch.
It finishes the final 48 text-bearing entries of archive 00/394 and continues
through the first 52 text-bearing entries of archive 00/395, ending at script
entry 180. Archive 00/395 has 39 text-bearing entries remaining, and the next
batch begins at text-entry position 52 (script entry 181,
`「そなえあれば うれいナシ」 ですよ`). The source-order plan and
independently authored wording are stored separately in
`archive_batch_0074_plan.json` and `archive_batch_0074_authored.json`.

Archive 00/395 was resolved at ROM offset 7628868 as a 4,682-byte GBA LZ77
stream that decompresses to a 6,429-byte archive. Both source archives in the
batch round-trip byte-identically through TextPet. Four control-qualified exact
repeated sources reuse established Korean wording, while the remaining 96
entries were translated and independently reread from Japanese. Protected
raw-entry and TPL hashes, planned ordering, stable IDs across all seventy-four
100-entry batches, Japanese-kana residual scan, tracked command preservation,
exact-source Korean consistency, and the deterministic rebuild passed all 15
static checks. The glossary adds Higure, SubChip, and Boss-Navi terms without a
duplicate source. Including the earlier 70-entry archive 00/09 draft, the
project now has 7,470 semantic draft entries, with an estimated 279 entries
remaining in the verified extraction population.

The projected combined Hangul repertoire is now 1,131 syllables against the
current 713-slot contextual font bank, an overflow of 418 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0075_100.json` is the seventy-fifth protected 100-entry batch.
It finishes the final 39 text-bearing entries of archive 00/395, translates all
40 text-bearing entries of archive 00/396, and continues through the first 21
text-bearing entries of archive 00/397, ending at script entry 51. Archive
00/397 has 14 text-bearing entries remaining, and the next batch begins at
text-entry position 21 (script entry 52,
`ママは おみやげは いいから / そのぶん いっぱい たのしんでらっしゃい`).
The source-order plan and independently authored wording are stored separately
in `archive_batch_0075_plan.json` and `archive_batch_0075_authored.json`.

Archives 00/396 and 00/397 were resolved at ROM offsets 7633552 and 7635956 as
2,403-byte and 1,789-byte GBA LZ77 streams, decompressing to 3,521-byte and
2,536-byte archives. All three source archives in the batch round-trip
byte-identically through TextPet. Forty-five control-qualified exact repeated
sources reuse established Korean wording, while the remaining 55 entries were
translated and independently reread from Japanese. Protected raw-entry and TPL
hashes, planned ordering, stable IDs across all seventy-five 100-entry batches,
Japanese-kana residual scan, tracked command preservation, exact-source Korean
consistency, and the deterministic rebuild passed all 15 static checks. The
glossary adds the Akihara Station and Yuichiro honorific forms without a
duplicate source. Including the earlier 70-entry archive 00/09 draft, the
project now has 7,570 semantic draft entries, with an estimated 179 entries
remaining in the verified extraction population.

The projected combined Hangul repertoire is now 1,132 syllables against the
current 713-slot contextual font bank, an overflow of 419 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0076_100.json` is the seventy-sixth protected 100-entry batch.
It finishes the final 14 text-bearing entries of archive 00/397, translates all
text-bearing entries of archives 00/398 through 00/401, and continues through
the first 11 text-bearing entries of archive 00/402, ending at script entry 45.
Archive 00/402 has 19 text-bearing entries remaining, and the next batch begins
at text-entry position 11 (script entry 220,
`コブンの ライバル、 / データの にんぎょうだ // ぐったりしている・・・`).
The source-order plan and independently authored wording are stored separately
in `archive_batch_0076_plan.json` and `archive_batch_0076_authored.json`.

Archives 00/398 through 00/402 were resolved at ROM offsets 7637748, 7638404,
7639148, 7640068, and 7641792 as GBA LZ77 streams. All six source archives in
the batch round-trip byte-identically through TextPet. Nineteen
control-qualified exact repeated sources reuse established Korean wording,
while the remaining 81 entries were translated and independently reread from
Japanese. Protected raw-entry and TPL hashes, planned ordering, stable IDs
across all seventy-six 100-entry batches, Japanese-kana residual scan, tracked
command preservation, exact-source Korean consistency, and the deterministic
rebuild passed all 15 static checks. The glossary adds the fictional Bone
Family anime title, Kobun, Rocket Guts Punch, and Glide without a duplicate
source. Including the earlier 70-entry archive 00/09 draft, the project now has
7,670 semantic draft entries, with an estimated 79 entries remaining in the
verified extraction population.

The projected combined Hangul repertoire remains 1,132 syllables against the
current 713-slot contextual font bank, an overflow of 419 distinct syllables.
ROM reinsertion remains blocked pending a larger font-capacity design, and
emulator testing remains deferred.

`archive_batch_0077_100.json` is the seventy-seventh protected 100-entry batch.
It finishes the final 19 text-bearing entries of archive 00/402, translates all
13 text-bearing entries of archive 00/403, and continues through the first 68
text-bearing entries of archive 00/404, ending at script entry 232. Archive
00/404 has two text-bearing entries remaining; the next one is text-entry
position 68 (script entry 233, `ブラックボードだ / プラグイン できるつくりだが /
今は そんなきぶん じゃなかった・・・`). The source-order plan and
independently authored wording are stored separately in
`archive_batch_0077_plan.json` and `archive_batch_0077_authored.json`.

Archives 00/403 and 00/404 were resolved at ROM offsets 7643640 and 7644292 as
652-byte and 4,363-byte GBA LZ77 streams that decompress to 1,126-byte and
6,072-byte archives. All three source archives in the batch round-trip
byte-identically through TextPet. One control-qualified exact repeated source
reuses established Korean wording, while the remaining 99 entries were
translated and independently reread from Japanese. Protected raw-entry and TPL
hashes, planned ordering, stable IDs across all seventy-seven 100-entry batches,
Japanese-kana residual scan, tracked command preservation, exact-source Korean
consistency, and the deterministic rebuild passed all 15 static checks. The
glossary adds Data, the Melpopos civilization, and the Afternoon Bath wordplay
without a duplicate source. Including the earlier 70-entry archive 00/09 draft,
the project now has 7,770 semantic draft entries.

The previously reported estimate of 79 total remaining entries was limited to
the then-extracted population and is no longer valid. The currently extracted
archive 00/404 has exactly two entries remaining, while later
`pc-jap-map-0266` through `pc-jap-map-0426` catalog records still require
TextPet classification and counting. The projected combined Hangul repertoire
remains 1,132 syllables against the current 713-slot contextual font bank, an
overflow of 419 distinct syllables. ROM reinsertion remains blocked pending a
larger font-capacity design, and emulator testing remains deferred.
