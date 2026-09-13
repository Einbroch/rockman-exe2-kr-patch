# Archive 00/09 classroom entries 26 through 30 development build

The clean development ROM now adds entries 26 through 30 to the previously verified classroom scope. The selected non-empty entries are 0 through 17 and 22 through 31, for 28 translated entries in total. Entries 18 through 21 remain the original zero-length slots.

The build starts from the untouched Rev 1 ROM with SHA-256 `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`. The resulting 16 MiB development ROM is `poc/output/exe2_rev1_archive_00_09_dialogue_classroom_00_31_full_exe1k_font_clean_poc.gba`, SHA-256 `fd487f4c2d1200346fb29ad9f77597258139cfee1fbccc2c8e50534362f5c551`.

The rebuilt archive is 6,673 bytes before compression and 4,891 bytes after compression. The independent verifier confirmed the 254-entry table, all protected source bytes and controls, byte-identical untranslated entries, required EXE 1 [K] font records, the GBA header checksum, and the untouched original compressed slot.

Muted focused runtime verification used Mesen 2 with `display:false` and `sound:false`. It rendered both pages of entry 26, all three pages of entry 27, and the single pages of entries 28, 29, and 30. No clipping, Japanese residue, or broken glyph was observed. Entry 29 consumed its four preserved 30-frame waits, and entry 30 closed the dialogue window after its preserved end command. The focused entry-30 test skipped the original chapter-check prefix, so that chapter-selection route remains outside this evidence.

The EXE 1 [K] font is now used under the user-attested permission record `analysis/exe1_k_font_permission_record.json`; no documentary permission copy is stored in the workspace. This ROM remains a local development artifact because it contains the original game and machine-draft text. Any eventual release must be a patch applied to the supported source ROM.

The current catalog-screened overlay codepage is full at 256/256 assigned Hangul syllables. The translated draft itself uses 253 syllables; three assignments survive only from the preserved base codepage. Continuing beyond this scope requires either a separately verified reassignment of unused fixed mappings or a broader font-capacity design. A three-slot cleanup alone is not a scalable completion path.
