# State-observed LZ77 archive 00/09 Korean PoC

## Result

- Original Rev 1 ROM SHA-256 remains `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.
- Input PoC ROM SHA-256: `6fbf895d2ce778e061e89b95aa092204b110162b2dc0854ea82e613a2a014b86`
- Output PoC ROM SHA-256: `6a638fed558cb9c5e6acf22fc52e35792f68a529a61f2427515566082cb7a466`
- Output: `poc/output/exe2_rev1_archive_00_09_entries_2_13_catalog_screened_poc.gba`
- This is a local, non-distributable validation ROM.

## State evidence

The supplied SS1 and SS2 snapshots have different state-payload hashes and
show different dialogue entries. Both resolve the same message selector:

| Field | Value |
| --- | --- |
| Archive selector | major `0`, minor `9`, tertiary `0` |
| Compressed source ROM offset | `0x74A484` |
| EWRAM destination | `0x02038800` |
| Original compressed length | 4,363 bytes |
| Decompressed length | 6,072 bytes |
| EWRAM/decompressed comparison | Exact, zero differing bytes |

The transfer routine is the GBA BIOS LZ77 WRAM service invoked at
`0x080E8690`. The renderer-state pointers identify entry 2 in SS1 and entry 13
in SS2.

## Bounded edit

The PoC inserts the already installed catalog-screened `U+AC00` glyph code at
the state-observed direct-glyph/control boundary in entries 2 and 13.

| Item | Value |
| --- | --- |
| Edited entries | 2 and 13 |
| Inserted bytes | 2 per entry, 4 total |
| Replacement decompressed length | 6,076 bytes |
| Replacement compressed length | 4,364 bytes |
| Available in-place capacity | 4,364 bytes |
| LZ77 round-trip | Exact |
| Changed ROM bytes | 3,979, all inside the declared compressed slot |

All later 16-bit entry offsets are shifted cumulatively. No font record is
rewritten in this stage; the input PoC's verified catalog-screened glyph is
reused.

## Verification boundary

The output must reload archive selector 00/09 from ROM before judging it; an
old savestate already contains the previous decompressed EWRAM pool. Verify
the two corresponding dialogue screens and continue through later entries to
check the shifted table. Passing this test proves only this archive and the two
marker edits. It does not provide enough in-place capacity for full Korean
translation of all 254 entries.
