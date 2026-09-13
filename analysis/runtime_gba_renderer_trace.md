# GBA live renderer trace (PoC evidence)

## Scope

- Content: alternate E6 font-bank PoC, launched through emucap MesenCE host API 2
- ROM SHA-1: `E741C2FF9593B72AC3717E04E67CCBA228F22BBD`
- Observation: visible dialogue screen, frame 4421

## Observed transfer

An EWRAM write breakpoint covering offsets `0x4F90..0x5350` of `gbaExtWorkRam`
hit while a dialogue glyph was being produced.

| Field | Observed value |
| --- | --- |
| Executing PC | `0x08020DAA` (Thumb, post-copy index advance) |
| Link register | `0x08020CB3` |
| Source | `gbaPrgRom` address `0x08699BF0` |
| Destination | EWRAM address `0x02005090` |
| Copy extent at first hit | 64 bytes |
| Follow-on presentation path | EWRAM tile buffer to GBA VRAM through the general transfer helper at `0x08000A84` |

## Interpretation

This is live proof of the glyph transfer path used at the tested dialogue screen:
glyph data is selected from ROM, copied to the dialogue tile buffer in EWRAM, then
uploaded to VRAM. It does **not** establish a safe production Korean codepage or a
text-block reinsertion route; the current E5/E6 map remains a rendering-only PoC.

## Static reconciliation

The bounded Thumb listing confirms that the observed breakpoint lands immediately
after the 64-byte copy loop:

| Code range | Verified role |
| --- | --- |
| `0x08020D84..0x08020DA8` | Selects a 64-byte font record from the character index and copies it to the EWRAM tile buffer. |
| `0x08020DAA..0x08020DB2` | Advances the glyph-buffer index and returns the character index to the caller. |
| `0x08020C6C..0x08020CEC` | Reads the active text-stream pointer from renderer state offset `+0x24`, dispatches control codes, and advances it. |

Direct character codes advance the stream by one byte. E5 and E6 prefix forms
advance it by two bytes before their glyph index is passed to the font-copy routine.
This establishes the renderer-side byte-consumption contract only. It still does not
prove a safe source pointer table, relocation route, or production Korean encoding.
