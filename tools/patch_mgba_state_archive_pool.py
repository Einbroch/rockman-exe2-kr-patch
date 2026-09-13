#!/usr/bin/env python3
"""Prepare an mGBA state that resumes at a patched archive insertion point.

The source state must already be paused with the renderer cursor exactly at the
declared insertion boundary.  The tool replaces only the decompressed EWRAM
archive pool and relocates the renderer's current/start pointers according to
the changed offset table.  It does not claim an unmodified gameplay route.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from pathlib import Path

from gba_lz77 import decompress
from inspect_renderer_state_pointer import (
    EWRAM_BASE,
    EWRAM_STATE_START,
    GBA_RAW_STATE_BYTES,
    PNG_SIGNATURE,
    ROM_BASE,
)


POOL_ADDRESS = 0x02038800
CURRENT_POINTER_OFFSET = 0x24
BASE_POINTER_OFFSET = 0x28
ENTRY_START_POINTER_OFFSET = 0x2C


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def chunks(data: bytes) -> list[tuple[bytes, bytes]]:
    if not data.startswith(PNG_SIGNATURE):
        raise ValueError("input is not a PNG-backed mGBA state")
    result = []
    position = len(PNG_SIGNATURE)
    while position + 12 <= len(data):
        size = struct.unpack_from(">I", data, position)[0]
        kind = data[position + 4 : position + 8]
        end = position + 12 + size
        if end > len(data):
            raise ValueError("truncated PNG chunk")
        result.append((kind, data[position + 8 : position + 8 + size]))
        position = end
        if kind == b"IEND":
            break
    if not result or result[-1][0] != b"IEND":
        raise ValueError("PNG has no IEND chunk")
    return result


def encode_png(items: list[tuple[bytes, bytes]]) -> bytes:
    output = bytearray(PNG_SIGNATURE)
    for kind, payload in items:
        output.extend(struct.pack(">I", len(payload)))
        output.extend(kind)
        output.extend(payload)
        output.extend(struct.pack(">I", zlib.crc32(kind + payload) & 0xFFFFFFFF))
    return bytes(output)


def archive_table(raw: bytes) -> list[int]:
    table_bytes = struct.unpack_from("<H", raw)[0]
    if table_bytes < 4 or table_bytes % 2 or table_bytes > len(raw):
        raise ValueError("invalid archive table length")
    table = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, table_bytes, 2)]
    if table[0] != table_bytes or any(left > right for left, right in zip(table, table[1:])):
        raise ValueError("invalid archive offsets")
    return table


def rom_u32(rom: bytes, address: int) -> int:
    offset = address - ROM_BASE
    if not 0 <= offset <= len(rom) - 4:
        raise ValueError(f"ROM address outside input: 0x{address:08X}")
    return struct.unpack_from("<I", rom, offset)[0]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--base-rom", type=Path, required=True)
    parser.add_argument("--patched-rom", type=Path, required=True)
    parser.add_argument("--archive-manifest", type=Path, required=True)
    parser.add_argument("--entry", type=int, required=True)
    parser.add_argument("--output-state", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    for output in (args.output_state, args.manifest):
        if output.exists() and not args.force:
            raise FileExistsError(f"output already exists: {output} (pass --force to replace it)")

    state_bytes = args.state.read_bytes()
    items = chunks(state_bytes)
    gbas_indices = [index for index, item in enumerate(items) if item[0] == b"gbAs"]
    if len(gbas_indices) != 1:
        raise ValueError("state must contain exactly one gbAs chunk")
    gbas_index = gbas_indices[0]
    payload = bytearray(zlib.decompress(items[gbas_index][1]))
    if len(payload) != GBA_RAW_STATE_BYTES:
        raise ValueError("unexpected mGBA GBA raw-state length")

    base_rom = args.base_rom.read_bytes()
    patched_rom = args.patched_rom.read_bytes()
    archive_manifest = json.loads(args.archive_manifest.read_text(encoding="utf-8"))
    if sha256(patched_rom) != archive_manifest["output"]["sha256"]:
        raise ValueError("patched ROM does not match archive manifest")
    archive = archive_manifest["archive"]
    base_raw, _ = decompress(base_rom, int(archive["source_rom_offset"]))
    patched_raw, _ = decompress(patched_rom, int(archive["relocation"]["target_rom_offset"]))
    base_table = archive_table(base_raw)
    patched_table = archive_table(patched_raw)
    if len(base_table) != len(patched_table):
        raise AssertionError("archive entry count changed")

    edits = {int(edit["entry_index"]): edit for edit in archive_manifest["edits"]}
    if args.entry not in edits:
        raise ValueError("selected entry is not declared in the archive manifest")
    edit = edits[args.entry]
    relative = int(edit["relative_offset"])
    if not 0 <= args.entry < len(base_table) - 1:
        raise ValueError("entry index outside archive")

    pool_state_offset = EWRAM_STATE_START + POOL_ADDRESS - EWRAM_BASE
    observed_pool = bytes(payload[pool_state_offset : pool_state_offset + len(base_raw)])
    if observed_pool != base_raw:
        raise ValueError("source state EWRAM pool does not match the original archive")

    saved_r10 = struct.unpack_from("<I", payload, 0x20 + 10 * 4)[0]
    renderer_global_rom_offset = saved_r10 + 0x48 - ROM_BASE
    renderer_state_address = struct.unpack_from("<I", base_rom, renderer_global_rom_offset)[0]
    if not EWRAM_BASE <= renderer_state_address < EWRAM_BASE + 0x40000:
        raise ValueError("renderer state address is outside EWRAM")
    renderer_state_offset = EWRAM_STATE_START + renderer_state_address - EWRAM_BASE
    current_pointer = struct.unpack_from("<I", payload, renderer_state_offset + CURRENT_POINTER_OFFSET)[0]
    base_pointer = struct.unpack_from("<I", payload, renderer_state_offset + BASE_POINTER_OFFSET)[0]
    entry_start_pointer = struct.unpack_from("<I", payload, renderer_state_offset + ENTRY_START_POINTER_OFFSET)[0]
    expected_current = POOL_ADDRESS + base_table[args.entry] + relative
    expected_start = POOL_ADDRESS + base_table[args.entry]
    if base_pointer != POOL_ADDRESS or current_pointer != expected_current or entry_start_pointer != expected_start:
        raise ValueError(
            "source state is not paused at the declared insertion boundary: "
            f"current=0x{current_pointer:08X}, start=0x{entry_start_pointer:08X}"
        )

    payload[pool_state_offset : pool_state_offset + len(patched_raw)] = patched_raw
    patched_current = POOL_ADDRESS + patched_table[args.entry] + relative
    patched_start = POOL_ADDRESS + patched_table[args.entry]
    struct.pack_into("<I", payload, renderer_state_offset + CURRENT_POINTER_OFFSET, patched_current)
    struct.pack_into("<I", payload, renderer_state_offset + ENTRY_START_POINTER_OFFSET, patched_start)
    if bytes(payload[pool_state_offset : pool_state_offset + len(patched_raw)]) != patched_raw:
        raise AssertionError("patched pool verification failed")

    encoded = zlib.compress(bytes(payload), 9)
    items[gbas_index] = (b"gbAs", encoded)
    output_state = encode_png(items)
    args.output_state.parent.mkdir(parents=True, exist_ok=True)
    args.output_state.write_bytes(output_state)

    report = {
        "schema_version": 1,
        "kind": "intervened_mgba_archive_render_state",
        "input": {"filename": args.state.name, "sha256": sha256(state_bytes)},
        "base_rom": {"filename": args.base_rom.name, "sha256": sha256(base_rom)},
        "patched_rom": {"filename": args.patched_rom.name, "sha256": sha256(patched_rom)},
        "intervention": {
            "ewram_pool_address": f"0x{POOL_ADDRESS:08X}",
            "original_pool_sha256": sha256(base_raw),
            "replacement_pool_sha256": sha256(patched_raw),
            "replacement_pool_byte_length": len(patched_raw),
            "renderer_state_address": f"0x{renderer_state_address:08X}",
            "entry_index": args.entry,
            "insertion_relative_offset": relative,
            "current_pointer_before": f"0x{current_pointer:08X}",
            "current_pointer_after": f"0x{patched_current:08X}",
            "entry_start_before": f"0x{entry_start_pointer:08X}",
            "entry_start_after": f"0x{patched_start:08X}",
        },
        "output": {"filename": args.output_state.name, "sha256": sha256(output_state)},
        "evidence_boundary": (
            "This state intervention tests renderer consumption from the exact patched archive bytes at an "
            "already observed insertion boundary. It does not replace the separate proof that normal gameplay "
            "loads the relocated archive from ROM."
        ),
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report["intervention"], ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
