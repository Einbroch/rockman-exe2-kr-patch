# Conservative control-code policy registry

`analysis/control_code_policy_registry.json` combines the verified control
facts into the rule set that future extractors and inserters must obey.

| Range / opcode | Current policy |
|---|---|
| `E5`, `E6` | Verified Korean glyph transport only. Each consumes one parameter byte; use only after a message boundary is independently proven. |
| `ED:00`, `ED:02` | Preserve with observed 3-byte stream width in one verified dialogue entry. Command meaning and state effect remain unknown. |
| `EE`, `F1`, `F7` | Preserve stateful. A parameter-to-dialogue-state transfer is statically observed; `F1` also changes window placement in the runtime probe. |
| `F9:00` | Preserve after a modified-frame runtime probe caused an invalid-address jump. Do not infer a general width or alter any F9 frame. |
| `FA:18`, `FA:1C` | Preserve with observed cursor behavior. The respective 4- and 2-byte cursor paths work on one verified dialogue screen, but command meaning remains unknown. |
| Other `E7..FF` | Blocked pending a complete control specification. |

No new `E7..FF` command frame is allowed in a Korean insertion. Existing
command frames retain their byte order and parameters. This policy does not
declare message boundaries or make any translation workspace entry buildable;
it only prevents an extractor or inserter from silently treating controls as
text.
