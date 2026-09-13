# 0xE7..0xFF control-handler local CFG audit

Target ROM SHA-256:
`1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.

`tools/trace_font_control_handler_cfg.py` starts at each of the 25 verified
indirect-table targets and follows only direct Thumb branches within a bounded
local span. It records terminal class and the directly observable `r4` delta.
It does not emit script bytes or a disassembly listing, and it deliberately
does not follow calls or register-indirect transfers.

## Result

All 25 opcodes remain unresolved for reinsertion. There are no local static
width candidates under the deliberately strict rule: every explored path must
return with one direct `r4` delta and must contain neither a call nor an `r4`
overwrite. This is an expected safety result, not a failed parse.

The audit distinguishes the blockers rather than treating `0xE7..0xFF` as a
fixed-width range:

| Observed local outcome | Affected opcode(s) | Translation policy now |
|---|---|---|
| Multiple directly observed return deltas | `0xEA`, `0xEB`, `0xED`, `0xF5`, `0xFF` | Preserve opcode and parameters; do not resize. |
| Register-indirect terminal transfer | `0xF1`, `0xF2`, `0xF3`, `0xF7`–`0xFB` | Block until the selected target and returned cursor behavior are verified. |
| Calls on the observed return path | Other entries with a return path | Do not infer width from the caller-local delta alone. |
| Direct `r4` overwrite seen on a return path | `0xE7`, `0xEC`, `0xEE`, `0xF0`, `0xF5`, `0xF6`, `0xFC`, `0xFD` | Treat the cursor result as unknown until runtime or callee analysis proves it. |

`0xED` retains its prior two-or-three-byte local branching result. The new CFG
audit also confirms that a single direct `r4` advance in another handler is
not sufficient evidence when a call or indirect transfer occurs.

## Scope and next evidence

This report is an implementation-boundary audit, not a command-name map. The
translation workspace therefore remains `blocked_control_spec` for every
candidate entry. The `0xF1`/`0xFA` register-indirect targets have now been
resolved statically in `analysis/font_indirect_handler_targets.md`; their
cursor effect still requires a controlled emulator trace before any workspace
status changes.

Machine-readable metadata is in `analysis/font_control_handler_cfg.json`.
