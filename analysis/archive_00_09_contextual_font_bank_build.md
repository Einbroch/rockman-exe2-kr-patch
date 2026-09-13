# Archive 00/09 contextual font-bank PoC

The current 16 MiB development ROM isolates the Korean font from untouched Japanese text. It restores all 741 original Rev 1 font records at `0x006973B0`, copies the contextual development bank to expanded ROM at `0x00810000`, and installs a 48-byte Thumb trampoline. The trampoline selects the expanded bank only while the renderer cursor lies in the rebuilt entries 0 through 46 interval `0x020389FE..0x020393AC`.

The independent verifier passed original-bank restoration, alternate-bank identity, hook and trampoline encoding, context bounds, archive preservation, codepage-record identity, GBA checksum, and changed-range confinement. The output ROM SHA-256 is `dbc72cf88b56a4a13428ce3d952482017fc0b1e2263352847d0d73dbe6a14864`.

Muted Mesen runtime verification used `display:false` and `sound:false`. Entries 35, 36, 40, and 45 rendered Korean in preceding candidates. In the current candidate, chapter-gated entry 46 rendered three Korean lines through the expanded bank under the baseline state's chapter value. Entry 50 rendered the untouched Japanese source through the restored original bank. The renderer cursor and rebuilt archive were injected for these focused tests, so normal NPC routing and the six alternate chapter jumps remain outside the runtime claim.

The `contextual_full_bank` compiler reserves 17 directly encoded non-Hangul records and nine protected source-glyph records, leaving 715 assignable records. The current artifact has 271 assignments; 268 occur in the current draft and three are retained from the preceding codepage, leaving 444 assignment slots. Direct one-byte Hangul encoding keeps the relocated compressed archive within the expanded-ROM allocation while preserving all untranslated entries exactly.

The EXE 1 [K] glyphs remain governed by the user-attested permission record. No documentary permission copy is stored in the workspace, and this full ROM is a local development artifact rather than a distributable release.
