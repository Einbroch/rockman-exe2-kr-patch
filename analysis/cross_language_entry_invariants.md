# Cross-language entry-invariant survey (Rev 1)

This survey compares each same-index PC package entry in Japanese, simplified
Chinese, traditional Chinese, and English. It retains only metadata plus short
byte templates that begin with previously observed control-candidate values.
No decoded message text is exported.

## Coverage

| Measure | Result |
| --- | ---: |
| Japanese map records | 427 |
| PC records comparable in all four languages | 426 |
| Records with differing PC entry counts | 35 |
| GBA entries with a comparable PC entry index | 9,622 |
| GBA entries starting with the four-language common PC prefix | 6,647 |
| Runtime-observed entries in this survey | 1 |

The observed `pc-jap-map-0023/entry-00` is included: all four PC packages
share a 12-byte prefix, and the GBA entry starts with that same prefix.

The most frequent GBA-matching, leading common-prefix templates are:

```text
ED 00 00 F1 00   (928 entries)
ED 00 40 F1 00   (791 entries)
ED 00 17 F1 00   (175 entries)
```

These are repeated cross-language byte patterns, not decoded commands. Their
widths, parameter meaning, and execution behavior remain unconfirmed.

## Safe handling rule

For an entry whose GBA bytes begin with the four-language common prefix, the
prefix has **candidate preservation priority**. The remainder stays
`forbidden` for automatic translation, tokenization, or reinsertion. Entries
without such a match are not exclusions; they are unresolved candidates.

Different PC entry counts and the one incompatible record mean package index
alignment is only comparative evidence. It must not be converted into a GBA
logical-message index until the runtime reader is captured.

Regenerate the metadata report with:

```powershell
python tools\cross_language_entry_invariants.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --archive "PC판 패치\exe2j.dat" `
  --state-report analysis\state_ss1.json `
  --output analysis\cross_language_entry_invariants.json
```
