"""Measure choice windows the way the game draws them, and say when a translation breaks one.

A choice window is the standard dialogue box with a cursor: `option` places
the cursor, the `space` after it reserves the cells the cursor is drawn in, and
`select` waits for the pick. Nothing else about it is special - the same box,
the same one-cell glyphs - so a choice line is as wide as its literal plus the
cursor cells before it, and a question shares the page's rows with its choices.

The draft grammar the catalogued batches use cannot say where an option's
suffix goes, so a question's own line break is easily consumed as the option
boundary: the question's second line becomes the first choice and every
choice after it shifts one slot. That is how the net dealer's question ran
into its first choice. Measuring the page catches the overflow; two
structural checks catch the shift itself even when the page happens to fit.
"""
from __future__ import annotations

import re

from dialogue_layout import QUOTE_RE, ROWS, WIDTH, literal

OPTION_RE = re.compile(r"(?m)^\toption\b")
SPACE_COUNT = re.compile(r"count\s*=\s*(\d+)")
CLEARS = re.compile(r"clear\s*=\s*true")
# The widest name each print can draw, in cells, from the translated tables:
# chip names reach 8 (a [V3] mark is one glyph), item names 9.
DYNAMIC_CELLS = {"printChip": 8, "printItem": 9, "printCode": 1, "printBuffer": 5}
DEFAULT_DYNAMIC_CELLS = 9


def commands(segment: str) -> list[tuple[str, list[str]]]:
    """(name, parameter lines) for each command between two literals, in order."""
    out: list[tuple[str, list[str]]] = []
    for line in segment.splitlines():
        if line.startswith("\t\t"):
            if out:
                out[-1][1].append(line.strip())
        elif line.startswith("\t") and line[1:2].isalpha():
            out.append((line.strip().split()[0], []))
    return out


def breaks_page(name: str, params: list[str]) -> bool:
    if name == "clearMsg" or name.startswith("msgOpen"):
        return True
    # A select that clears leaves the next literal on an empty box.
    return name == "select" and any(CLEARS.search(p) for p in params)


def pages(block: str, name_width=None) -> list[list[str]]:
    """The lines each page draws, counting the cells a `space` or a print adds.

    `name_width(command, parameters)` gives the width of a name the script
    prints by a fixed index, when the caller knows the translated tables; a
    name it cannot resolve - one read from a buffer at run time - counts at
    the widest the table holds.
    """
    out: list[list[str]] = []
    lines = [""]
    quotes = list(QUOTE_RE.finditer(block))
    cursor = 0
    for match in quotes + [None]:
        segment = block[cursor:match.start()] if match is not None else block[cursor:]
        for name, params in commands(segment):
            if breaks_page(name, params):
                if any(lines):
                    out.append(lines)
                lines = [""]
            elif name == "space":
                count = next((int(m.group(1)) for p in params
                              for m in [SPACE_COUNT.search(p)] if m), 0)
                lines[-1] += " " * count
            elif name.startswith("print"):
                width = name_width(name, params) if name_width else None
                if width is None:
                    width = DYNAMIC_CELLS.get(name, DEFAULT_DYNAMIC_CELLS)
                lines[-1] += "#" * width
        if match is None:
            break
        parts = literal(match).split("\n")
        lines[-1] += parts[0]
        lines.extend(parts[1:])
        cursor = match.end()
    if any(lines):
        out.append(lines)
    return out


def has_options(block: str) -> bool:
    return bool(OPTION_RE.search(QUOTE_RE.sub("", block)))


def option_slots(block: str) -> list[int]:
    """Indices of the literals a choice prints: the ones an `option` precedes."""
    quotes = list(QUOTE_RE.finditer(block))
    return [i for i in range(1, len(quotes))
            if OPTION_RE.search(block[quotes[i - 1].end():quotes[i].start()])]


def problems(source: str, shipped: str, name_width=None) -> list[str]:
    """Every way the shipped script breaks a window the source draws; empty when none.

    A choice the source prints but the shipped script leaves blank, or one that
    grew lines, means text moved between slots. A page larger than the window
    the source itself draws overruns the box. Pages are compared one to one,
    so the source is the authority on how big each window is.
    """
    found: list[str] = []
    before = [literal(q) for q in QUOTE_RE.finditer(source)]
    after = [literal(q) for q in QUOTE_RE.finditer(shipped)]
    for index in option_slots(source):
        if before[index].strip() and not after[index].strip():
            found.append("choice %d is empty" % index)
        if after[index].rstrip().count("\n") > before[index].rstrip().count("\n"):
            found.append("choice %d grew lines: %r" % (index, after[index]))
    source_pages, shipped_pages = pages(source, name_width), pages(shipped, name_width)
    if len(source_pages) != len(shipped_pages):
        found.append("page count %d -> %d" % (len(source_pages), len(shipped_pages)))
    for number, (src, got) in enumerate(zip(source_pages, shipped_pages)):
        rows = max(ROWS, len(src))
        width = max(WIDTH, max(len(line) for line in src))
        if len(got) > rows or max(len(line) for line in got) > width:
            found.append("page %d is %dx%d in a %dx%d window: %r" % (
                number, len(got), max(len(line) for line in got), rows, width, got))
    return found


GLYPH_TOKEN = re.compile(r"\[[A-Za-z0-9]+\]")


def name_widths(item_names: dict[int, str], chip_names: list[str]):
    """A `name_width` for pages(): the real width of a name printed by fixed index.

    `buffer = 0` prints the item or chip the command names; any other buffer is
    filled at run time, so its width stays the table's widest. A bracketed
    mark such as [V3] is one glyph.
    """
    def width(command: str, params: list[str]):
        values = dict(p.replace(" ", "").split("=", 1) for p in params if "=" in p)
        if values.get("buffer", "0") != "0":
            return None
        if command == "printCode":
            return 1
        if command == "printItem" and "item" in values:
            name = item_names.get(int(values["item"]))
        elif command == "printChip" and "chip" in values:
            index = int(values["chip"])
            name = chip_names[index] if 0 <= index < len(chip_names) else None
        else:
            return None
        return None if name is None else len(GLYPH_TOKEN.sub("#", name.strip()))
    return width
