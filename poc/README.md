# Korean glyph visibility PoC

This is a non-distributable visibility experiment for the verified Japanese
Rev 1 ROM. It replaces only the 64-byte font record at index `0xE9` in a
separate ROM copy. The selected record is already reachable through the
observed extended-glyph path, so no message bytes, pointer tables, or parser
code are modified. Its default glyph is `가`, chosen because its structure is
still distinguishable in the fixed 8x16 cell.

The build renders one Korean character from a locally supplied font into two
vertical 8x8 GBA 4bpp tiles (8x16 total). It records a manifest containing
input, font, output, and exact-write hashes; it does not retain the source
font or extract original graphics.

Run from this directory with explicitly supplied paths:

```powershell
python tools\build_korean_glyph_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --output-rom "poc\output\exe2_rev1_ko_glyph_poc.gba" `
  --font "C:\path\to\a\licensed-korean-font.ttf" `
  --manifest "poc\output\manifest.json" `
  --preview "poc\output\glyph_preview.png"
```

The output demonstrates only that a Korean glyph can pass through the
existing font-record and dialogue-rendering path after a fresh redraw. It is
not a Korean text encoder, a complete font, or a distributable patch.

## One-entry reinsertion PoC

`tools\build_korean_text_insertion_poc.py` extends the visibility experiment
with one length-preserving two-byte message edit. It supplies `가` at record
`0xE9`, `나` at `0xEA`, then replaces two direct glyph bytes in the verified
59-byte active entry with the existing `E5` extended-glyph form for record
`0xEA`. Entry length and all pointers remain unchanged.

```powershell
python tools\build_korean_text_insertion_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --output-rom "poc\output\exe2_rev1_ko_text_poc.gba" `
  --font "C:\path\to\a\licensed-korean-font.ttf" `
  --manifest "poc\output\text_manifest.json" `
  --preview-dir "poc\output\text_glyph_previews"
```

This is still a non-distributable test: it proves one existing extended-glyph
form can be deliberately reinserted into one active dialogue entry. It does
not establish a general Korean code page, arbitrary-length text handling, or
complete-script safety.

## Existing 512-record bank PoC

`tools\build_korean_extended_bank_poc.py` adds `다` at record `0x1E5` and
inserts its existing `E6` form into the same verified entry, alongside the
earlier `E5` insertion for `나`. This directly tests both existing two-byte
glyph routes inside the conservative 512-record bank; it does not modify the
parser or any pointer.

```powershell
python tools\build_korean_extended_bank_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --output-rom "poc\output\exe2_rev1_ko_e5_e6_poc.gba" `
  --font "C:\path\to\a\licensed-korean-font.ttf" `
  --manifest "poc\output\e5_e6_manifest.json" `
  --preview-dir "poc\output\e5_e6_glyph_previews"
```

## Data-driven code-page PoC

`tools\build_codepage_message_poc.py` connects the generated overlay mapping,
font-record conversion, and one same-length message insertion. It uses the
included technical code-page sample and encodes `가다` from its mapping rather
than from hard-coded glyph indices. The verified target begins with six
contiguous direct-glyph bytes, so `--message 가나다` can be used for a
three-glyph same-length test; longer text is rejected before any ROM is made.
Only the glyph records used by `--message` are written. The planning-only
`candidate_unobserved_overlay` code page requires the explicit
`--allow-candidate-unobserved-codepage` flag and remains a collision test, not
a production font allocation.

The same verified entry has an independent 11-byte direct-glyph run at
`--relative-offset 0x13`; a five-glyph (10-byte) same-length test can use that
site. Each selected site is checked against the original entry hash and must
remain entirely inside a contiguous direct-glyph run.

```powershell
python tools\build_codepage_message_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --codepage "poc\output\korean_codepage_poc.json" `
  --policy "analysis\control_code_policy_registry.json" `
  --font "C:\path\to\a\licensed-korean-font.ttf" `
  --output-rom "poc\output\exe2_rev1_ko_codepage_poc.gba" `
  --manifest "poc\output\codepage_message_manifest.json" `
  --preview-dir "poc\output\codepage_glyph_previews"
```

## F1 selector cursor probe

`tools\build_f1_cursor_probe_poc.py` is a controlled, length-preserving
runtime check for the static `F1` selector `0x04` result. It writes only the
existing E5-bank glyph record for `나` and five direct-glyph bytes at the
verified active entry. The test frame reserves three bytes for `F1`, then
places the visible E5 glyph at the predicted following cursor location.

```powershell
python tools\build_f1_cursor_probe_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_f1_04_cursor_probe.gba" `
  --manifest "poc\output\f1_04_cursor_probe_manifest.json" `
  --preview-dir "poc\output\f1_04_cursor_probe_preview"
```

