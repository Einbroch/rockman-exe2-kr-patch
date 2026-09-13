# LZ77 archive 00/09 expanded-growth PoC

## Purpose

The in-place marker build proves the archive can be recompressed, but its
4,364-byte slot has no practical translation headroom. This companion PoC
tests a 16MB ROM layout with the modified archive relocated to the first byte
after the original 8MB image.

## Build result

- Input PoC ROM SHA-256: `6fbf895d2ce778e061e89b95aa092204b110162b2dc0854ea82e613a2a014b86`
- Output ROM SHA-256: `25a41bfb0c6aabd3c2bd30c07c06f157b3d77dc0a1ab5fed3f9867b309357509`
- Output: `poc/output/exe2_rev1_archive_00_09_entries_2_13_expanded_growth_poc.gba`
- Output size: 16,777,216 bytes (16MB)
- This is a local, non-distributable validation ROM.

| Item | Value |
| --- | --- |
| Original archive offset | `0x74A484` |
| Relocated archive offset | `0x800000` |
| Relocated GBA address | `0x08800000` |
| Archive pointer word | ROM offset `0x228A4` |
| Replacement compressed length | 4,369 bytes |
| Replacement decompressed length | 6,084 bytes |
| Edited entries | 2 and 13 |
| Marker length | 3 glyphs / 6 bytes per entry |
| Original compressed archive | Preserved byte-for-byte |
| Bytes changed inside original 8MB | 3 bytes, confined to the pointer word |

The relocated stream round-trips exactly through the GBA LZ77 codec. Its
254-entry table is monotonic and its final offset equals the decompressed
length after both insertions.

## Verification boundary

This build tests ROM-size expansion, pointer redirection, BIOS-LZ77 loading,
and multi-glyph growth together. It is not production-safe until the emulator
loads selector 00/09 from the expanded address, both state-observed entries
render the marker, and later entries remain reachable. Other archives still
use their original pointers and are not translated.
