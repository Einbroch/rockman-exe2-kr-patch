# Non-intersecting structural candidate queue

`rev1_nonintersecting_candidate_queue.json` is a derived review queue from
the verified candidate workspace. It includes only exact-unique spans that do
not intersect any other distinct candidate span.

| Stage | Count |
| --- | ---: |
| Parent candidate entries | 10,360 |
| Exact-unique spans | 5,928 |
| Excluded intersecting spans | 1,742 |
| Queue entries | 4,186 |

The queue contains offsets, lengths, and hashes only; no source text or PC
assets are copied. Every entry remains `blocked_control_spec`, and the queue
explicitly forbids translation and reinsertion until the specific GBA message
boundary, source decoding, control preservation, and runtime reachability are
verified.

Generate it with `tools/build_nonintersecting_candidate_queue.py`. The tool
requires the parent workspace to remain an untouched, fully blocked candidate
set, validates every source hash against the verified Rev 1 ROM, and rejects
any overlap in its output.
