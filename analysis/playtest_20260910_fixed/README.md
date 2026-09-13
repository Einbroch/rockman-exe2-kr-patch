# Fixed-ROM normal-play replay

Current ROM: `EXE2_KR_playtest_20260910_fixed.gba`, identical to
`poc/output/exe2_rev1_semantic_translation_playtest_fix_v2.gba`.
SHA-256: `a648a984d5a112aaef3d67462ec3e6708aa6ad5acd7e31e53263af7247b6a27a`.

Mesen SHA-256: `af60a18859e3253f09c8fd32f6b1c04637efbd98780f1427dd94d4629474f640`.
All segments use `--noAudio` and normal controller input only. There are no game RAM or script writes.

## Verified route and fix

- Initial battery copied from `../playtest_20260909/012_saved/battery_classroom.sav`, hash `bccc38c8d92df3d447ce965d4555953213c31d2587d7b68268f7f021a52f601f`.
- `001_coldboot_continue`: cold boot new ROM and Continue from that isolated in-game save. No old-ROM savestate loaded.
- `002_route_dex`: replay observed movement route through the classroom; speak to Dex normally.
- `003`–`005`: replay teacher arrival/end-of-term event; `005_before_fixed_tail` is the new-ROM immediate predecessor checkpoint.
- `006_fixed_tail`: `00/164` terminal jump naturally displays `넷토、 역시...`, replacing the Japanese line found in `../playtest_20260909/033_after_class/step_002.png`.
- `007_after_fix_field`: confirm dialogue exit, player movement and save-menu entry.
- `008_saved_after_class`: game's save-completed message captured in `step_002.png`. Battery backup: `battery_after_class.sav`, hash `28b10f935edc8355466971cfeb86c8048a65bd4a848ee9ed2bca8e0bb10e453d`.
- `009_saved_coldboot`: cold boot and Continue again; after-class camera/NPC state restored, L-button hint responds normally.
- `010_resume_field`: close L-button hint and save a new-ROM field checkpoint. `011`–`017` revisit Dex's after-school conversation and reach its field return. `018`–`029` resolve repeated dialogue pages and walk to the school exit. `030`–`040` cross the school exterior and park to the city road. `041`–`049` inspect the terminal-area NPC and confirm its one-page line closes on A when started from a field checkpoint. `050`–`064` inspect the park, city access point and L-hint close behavior. `065`–`072` reach the house area and confirm the bus-stop NPC line in Korean. `073`–`084` enter the neighboring blue/white building and save an indoor checkpoint. `085`–`091` navigate the room and inspect the clock object; its Korean three-line description fits and closes normally. `092`–`095` trigger the home-entry NPC conversation and return to the room without a crash. `096`–`099` inspect the TV/picture object; its three-line Korean description fits and closes normally. `100`–`111` walk the living room/kitchen and repeat the mom/door interaction from fresh checkpoints; repeated one-page dialogue closes normally and the room remains stable. `112`–`127` revisit the PET/living-room object, test the mom interaction from several approach directions, and probe both room edges; no new text overflow, lockup, or crash was observed. `128`–`129` use the living-room stairs to transition back outside. `130`–`133` inspect the house-front delivery NPC through three Korean pages; all lines fit and close. `134`–`152` traverse the northern neighborhood and waterfront road, inspect the virus-busting NPC through three pages, and reach the map edge without a crash or malformed text. `153`–`161` probe the waterfront road and park edges; the route remains stable and returns to the neighborhood without a crash. `162`–`170` inspect the neighborhood shop frontage, its nearby NPC dialogue, and the decorative shop entrance; the one-page Korean line closes normally and the building does not falsely transition. `171`–`174` probe the street, pool and park-slide area; no new issue was found, so these redundant screenshots were moved to the recoverable `_archived_screenshots` area while their receipts and hashes remain validated. `175`–`176` recheck the street north/south boundaries with no new issue; their redundant screenshots were also archived. `177`–`184` probe the west/east neighborhood road, shop-side NPCs, and the large-building frontage; no new dialogue or transition issue was found, and all redundant screenshots were archived. `185`–`192` probe the large building, blue-roof building, pink house frontage, and map edges; no new dialogue, false transition, crash, or text issue was found, and redundant screenshots were archived. Latest checkpoint: `192_pink_house_edge/checkpoint.mss` at the neighborhood map edge.

## Resume

Run `tools/run_natural_play_segment.py` with this exact ROM, the recorded Mesen executable, `--load analysis/playtest_20260910_fixed/192_pink_house_edge/checkpoint.mss`, and a NEW segment output folder. The runner verifies ROM, emulator and checkpoint hashes. Never bypass its cross-ROM guard.

Screenshots from inspected no-issue segments may be moved to the recoverable `_archived_screenshots/` area in either playtest session; `tools/record_natural_play_qa.py` verifies their original hashes from the archive manifests. Dialogue/problem evidence stays in its segment directory. The prior sessions are now cleaned: 115 screenshots archived from `playtest_20260909` and 372 from `playtest_20260910_fixed`; 20 representative/problem screenshots remain in place.

For a later ROM build, use the backed-up in-game battery save and a new isolated ROM stem; do not automatically import this build's dialogue state.

This is partial natural-play QA, not a whole-game pass. Japanese menus/save prompts, 156 other untranslated physical continuations, 95 unresolved-reference formal entries, and deferred layout cases remain open. The old 20260905 distribution ZIP was not rebuilt in this session.
