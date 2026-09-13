# PC Japanese message-map equivalence audit

## Inputs

- GBA target: `Battle Network Rockman EXE 2 (Japan) (Rev 1).gba`
  - SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- PC reference archive: `PC판 패치/exe2j.dat`
  - SHA-256: `47756a72a1e793b6b02e07cc16404ff4b2e6ca5ff4bc554edff2c38e6cc3debc`
- Machine-readable result: `pc_japanese_message_equivalence.json`

The audit reads the PC archive in memory. It records only record counts,
addresses, lengths, and hashes; it does not extract or export messages,
fonts, or other source assets.

## Result

`message_jap.map` declares 427 records. All 427 source-address/length pairs
are valid within the verified Rev 1 ROM address space, so the map is a valid
independent coverage reference for this ROM revision.

The paired PC package is not a byte-for-byte copy of the GBA message region:
424 mapped records differ at the same source length, and only 3 match. The
PC package therefore uses a separate representation and must not be used as a
direct byte source, pointer table, or reinsertion payload for the GBA ROM.

## Boundary limitation

The active 59-byte GBA probe entry at ROM offset `0x77A2AE` is completely
covered by three PC map records (indices 23, 419, and 420). These ranges also
overlap each other. Consequently, the 427 map records are not a unique,
one-record-per-GBA-string boundary catalog. They cannot establish an
individual GBA message boundary or a control-code grammar.

## Allowed use in this project

- Use the PC map as a revision-checked source-range coverage reference and
  terminology/context aid during human translation review.
- Continue to derive GBA extraction boundaries, control preservation, and
  reinsertion eligibility only from the verified Rev 1 ROM analysis and
  runtime tests.
- Do not copy PC text, fonts, glyphs, or package bytes into the GBA patch.