Run the output ROM from a fresh state and capture the same dialogue screen.
If `나` appears at the first edited position, the observation supports this
one selector's three-byte cursor hypothesis; it does not validate the other
control commands or a general reinsertion policy.

## FA selector cursor probe

`tools\build_fa_1c_cursor_probe_poc.py` tests the separate static candidates
`FA:1C` and `FA:18`. The former uses its two-byte cursor candidate; the latter
adds two reserved bytes for its four-byte candidate. Both then use the existing
E5 form for `나`. A location change, missing glyph, or other state change is a
meaningful negative result and leaves `FA` blocked.

```powershell
python tools\build_fa_1c_cursor_probe_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_fa_1c_cursor_probe.gba" `
  --manifest "poc\output\fa_1c_cursor_probe_manifest.json" `
  --preview-dir "poc\output\fa_1c_cursor_probe_preview"
```

Use `--selector 0x18` and distinct output/manifest names to run the four-byte
candidate.

## ED:00 following-byte effect probe

`tools\build_ed_00_argument_probe.py` changes exactly one byte following the
observed `ED:00` prefix in the verified active entry. It is an effect test,
not a command-width or reinsertion test: any visible difference keeps `ED`
blocked, and an unchanged screen does not prove that the byte is safe to edit.

```powershell
python tools\build_ed_00_argument_probe.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --output-rom "poc\output\exe2_rev1_ed_00_argument_probe.gba" `
  --manifest "poc\output\ed_00_argument_probe_manifest.json"
```

Load the same dialogue screen from a fresh state and capture it for comparison
with the unmodified ROM. The generated ROM preserves the entry length and
changes no pointer, font record, or parser code.

## ED:00 cursor-boundary probe

`tools\build_ed_00_cursor_probe.py` places an existing `E5` Korean-glyph
transport in the third byte after `ED:00`, within five direct-glyph bytes of
the verified active entry. If the `나` marker is visible, that supports a
two-byte cursor for this selector at this location. If it is absent while the
dialogue advances normally, that supports consumption of the third byte. Both
outcomes remain selector-local evidence and do not permit ED rewriting.

```powershell
python tools\build_ed_00_cursor_probe.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_ed_00_cursor_probe.gba" `
  --manifest "poc\output\ed_00_cursor_probe_manifest.json" `
  --preview-dir "poc\output\ed_00_cursor_probe_preview"
```

Pass `--selector 0x02` with separate output, manifest, and preview paths to
test the independently observed `ED:02` prefix. A result for one selector
must not be applied to the other.

## F9:00 cursor-boundary probe

`tools\build_f9_00_cursor_probe.py` places the marker's `E5` prefix at the
fourth byte of an `F9:00` frame. An absent marker with normal progression
supports the existing four-byte candidate for this selector; a visible marker
refutes it. Neither result authorizes F9 rewriting.

```powershell
python tools\build_f9_00_cursor_probe.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_f9_00_cursor_probe.gba" `
  --manifest "poc\output\f9_00_cursor_probe_manifest.json" `
  --preview-dir "poc\output\f9_00_cursor_probe_preview"
```

## Expanded Korean-glyph record probes

`tools\build_korean_record_512_poc.py` supplies a Korean glyph at a selected
E6-addressable expanded font record and accesses it through the existing `E6`
transport. Record 512 is the first record beyond the conservative
same-palette run; record 740 is the statically reachable E6 endpoint. A
visible marker only proves the tested record is reachable and compatible after
its source data is converted; it does not authorize a complete expanded bank.

```powershell
python tools\build_korean_record_512_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_ko_record_512_probe.gba" `
  --manifest "poc\output\record_512_probe_manifest.json" `
  --preview-dir "poc\output\record_512_probe_preview"
```

For the endpoint test, add `--record-index 0x2E4` and use the corresponding
`record_740` output names.

## Expanded-record collision probe

`tools\build_font_record_collision_probe.py` replaces only one selected E5/E6
font record and leaves all message bytes untouched. If its Korean
marker appears in original text on a tested screen, that record collides with
an existing consumer. No marker is not a global non-use conclusion.

```powershell
python tools\build_font_record_collision_probe.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --record-index 0x200 `
  --output-rom "poc\output\exe2_rev1_record_512_collision_probe.gba" `
  --manifest "poc\output\record_512_collision_probe_manifest.json" `
  --preview-dir "poc\output\record_512_collision_probe_preview"
```

## Active-block relocation probe

`tools\build_active_block_relocation_probe.py` copies the runtime-observed
525-byte active block to a validated constant-padding candidate and changes
only its one statically observed pointer literal. It makes no change inside
the block. A normal dialogue screen is a prerequisite for any future
variable-length-entry experiment; it does not itself establish editable entry
boundaries.

```powershell
python tools\build_active_block_relocation_probe.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --output-rom "poc\output\exe2_rev1_active_block_relocation_probe.gba" `
  --manifest "poc\output\active_block_relocation_probe_manifest.json"
```

