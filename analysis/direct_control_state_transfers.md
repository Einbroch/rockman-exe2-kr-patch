# Direct parameter-to-state control markers

Target ROM SHA-256:
`1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.

`tools/find_direct_control_state_transfers.py` inspects only the first 16
bytes of every verified `0xE7..0xFF` handler. It records a marker when a byte
loaded from `r4` is subsequently written through `r5` within that same entry
window. The result contains no script data, disassembly, or assets.

| Opcode | Message parameter offset(s) | `r5` byte offset(s) | Policy |
|---|---|---|---|
| `0xEE` | 2, 3 | 26, 27 | Preserve; parameter-to-state transfer is directly observed. |
| `0xF1` | 1 | 23 | Preserve; runtime also confirms a dialogue-window state effect. |
| `0xF7` | 1 | 19 | Preserve; parameter-to-state transfer is directly observed. |

The offsets identify code-level data flow only. They do not name the state
fields or fully define command semantics. Other commands remain blocked unless
their own boundaries and effects are independently verified.

Machine-readable metadata: `analysis/direct_control_state_transfers.json`.
