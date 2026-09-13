# BG0 font byte-dispatch candidate

Target ROM SHA-256:
`1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.

At ROM offset `0x020C6C`, the examined Thumb routine loads a pointer into
`r4`; at `0x020C6E` it loads a byte through that pointer into `r1`. The later
dispatch first compares `r1` with `0xE7`. Values at or above that threshold
are reduced by `0xE7`, scaled by four, looked up in an indirect jump table,
and branched to. Values below the threshold enter the glyph path, which then
compares `r1` with `0xE5` and `0xE6`.

| Path | Index passed to `0x020D84` | `r4` advance |
|---|---|---:|
| Default | Current byte | 1 |
| `0xE5` | Following byte plus `0xE5` | 2 |
| `0xE6` | Following byte plus `0xE6` plus `0xFF` | 2 |

All three branches directly call `0x020D84`, the routine already observed to
compute raw font-record addresses from `0x086973B0` using a six-bit shift.

Consequently, `0xE5` and `0xE6` are extension prefixes inside the glyph range,
whereas `0xE7..0xFF` is the candidate command-dispatch range. Individual
command semantics in that latter range are not yet assigned.

## Command-table boundary audit

`tools/analyze_font_control_dispatch_table.py` verifies the jump-table literal
at `0x020F54`, the table at `0x020F8C`, and all 25 entries for
`0xE7..0xFF`. Every entry is an in-ROM Thumb target. Its report deliberately
records only addresses and bounded instruction syntax, because neighboring
handlers are closely packed and a fixed byte window cannot establish an exact
function boundary.

Four individually examined handlers show why command spans must remain
per-opcode rules rather than a shared fixed width:

| Opcode | Verified local structure | Safe conclusion |
|---|---|---|
| `0xED` | Reads `r4+1`; local branches advance `r4` by two or three before returning. | Variable-width command candidate. |
| `0xF1` | Reads `r4+1`, then branches through a selected function pointer. | Its local frame does not establish a final consumed width. |
| `0xF9` | Reads fields at `r4+2` and `r4+3`, then advances `r4` by four before returning. | Four-byte command candidate. |
| `0xFA` | Reads `r4+1`, then branches through a selected function pointer. | Its local frame does not establish a final consumed width. |

These are static handler facts, not command names or confirmed runtime
semantics. The `0xF1`/`0xFA` selected targets have since been resolved as
bounded static paths, but selector reachability and state effects still
require a runtime trace before any reinsertion policy is set.

The active-state screen/entry correlation independently shows that the two
unmatched 8x16 records are associated with two identical opaque two-byte gaps.
This agrees with the `0xE5` extension path. It is still not a runtime
breakpoint trace: reachability from the exact active entry and the semantics of
all remaining commands require a second state or debugger observation.

The reports contain offsets, arithmetic, hashes, and counts only; no script
bytes, glyphs, palettes, or screenshots are stored.

## Local control-flow audit

`tools/trace_font_control_handler_cfg.py` now traces direct Thumb branches
from every `0xE7..0xFF` table entry while deliberately stopping at calls and
register-indirect transfers. Its strict result has no width candidates: all
25 entries remain blocked for reinsertion because each reaches a call,
indirect transfer, variable local delta, or direct `r4` overwrite on an
explored path. The detailed classification is recorded in
`analysis/font_control_handler_cfg.md` and the metadata-only JSON companion.

Runtime evidence now classifies `0xF1` selector `0x04` as dialogue-stateful:
it changes window placement. Preserve `0xF1` command frames verbatim; do not
repurpose them for Korean text transport. See
`analysis/candidate_control_footprint.md` for the protected-candidate
footprint and policy boundary.

The direct entry audit also identifies parameter-to-dialogue-state transfers
for `0xEE` and `0xF7`; both are preserve-only alongside `0xF1`. See
`analysis/direct_control_state_transfers.md`.