## Active-entry growth probe

`tools\build_active_entry_growth_probe.py` performs the next bounded test: it
relocates the active block, inserts the selected Korean E5/E6 byte pairs into
the selected table entry at a verified direct-glyph boundary, and raises every
later table offset by the inserted size. It writes only the selected font records and
leaves all original entry bytes in order. This is only a one-block
variable-length probe.

```powershell
python tools\build_active_entry_growth_probe.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --codepage "poc\output\korean_codepage_candidate_unobserved_poc.json" `
  --policy "analysis\control_code_policy_registry.json" `
  --allow-candidate-unobserved-codepage `
  --message "가나다" `
  --entry-index 0 `
  --entry-relative-offset 18 `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_active_entry_growth_probe.gba" `
  --manifest "poc\output\active_entry_growth_probe_manifest.json" `
  --preview-dir "poc\output\active_entry_growth_probe_preview"
```

## Active-block multi-entry growth probe

`tools\build_active_block_multi_entry_growth_poc.py` accepts repeated
`--edit ENTRY_INDEX:RELATIVE_OFFSET:HANGUL` inputs, inserts every declared
string at a verified boundary, and applies the cumulative byte delta to each
later table offset. It is a bounded multi-entry test for the same active
block, not a general script compiler.

```powershell
python tools\build_active_block_multi_entry_growth_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --codepage "poc\output\korean_codepage_candidate_unobserved_poc.json" `
  --policy "analysis\control_code_policy_registry.json" `
  --allow-candidate-unobserved-codepage `
  --edit "0:18:가나다" `
  --edit "1:9:가나다" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_active_block_multi_entry_growth_poc.gba" `
  --manifest "poc\output\active_block_multi_entry_growth_manifest.json" `
  --preview-dir "poc\output\active_block_multi_entry_growth_preview"
```

## Active-block nine-entry alignment PoC

`exe2_rev1_active_block_nine_entry_growth_poc.gba` is the next bounded
alignment check for the same runtime-observed block. It inserts the same
three Korean glyphs at independently verified direct-glyph/control boundaries
in all nine non-empty table entries. The relocation writes 54 inserted message
bytes in total and recalculates every later table offset cumulatively. It
reuses only the three font records already exercised by the earlier active
block tests; it is still a non-distributable local test artifact.

```powershell
python tools\build_active_block_multi_entry_growth_poc.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --codepage "poc\output\korean_codepage_candidate_unobserved_poc.json" `
  --policy "analysis\control_code_policy_registry.json" `
  --allow-candidate-unobserved-codepage `
  --edit "0:18:가나다" --edit "1:9:가나다" --edit "2:19:가나다" `
  --edit "3:18:가나다" --edit "4:15:가나다" --edit "5:20:가나다" `
  --edit "6:18:가나다" --edit "7:31:가나다" --edit "8:17:가나다" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_active_block_nine_entry_growth_poc.gba" `
  --manifest "poc\output\active_block_nine_entry_growth_manifest.json" `
  --preview-dir "poc\output\active_block_nine_entry_growth_preview"
```

Verify the complete nine-entry sequence from the same fresh state. A normal
screen must preserve the inserted marker and keep every later entry reachable;
one successful screen alone is not enough to validate the whole table.

## Catalog-screened nine-entry PoC

`exe2_rev1_active_block_nine_entry_catalog_screened_poc.gba` repeats the
nine-entry growth test with a stricter provisional codepage. Its three E5/E6
font records are selected from the intersection of the structural candidate
audit and a raw-pair screen across all 427 catalogued message blocks. The
selection reduces the chance that untranslated catalogued text will use one of
the overwritten records; it is still not a global font-slot safety proof.

Use the same fresh active-block test state and verify all nine entries. The
build manifest is `active_block_nine_entry_catalog_screened_manifest.json` and
the precise evidence boundary is documented in
`analysis/catalog_screened_active_block_poc.md`.

## Block 0024 catalog-screened PoC

`exe2_rev1_block_0024_nine_entry_catalog_screened_poc.gba` applies the same
catalog-screened provisional codepage to the independently state-observed
block 0024. Its companion SRAM uses the same basename and is copied from the
previous block-0024 test setup. Verify all nine edited entries before treating
the block as a successful bounded PoC. See
`analysis/block_0024_catalog_screened_poc.md` for the evidence boundary.

## State-observed LZ77 archive 00/09 PoC

