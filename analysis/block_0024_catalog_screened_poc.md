# Block 0024 catalog-screened Korean PoC

## Bounded result

- Base ROM SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- Output ROM SHA-256: `a0dd33026a3240c2664d657a493e2af8fd34bc34fc0509a438a3e165c4bff81e`
- Output ROM: `poc/output/exe2_rev1_block_0024_nine_entry_catalog_screened_poc.gba`
- Matched SRAM SHA-256: `2d864c0b789a43214eee8524d3182075125e5ca2cd527f3582ec87ffd94076bc`
- The original ROM remains unchanged. This output is a local, non-distributable test artifact.

## Evidence used

1. Block `pc-jap-map-0024` is present in the 427-block structural catalog.
2. The supplied state report provides prior runtime evidence for this exact
   source block.
3. Its audited direct PC-relative literal consumers are real calls into the
   verified message initializer.
4. Each of the nine selected insertions is at a separately enumerated
   direct-glyph/control boundary in the base block.
5. Font records use the catalog-screened provisional codepage, not the older
   structural-only candidate set.

## Build accounting

| Item | Value |
| --- | --- |
| Edited entries | 9 |
| Inserted glyph-stream bytes | 54 |
| Font records written | 3 |
| Total changed bytes | 674 |
| Codepage mode | `candidate_catalog_unobserved_overlay` |

The builder rejects any change outside the relocated block, its audited
literal-pointer word, and the three declared font-record ranges. It updates
the block's subsequent 16-bit table offsets cumulatively.

## Verification boundary

Load the output ROM with the matching SRAM, reach the prior block-0024 test
context, and traverse every edited entry. Successful rendering of one entry is
not sufficient: all nine entries must remain reachable after table growth.
This does not establish safe replacement of all text blocks or global font
slot safety.
