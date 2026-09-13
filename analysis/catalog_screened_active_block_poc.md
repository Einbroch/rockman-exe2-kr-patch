# Catalog-screened active-block Korean PoC

## Scope

- Base ROM SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- Output ROM SHA-256: `6fbf895d2ce778e061e89b95aa092204b110162b2dc0854ea82e613a2a014b86`
- Output: `poc/output/exe2_rev1_active_block_nine_entry_catalog_screened_poc.gba`
- This is a local, non-distributable test artifact. The original ROM is not modified.

## Candidate selection

The E5/E6 font slots used by this PoC are the intersection of:

1. the existing structural E5/E6 raw-pair non-observation audit; and
2. a new raw-pair screen across all 427 catalogued message blocks.

The catalog screen reports 256 of the 512 E5/E6 record indices with no raw
pair occurrence in the complete catalog-block scope. The sample's three
Hangul records come from that intersection. This is stronger evidence than the
older structural-only candidate set, but it is not a proof of global font-slot
safety outside the catalogued scope.

## Bounded build result

| Item | Value |
| --- | --- |
| Edited table entries | 9 |
| Inserted glyph-stream bytes | 54 |
| Written font records | 3 |
| Total changed bytes | 698 |
| Codepage mode | `candidate_catalog_unobserved_overlay` |

The builder verifies that every changed byte is within the declared relocation
region, the audited active-block literal, or one of the three declared font
records. It also recalculates all later 16-bit offsets in the relocated table.

## Required verification

Run this output from the same fresh active-block test state used for the prior
nine-entry test, then traverse all nine edited entries. Success requires that
each marker renders and that later entries remain reachable. A successful first
screen does not validate the entire table or authorize a production patch.
