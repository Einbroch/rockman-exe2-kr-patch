# F1 / F3 / F8 / FA indirect-target audit

Target ROM SHA-256:
`1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.

The main CFG audit stops at register-indirect transfers. This follow-up resolves
such dispatchers without exporting their stream data. `0xF1` selects from two
target entries after aligning its parameter byte to a four-byte boundary.
`0xF3`, `0xF8`, and `0xFA` select through parameter-based word-offset tables.
Every resolved target is then subjected to the same bounded direct
control-flow audit.

## Local result

The initial F1/FA subset has 12 selected targets, of which three satisfy the local static-width rule (one direct
`r4` delta, every explored terminal returns, and no observed call or direct
`r4` overwrite):

| Opcode | Selector value | Direct local `r4` delta |
|---|---:|---:|
| `0xF1` | `0x04` | 3 |
| `0xFA` | `0x18` | 4 |
| `0xFA` | `0x1C` | 2 |

The remaining nine targets still have a local call, variable cursor result,
or direct `r4` overwrite. The metadata-only result is in
`analysis/font_indirect_handler_targets.json`.

## Additional F3 / F8 target tables

The same audit now resolves all 10 `F3` targets and all 5 `F8` targets. None
meet the strict local static-width rule: each has a local call, variable cursor
result, or direct `r4` overwrite on an explored path. `F3` and `F8` therefore
remain fully blocked; no runtime PoC is produced from their current static
evidence.

## Safety status

These values are static target-path candidates only. They do **not** name the
commands, prove which selector values occur in the verified message catalog,
or prove runtime state effects. Consequently, no translation candidate is
unblocked and no message byte is changed. The next verification is a controlled
emulator trace for reachable `0xF1`/`0xFA` selector cases.

The controlled `F1:04` runtime probe has now established one state effect:
the dialogue window changes placement. It also did not yield an unambiguous
glyph-placement observation. `F1` is therefore a preserve-only control, not a
candidate transport or spacing command. Its static cursor candidate remains
useful for reverse engineering, but is not a reinsertion rule.

The separate `FA:1C` runtime probe keeps the dialogue window in its original
placement and displays the E5 Korean glyph at the predicted next cursor
position. This supports the two-byte cursor observation for this selector in
the verified screen only; it does not establish FA's command meaning or make
it available for reinsertion.