`exe2_rev1_archive_00_09_entries_2_13_catalog_screened_poc.gba` is the first
bounded edit of a runtime-decompressed message archive. The supplied SS1 and
SS2 snapshots resolve archive selector 00/09, prove an exact BIOS-LZ77 copy to
EWRAM, and identify active entries 2 and 13. One catalog-screened Hangul marker
is inserted into each entry while staying within the original compressed ROM
slot. See `analysis/archive_00_09_state_observed_poc.md`.

`exe2_rev1_archive_00_09_entries_2_13_expanded_growth_poc.gba` is the matching
capacity experiment. It expands the image to 16MB, preserves the original
archive, redirects selector 00/09 to `0x08800000`, and inserts the three-glyph
marker in both observed entries. See
`analysis/archive_00_09_expanded_growth_poc.md`.

## State-observed next-block growth PoC

`tools\build_runtime_observed_block_growth_poc.py` is a guarded successor for
additional blocks. It refuses a block unless all of the following are supplied
and agree: the immutable structural catalog, a state report containing that
block's source pointer, and the direct literal-consumer audit. The input ROM
hash is mandatory, so chained local PoCs cannot silently target an unintended
base.

The first chained result applies one insertion to the state-observed next
block while preserving the earlier nine-entry relocation:

```powershell
python tools\build_runtime_observed_block_growth_poc.py `
  --rom "poc\output\exe2_rev1_active_block_nine_entry_growth_poc.gba" `
  --expected-input-sha256 "00e6fecce27ba46fbcf8ba558c5c26ec8b22cad338073b94d12042b8b4b603f1" `
  --catalog "analysis\rev1_message_block_catalog.json" `
  --literal-audit "analysis\catalog_block_literal_consumer_audit.json" `
  --state-report "analysis\active_block_nine_entry_growth_state_40.json" `
  --block-id "pc-jap-map-0024" `
  --target-offset 0x1E6DC0 `
  --codepage "poc\output\korean_codepage_candidate_unobserved_poc.json" `
  --policy "analysis\control_code_policy_registry.json" `
  --allow-candidate-unobserved-codepage `
  --edit "0:20:가나다" `
  --font "C:\Windows\Fonts\malgunbd.ttf" `
  --output-rom "poc\output\exe2_rev1_block_0024_entry_growth_poc.gba" `
  --manifest "poc\output\block_0024_entry_growth_manifest.json" `
  --preview-dir "poc\output\block_0024_entry_growth_preview"
```

This is still a local, non-distributable test. It establishes only this
declared edit in this state-observed block; every later block needs independent
state evidence and runtime verification.

The corresponding nine-entry stress build uses the same guarded inputs and
adds the declared marker once to every non-empty entry in the block. Its output
is `poc\output\exe2_rev1_block_0024_nine_entry_growth_poc.gba`; verify the
whole dialogue sequence from the supplied state rather than treating its first
screen as coverage for every entry.

## Chained block-0067 growth PoC

The next state contained an exact 32-byte-or-longer fragment of
`pc-jap-map-0067` in EWRAM after the source pointer had been consumed. The
state inspector can record this bounded evidence with `--fragment-block-id`;
the guarded builder accepts it only together with the catalog hash and the
direct literal-consumer audit.

Because the second chained block occupied the only suitable mid-ROM padding,
`tools\repack_chained_block_relocation.py` first moves its already-validated
relocated payload to unused tail padding and repoints only the literal words
declared in its prior manifest. The final local artifact is
`poc\output\exe2_rev1_block_0067_entry_growth_poc.gba`. It preserves the
previous two relocated payloads, retargets both block-0067 literal consumers,
and adds one declared marker to entry 17. Test it by loading the state from
before this dialogue, then advancing into the observed message; this remains
a non-distributable PoC, not a general patch.

## Guarded candidate pointer-table route

`tools\build_runtime_observed_block_growth_poc.py` also has an opt-in route
for a block whose exact start-pointer words occur only within a bounded,
contiguous candidate table in
`analysis\catalog_block_start_pointer_word_census.json`. It remains rejected
by default. A build must supply the pointer census, a runtime state report for
the selected block, `analysis\candidate_pointer_table_pc_relative_literal_audit.json`,
and `--allow-candidate-pointer-table`. Tables without a static PC-relative code
consumer are rejected. The manifest then labels the consumer as a candidate
table rather than a confirmed direct code literal. This is a local
investigation path, not proof that a table's type or all its consumers are
globally understood.

## PoC font-slot boundary

The current Korean code page remains a rendering PoC only. Its selected E5
records had no matching pair in the scoped structural script audit, but the
whole-ROM pair audit found raw occurrences for every selected pair outside
that scope. Those occurrences are not automatically executed text, yet they
prevent promoting the current overlay to a production-safe font allocation.
Broad translation therefore requires a separately verified font bank and
allocation design rather than reusing the PoC record choices by default.
