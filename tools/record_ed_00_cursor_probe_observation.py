#!/usr/bin/env python3
"""Record a metadata-only runtime result of an ED selector cursor probe."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_korean_glyph_poc import EXPECTED_ROM_SHA256, sha256


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--selector", type=lambda value: int(value, 0), choices=(0x00, 0x02), default=0x00)
    args = parser.parse_args()

    manifest_bytes = args.manifest.read_bytes()
    manifest = json.loads(manifest_bytes)
    if manifest.get("kind") != f"non_distributable_ed_{args.selector:02x}_cursor_runtime_probe":
        raise ValueError("unexpected probe manifest kind")
    if manifest.get("input", {}).get("sha256") != EXPECTED_ROM_SHA256:
        raise ValueError("probe manifest does not identify the supported Rev 1 ROM")
    writes = manifest.get("expected_writes", [])
    command_writes = [
        item for item in writes
        if item.get("kind") in {"length_preserving_ed_00_cursor_probe", "length_preserving_ed_selector_cursor_probe"}
    ]
    if len(command_writes) != 1 or command_writes[0].get("opcode") != 0xED or command_writes[0].get("selector_value") != args.selector:
        raise ValueError("probe manifest does not identify the expected ED selector test")

    report = {
        "schema_version": 1,
        "kind": "runtime_control_width_observation",
        "input": {"rom_sha256": EXPECTED_ROM_SHA256},
        "probe_manifest": {"filename": args.manifest.name, "sha256": sha256(manifest_bytes)},
        "observation": {
            "opcode": 0xED,
            "selector_value": args.selector,
            "observed_stream_byte_count": 3,
            "marker_visible": False,
            "dialogue_progress_normal": True,
            "interpretation": "The E5 marker placed in the third post-opcode byte was not rendered; the following byte was rendered as a normal glyph.",
        },
        "limitations": [
            "The observation applies only to the selected ED selector in the verified active entry.",
            "It does not name the command, establish its state effect, or authorize changing its bytes.",
            "No screenshot or source stream data is stored in this report.",
        ],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
