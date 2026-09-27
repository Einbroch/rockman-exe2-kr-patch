"""Check that the draft's space or line break beside an inline command survives the build.

A draft marks a printed name, chip code or amount, and a pause, inline:
"정말이네, [printItem item=58]를", "있구나. [waitSkip 30] / 의심해서". The
builder splits the draft into the source's literal slots at those commands
and trims every slot, so a separator beside one used to vanish: the name
glued to the word before it, the next sentence to the pause.

For every such command this compares the draft's separator on each side with
the transformed literal edges, after the layout pass. Expectations come from
the draft tokens, not from the builder's rendering. A pause prints nothing,
so one separator on either side of it is enough; where the source keeps a
pause-by-pause ellipsis or stutter tight ("・・・", "뭐・뭐・"), a space there
is not expected. Exits 1 if any separator is lost.
"""
from __future__ import annotations

import argparse
import collections
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import build_semantic_translation_dev_rom as B  # noqa: E402
import choice_layout  # noqa: E402
from dialogue_layout import QUOTE_RE, layout_script, literal  # noqa: E402

PARAMETER = {"printItem": "item", "printChip": "chip", "printCode": "code",
             "wait": "frames", "waitSkip": "frames", "textSpeed": "delay"}
AMOUNTS = {"printItemAmount", "printBuffer"}
PAUSES = ("[wait ", "[waitSkip ", "[textSpeed ")
NAMES = ("[printItem ", "[printChip ", "[printCode ")
PAGE_BREAK = re.compile(r"^(?:keyWait|clearMsg|select|msgOpen\w*|msgClose\w*|end|jump\w*)$")
TIGHT = set("・.…!?~〜ー、")
DRAFT_MARKS = re.compile(r"\[(?:printItem|printChip|printCode|wait|waitSkip|textSpeed)\b|\{[^}]+\}")


def draft_side(tokens: list, index: int, step: int) -> str:
    """The draft's separator next to token `index`, looking back (-1) or ahead (+1)."""
    neighbour = index + step
    if not 0 <= neighbour < len(tokens):
        return "edge"
    token = tokens[neighbour]
    if token.kind in ("line", "page"):
        return "newline" if token.kind == "line" else "page"
    if token.kind == "text":
        char = token.value[-1:] if step < 0 else token.value[:1]
        return "space" if char.isspace() else "none"
    return token.kind


def output_side(text: str | None, at_end: bool) -> str:
    if text is None:
        return "page"
    char = text[-1:] if at_end else text[:1]
    return "newline" if char == "\n" else "space" if char == " " else "none"


def inline_commands(transformed: str) -> list[tuple[str, str | None, str | None]]:
    """(tag, literal before, literal after) for each inline command; None across a page break."""
    quotes = list(QUOTE_RE.finditer(transformed))
    literals = [literal(q) for q in quotes]
    segments = ([transformed[:quotes[0].start()]]
                + [transformed[quotes[i].end():quotes[i + 1].start()] for i in range(len(quotes) - 1)]
                + [transformed[quotes[-1].end():]])
    found = []
    for position, segment in enumerate(segments):
        commands = choice_layout.commands(segment)
        names = [name for name, _ in commands]
        for index, (name, parameters) in enumerate(commands):
            if name in PARAMETER:
                value = next((p.split("=")[1].strip() for p in parameters if p.startswith(PARAMETER[name])), "?")
                tag = f"[{name} {value}]" if name in ("wait", "waitSkip") else f"[{name} {PARAMETER[name]}={value}]"
            elif name in AMOUNTS:
                tag = "{amount}"
            else:
                continue
            open_before = not any(PAGE_BREAK.match(other) for other in names[:index])
            open_after = not any(PAGE_BREAK.match(other) for other in names[index + 1:])
            before = literals[position - 1] if position >= 1 and open_before else None
            after = literals[position] if position < len(literals) and open_after else None
            found.append((tag, before, after))
    return found


def audit(entries: dict, archives: dict, analysis_dir: Path) -> tuple[list[dict], collections.Counter]:
    blocks: dict[str, dict[int, str]] = {}
    losses: list[dict] = []
    stats: collections.Counter = collections.Counter()
    for (selector, index), entry in sorted(entries.items()):
        if "translated_literals" in entry:
            continue
        draft = entry.get("draft_translation") or ""
        if not DRAFT_MARKS.search(draft):
            continue
        if selector not in blocks:
            text = (analysis_dir / archives[selector]["tpl_filename"]).read_bytes().decode("utf-8-sig")
            blocks[selector] = {int(m.group(1)): m.group(0) for m in B.SCRIPT_RE.finditer(text)}
        source = blocks[selector][index]
        transformed, _ = B.translate_block(source, entry)
        if entry["entry_id"] not in B.REVIEWED_IDS:
            transformed, _ = layout_script(source, transformed, entry["entry_id"])
        shipped = inline_commands(transformed)
        tokens = B.draft_tokens(draft)
        cursor = 0
        for position, token in enumerate(tokens):
            if token.kind == "tag" and token.value.startswith(NAMES + PAUSES):
                wanted = token.value
            elif token.kind == "dynamic":
                wanted = "{amount}"
            else:
                continue
            match = next((k for k in range(cursor, len(shipped)) if shipped[k][0] == wanted), None)
            if match is None:
                stats["draft_marks_without_inline_command"] += 1
                continue
            cursor = match + 1
            _, before, after = shipped[match]
            want_before, want_after = draft_side(tokens, position, -1), draft_side(tokens, position, +1)
            got_before, got_after = output_side(before, True), output_side(after, False)
            stats["marks"] += 1
            lost = []
            if wanted.startswith(PAUSES):
                if before is None or after is None:
                    continue
                wanted_any = {want_before, want_after} & {"space", "newline"}
                breaks = before.endswith("\n") or after.startswith("\n")
                tight = (any(TIGHT.issuperset(text.strip()) and text.strip() for text in (before, after))
                         or before.rstrip().endswith("・") or after.lstrip().startswith("・"))
                if tight and not breaks:
                    wanted_any = set()
                if wanted_any and not {got_before, got_after} & {"space", "newline"}:
                    lost.append("pause")
            else:
                if want_before in ("space", "newline") and before is not None and got_before == "none":
                    lost.append("before")
                if want_after in ("space", "newline") and after is not None and got_after == "none":
                    lost.append("after")
            for side in lost:
                stats[f"lost_{side}"] += 1
            if lost:
                losses.append({"entry": f"{selector}/{index}", "mark": wanted, "lost": lost,
                               "draft": [want_before, want_after], "shipped": [got_before, got_after],
                               "before": (before or "")[-12:], "after": (after or "")[:12]})
    return losses, stats


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--translations-dir", type=Path, default=Path("translations"))
    parser.add_argument("--analysis-dir", type=Path, default=Path("analysis"))
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    entries, archives, _ = B.load_batches(args.translations_dir)
    losses, stats = audit(entries, archives, args.analysis_dir)
    result = {"status": "PASS" if not losses else "FAIL", "stats": dict(sorted(stats.items())),
              "entries_with_losses": len({loss["entry"] for loss in losses}), "losses": losses}
    if args.report:
        args.report.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({key: value for key, value in result.items() if key != "losses"}, ensure_ascii=False))
    return 0 if not losses else 1


if __name__ == "__main__":
    raise SystemExit(main())
