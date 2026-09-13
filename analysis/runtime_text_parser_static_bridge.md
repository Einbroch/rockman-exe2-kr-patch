# Runtime text parser and font-copy bridge

## Evidence boundary

- Original ROM SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- Static window: ARM Thumb code at CPU addresses `0x08020C40..0x08020E3F`
- Live counterpart: renderer write-breakpoint observation at frame `4421`, recorded in `runtime_gba_renderer_trace.md`
- This document contains code addresses and structural behavior only; it contains no extracted game text or glyph asset data.

## Confirmed parser contract

| Parser location | Behavior |
| --- | --- |
| `0x08020C6C` | Loads the current text-stream pointer from renderer-state offset `+0x24`. |
| `0x08020C6E..0x08020C86` | Dispatches control bytes at and above `0xE7` through a handler table. |
| `0x08020CA6..0x08020CBA` | Routes direct one-byte character codes to the glyph path and increments the stream pointer by one. |
| `0x08020CBC..0x08020CCC` | Handles E5-prefixed glyph codes and increments the stream pointer by two. |
| `0x08020CCE..0x08020CE0` | Handles E6-prefixed glyph codes and increments the stream pointer by two. |
| `0x08020CEA` | Writes the advanced pointer back to renderer-state offset `+0x24`. |

## Confirmed glyph path

| Code range | Behavior |
| --- | --- |
| `0x08020D84..0x08020D9C` | Converts the resolved glyph index into a font-record address and selects the active tile-buffer slot. |
| `0x08020D9E..0x08020DA8` | Copies exactly 64 bytes into the EWRAM tile buffer. |
| `0x08020DAA..0x08020DB2` | Advances the destination slot and returns to the parser. |

## Consequence for the patch design

The existing Korean font PoC exercises the renderer after a resolved glyph index is
available. A production patch additionally needs an independently observed source
text route: the owner of the renderer-state `+0x24` pointer, all consumers of that
route, and a relocation/repointing proof for edited blocks. Until that proof exists,
E5/E6 assignments remain limited to rendering PoCs.
