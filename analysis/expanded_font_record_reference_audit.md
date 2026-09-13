# Expanded font-record reference audit

The structural message-candidate catalog was scanned for raw two-byte `E5` and
`E6` forms, deduplicating exact candidate spans first. The scan covered 5,928
canonical candidate subentries and revalidated every scanned range against the
target Rev 1 ROM.

It found 10,058 raw prefix-shaped pairs across 3,054 canonical candidate
subentries: 9,799 `E5` pairs covering 118 potential indices, and 259 `E6`
pairs covering 20 potential indices. In the expanded range 512--740, only
record 512 appears: six raw-pair observations. This makes record 512 a
concrete collision risk within the catalogued structural scope.

The scan did not observe raw prefix pairs for 138 `E5` records and 228 later
expanded `E6` records. These are not yet free slots: message boundaries are
still structural candidates and other UI/graphics consumers have not been
traced. The result is therefore a prioritization signal for the next
consumer-reference audit, not authorization to overwrite any original record.

Machine-readable counts and source-hash validation are in
`expanded_font_record_reference_audit.json`; no game text, glyph data, or
message bytes are included.
