# ED selector 0x00 runtime width observation

The dedicated cursor probe was run on the verified active dialogue entry for
the Rev 1 ROM. Its Korean marker was placed at the third byte after opcode
`ED` with selector `0x00`.

The marker was not rendered; the following byte rendered through the ordinary
glyph path and dialogue progression remained normal. This is runtime evidence
that this exact `ED:00` occurrence consumes three stream bytes.

The result is selector- and entry-local. It does not identify the command,
show whether its third byte changes state, establish the width of any other
`ED` selector, or permit rewrites. The policy is therefore
`preserve_runtime_width_observed` rather than editable.

Machine-readable metadata: `ed_00_cursor_probe_observation.json`.
