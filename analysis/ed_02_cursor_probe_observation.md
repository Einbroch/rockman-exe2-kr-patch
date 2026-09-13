# ED selector 0x02 runtime width observation

The selector `0x02` cursor probe used the same verified active dialogue entry
and placed its Korean marker at the third byte after `ED`.

The marker was not rendered; the following byte used the ordinary glyph path
and dialogue progression remained normal. This supports a three-byte stream
width for `ED:02` in this entry.

This result does not transfer to other `ED` selectors, identify command
meaning, establish state effects, or authorize byte changes. It is recorded as
`preserve_runtime_width_observed` only.

Machine-readable metadata: `ed_02_cursor_probe_observation.json`.
