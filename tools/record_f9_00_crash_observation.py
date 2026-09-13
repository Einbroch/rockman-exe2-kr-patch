#!/usr/bin/env python3
"""Record the metadata-only crash result of the F9:00 cursor probe."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_korean_glyph_poc import EXPECTED_ROM_SHA256, sha256


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    manifest_bytes = args.manifest.read_bytes()
    manifest = json.loads(manifest_bytes)
    if manifest.get("kind") != "non_distributable_f9_00_cursor_runtime_probe":
        raise ValueError("unexpected F9 probe manifest kind")
    if manifest.get("input", {}).get("sha256") != EXPECTED_ROM_SHA256:
        raise ValueError("probe manifest does not identify the supported Rev 1 ROM")
    writes = [item for item in manifest.get("expected_writes", []) if item.get("kind") == "length_preserving_f9_00_cursor_probe"]
    if len(writes) != 1 or writes[0].get("opcode") != 0xF9 or writes[0].get("selector_value") != 0:
        raise ValueError("probe manifest does not identify F9:00")
    report = {
        "schema_version": 1,
        "kind": "runtime_control_crash_observation",
        "input": {"rom_sha256": EXPECTED_ROM_SHA256},
        "probe_manifest": {"filename": args.manifest.name, "sha256": sha256(manifest_bytes)},
        "observation": {
            "opcode": 0xF9,
            "selector_value": 0,
            "dialogue_progress_normal": False,
            "runtime_outcome": "invalid_address_jump",
        },
        "policy_consequence": "Preserve the original F9:00 frame verbatim; do not create or modify F9 frames.",
        "limitations": [
            "The crash proves the probe frame is unsafe, not a complete F9 specification.",
            "No screenshot or source stream data is stored in this report.",
        ],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
