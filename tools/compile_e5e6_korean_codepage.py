#!/usr/bin/env python3
"""Compile a deterministic Hangul-to-existing-E5/E6 font-index code page.

This creates a mapping artifact only. It does not modify a ROM, write glyphs,
or treat a mapping as proof that the target text scope is safe to translate.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


DIRECT_LAST = 0xE4
E5_FIRST = 0xE5
E5_LAST = 0x1E4
E6_FIRST = 0x1E5
E6_LAST = 0x2E4  # Verified static endpoint; runtime probes confirm index 740.


def is_hangul_syllable(character: str) -> bool:
    return 0xAC00 <= ord(character) <= 0xD7A3


def encode_index(index: int) -> list[int]:
    if 0 <= index <= DIRECT_LAST:
        return [index]
    if E5_FIRST <= index <= E5_LAST:
        return [0xE5, index - E5_FIRST]
    if E6_FIRST <= index <= E6_LAST:
        return [0xE6, index - E6_FIRST]
    raise ValueError(f"index outside the declared code-page range: {index:#x}")


def load_policy(path: Path) -> tuple[dict[str, object], str]:
    data = path.read_bytes()
    policy = json.loads(data)
    if policy.get("target_rom_sha256") != "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8":
        raise ValueError("policy does not identify the supported Rev 1 ROM")
    prefixes = {item.get("opcode"): item for item in policy.get("glyph_prefixes", [])}
    for opcode, expected_formula in ((0xE5, "0xE5 + parameter"), (0xE6, "0x1E5 + parameter")):
        entry = prefixes.get(opcode)
        if entry is None or entry.get("policy") != "verified_glyph_transport_only":
            raise ValueError(f"policy does not permit glyph prefix {opcode:#x}")
        if entry.get("stream_byte_count") != 2 or entry.get("font_record_index_formula") != expected_formula:
            raise ValueError(f"policy glyph prefix {opcode:#x} does not match the verified mapping")
    if policy.get("build_rule", {}).get("allow_new_E7_to_FF_command_frames") is not False:
        raise ValueError("policy does not forbid new high control command frames")
    return policy, hashlib.sha256(data).hexdigest()


def load_candidate_unobserved_indices(path: Path) -> tuple[list[int], str]:
    data = path.read_bytes()
    audit = json.loads(data)
    if audit.get("scope", {}).get("rom_sha256") != "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8":
        raise ValueError("reference audit does not identify the supported Rev 1 ROM")
    observations = audit.get("glyph_prefix_raw_pair_observations")
    if not isinstance(observations, dict):
        raise ValueError("reference audit does not provide E5/E6 observations")
    candidates: list[int] = []
    for key, first, last in (("e5", E5_FIRST, E5_LAST), ("e6", E6_FIRST, E6_LAST)):
        entry = observations.get(key)
        if not isinstance(entry, dict) or entry.get("record_index_range") != [first, last]:
            raise ValueError(f"reference audit has an invalid {key} index range")
        indices = entry.get("no_raw_pair_observed_record_indices")
        if not isinstance(indices, list) or not all(isinstance(index, int) and first <= index <= last for index in indices):
            raise ValueError(f"reference audit has invalid {key} unobserved indices")
        candidates.extend(indices)
    return sorted(set(candidates)), hashlib.sha256(data).hexdigest()


def load_catalog_unobserved_indices(path: Path) -> tuple[list[int], str]:
    data = path.read_bytes()
    audit = json.loads(data)
    if audit.get("kind") != "catalog_scoped_e5e6_raw_pair_screen":
        raise ValueError("catalog screen has an unexpected kind")
    source = audit.get("input")
    summary = audit.get("summary")
    if not isinstance(source, dict) or source.get("sha256") != "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8":
        raise ValueError("catalog screen does not identify the supported Rev 1 ROM")
    if not isinstance(summary, dict):
        raise ValueError("catalog screen has no summary")
    indices = summary.get("no_catalog_record_raw_pair_observed_record_indices")
    if not isinstance(indices, list) or not all(isinstance(index, int) and E5_FIRST <= index <= E6_LAST for index in indices):
        raise ValueError("catalog screen has invalid candidate indices")
    return sorted(set(indices)), hashlib.sha256(data).hexdigest()


def load_context_reserved_indices(path: Path) -> tuple[list[int], str, dict[str, object]]:
    data = path.read_bytes()
    draft = json.loads(data)
    if draft.get("kind") not in {
        "archive_translation_draft",
        "non_distributable_state_observed_archive_translation_draft",
    }:
        raise ValueError("context draft has an unexpected kind")
    direct_indices: set[int] = set()
    source_glyph_indices: set[int] = set()
    for entry in draft.get("entries", []):
        for segment in entry.get("replacement_segments", []):
            if "direct_hex" in segment:
                values = bytes.fromhex(segment["direct_hex"])
                if any(value > DIRECT_LAST for value in values):
                    raise ValueError(
                        f"entry {entry.get('entry_index')} direct_hex contains a non-direct byte"
                    )
                direct_indices.update(values)
            elif "source_glyph_hex" in segment:
                values = bytes.fromhex(segment["source_glyph_hex"])
                if not values or len(values) % 2:
                    raise ValueError(
                        f"entry {entry.get('entry_index')} source_glyph_hex has invalid length"
                    )
                for offset in range(0, len(values), 2):
                    prefix, parameter = values[offset:offset + 2]
                    if prefix == 0xE5:
                        source_glyph_indices.add(E5_FIRST + parameter)
                    elif prefix == 0xE6:
                        source_glyph_indices.add(E6_FIRST + parameter)
                    else:
                        raise ValueError(
                            f"entry {entry.get('entry_index')} source_glyph_hex has invalid prefix"
                        )
    reserved = sorted(direct_indices | source_glyph_indices)
    details = {
        "draft_filename": path.name,
        "draft_sha256": hashlib.sha256(data).hexdigest(),
        "direct_record_indices": sorted(direct_indices),
        "source_glyph_record_indices": sorted(source_glyph_indices),
        "combined_reserved_record_count": len(reserved),
    }
    return reserved, hashlib.sha256(data).hexdigest(), details


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True, help="UTF-8 Korean translation sample or corpus")
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--policy", type=Path, required=True)
    parser.add_argument(
        "--base-codepage",
        type=Path,
        help="Existing codepage whose character assignments must remain unchanged",
    )
    parser.add_argument("--audit", type=Path, help="E5/E6 reference audit required by candidate_unobserved_overlay")
    parser.add_argument("--catalog-screen", type=Path, help="catalog E5/E6 screen required by candidate_catalog_unobserved_overlay")
    parser.add_argument(
        "--context-draft",
        type=Path,
        help="structured translated scope used to reserve non-Hangul glyph records in contextual_full_bank mode",
    )
    parser.add_argument(
        "--mode",
        choices=("overlay", "full_candidate_bank", "candidate_unobserved_overlay", "candidate_catalog_unobserved_overlay", "contextual_full_bank"),
        default="overlay",
        help="overlay preserves direct indices; candidate modes skip screened E5/E6 candidates; full_candidate_bank does not preserve direct indices",
    )
    args = parser.parse_args()
    _, policy_sha256 = load_policy(args.policy)
    text = args.input.read_text(encoding="utf-8")
    characters = {character for character in text if is_hangul_syllable(character)}
    placement_evidence: dict[str, object] | None = None
    context_reservation: dict[str, object] | None = None
    if args.mode == "overlay":
        first_index, last_index = E5_FIRST, E6_LAST
        assignable_indices = list(range(first_index, last_index + 1))
    elif args.mode in ("candidate_unobserved_overlay", "candidate_catalog_unobserved_overlay"):
        if args.audit is None:
            raise ValueError("candidate overlay modes require --audit")
        assignable_indices, audit_sha256 = load_candidate_unobserved_indices(args.audit)
        catalog_screen_sha256: str | None = None
        if args.mode == "candidate_catalog_unobserved_overlay":
            if args.catalog_screen is None:
                raise ValueError("candidate_catalog_unobserved_overlay requires --catalog-screen")
            catalog_indices, catalog_screen_sha256 = load_catalog_unobserved_indices(args.catalog_screen)
            assignable_indices = sorted(set(assignable_indices).intersection(catalog_indices))
        if not assignable_indices:
            raise ValueError("combined candidate screens contain no eligible E5/E6 indices")
        first_index, last_index = assignable_indices[0], assignable_indices[-1]
        placement_evidence = {
            "audit_filename": args.audit.name,
            "audit_sha256": audit_sha256,
            "selection": "E5/E6 indices with no raw prefix pair observed in the structural candidate audit",
            "safety_conclusion": "not established",
        }
        if catalog_screen_sha256 is not None:
            placement_evidence.update({
                "catalog_screen_filename": args.catalog_screen.name,
                "catalog_screen_sha256": catalog_screen_sha256,
                "selection": "intersection of structural-audit and 427-block catalog raw-pair non-observation",
            })
    elif args.mode == "contextual_full_bank":
        if args.context_draft is None:
            raise ValueError("contextual_full_bank requires --context-draft")
        reserved_indices, _, context_reservation = load_context_reserved_indices(args.context_draft)
        first_index, last_index = 0, E6_LAST
        assignable_indices = [
            index for index in range(first_index, last_index + 1)
            if index not in set(reserved_indices)
        ]
        placement_evidence = {
            "selection": "full verified 0..740 transport minus non-Hangul records used by the declared translated context",
            "safety_conclusion": "requires the independently verified renderer-cursor contextual font-bank hook",
        }
    else:
        first_index, last_index = 0, E6_LAST
        assignable_indices = list(range(first_index, last_index + 1))
    fixed_entries: dict[str, dict[str, object]] = {}
    base_codepage_metadata: dict[str, object] | None = None
    if args.base_codepage is not None:
        base_bytes = args.base_codepage.read_bytes()
        base = json.loads(base_bytes)
        if base.get("kind") != "provisional_korean_codepage" or base.get("mode") != args.mode:
            raise ValueError("base codepage kind or mode does not match this build")
        if base.get("policy", {}).get("sha256") != policy_sha256:
            raise ValueError("base codepage policy does not match this build")
        used_indices: set[int] = set()
        for entry in base.get("entries", []):
            character = entry.get("character")
            index = entry.get("font_record_index")
            encoded = entry.get("encoded_bytes")
            if not isinstance(character, str) or len(character) != 1 or not is_hangul_syllable(character):
                raise ValueError("base codepage has an invalid Hangul character")
            if not isinstance(index, int) or index not in assignable_indices or encoded != encode_index(index):
                raise ValueError(f"base codepage has an invalid assignment for {character}")
            if character in fixed_entries or index in used_indices:
                raise ValueError("base codepage has duplicate characters or font indices")
            fixed_entries[character] = {
                "unicode_code_point": f"U+{ord(character):04X}",
                "character": character,
                "font_record_index": index,
                "encoded_bytes": encode_index(index),
            }
            used_indices.add(index)
        characters.update(fixed_entries)
        base_codepage_metadata = {
            "filename": args.base_codepage.name,
            "sha256": hashlib.sha256(base_bytes).hexdigest(),
            "preserved_assignment_count": len(fixed_entries),
        }
    characters = sorted(characters, key=ord)
    capacity = len(assignable_indices)
    if len(characters) > capacity:
        raise ValueError(
            f"Hangul repertoire has {len(characters)} distinct syllables, exceeding {args.mode} capacity {capacity}"
        )
    entries = []
    remaining_indices = iter(index for index in assignable_indices if index not in {
        int(entry["font_record_index"]) for entry in fixed_entries.values()
    })
    for character in characters:
        if character in fixed_entries:
            entries.append(fixed_entries[character])
            continue
        index = next(remaining_indices)
        entries.append({
            "unicode_code_point": f"U+{ord(character):04X}",
            "character": character,
            "font_record_index": index,
            "encoded_bytes": encode_index(index),
        })
    report = {
        "schema_version": 1,
        "kind": "provisional_korean_codepage",
        "input": {"filename": args.input.name, "character_count": len(text)},
        "base_codepage": base_codepage_metadata,
        "policy": {"filename": args.policy.name, "sha256": policy_sha256},
        "mode": args.mode,
        "reserved_original_direct_index_range": [0, DIRECT_LAST] if args.mode in ("overlay", "candidate_unobserved_overlay", "candidate_catalog_unobserved_overlay") else None,
        "font_record_index_range": [first_index, last_index],
        "assignable_font_record_index_count": len(assignable_indices),
        "capacity": capacity,
        "distinct_hangul_syllable_count": len(entries),
        "remaining_capacity": capacity - len(entries),
        "entries": entries,
        "placement_evidence": placement_evidence,
        "context_reservation": context_reservation,
        "limitations": [
            "Only precomposed Hangul syllables are assigned; punctuation, Latin text, and control tokens stay outside this mapping.",
            "overlay mode is the only mode compatible with untranslated direct-index Japanese text.",
            "candidate_unobserved_overlay is a planning-only selection based on structural raw-pair observations; it does not prove selected records are unreferenced or safe to overwrite.",
            "candidate_catalog_unobserved_overlay adds a catalog-scoped raw-pair screen; it remains a scoped PoC selection, not a global font-slot safety proof.",
            "full_candidate_bank is a planning mode and requires a separately verified scope where direct indices may be replaced.",
            "contextual_full_bank is valid only inside the exact translated cursor interval enforced by a verified context-selected font-bank hook.",
            "contextual_full_bank reserves every direct_hex and source_glyph_hex font record used by the structured translated scope.",
            "A mapping file does not supply font graphics, prove source-record availability, or authorize script reinsertion.",
        ],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
