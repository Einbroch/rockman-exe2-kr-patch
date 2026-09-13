# Existing font-index capacity measurement

Target ROM SHA-256:
`1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.

The verified byte dispatcher can form a contiguous glyph-record index range
from 0 through 740: direct bytes cover 0--228, `E5` covers 229--484, and
`E6` covers 485--740. This is indexer arithmetic only, not a declaration that
every target is a compatible resident font record.

Measuring the corresponding 741 64-byte source records at `0x006973B0` using
only 4bpp palette-index ceilings finds a leading continuous run of 512 records
whose highest source palette index is at most 3. That is the same ceiling used
by the dialogue glyph records already observed in the state. Record 512 is
the first index after this run and reaches palette index 15.

Runtime PoCs then replaced record 512 and the E6 endpoint record 740 with
valid dialogue-format Korean glyph data. Both were reached through the
existing `E6` transport and rendered normally. Thus the no-code-change
addressable capacity is **741 records**: direct indices 0--228, all `E5`
indices, and all `E6` parameters 0--255.

This establishes addressability and renderer compatibility after a record is
supplied in dialogue-glyph format. It does not make the original contents of
records 512--740 free for replacement: their other consumers and any original
text usage still need an occupancy audit before a production font layout is
chosen.

The first structural candidate audit found raw `E6`-shaped references to
record 512, so that record is a collision risk and is not an initial Korean
slot. It observed no such pair for 228 of the other expanded indices, but this
is only a prioritization result until message boundaries and non-dialogue
consumers are proven. See `expanded_font_record_reference_audit.md`.

This does not establish that 512 entries are enough for a complete Korean
translation. The final character repertoire must be measured from the approved
translation corpus; if it exceeds the verified bank capacity, the next design
is a larger font bank plus a code/data-path extension rather than silent
character substitution.
