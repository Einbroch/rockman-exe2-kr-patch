#!/usr/bin/env python3
"""Inspect a PNG-backed mGBA screenshot or savestate without decoding state RAM."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import zlib
from pathlib import Path


PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
GBA_RAW_STATE_BYTES = 0x61000
GBA_STATE_REGIONS = (
    (0x00400, 0x00800, "io", 0x04000000),
    (0x00800, 0x00C00, "palette", 0x05000000),
    (0x00C00, 0x01000, "oam", 0x07000000),
    (0x01000, 0x19000, "vram", 0x06000000),
    (0x19000, 0x21000, "iwram", 0x03000000),
    (0x21000, 0x61000, "ewram", 0x02000000),
)
IWRAM_STATE_START = 0x19000
IWRAM_BASE = 0x03000000


def automatic_catalog_fragment_matches(
    state_payload: bytes, rom: bytes, records: list[dict[str, object]], minimum: int
) -> list[dict[str, object]]:
    """Find one longest exact EWRAM fragment per catalog block without serializing bytes.

    A four-byte source stride bounds index size. A minimum of 35 bytes ensures
    an exact run has at least one stride-aligned 32-byte seed.
    """
    if minimum < 35:
        raise ValueError("automatic fragment minimum must be at least 35 bytes")
    seed_bytes = 32
    index: dict[bytes, list[tuple[str, int, int, int]]] = {}
    entry_boundaries: dict[str, list[int] | None] = {}
    for record in records:
        source_offset = record.get("source_rom_offset")
        length = record.get("byte_length")
        if not isinstance(source_offset, int) or not isinstance(length, int) or length < minimum:
            continue
        raw = rom[source_offset : source_offset + length]
        table = None
        if len(raw) >= 4:
            table_bytes = struct.unpack_from("<H", raw)[0]
            if 4 <= table_bytes <= len(raw) and table_bytes % 2 == 0:
                candidate = [struct.unpack_from("<H", raw, offset)[0] for offset in range(0, table_bytes, 2)]
                if candidate[0] == table_bytes and all(left <= right for left, right in zip(candidate, candidate[1:])):
                    table = candidate
        entry_boundaries[str(record["id"])] = table
        for relative_offset in range(0, len(raw) - seed_bytes + 1, 4):
            index.setdefault(raw[relative_offset : relative_offset + seed_bytes], []).append(
                (str(record["id"]), source_offset, relative_offset, length)
            )
    best: dict[str, dict[str, object]] = {}
    for state_offset in range(0x21000, len(state_payload) - seed_bytes + 1):
        candidates = index.get(state_payload[state_offset : state_offset + seed_bytes])
        if not candidates:
            continue
        for record_id, source_offset, relative_offset, source_length in candidates:
            matched = seed_bytes
            while (
                matched < source_length - relative_offset
                and state_offset + matched < len(state_payload)
                and state_payload[state_offset + matched] == rom[source_offset + relative_offset + matched]
            ):
                matched += 1
            if matched < minimum:
                continue
            previous = best.get(record_id)
            if previous is not None and int(previous["matched_byte_length"]) >= matched:
                continue
            fragment = state_payload[state_offset : state_offset + matched]
            table_entry_index = None
            table = entry_boundaries[record_id]
            if table is not None:
                for index_in_table, (start, end) in enumerate(zip(table, table[1:])):
                    if start <= relative_offset and relative_offset + matched <= end:
                        table_entry_index = index_in_table
                        break
            best[record_id] = {
                "id": record_id,
                "source_relative_offset": relative_offset,
                "matched_byte_length": matched,
                "matched_fragment_sha256": hashlib.sha256(fragment).hexdigest(),
                "state_payload_offset": state_offset,
                "state_memory_mapping": state_offset_mapping(state_offset),
                "table_entry_index": table_entry_index,
                "fragment_is_wholly_within_declared_table_entry": table_entry_index is not None,
            }
    return [best[record_id] for record_id in sorted(best)]


def state_offset_mapping(offset: int) -> dict[str, int | str] | None:
    for start, end, region, base_address in GBA_STATE_REGIONS:
        if start <= offset < end:
            return {
                "region": region,
                "region_offset": offset - start,
                "emulated_address": base_address + offset - start,
            }
    return None


def pointer_neighborhood_words(payload: bytes, pointer_offset: int) -> list[dict[str, int]]:
    """Return adjacent words only; never serialize arbitrary state bytes."""
    words = []
    for relative_word in range(-1, 4):
        offset = pointer_offset + relative_word * 4
        if 0 <= offset and offset + 4 <= len(payload):
            words.append(
                {
                    "state_payload_offset": offset,
                    "little_endian_u32": struct.unpack_from("<I", payload, offset)[0],
                    "state_memory_mapping": state_offset_mapping(offset),
                }
            )
    return words


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--rom", type=Path, help="ROM used for optional candidate-block matching")
    parser.add_argument("--catalog", type=Path, help="candidate catalog produced by catalog_message_blocks.py")
    parser.add_argument(
        "--fragment-block-id",
        help="optional catalog block id for bounded 32-byte state-fragment matching",
    )
    parser.add_argument(
        "--auto-fragment-minimum",
        type=int,
        help="automatically find one exact EWRAM fragment per catalog block; minimum is 35 bytes",
    )
    args = parser.parse_args()
    data = args.input.read_bytes()
    if not data.startswith(PNG_SIGNATURE):
        raise ValueError("input is not a PNG-backed mGBA snapshot")
    position = len(PNG_SIGNATURE)
    chunks = []
    state_chunk_data = None
    width = height = None
    while position < len(data):
        if position + 12 > len(data):
            raise ValueError("truncated PNG chunk")
        size = struct.unpack_from(">I", data, position)[0]
        chunk_type = data[position + 4 : position + 8].decode("ascii", "replace")
        end = position + 12 + size
        if end > len(data):
            raise ValueError("PNG chunk exceeds file length")
        if chunk_type == "IHDR" and size == 13:
            width, height = struct.unpack_from(">II", data, position + 8)
        if chunk_type == "gbAs":
            state_chunk_data = data[position + 8 : position + 8 + size]
        chunks.append({"file_offset": position, "type": chunk_type, "data_bytes": size})
        position = end
        if chunk_type == "IEND":
            break
    if position != len(data):
        raise ValueError("unexpected trailing bytes after IEND")
    report = {
        "schema_version": 1,
        "input": {
            "filename": args.input.name,
            "byte_length": len(data),
            "sha256": hashlib.sha256(data).hexdigest(),
        },
        "image": {"width": width, "height": height},
        "png_chunks": chunks,
        "state_payload_present": any(chunk["type"] not in {"IHDR", "IDAT", "IEND", "PLTE", "tRNS", "pHYs", "tEXt", "zTXt", "iTXt"} for chunk in chunks),
    }
    if (args.rom is None) != (args.catalog is None):
        raise ValueError("--rom and --catalog must be provided together")
    if args.rom and args.catalog:
        if state_chunk_data is None:
            raise ValueError("no gbAs state chunk found")
        state_payload = zlib.decompress(state_chunk_data)
        rom = args.rom.read_bytes()
        catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
        matches = []
        pointer_matches = []
        subentry_pointer_matches = []
        fragment_matches = []
        automatic_fragment_matches = []
        # A short message can be copied into EWRAM after its source pointer has
        # been consumed.  This deliberately scopes the search to one declared
        # block so the evidence pass stays bounded on large, overlapping catalogs.
        if args.fragment_block_id:
            fragment_record = next(
                (record for record in catalog["records"] if record.get("id") == args.fragment_block_id),
                None,
            )
            if fragment_record is None:
                raise ValueError("--fragment-block-id is absent from the catalog")
            source_offset = fragment_record["source_rom_offset"]
            length = fragment_record["byte_length"]
            if source_offset is None or length < 32:
                raise ValueError("--fragment-block-id has no source range of at least 32 bytes")
            raw = rom[source_offset : source_offset + length]
            fragment_index: dict[bytes, list[int]] = {}
            for relative_offset in range(0, len(raw) - 31):
                fragment_index.setdefault(raw[relative_offset : relative_offset + 32], []).append(relative_offset)
            for state_offset in range(0x21000, len(state_payload) - 31):
                for source_relative_offset in fragment_index.get(state_payload[state_offset : state_offset + 32], []):
                    fragment_matches.append(
                        {
                            "id": args.fragment_block_id,
                            "source_relative_offset": source_relative_offset,
                            "matched_byte_length": 32,
                            "matched_fragment_sha256": hashlib.sha256(
                                state_payload[state_offset : state_offset + 32]
                            ).hexdigest(),
                            "state_payload_offset": state_offset,
                            "state_memory_mapping": state_offset_mapping(state_offset),
                        }
                    )
        if args.auto_fragment_minimum is not None:
            automatic_fragment_matches = automatic_catalog_fragment_matches(
                state_payload, rom, catalog["records"], args.auto_fragment_minimum
            )
        for record in catalog["records"]:
            source_offset = record["source_rom_offset"]
            length = record["byte_length"]
            if source_offset is None or length < 32:
                continue
            raw = rom[source_offset : source_offset + length]
            pointer_count = state_payload.count(struct.pack("<I", record["source_rom_address"]))
            if pointer_count:
                needle = struct.pack("<I", record["source_rom_address"])
                pointer_matches.append(
                    {
                        "id": record["id"],
                        "source_pointer_le_occurrence_count": pointer_count,
                        "state_payload_offsets": [position for position in range(len(state_payload)) if state_payload.startswith(needle, position)][:4],
                    }
                )
            first_match = state_payload.find(raw)
            if first_match >= 0:
                positions = []
                position = first_match
                while position >= 0 and len(positions) < 4:
                    positions.append(position)
                    position = state_payload.find(raw, position + 1)
                matches.append(
                    {
                        "id": record["id"],
                        "matched_byte_length": length,
                        "state_payload_offsets": positions,
                        "source_pointer_le_occurrence_count": pointer_count,
                    }
                )
            for subentry in record.get("subentries", []):
                subentry_pointer_count = state_payload.count(struct.pack("<I", subentry["source_rom_address"]))
                if subentry_pointer_count:
                    needle = struct.pack("<I", subentry["source_rom_address"])
                    offsets = [position for position in range(len(state_payload)) if state_payload.startswith(needle, position)][:4]
                    subentry_pointer_matches.append(
                        {
                            "id": subentry["id"],
                            "source_pointer_le_occurrence_count": subentry_pointer_count,
                            "state_payload_offsets": offsets,
                            "pointer_neighborhood_words": [
                                pointer_neighborhood_words(state_payload, position) for position in offsets
                            ],
                        }
                    )
        report["gba_state_payload"] = {
            "compression": "zlib",
            "uncompressed_bytes": len(state_payload),
            "sha256": hashlib.sha256(state_payload).hexdigest(),
            "raw_state_version_magic": struct.unpack_from("<I", state_payload, 0)[0],
            "known_gba_memory_layout": (
                "mGBA GBA raw-state layout" if len(state_payload) == GBA_RAW_STATE_BYTES else None
            ),
            "exact_candidate_block_matches_minimum_32_bytes": matches,
            "candidate_source_pointer_occurrences": pointer_matches,
            "candidate_subentry_pointer_occurrences": subentry_pointer_matches,
            "candidate_catalog_fragment_matches_minimum_32_bytes": fragment_matches,
        "automatic_catalog_fragment_matches": automatic_fragment_matches,
            "interpretation_notice": (
                "A match proves only that candidate bytes occur in the serialized state payload. "
                "Adjacent words are recorded only as pointer-value context; they do not establish "
                "field names or renderer consumption. For a 0x61000-byte GBA raw state, memory "
                "addresses are mapped from mGBA's documented fixed regions; this identifies the "
                "emulated RAM location but not game-structure semantics."
            ),
        }
        if len(state_payload) == GBA_RAW_STATE_BYTES:
            gprs = [struct.unpack_from("<I", state_payload, 0x20 + index * 4)[0] for index in range(16)]
            cpsr = struct.unpack_from("<I", state_payload, 0x60)[0]
            report["gba_state_payload"]["cpu_snapshot"] = {
                "gprs": {f"r{index}": value for index, value in enumerate(gprs)},
                "cpsr": cpsr,
                "thumb_state_bit_set": bool(cpsr & (1 << 5)),
                "interpretation_notice": (
                    "This is the CPU register snapshot serialized by mGBA. The stored r15 value "
                    "is reported without inferring an instruction boundary or pipeline adjustment."
                ),
            }
            stored_r15 = gprs[15]
            if args.rom and IWRAM_BASE <= stored_r15 < IWRAM_BASE + 0x8000:
                state_offset = IWRAM_STATE_START + stored_r15 - IWRAM_BASE
                sample = state_payload[state_offset : state_offset + 32]
                origins = []
                position = rom.find(sample) if len(sample) == 32 else -1
                while position >= 0 and len(origins) < 8:
                    origins.append(position)
                    position = rom.find(sample, position + 1)
                report["gba_state_payload"]["stored_r15_iwram_code_candidate"] = {
                    "iwram_address": stored_r15,
                    "state_payload_offset": state_offset,
                    "sample_byte_length": len(sample),
                    "sample_sha256": hashlib.sha256(sample).hexdigest(),
                    "exact_rom_origin_offsets": origins,
                    "interpretation_notice": (
                        "An exact match means only that this IWRAM byte window also occurs in ROM. "
                        "It does not establish copy direction, function identity, or current instruction boundary."
                    ),
                }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
