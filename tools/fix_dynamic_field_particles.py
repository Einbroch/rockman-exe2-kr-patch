#!/usr/bin/env python3
"""Pick the Korean particle after a dynamic name field from the name it prints.

`printItem` and `printChip` drop a name into the sentence at run time, so a
particle written next to one is a guess: `을` is right after a name that ends in
a final consonant and wrong after one that does not. The game showed
`A 라이선스을`, which is that guess being wrong.

Item names are themselves translated entries - archive 00/359, entry N is the
name `item=N` prints - so the correct particle can be derived rather than
guessed. Chip names live in a name bank outside these batches; those are
reported, not rewritten, because the deciding character is not knowable here.
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

ITEM_NAME_ARCHIVE = "00/359"
FIELD = re.compile(r"\[(printItem|printChip|printCode|printBuffer)([^\]]*)\]")
ITEM_INDEX = re.compile(r"item\s*=\s*(\d+)")
# Particles whose form depends on the preceding syllable's final consonant.
PAIRS = {"을": ("을", "를"), "를": ("을", "를"),
         "은": ("은", "는"), "는": ("은", "는"),
         "이": ("이", "가"), "가": ("이", "가"),
         "과": ("과", "와"), "와": ("과", "와"),
         "으로": ("으로", "로"), "로": ("으로", "로"),
         "이나": ("이나", "나"), "나": ("이나", "나"),
         "이라": ("이라", "라"), "라": ("이라", "라")}
# Longest first so `으로` is seen before `로`.
PARTICLE_RE = re.compile(r"(?P<close>[\]」])(?P<particle>으로|이나|이라|을|를|은|는|이|가|과|와|로|나|라)")


def final_consonant(syllable: str):
    """True/False for a Hangul syllable, None when the character cannot decide."""
    if not syllable or not ("가" <= syllable <= "힣"):
        return None
    return (ord(syllable) - 0xAC00) % 28 != 0


def load_item_names(translations_dir: Path) -> dict[int, str]:
    names: dict[int, str] = {}
    for path in sorted(translations_dir.glob("*.json")):
        try:
            document = json.loads(path.read_text(encoding="utf-8"))
        except (ValueError, UnicodeDecodeError):
            continue
        stack = [document]
        while stack:
            node = stack.pop()
            if isinstance(node, dict):
                if (node.get("selector") == ITEM_NAME_ARCHIVE
                        and isinstance(node.get("entry_index"), int)
                        and isinstance(node.get("draft_translation"), str)):
                    names.setdefault(node["entry_index"], node["draft_translation"])
                stack.extend(node.values())
            elif isinstance(node, list):
                stack.extend(node)
    return names


def preceding_field(text: str, close_at: int):
    """The dynamic field whose printed name this particle follows, if any."""
    head = text[:close_at + 1]
    if head.endswith("」"):
        opened = head.rfind("「")
        if opened < 0:
            return None
        inner = head[opened + 1:-1]
        match = FIELD.fullmatch(inner.strip())
        return match if match else None
    matches = list(FIELD.finditer(head))
    if matches and matches[-1].end() == close_at + 1:
        return matches[-1]
    return None


def rewrites(text: str, item_names: dict[int, str]):
    """(start, end, replacement, note) for every particle that needs changing."""
    out, unresolved = [], []
    for match in PARTICLE_RE.finditer(text):
        field = preceding_field(text, match.start("close"))
        if field is None:
            continue
        particle = match.group("particle")
        if field.group(1) != "printItem":
            unresolved.append((field.group(1), particle))
            continue
        index = ITEM_INDEX.search(field.group(2))
        name = item_names.get(int(index.group(1))) if index else None
        if not name:
            unresolved.append((field.group(1), particle))
            continue
        closed = final_consonant(name.strip()[-1])
        if closed is None:
            unresolved.append((field.group(1), particle))
            continue
        correct = PAIRS[particle][0 if closed else 1]
        if correct != particle:
            out.append((match.start("particle"), match.end("particle"), correct, name))
    return out, unresolved


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--translations-dir", type=Path, default=Path("translations"))
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    item_names = load_item_names(args.translations_dir)
    changed_files, changed_entries, unresolved_total = 0, 0, []
    for path in sorted(args.translations_dir.glob("*.json")):
        try:
            document = json.loads(path.read_text(encoding="utf-8"))
        except (ValueError, UnicodeDecodeError):
            continue
        touched = False
        stack = [document]
        while stack:
            node = stack.pop()
            if isinstance(node, dict):
                text = node.get("draft_translation")
                if isinstance(text, str) and FIELD.search(text):
                    edits, unresolved = rewrites(text, item_names)
                    unresolved_total.extend(unresolved)
                    if edits:
                        changed_entries += 1
                        for start, end, correct, name in edits:
                            print("%s/%s  %r -> %r  (%s)" % (
                                node.get("selector"), node.get("entry_index"),
                                text[start:end], correct, name))
                        for start, end, correct, _ in reversed(edits):
                            text = text[:start] + correct + text[end:]
                        node["draft_translation"] = text
                        touched = True
                stack.extend(node.values())
            elif isinstance(node, list):
                stack.extend(node)
        if touched and args.apply:
            path.write_text(json.dumps(document, ensure_ascii=False, indent=1) + "\n",
                            encoding="utf-8")
            changed_files += 1
    print(json.dumps({"item_names": len(item_names), "entries_with_fixes": changed_entries,
                      "files_written": changed_files, "applied": args.apply,
                      "unresolved_dynamic_particles": len(unresolved_total)},
                     ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
