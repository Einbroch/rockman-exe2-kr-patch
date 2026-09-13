#!/usr/bin/env python3
"""Resolve the verified renderer-state pointers from an mGBA GBA savestate.

The report is metadata-only: pointer values, hashes, offsets, and catalog IDs.
It never serializes source message bytes.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from pathlib import Path


PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
GBA_RAW_STATE_BYTES = 0x61000
EWRAM_STATE_START = 0x21000
EWRAM_BASE = 0x02000000
EWRAM_BYTES = 0x40000
ROM_BASE = 0x08000000
FIELDS = {
    "current_text_pointer": 0x24,
    "source_block_base": 0x28,
    "current_entry_end": 0x2C,
}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def state_payload(path: Path) -> bytes:
    data = path.read_bytes()
    if not data.startswith(PNG_SIGNATURE):
        raise ValueError("input is not a PNG-backed mGBA state")
    position = len(PNG_SIGNATURE)
    encoded = None
    while position + 12 <= len(data):
        size = struct.unpack_from(">I", data, position)[0]
        kind = data[position + 4 : position + 8]
        end = position + 12 + size
        if end > len(data):
            raise ValueError("truncated PNG chunk")
        if kind == b"gbAs":
            encoded = data[position + 8 : position + 8 + size]
        position = end
        if kind == b"IEND":
            break
    if encoded is None:
        raise ValueError("savestate has no gbAs payload")
    payload = zlib.decompress(encoded)
    if len(payload) != GBA_RAW_STATE_BYTES:
        raise ValueError("unexpected mGBA GBA raw-state length")
    return payload


def catalog_owner(address: int, records: list[dict[str, object]]) -> dict[str, object] | None:
    for record in records:
        start = record.get("source_rom_address")
        length = record.get("byte_length")
        if isinstance(start, int) and isinstance(length, int) and start <= address < start + length:
            return {"id": record.get("id"), "relative_offset": address - start}
    return None


def ewram_window_origins(pointer: int, payload: bytes, rom: bytes, records: list[dict[str, object]]) -> dict[str, object] | None:
    if not EWRAM_BASE <= pointer < EWRAM_BASE + EWRAM_BYTES:
        return None
    region_offset = pointer - EWRAM_BASE
    state_offset = EWRAM_STATE_START + region_offset
    sample = payload[state_offset : state_offset + 32]
    if len(sample) != 32:
        return None
    origins = []
    position = rom.find(sample)
    while position >= 0 and len(origins) < 16:
        origins.append(position)
        position = rom.find(sample, position + 1)
    owners = []
    for origin in origins:
        owner = catalog_owner(ROM_BASE + origin, records)
        if owner is not None and owner not in owners:
            owners.append(owner)
    return {
        "ewram_region_offset": region_offset,
        "sample_byte_length": len(sample),
        "sample_sha256": sha256(sample),
        "exact_rom_origin_offsets": origins,
        "catalog_owners": owners,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    payload = state_payload(args.input)
    rom = args.rom.read_bytes()
    catalog_bytes = args.catalog.read_bytes()
    catalog = json.loads(catalog_bytes)
    records = catalog.get("records")
    if not isinstance(records, list):
        raise ValueError("catalog has no records")
    r10 = struct.unpack_from("<I", payload, 0x20 + 10 * 4)[0]
    if not ROM_BASE <= r10 + 0x48 <= ROM_BASE + len(rom) - 4:
        raise ValueError("saved r10 does not resolve the renderer-state global")
    renderer_global_rom_offset = r10 + 0x48 - ROM_BASE
    renderer_state_address = struct.unpack_from("<I", rom, renderer_global_rom_offset)[0]
    if not EWRAM_BASE <= renderer_state_address < EWRAM_BASE + EWRAM_BYTES:
        raise ValueError("renderer-state global does not point into EWRAM")
    state_offset = EWRAM_STATE_START + renderer_state_address - EWRAM_BASE
    fields = {}
    for name, relative in FIELDS.items():
        pointer = struct.unpack_from("<I", payload, state_offset + relative)[0]
        fields[name] = {
            "value": pointer,
            "rom_catalog_owner": catalog_owner(pointer, records),
            "ewram_window": ewram_window_origins(pointer, payload, rom, records),
        }
    report = {
        "schema_version": 1,
        "kind": "verified_renderer_state_pointer_snapshot",
        "input": {"filename": args.input.name, "sha256": sha256(args.input.read_bytes())},
        "state_payload": {"sha256": sha256(payload), "byte_length": len(payload)},
        "rom": {"filename": args.rom.name, "sha256": sha256(rom)},
        "catalog": {"filename": args.catalog.name, "sha256": sha256(catalog_bytes)},
        "saved_r10": r10,
        "renderer_global_rom_offset": renderer_global_rom_offset,
        "renderer_state_address": renderer_state_address,
        "fields": fields,
        "interpretation_notice": (
            "The state address and field offsets come from the verified renderer path. A catalog owner or exact "
            "32-byte ROM origin links the serialized pointer value to a source range, but does not alone prove "
            "that every visible glyph was consumed after the snapshot boundary."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
