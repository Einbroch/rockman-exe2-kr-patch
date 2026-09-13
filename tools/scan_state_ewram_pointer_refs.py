#!/usr/bin/env python3
"""Find EWRAM words in an mGBA PNG savestate that point into a target range.

Only addresses and 32-bit pointer values are reported.  No arbitrary RAM or
script bytes are emitted, and a hit is not treated as a semantic field name.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from pathlib import Path


PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
EWRAM_STATE_START = 0x21000
EWRAM_STATE_END = 0x61000
EWRAM_BASE = 0x02000000


def load_state_payload(path: Path) -> bytes:
    data = path.read_bytes()
    if not data.startswith(PNG_SIGNATURE):
        raise ValueError("input is not a PNG-backed mGBA savestate")
    position = len(PNG_SIGNATURE)
    while position + 12 <= len(data):
        length = struct.unpack_from(">I", data, position)[0]
        kind = data[position + 4 : position + 8]
        data_start = position + 8
        data_end = data_start + length
        if data_end + 4 > len(data):
            raise ValueError("truncated PNG chunk")
        if kind == b"gbAs":
            return zlib.decompress(data[data_start:data_end])
        position = data_end + 4
    raise ValueError("no gbAs chunk found")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--target-start", type=lambda value: int(value, 0), required=True)
    parser.add_argument("--target-end", type=lambda value: int(value, 0), required=True,
                        help="exclusive EWRAM address")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if not EWRAM_BASE <= args.target_start < args.target_end <= EWRAM_BASE + 0x40000:
        raise ValueError("target range must lie within 0x02000000-0x0203FFFF")

    payload = load_state_payload(args.input)
    if len(payload) != EWRAM_STATE_END:
        raise ValueError(f"unexpected raw GBA state length: {len(payload):#x}")
    references = []
    for state_offset in range(EWRAM_STATE_START, EWRAM_STATE_END, 4):
        value = struct.unpack_from("<I", payload, state_offset)[0]
        if args.target_start <= value < args.target_end:
            references.append(
                {
                    "holder_ewram_address": EWRAM_BASE + state_offset - EWRAM_STATE_START,
                    "points_to_ewram_address": value,
                }
            )
    report = {
        "schema_version": 1,
        "input": {
            "filename": args.input.name,
            "sha256": hashlib.sha256(args.input.read_bytes()).hexdigest(),
            "raw_state_bytes": len(payload),
        },
        "target_ewram_range": [args.target_start, args.target_end],
        "references": references,
        "interpretation_notice": (
            "This identifies EWRAM words whose numeric value points into the selected address range. "
            "It does not establish allocation boundaries, pointer ownership, reachability, or code use."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
