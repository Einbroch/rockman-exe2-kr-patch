# Runtime message-pointer call path (Rev 1)

The saved-state evidence identified `pc-jap-map-0023`, whose block begins at
GBA address `0x0877A298`.  This report adds a static execution-path check for
that exact address.

The state-handler dispatcher at ROM offset `0x0C841C` uses the Thumb address
table at `0x0C8428`.  Its third table entry selects the handler at `0x0C846A`.
At `0x0C8478`, that handler loads `0x0877A298` into `r0`, explicitly sets
`r1` to zero, then directly calls `0x020B60`.  The target begins with
`PUSH {r5, lr}` and at `0x020B9E` loads RAM address `0x0200A1B0`.

The bounded Thumb reconstruction now proves the initial consumption path.  The
callee preserves the caller's `r0` source-block base at renderer-state `+0x28`,
uses the caller's `r1` as an index into the block's 16-bit entry-offset table,
adds that offset to the preserved base, and writes the resolved entry start to
renderer-state `+0x24`.  The later parser routine reads and advances precisely
that `+0x24` pointer.  This upgrades block 0023 from a state association to a
verified, one-block source-to-parser route.

The proof remains deliberately bounded: it does not establish every caller of
the initializer, every block's pointer consumer, a safe global relocation plan,
or a production Korean encoding.  The byte-to-glyph mapping and control-code
grammar outside the direct/E5/E6 consumption contract remain unconfirmed.

The `ss1` payload provides an independent association, but not field names. At
the observed entry-pointer occurrence `0x2975C`, adjacent 32-bit words are the
block start `0x0877A298`, the entry start `0x0877A2AE`, and `0x0200A1B0` in
that order. This records a shared serialized-state context only; mGBA's state
layout and the semantic role of each word are still unverified.

The EWRAM address mapping and candidate pointer roots are recorded separately
in `runtime_memory_context.md` and `state_ewram_message_context_refs.json`.

## Independent block 0024 call sites

The nine-entry growth PoC's source block has a second, independent static
route into the same initializer.  Two state-handler paths load its block base
from the literal at ROM offset `0x0C86B8`, select entry `0` or entry `1` in
`r1`, and directly call `0x08020B60`:

| Call instruction | Selected entry | Result |
| --- | --- | --- |
| `0x080C8572` | `0` | Resolves the block's first offset-table entry into parser state. |
| `0x080C85E4` | `1` | Resolves the block's second offset-table entry into parser state. |

This confirms the relocation literal used by the block 0024 PoC is a real
text-initializer consumer, not a data-only reference.  It does not prove that
entries 2 through 8 are reached by these two call sites, nor expand the
one-block proof into a global reinsertion guarantee.

Regenerate the machine-readable evidence with:

```powershell
python tools\trace_runtime_message_ingest_path.py `
  --rom "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba" `
  --output analysis\runtime_message_ingest_path.json
```
