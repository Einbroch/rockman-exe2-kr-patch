# Protected candidate control-byte footprint

Target ROM SHA-256:
`1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`.

`tools/audit_candidate_control_footprint.py` verifies the hash of every one
of the 242 protected candidate blocks before collecting only aggregate control
byte metadata. The ranges overlap, so the report supplies both an overlapping
block footprint and a merged physical-ROM count. No script bytes, candidate
identifiers, decoded source text, or assets are written.

## Coverage result

The protected blocks merge into 11 physical ROM ranges covering 256,623 bytes.
Every value from `0xE7` through `0xFF` occurs somewhere in this structural
coverage. This is **not** a decoded usage count: these are candidate ranges,
not parser-proven message boundaries, and shared/overlapping ranges would make
a naïve per-block count misleading.

`0xF1` occurs in 239 of the 242 overlapping block ranges and 5,612 times in
the merged physical coverage. That breadth means it must be treated as a
global preservation risk until individual parser boundaries are proven; it is
not evidence that there are 5,612 decoded F1 commands.

Machine-readable aggregate metadata is in
`analysis/candidate_control_footprint.json`.

## Updated control policy

The controlled `F1:04` runtime probe changes dialogue-window placement. The
dispatcher also writes its parameter into dialogue state before it reaches the
selected target. Therefore `F1` is now an explicit `preserve` control: retain
its original opcode, parameter, and order; do not use it for Korean text
encoding or spacing.

All other `E7..FF` values remain `blocked_control_spec`. Existing `E5`/`E6`
glyph prefixes remain the only verified Korean glyph transport in the current
PoCs; this does not yet make any full candidate entry editable.
