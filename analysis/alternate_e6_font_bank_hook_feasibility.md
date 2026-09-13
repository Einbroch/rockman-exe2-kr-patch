# Alternate E6 font-bank hook feasibility

Metadata-only static design; no source text, glyphs, or executable patch bytes are included.

- Existing indexer hook span: `0x020D84`–`0x020D8C` (8 bytes)
- Alternate index range: 512–740
- Alternate records: 229
- Alternate bank bytes: 14656
- Proposed appended bank: `0x800000`–`0x803940`

The proposed hook selects the existing font base below index 512 and an adjusted appended-bank base at or above it. It is a feasibility design only: transport collisions, appended-ROM mapping, and trampoline behavior still require runtime proof.
