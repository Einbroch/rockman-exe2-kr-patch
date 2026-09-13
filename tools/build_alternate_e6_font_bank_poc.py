#!/usr/bin/env python3
"""Build a non-distributable alternate-E6-font-bank Korean rendering PoC."""
from __future__ import annotations

import argparse, hashlib, json, struct
from pathlib import Path

from build_korean_glyph_poc import FONT_BASE_OFFSET, RECORD_BYTES, encode_4bpp, make_mask, write_preview

ROM_BASE = 0x08000000
HOOK = 0x020D84
CONTINUATION = 0x020D8C
BANK = 0x800000
FIRST = 512
LAST = 740
TRAMPOLINE = BANK + (LAST - FIRST + 1) * RECORD_BYTES
BLOCK_TARGET = 0x804000
ROM_SIZE = 0x1000000


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def table(block: bytes) -> list[int]:
    width = struct.unpack_from("<H", block)[0]
    if width < 4 or width % 2 or width > len(block):
        raise ValueError("current relocated block has no valid offset table")
    values = [struct.unpack_from("<H", block, offset)[0] for offset in range(0, width, 2)]
    if values[0] != width or any(a > b for a, b in zip(values, values[1:])):
        raise ValueError("current relocated block table is invalid")
    return values


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--expected-input-sha256", required=True)
    parser.add_argument("--prior-manifest", type=Path, required=True)
    parser.add_argument("--state-report", type=Path, required=True)
    parser.add_argument("--literal-audit", type=Path, required=True)
    parser.add_argument("--font", type=Path, required=True)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--preview-dir", type=Path, required=True)
    parser.add_argument("--font-size", type=int, default=16)
    parser.add_argument("--entry-index", type=int, default=17)
    parser.add_argument("--relative-offset", type=int, default=2)
    args = parser.parse_args()
    if args.output_rom.exists(): raise FileExistsError("output ROM already exists")
    original = args.rom.read_bytes()
    if len(original) != BANK or sha256(original).lower() != args.expected_input_sha256.lower():
        raise ValueError("input must be the declared 8 MiB chained PoC base")
    if not args.font.is_file(): raise ValueError("font file not found")
    prior = json.loads(args.prior_manifest.read_text(encoding="utf-8"))
    if prior.get("output", {}).get("sha256") != sha256(original):
        raise ValueError("prior manifest does not attest to the input ROM")
    previous = next(item for item in prior["expected_writes"] if item["kind"].startswith("relocated_"))
    if previous.get("block_id") != "pc-jap-map-0067": raise ValueError("prior manifest is not block 0067")
    old_target, old_length = int(previous["target_rom_offset"]), int(previous["target_byte_length"])
    old_pointer = ROM_BASE + old_target
    audit = json.loads(args.literal_audit.read_text(encoding="utf-8"))
    audit_row = next(row for row in audit["blocks_with_direct_pc_relative_literal_load"] if row["id"] == "pc-jap-map-0067")
    literal_offsets = sorted({int(ref["literal_offset"]) for ref in audit_row["literal_load_references"]})
    if any(struct.unpack_from("<I", original, offset)[0] != old_pointer for offset in literal_offsets):
        raise ValueError("0067 literal no longer names the prior relocated target")
    state = json.loads(args.state_report.read_text(encoding="utf-8"))
    automatic = state.get("gba_state_payload", {}).get("automatic_catalog_fragment_matches", [])
    if not any(row.get("id") == "pc-jap-map-0067" and row.get("table_entry_index") == args.entry_index and row.get("matched_byte_length", 0) >= 35 for row in automatic):
        raise ValueError("state report lacks a qualifying block-0067 entry fragment")
    block = bytearray(original[old_target:old_target + old_length])
    offsets = table(block)
    entry, relative = args.entry_index, args.relative_offset
    insert = bytes((0xE6, 0x1C, 0xE6, 0x1D, 0xE6, 0x1E))  # indices 513..515
    position = offsets[entry] + relative
    if not offsets[entry] < position < offsets[entry + 1] or not block[position - 1] < 0xE5 <= block[position]:
        raise ValueError("test insertion is not a direct-glyph/control boundary in the current block")
    block[position:position] = insert
    for index in range(entry + 1, len(offsets)):
        offsets[index] += len(insert)
        struct.pack_into("<H", block, index * 2, offsets[index])
    if BLOCK_TARGET + len(block) > ROM_SIZE: raise AssertionError("extended target exceeds output ROM")
    output = bytearray(original) + bytearray(b"\xFF" * (ROM_SIZE - len(original)))
    bank_source = original[FONT_BASE_OFFSET + FIRST * RECORD_BYTES:FONT_BASE_OFFSET + (LAST + 1) * RECORD_BYTES]
    if len(bank_source) != (LAST - FIRST + 1) * RECORD_BYTES: raise AssertionError("font bank source range invalid")
    output[BANK:BANK + len(bank_source)] = bank_source
    glyphs = [("가", 513), ("나", 514), ("다", 515)]
    args.preview_dir.mkdir(parents=True, exist_ok=True)
    font_writes = []
    for character, index in glyphs:
        glyph = encode_4bpp(make_mask(args.font, character, args.font_size))
        dest = BANK + (index - FIRST) * RECORD_BYTES
        output[dest:dest + RECORD_BYTES] = glyph
        write_preview(make_mask(args.font, character, args.font_size), args.preview_dir / f"glyph_U+{ord(character):04X}.png")
        font_writes.append({"unicode_code_point": f"U+{ord(character):04X}", "alternate_font_record_index": index, "rom_offset": dest, "byte_length": RECORD_BYTES, "replacement_sha256": sha256(glyph)})
    adjusted_base = ROM_BASE + BANK - FIRST * RECORD_BYTES
    trampoline = struct.pack("<11H", 0x4688, 0x0A4A, 0x2A00, 0xD001, 0x4803, 0xE000, 0x4803, 0x0189, 0x1840, 0x4B03, 0x4718) + b"\x00\x00" + struct.pack("<III", adjusted_base, 0x086973B0, ROM_BASE + CONTINUATION + 1)
    hook = struct.pack("<HHI", 0x4B00, 0x4718, ROM_BASE + TRAMPOLINE + 1)
    if len(trampoline) != 36 or len(hook) != 8: raise AssertionError("unexpected hook encoding size")
    output[TRAMPOLINE:TRAMPOLINE + len(trampoline)] = trampoline
    output[BLOCK_TARGET:BLOCK_TARGET + len(block)] = block
    output[HOOK:HOOK + len(hook)] = hook
    for offset in literal_offsets: struct.pack_into("<I", output, offset, ROM_BASE + BLOCK_TARGET)
    allowed_prefix = [range(HOOK, HOOK + len(hook)), *[range(offset, offset + 4) for offset in literal_offsets]]
    changed_prefix = [offset for offset, (before, after) in enumerate(zip(original, output[:len(original)], strict=True)) if before != after]
    if not changed_prefix or not all(any(offset in region for region in allowed_prefix) for offset in changed_prefix):
        raise AssertionError("prefix diff escapes planned hook/pointer updates")
    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.output_rom.write_bytes(output)
    manifest = {
        "schema_version": 1, "kind": "non_distributable_alternate_e6_font_bank_rendering_poc",
        "input": {"filename": args.rom.name, "sha256": sha256(original), "byte_length": len(original)},
        "state_evidence": {"filename": args.state_report.name, "sha256": sha256(args.state_report.read_bytes()), "block_id": "pc-jap-map-0067", "entry_index": entry},
        "prior_manifest": {"filename": args.prior_manifest.name, "sha256": sha256(args.prior_manifest.read_bytes())},
        "literal_audit": {"filename": args.literal_audit.name, "sha256": sha256(args.literal_audit.read_bytes()), "literal_word_rom_offsets": literal_offsets},
        "output_rom_byte_length": len(output),
        "expected_writes": [
            {"kind":"indexer_trampoline_hook", "hook_rom_offset":HOOK, "hook_byte_length":len(hook), "trampoline_rom_offset":TRAMPOLINE, "trampoline_byte_length":len(trampoline), "continuation_rom_offset":CONTINUATION},
            {"kind":"alternate_e6_font_bank", "index_range":[FIRST,LAST], "rom_offset":BANK, "byte_length":len(bank_source), "font_writes":font_writes},
            {"kind":"relocated_block_0067_with_e6_marker", "source_current_target_rom_offset":old_target, "source_current_byte_length":old_length, "target_rom_offset":BLOCK_TARGET, "target_byte_length":len(block), "inserted_glyph_stream_byte_length":len(insert)},
            {"kind":"block_pointer_literals", "literal_word_rom_offsets":literal_offsets, "replacement_pointer":f"{ROM_BASE + BLOCK_TARGET:08X}"},
        ],
        "output": {"filename":args.output_rom.name, "sha256":sha256(bytes(output))},
        "limitations": ["This tests an alternate E6 bank, one hook, and one observed block only.", "It does not establish full-ROM expansion compatibility, font-token collision safety, or a distributable Korean patch."],
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

if __name__ == "__main__": main()
