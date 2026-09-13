# Rev 1 candidate-span integrity audit

## Verified input

- ROM SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- Workspace: `translations/rev1_message_candidates.json`
- Workspace SHA-256: `bed12cd291cd593b2efc809a0fe190d2c94efa24bd7003dad5876a89adf13803`

All 10,360 recorded candidate spans are in range and their stored source
hashes match the verified Rev 1 ROM.

## Span topology

| Measure | Count |
| --- | ---: |
| Candidate entries | 10,360 |
| Exact unique source spans | 5,928 |
| Duplicate entries | 4,432 |
| Unique spans that intersect another distinct span | 1,742 |
| Distinct containment relationships | 1,458 |
| Distinct partial-overlap relationships | 223 |

Only 4,186 exact-unique spans have no intersection with another distinct
candidate span. This is a deduplication fact, not proof that those spans are
independent display strings or safe insertion sites.

## Consequence

The 10,360-entry workspace remains a structural candidate set. It must not be
treated as a one-entry-per-string translation list: translating every entry
would duplicate work, and writing any intersecting range could corrupt a
larger message structure.

All candidates remain `blocked_control_spec`. A future canonical translation
workspace must be created only after the GBA control grammar and runtime
reachability establish true message boundaries; it should merge exact
duplicates and exclude or explicitly model partial/containment overlaps.

## Reproduction

Run `tools/audit_message_candidate_spans.py` against the verified Rev 1 ROM
and the candidate workspace. The machine-readable result is
`message_candidate_span_audit.json`. The tool reads no PC message payload and
does not export source text.
