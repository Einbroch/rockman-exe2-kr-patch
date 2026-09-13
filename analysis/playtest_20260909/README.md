# Normal-play checkpoint session (2026-09-09 onward)

- ROM: `EXE2_KR_playtest_20260909.gba`, SHA-256 `8d6ed5473404d2dcaf6056297324e86a47d88b4c999324eb40ab8a7a5e8ac11a`.
- Emulator: Mesen, SHA-256 `af60a18859e3253f09c8fd32f6b1c04637efbd98780f1427dd94d4629474f640`.
- Runner: `tools/run_natural_play_segment.py`. Always `--testRunner --noAudio`. Native CPU-execution callbacks create/load full savestates; no game RAM, dialogue, position, or event-flag injection.
- Each numbered segment contains its exact input timeline, screenshots, renderer observations, immutable `checkpoint.mss`, hashes and `result.json`. Only `completed: true` segments are resume points.
- Resume with `--load <segment>/checkpoint.mss`, a new `--out` directory, and controller actions `button:held_frames:released_frames`. Use 6 frames for reliable short presses across state loads. Directions can be held longer. Inputs are inspected through each returned screenshot, not inferred from command success.
- The runner rejects checkpoints whose ROM/emulator/checkpoint hashes do not match. Do not disable that check for a new patch. After any ROM fix, cold boot with an isolated battery save or independently establish a safe compatible field checkpoint.
- Mesen connector launch failed with a non-UTF-8 handshake for the Korean content path; this is a tool connection failure, not a reproduced game crash. The standalone CLI runner does not use that connector. A failed launch process was observed to have exited.
- User ROMs and pre-existing user saves have not been edited. This session has a unique ROM stem and its own emulator battery save (`portable/Saves/EXE2_KR_playtest_20260909.sav`). `012_saved/battery_classroom.sav` is a backup made after the game's save-completed message. That additional backup was made after the segment receipt; its hash is not yet in that segment's artifact map.

## Observed route

1. `001`–`008`: cold boot, New Game, opening, classroom introduction; former `00/163/8` crash dialogue naturally continues and returns to field.
2. `009`–`012`: open PET menu, select Save, confirm game save, return to field. Save menu and prompts remain Japanese (open UI-localization issue).
3. `013`: L-button hint now fits three lines on the natural map; approach and speak to Mayl.
4. `014`–`019`: Mayl conversation, move to the book boy, open PET explanation choice naturally. Question and both options fit.
5. `020`: right-hand decline branch; `021`–`023`: accept branch and PET explanations; `024`: independent B-cancel branch, then field return.
6. `025`–`028`: walk across classroom and initiate Dex conversation.
7. `029`–`033`: teacher arrival, camera movement and end-of-term classroom event. Continue from the highest completed segment after inspecting its final screenshot.

## Issue found and repair in progress (2026-09-10)

- `033_after_class/step_002.png` naturally renders the untranslated physical continuation of `00/164`: `熱斗くん、やっぱりー・・・`. The predecessor is `032_after_class/checkpoint.mss`; the immediate visual predecessor is `033_after_class/step_001.png`. Replay the segment's timeline for reproduction.
- Added protected development translation `translations/physical_continuation_00_164.tpl`: `넷토、 역시...`. Source is the immutable 24 bytes at `0x77A7F8`; existing source TPL and command structure are preserved.
- The initial candidate `exe2_rev1_semantic_translation_playtest_fix.gba` (`8f059807...`) silently omitted ASCII comma in TextPet. It is REJECTED, not a current testing ROM. It is kept as failure evidence. `verify_playtest_continuation_fix.py` caught the unmapped character.
- The v2 candidate uses the supported `、` glyph. The primary builder now verifies every authored literal in each translated physical continuation against actual compiled payload bytes. Unit tests cover unmapped punctuation, dropped whitespace and literal ordering.
- `034_battery_reload` cold-boots the original test ROM, selects Continue and returns to the original classroom save. Battery backup and live battery SHA-256 both equal `bccc38c8d92df3d447ce965d4555953213c31d2587d7b68268f7f021a52f601f`. Use that isolated battery for the fixed-ROM replay; do not load old-ROM mid-dialogue states.
- The GBA project retains its existing protected JSON/TPL development pipeline under create-kr-patch conventions. The generic gt-text TSV/80-row workflow is not being retrofitted into this one-dialogue GBA defect repair; no gt stage or final release gate is claimed complete.

No full-game pass is claimed. Reviewed opening/classroom pages have not shown a new overflow or crash so far. The newly observed Japanese continuation is under repair; title/menu/save UI is also unfinished. The original patch's deferred special-window/dynamic/over-capacity cases are still open.
