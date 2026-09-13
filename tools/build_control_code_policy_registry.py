#!/usr/bin/env python3
"""Build a conservative control-code policy registry from verified reports."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
RUNTIME_CURSOR_OBSERVATIONS = {
    (0xFA, 0x18): {"direct_cursor_delta": 4, "visible_layout_change": False},
    (0xFA, 0x1C): {"direct_cursor_delta": 2, "visible_layout_change": False},
}


def load_report(path: Path) -> dict[str, object]:
    report = json.loads(path.read_text(encoding="utf-8"))
    source = report.get("input", {})
    digest = source.get("sha256") or source.get("rom_sha256")
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"report does not identify the supported Rev 1 ROM: {path.name}")
    return report


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state-transfers", type=Path, required=True)
    parser.add_argument("--indirect-targets", type=Path, required=True)
    parser.add_argument("--ed-runtime", type=Path, action="append", default=[])
    parser.add_argument("--f9-runtime", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    state_report = load_report(args.state_transfers)
    target_report = load_report(args.indirect_targets)
    ed_runtime_reports = [load_report(path) for path in args.ed_runtime]
    f9_runtime_report = load_report(args.f9_runtime) if args.f9_runtime else None

    control_codes = [
        {"opcode": opcode, "policy": "blocked_control_spec"}
        for opcode in range(0xE7, 0x100)
    ]
    by_opcode = {item["opcode"]: item for item in control_codes}
    for item in state_report["direct_parameter_to_r5_byte_transfer_entries"]:
        opcode = item["opcode"]
        by_opcode[opcode]["policy"] = "preserve_stateful"
        by_opcode[opcode]["state_transfer_marker_count"] = len(item["transfers"])

    observed_by_opcode: dict[int, list[dict[str, object]]] = {}
    for candidate in target_report["summary"]["local_static_width_candidates"]:
        key = (candidate["opcode"], candidate["selector_value"])
        if key in RUNTIME_CURSOR_OBSERVATIONS:
            observed_by_opcode.setdefault(candidate["opcode"], []).append({
                "selector_value": candidate["selector_value"],
                "direct_cursor_delta": candidate["width"],
                "runtime": RUNTIME_CURSOR_OBSERVATIONS[key],
            })
    for opcode, observations in observed_by_opcode.items():
        if by_opcode[opcode]["policy"] == "blocked_control_spec":
            by_opcode[opcode]["policy"] = "preserve_runtime_cursor_observed"
        by_opcode[opcode]["selector_observations"] = observations

    ed_observations = []
    seen_ed_selectors: set[int] = set()
    for ed_runtime_report in ed_runtime_reports:
        observation = ed_runtime_report.get("observation", {})
        selector = observation.get("selector_value")
        if observation.get("opcode") != 0xED or selector not in {0, 2}:
            raise ValueError("ED runtime report does not identify a supported observed selector")
        if selector in seen_ed_selectors:
            raise ValueError("duplicate ED selector runtime report")
        if observation.get("observed_stream_byte_count") != 3 or observation.get("marker_visible") is not False:
            raise ValueError("ED runtime report does not support the observed three-byte boundary")
        seen_ed_selectors.add(selector)
        ed_observations.append({
            "selector_value": selector,
            "stream_byte_count": 3,
            "runtime": {
                "marker_visible": False,
                "dialogue_progress_normal": observation.get("dialogue_progress_normal") is True,
            },
        })
    if ed_observations:
        by_opcode[0xED]["policy"] = "preserve_runtime_width_observed"
        by_opcode[0xED]["selector_observations"] = sorted(ed_observations, key=lambda item: item["selector_value"])

    if f9_runtime_report:
        observation = f9_runtime_report.get("observation", {})
        if observation.get("opcode") != 0xF9 or observation.get("selector_value") != 0:
            raise ValueError("F9 runtime report is not the expected F9:00 observation")
        if observation.get("runtime_outcome") != "invalid_address_jump" or observation.get("dialogue_progress_normal") is not False:
            raise ValueError("F9 runtime report does not establish the observed crash boundary")
        by_opcode[0xF9]["policy"] = "preserve_runtime_crash_observed"
        by_opcode[0xF9]["selector_observations"] = [{
            "selector_value": 0,
            "runtime_outcome": "invalid_address_jump",
        }]

    document = {
        "schema_version": 1,
        "target_rom_sha256": EXPECTED_ROM_SHA256,
        "glyph_prefixes": [
            {
                "opcode": 0xE5,
                "parameter_byte_count": 1,
                "stream_byte_count": 2,
                "font_record_index_formula": "0xE5 + parameter",
                "policy": "verified_glyph_transport_only",
            },
            {
                "opcode": 0xE6,
                "parameter_byte_count": 1,
                "stream_byte_count": 2,
                "font_record_index_formula": "0x1E5 + parameter",
                "policy": "verified_glyph_transport_only",
            },
        ],
        "control_codes": control_codes,
        "build_rule": {
            "allow_new_korean_glyph_bytes_only_via": [0xE5, 0xE6],
            "allow_new_E7_to_FF_command_frames": False,
            "preserve_command_order_and_parameters": True,
        },
        "limitations": [
            "Verified glyph transport does not prove editable message boundaries or complete Korean code-page capacity.",
            "A preserve policy never assigns a command name or authorizes rewriting its parameters.",
            "The runtime observations cover one verified dialogue screen per listed selector only.",
        ],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(document, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
