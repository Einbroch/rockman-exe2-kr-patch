#!/usr/bin/env python3
"""Prepare an explicit mGBA renderer probe for one relocated raw archive entry."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from pathlib import Path

from inspect_renderer_state_pointer import EWRAM_BASE, EWRAM_STATE_START, GBA_RAW_STATE_BYTES, ROM_BASE
from patch_mgba_state_archive_pool import archive_table, chunks, encode_png
from gba_lz77 import decompress


POOL_ADDRESS = 0x02038800
def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--build-manifest", type=Path, required=True)
    parser.add_argument("--selector", required=True)
    parser.add_argument("--entry", type=int, required=True)
    parser.add_argument("--successor-bytes", type=int, default=256)
    parser.add_argument("--output-state", type=Path, required=True)
    parser.add_argument("--report", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    for path in (args.state, args.rom, args.build_manifest):
        if not path.is_file():
            raise FileNotFoundError(path)
    for path in (args.output_state, args.report):
        if path.exists() and not args.force:
            raise FileExistsError(path)

    state_bytes = args.state.read_bytes()
    rom = args.rom.read_bytes()
    manifest_bytes = args.build_manifest.read_bytes()
    manifest = json.loads(manifest_bytes)
    if sha256(rom) != manifest.get("output", {}).get("sha256"):
        raise ValueError("build manifest does not identify the probe ROM")
    if args.successor_bytes < 0:
        raise ValueError("successor byte count cannot be negative")

    matches = [item for item in manifest["archives"] if item["selector"] == args.selector]
    if len(matches) != 1:
        raise ValueError("selector must identify exactly one relocated archive")
    archive = matches[0]
    start = int(archive["relocated_rom_offset"])
    length = int(archive["replacement_stored_byte_length"])
    stored = rom[start:start + length]
    if sha256(stored) != archive["replacement_stored_sha256"]:
        raise ValueError("relocated raw archive hash mismatch")
    core_length = int(archive["replacement_decompressed_byte_length"])
    if archive["storage"] == "lz77":
        raw, consumed = decompress(rom, start)
        if consumed != length:
            raise ValueError("compressed archive extent mismatch")
    elif archive["storage"] == "raw":
        raw = stored[:core_length]
    else:
        raise ValueError("unsupported archive storage")
    if sha256(raw) != archive["replacement_decompressed_sha256"]:
        raise ValueError("archive core hash mismatch")
    table = archive_table(raw)
    if not 0 <= args.entry < len(table) - 1:
        raise ValueError("entry is outside the archive table")

    items = chunks(state_bytes)
    gbas_indices = [index for index, item in enumerate(items) if item[0] == b"gbAs"]
    if len(gbas_indices) != 1:
        raise ValueError("state must contain exactly one gbAs chunk")
    gbas_index = gbas_indices[0]
    payload = bytearray(zlib.decompress(items[gbas_index][1]))
    if len(payload) != GBA_RAW_STATE_BYTES:
        raise ValueError("unexpected mGBA state payload length")

    saved_r10 = struct.unpack_from("<I", payload, 0x20 + 10 * 4)[0]
    global_offset = saved_r10 + 0x48 - ROM_BASE
    if not 0 <= global_offset <= len(rom) - 4:
        raise ValueError("saved r10 does not resolve the renderer global")
    renderer_address = struct.unpack_from("<I", rom, global_offset)[0]
    if not EWRAM_BASE <= renderer_address < EWRAM_BASE + 0x40000:
        raise ValueError("renderer state is outside EWRAM")
    renderer_offset = EWRAM_STATE_START + renderer_address - EWRAM_BASE
    pool_offset = EWRAM_STATE_START + POOL_ADDRESS - EWRAM_BASE
    probe_window = (raw if archive["storage"] == "lz77" else stored) + rom[start + length:start + length + args.successor_bytes]
    expected_window_length = (len(raw) if archive["storage"] == "lz77" else length) + args.successor_bytes
    if len(probe_window) != expected_window_length:
        raise ValueError("probe window extends past the ROM")
    if pool_offset + len(probe_window) > EWRAM_STATE_START + 0x40000:
        raise ValueError("raw archive probe window does not fit in EWRAM")

    before = {
        "current_pointer": struct.unpack_from("<I", payload, renderer_offset + 0x24)[0],
        "base_pointer": struct.unpack_from("<I", payload, renderer_offset + 0x28)[0],
        "entry_start_pointer": struct.unpack_from("<I", payload, renderer_offset + 0x2C)[0],
    }
    payload[pool_offset:pool_offset + len(probe_window)] = probe_window
    entry_address = POOL_ADDRESS + table[args.entry]
    payload[renderer_offset + 0x00] = 1
    payload[renderer_offset + 0x01] = args.entry
    payload[renderer_offset + 0x02] = 0
    payload[renderer_offset + 0x04] = 0
    payload[renderer_offset + 0x05] = 0
    payload[renderer_offset + 0x06] = 0
    payload[renderer_offset + 0x08] = 2
    payload[renderer_offset + 0x09] = 0
    payload[renderer_offset + 0x0E] = 0
    payload[renderer_offset + 0x0F] = 0
    payload[renderer_offset + 0x11] = 0
    payload[renderer_offset + 0x12] = 0
    payload[renderer_offset + 0x14] = 0
    struct.pack_into("<I", payload, renderer_offset + 0x24, entry_address)
    struct.pack_into("<I", payload, renderer_offset + 0x28, POOL_ADDRESS)
    struct.pack_into("<I", payload, renderer_offset + 0x2C, entry_address)

    items[gbas_index] = (b"gbAs", zlib.compress(bytes(payload), 9))
    output = encode_png(items)
    args.output_state.parent.mkdir(parents=True, exist_ok=True)
    args.output_state.write_bytes(output)
    report = {
        "schema_version": 1,
        "kind": "intervened_mgba_raw_archive_entry_probe",
        "evidence_scope": "renderer-only; does not prove normal gameplay loading or event prerequisites",
        "input_state": {"filename": args.state.name, "sha256": sha256(state_bytes)},
        "rom": {"filename": args.rom.name, "sha256": sha256(rom)},
        "build_manifest": {"filename": args.build_manifest.name, "sha256": sha256(manifest_bytes)},
        "archive": {
            "selector": args.selector,
            "entry": args.entry,
            "relocated_rom_offset": start,
            "raw_core_byte_length": core_length,
            "raw_core_sha256": sha256(raw),
            "stored_byte_length": length,
            "stored_sha256": sha256(stored),
            "successor_byte_length": args.successor_bytes,
            "probe_window_sha256": sha256(probe_window),
            "entry_relative_start": table[args.entry],
            "entry_relative_end": table[args.entry + 1],
        },
        "intervention": {
            "renderer_state_address": f"0x{renderer_address:08X}",
            "ewram_pool_address": f"0x{POOL_ADDRESS:08X}",
            "entry_address": f"0x{entry_address:08X}",
            "pointers_before": before,
        },
        "output_state": {"filename": args.output_state.name, "sha256": sha256(output)},
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report["intervention"], indent=2))


if __name__ == "__main__":
    main()
