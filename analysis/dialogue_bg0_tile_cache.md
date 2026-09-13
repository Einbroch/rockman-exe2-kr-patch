# Dialogue BG0 tile-cache observation

Target ROM SHA-256:
`1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.
State SHA-256:
`819619baf8bef2360c6e2c55fa9adc6fc669932478cb6f20bc2b1907113f6914`.

## State observation

The full visible dialogue text area (`x=64..207`, `y=104..151`) is covered by
mode-0 BG0, which has priority 0, character base `0x06008000`, and uses
palette bank 15. The region uses 75 distinct BG0 tile indices. Its dark
screen pixels occur in BG0 tile patterns within the observed range
`584..649`; repeated tile-pattern hashes are recorded rather than graphics.

This range begins at `0x0600C900` and lies inside a natural BG0 tile-cache
window beginning at `0x0600C800` (tile 576). It is distinct from the three
complete LZ77 graphics streams observed in BG1, BG2, and BG3.

Every one of the 34 unique BG0 tile patterns that contributes dark pixels in
the text-only region has an exact 32-byte occurrence in the target ROM. The
observed source offsets span `0x006980B0..0x0069C890`, with most occurrences
near `0x00699xxx..0x0069Axxx`. This is direct evidence that the visible
glyph-pattern data is present as raw ROM data; it is not a claim that every
occurrence is the sole font source or that its logical character mapping is
known.

Using seed `0x006973B0` and a 64-byte record stride, all 34 observed patterns
align to one of the two 32-byte components of a candidate record. Twenty-two
consecutive BG0 tile pairs (for example 584/585) map to the first and second
components of the same raw-ROM record. The ROM also contains a Thumb sequence
at `0x020D86` that loads `0x086973B0`, shifts an input by six bits, and adds it
to that base. Together these are strong structural evidence for 64-byte
glyph-record addressing, but still do not prove the character code or glyph
dimensions.

All 22 cached two-component records are arranged as first-tile/second-tile
vertical neighbors in the dialogue tilemap; none is arranged as a horizontal
pair in the measured text region. This proves the observed display layout is
two 8x8 tiles stacked vertically (an 8x16 tile layout) for these records in
this state. It remains a display-layout observation, not a character encoding
claim.

An opaque cross-check against the runtime-observed 59-byte entry adds a useful
constraint: all 15 pair-derived record indices that fit in one byte occur
somewhere in that entry. Fourteen of those 15 also have an exact match between
their cached-pair appearance count and their byte-frequency in the entry. The
check stores no code values or script bytes and does not distinguish controls
from text. It strongly supports, but does not yet establish, direct single-byte
font indexing for this entry.

A full 64-byte-record scan is stronger still: 35 of 37 visible 8x16 cache
records have exactly one aligned raw-ROM source record. Seventeen distinct
one-byte-range source indices all occur in the active entry, and sixteen have
an exact match between their displayed-record count and their byte-frequency.
The two remaining displayed records share a high-frequency all-blank pattern;
one remaining source index is the observed exception. This is sufficient to
prioritize single-byte indexing as the active hypothesis, but not to publish a
complete mapping, classify commands, or perform reinsertion.

Order provides an independent check. Reading the visible full-text grid in
screen order yields 34 one-byte-range source records. A longest-common-
subsequence comparison against the entry after its already-observed 12-byte
prefix matches 32 in the same order; the two unmatched records are instances
of one source-record index. No source byte values, text, or match positions are
stored. This sharply narrows the remaining work to control handling and the
single exceptional glyph-record relation.

For that exception, the two unmatched visible-record instances each occupy an
internal gap between direct ordered matches. Those gaps contain the same
opaque two-byte span (two occurrences, four bytes total, one span hash). This
is evidence for a repeated multi-byte handling path; it does not identify the
bytes as a character code versus a command-plus-parameter sequence.

Static code resolves the main ambiguity: a Thumb dispatch at `0x020CA6`
compares values `0xE5` and `0xE6`; the ordinary path calls the font indexer at
`0x020D84` and advances `r4` by one. Both extension paths load the following
byte, transform it (`+0xE5` for E5; `+0xE6 +0xFF` for E6), call the same
indexer, and advance `r4` by two. This explains the observed repeated E5
two-byte glyph path, while leaving the semantic role of E6 and all other
commands to be verified against another runtime state.

The same routine routes values `0xE7..0xFF` through an indirect jump table.
This establishes a conservative structural boundary: `0xE5`/`0xE6` are
extended glyph prefixes, while bytes at or above `0xE7` belong to the candidate
command range and must be preserved until their individual behavior is proven.

## Static leads

The ROM contains literal `0x0600C800` references from Thumb instructions at
ROM offsets `0x020D70` and `0x024DBA`, and literal `0x0600DB00` at
`0x024DC4`. These are structural leads only: they establish that code loads
addresses in the dialogue tile-cache window, not that a particular instruction
writes a glyph or consumes the observed script entry.

## Consequence

The next font investigation should focus on the BG0 character-base range
`0x0600C800..0x0600DB00`, not on the previously matched compressed BG1--BG3
assets, and on raw ROM tile-pattern leads near `0x086980B0..0x0869C890`.
A second dialogue state with changed characters can now compare this small
cache window by tile-pattern hash. A debugger break on writes to this window
would directly identify the tile producer and its character mapping.

`tools/diff_state_bg_tile_window.py` performs this comparison over the
verified `0x0600C800..0x0600DB00` window. Its self-comparison test against the
current state reports zero changed tiles, so it is ready for a distinct
dialogue state without storing graphics.

No ROM bytes, tile graphics, palette values, or screenshot pixels are stored
in the reports.
