#!/usr/bin/env python3
"""Build a non-distributable EXE2 Rev 1 ROM from protected semantic drafts.

All protected translation inputs are regenerated directly from the immutable
Rev 1 ROM and TPL baselines, encoded with a collision-screened four-byte
Hangul escape, relocated into expanded ROM, and reached by updating every
aligned literal pointer to the original archive.

This is deliberately a development build: the wording is still marked as a
machine draft and archive 00/357 has no literal source pointer, so it is left
unchanged and reported instead of being silently skipped.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import struct
import subprocess
import tempfile
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

from capstone import CS_ARCH_ARM, CS_MODE_LITTLE_ENDIAN, CS_MODE_THUMB, Cs
from PIL import ImageFont

from build_korean_glyph_poc import encode_4bpp, make_mask
from exe1_k_font_source import (
    EXPECTED_SHA256 as EXE1_K_SHA256,
    FONT_BASE_OFFSET as EXE1_FONT_BASE,
    FONT_RECORD_BYTES,
    HANGUL_BASE_INDEX,
    KS_X_1001_HANGUL_COUNT,
    ks_x_1001_ordinal,
    load_source as load_exe1_font,
)
from gba_lz77 import compress, decompress
from dialogue_layout import (layout_script, literal as layout_literal, quote as layout_quote,
                             capacity_violations as layout_capacity_violations)

DIALOGUE_WINDOW_CELLS = 21
DIALOGUE_WINDOW_ROWS = 3
from layout_byte_verifier import table_mapping, verify_changed_literals
from menu_hangul_hook import planned_writes as menu_hook_writes, HOOK_OFFSET as MENU_HOOK_OFFSET
import dialogue_rom_residency as dialogue_rom
from reviewed_choice_layout import REVIEWED_IDS, validate_choice_layout
import choice_layout
from pet_menu_graphics import planned_writes as pet_graphics_writes
from static_submenu_tables import planned_writes as static_submenu_writes, printed_chip_names
from submenu_title_graphics import planned_writes as submenu_graphics_writes
from title_menu_graphics import planned_writes as title_menu_writes
from chip_panel_graphics import planned_writes as chip_panel_writes
from result_window_graphics import planned_writes as result_window_writes


SOURCE_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
BASE_TRANSLATION_SHA256 = "5462941085786f69d23c828fc2ddf2c61125bcec91848a4460401ce2ab21435b"
TEXTPET_SHA256 = "1a92681bc423869816cd7db0c94ad9b25da23abc0461f45784a06d5236216658"
TEXTPET_EXE2_TABLE_SHA256 = "4c7940617c285f21d4655011c9f6a5f4b9625de788be67a310593c378bf0885c"
TEXTPET_MMBN2_COMMANDS_SHA256 = "5f49759e271e30b38ca134dfa3dd8dd8b79b72399f9791e0743674b4d28073b6"

ROM_BASE = 0x08000000
OUTPUT_SIZE = 0x1000000
ORIGINAL_FONT_BASE = 0x006973B0
MASTER_FONT_BASE = 0x00840000
# Above the static tables at 0x920000/0x930000/0x940000: the dialogue archives
# now travel uncompressed, so they need far more room than the old 0x870000 base left.
ARCHIVE_RELOCATION_BASE = 0x00960000
TRAMPOLINE_BASE = 0x00830000

MAIN_DISPATCH_HOOK = 0x00020C70
SCANNER_HOOK = 0x00020D28
FONT_BASE_HOOK = 0x00020D84

HANGUL_ESCAPE = bytes((0xF9, 0xFC))
SKIPPED_NO_LITERAL_POINTER = {"00/357"}
FALLBACK_HANGUL = {"쌰": KS_X_1001_HANGUL_COUNT}
HANGUL_RE = re.compile(r"[가-힣]")
TAG_RE = re.compile(r"\[([A-Za-z]+)(?:\s+([^\]]+))?\]")
SCRIPT_RE = re.compile(r"(?ms)^script\s+(\d+)\s+mmbn2s?\s+\{.*?^\}")
QUOTE_RE = re.compile(r'(?s)"""(.*?)"""|"([^"\r\n]*)"')
TOKEN_RE = re.compile(r"\[[A-Za-z]+(?:\s+[^\]]+)?\]|\{[^{}\r\n]+\}|\s+//\s+|\s+/\s+")
JUMP_TARGET_RE = re.compile(r"\bjump\s+target\s*=\s*(\d+)")
TRACKED = {"wait", "waitSkip", "printItem", "printChip", "printCode", "textSpeed"}
# Byte forms of a script that ends immediately, reachable through the boundary
# table's terminal slot: "end", "waitHold" (the latter reserves four bytes), and
# the bulletin-board bodies' "msgOpenQuick" then "waitHold" - an empty window.
TERMINAL_EMPTY_SCRIPTS = (bytes([0xE7]), bytes([0xEA, 0xFF, 0x00, 0x00]),
                          bytes([0xF1, 0x02, 0xEA, 0xFF, 0x00, 0x00]))
# A script parameter naming the entry its control goes to: jump's target, the
# checkFlag family's jumpIfTrue/jumpIfFalse, a select's `jump = n`, and so on.
ENTRY_TARGET_RE = re.compile(r"\b(?:jump\w*|target)\s*=\s*(\d+)")
# Measured EWRAM ceilings, not guesses. On a map load the game decompresses the
# map's dialogue archive to 0x02038800 and, just before it, the map's sprite
# blocks to 0x0203C000, so a dialogue archive has 14,336 bytes before it runs
# into sprite data that is already live. No original archive comes near that -
# the largest of the 382 is 13,408 - but Hangul costs four bytes a character,
# and an archive that overruns replaces those sprite headers with text. The
# sprite part walker then follows a pointer built out of text bytes and never
# finds its 0xFF terminator: black screen, audio still running. Mesen hid this
# because its unmapped reads happen to end the walk; My Boy! does not.
# (selector -> (destination, next observed allocation))
EWRAM_DESTINATIONS = {
    "00/mail": (0x02023000, 0x02027000),
    "00/mailbody": (0x02027000, 0x02033000),
}
DEFAULT_EWRAM_DESTINATION = (0x02038800, 0x0203C000)
# The bulletin boards reuse the e-mail buffers. Loader 0x0802F28C takes board
# n's (list, body) archive pair from the table at 0x0802F014 and unpacks the
# list to the literal at 0x0802F2B0 and the body to the one at 0x0802F2B4.
BBS_PAIR_TABLE = 0x2F014
BBS_PAIR_COUNT = 8
BBS_DESTINATION_LITERALS = 0x2F2B0


def bulletin_board_destinations(rom: bytes) -> dict[int, tuple[int, int]]:
    """Archive offset -> the EWRAM window the board loader unpacks it into.

    Read from the loader's own table and literals rather than written down, so
    a board archive gets the window its code actually uses.
    """
    list_window, body_window = EWRAM_DESTINATIONS["00/mail"], EWRAM_DESTINATIONS["00/mailbody"]
    if struct.unpack_from("<2I", rom, BBS_DESTINATION_LITERALS) != (list_window[0], body_window[0]):
        raise ValueError("bulletin board loader no longer unpacks into the e-mail buffers")
    found: dict[int, tuple[int, int]] = {}
    for pair in range(BBS_PAIR_COUNT):
        pointers = struct.unpack_from("<2I", rom, BBS_PAIR_TABLE + pair * 8)
        for pointer, window in zip(pointers, (list_window, body_window)):
            if not ROM_BASE <= pointer < ROM_BASE + len(rom):
                raise ValueError("bulletin board pair table holds a non-ROM pointer")
            if found.setdefault(pointer - ROM_BASE, window) != window:
                raise ValueError(f"0x{pointer - ROM_BASE:07X}: both a board list and a board body")
    return found


def ewram_budget(selector: str, archive_offset: int,
                 boards: dict[int, tuple[int, int]]) -> tuple[int, int, int]:
    start, limit = EWRAM_DESTINATIONS.get(selector) or boards.get(archive_offset) or DEFAULT_EWRAM_DESTINATION
    return start, limit, limit - start
PUNCTUATION_NORMALIZATION = str.maketrans({",": "、", "-": "ー", "·": "・", "―": "ー"})


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def hangul_ordinal(character: str) -> int:
    """Return the dense font-record ordinal used by the custom escape."""
    if character in FALLBACK_HANGUL:
        return FALLBACK_HANGUL[character]
    return ks_x_1001_ordinal(character)


def hangul_from_ordinal(ordinal: int) -> str:
    if 0 <= ordinal < KS_X_1001_HANGUL_COUNT:
        lead = 0xB0 + ordinal // 94
        trail = 0xA1 + ordinal % 94
        return bytes((lead, trail)).decode("euc_kr")
    for character, fallback_ordinal in FALLBACK_HANGUL.items():
        if ordinal == fallback_ordinal:
            return character
    raise ValueError(f"Hangul ordinal out of range: {ordinal}")


def directory_argument(path: Path) -> str:
    value = str(path.resolve())
    return value if value.endswith(("/", "\\")) else value + "\\"


def continuation_archive_name(continuation: dict) -> str:
    """The TextPet archive name a translated continuation compiles under."""
    if continuation["source_rom_offset"] is not None:
        return f"{continuation['source_rom_offset']:07X}"
    # A tail inside a decompressed buffer has no ROM offset of its own.
    return f"{continuation['archive_offset']:07X}T"


def run_textpet(executable: Path, plugins: Path, source: Path, destination: Path) -> str:
    command = [
        str(executable.resolve()), "silent",
        "load-plugins", directory_argument(plugins),
        "game", "exe2",
        "read-text-archives", directory_argument(source), "-f", "tpl",
        "write-text-archives", directory_argument(destination), "-f", "bin",
    ]
    result = subprocess.run(command, capture_output=True, text=True, encoding="utf-8")
    if result.returncode:
        raise RuntimeError(
            f"TextPet failed ({result.returncode})\nSTDOUT:\n{result.stdout}\nSTDERR:\n{result.stderr}"
        )
    if "Done." not in result.stdout:
        raise RuntimeError("TextPet did not report successful completion")
    return result.stdout


def archive_offsets(raw: bytes) -> list[int]:
    if len(raw) < 4:
        raise ValueError("archive is too short")
    table_size = struct.unpack_from("<H", raw)[0]
    if table_size < 4 or table_size % 2 or table_size > len(raw):
        raise ValueError("invalid archive boundary table")
    values = [struct.unpack_from("<H", raw, pos)[0] for pos in range(0, table_size, 2)]
    if values[0] != table_size or values[-1] != len(raw):
        raise ValueError("archive boundary table does not cover the payload")
    if any(a > b for a, b in zip(values, values[1:])):
        raise ValueError("archive boundary table is not monotonic")
    return values


def load_source_archive(rom: bytes, metadata: dict) -> tuple[bytes, bytes]:
    offset = int(metadata["archive_offset"])
    storage = metadata.get("storage", "lz77")
    if storage == "lz77":
        raw, stored = decompress(rom, offset)
        if stored != int(metadata["stored_byte_length"]):
            raise ValueError(f"{metadata['selector']}: compressed length changed")
    elif storage == "raw":
        stored = int(metadata["stored_byte_length"])
        raw = rom[offset:offset + stored]
    else:
        raise ValueError(f"{metadata['selector']}: unsupported storage {storage!r}")
    # A decompressed buffer may carry bytes past the archive its table
    # declares. Naming the payload keeps the shared boundary rule intact, and
    # the remainder is handed back rather than dropped: those bytes can be a
    # terminal empty script the game selects by index.
    payload = metadata.get("payload_byte_length")
    trailing = b""
    if payload is not None:
        payload = int(payload)
        if not 0 < payload <= len(raw):
            raise ValueError(f"{metadata['selector']}: payload_byte_length is outside the buffer")
        raw, trailing = raw[:payload], raw[payload:]
    archive_offsets(raw)
    if sha256(raw) != metadata["decompressed_sha256"]:
        raise ValueError(f"{metadata['selector']}: source archive hash mismatch")
    return raw, trailing


# The last catalogued archive has no next archive to bound its trailing script,
# so the shared rule would skip it. These two windows bound the search instead:
# how far to look for the terminator the reader stops at, and how much padding
# after it has to be padding for the extent to count as established.
SCRIPT_END_COMMAND = 0xE7
TERMINAL_CONTINUATION_SCAN = 64
TERMINAL_CONTINUATION_PADDING = 64


def terminal_continuation_end(rom: bytes, boundary: int, selector: str):
    """Where the last catalogued archive's trailing script stops.

    Every other archive is bounded by the next one in the catalogue; this one
    is not, so the extent has to come from the data. Follow the script to the
    terminator, then insist the bytes after it are padding - that is what says
    the script ended there rather than the window running out. If they are not,
    stop the build instead of guessing how many bytes to carry.
    """
    window = rom[boundary:boundary + TERMINAL_CONTINUATION_SCAN]
    if all(value == 0xFF for value in window):
        return None
    stop = window.find(bytes((SCRIPT_END_COMMAND,)))
    if stop < 0:
        raise ValueError(f"{selector}: trailing script has no terminator within "
                         f"{TERMINAL_CONTINUATION_SCAN} bytes")
    end = boundary + stop + 1
    if not set(rom[end:end + TERMINAL_CONTINUATION_PADDING]) <= {0x00, 0xFF}:
        raise ValueError(f"{selector}: content follows the trailing script terminator; "
                         "its extent is not established")
    return end


def find_raw_physical_continuations(
    rom: bytes,
    archives: dict[str, dict],
    source_raw: dict[str, bytes],
    source_tpl: dict[str, bytes],
    source_trailing: dict[str, bytes],
) -> dict[str, dict]:
    """Preserve raw bytes reached through the table's terminal boundary entry.

    Some EXE2 raw archives deliberately jump to target ``entry_count``. The
    terminal table value points immediately after the formal archive, where a
    physical continuation script lives before the next catalogued archive.
    Relocating only the formal archive turns that valid flow into execution of
    expanded-ROM fill bytes.
    """
    continuations: dict[str, dict] = {}
    ordered = sorted(archives.items(), key=lambda item: int(item[1]["archive_offset"]))
    for position, (selector, metadata) in enumerate(ordered):
        entry_count = len(archive_offsets(source_raw[selector])) - 1
        outbound: list[dict] = []
        text = source_tpl[selector].decode("utf-8-sig")
        for script_match in SCRIPT_RE.finditer(text):
            entry_index = int(script_match.group(1))
            for jump_match in JUMP_TARGET_RE.finditer(script_match.group(0)):
                target = int(jump_match.group(1))
                if target >= entry_count:
                    outbound.append({"entry_index": entry_index, "jump_target": target})
        if not outbound:
            # A raw archive's script can continue past the length its boundary
            # table declares, and callers reach it without a script jump - by
            # selecting the terminal index, or by simply reading on. Relocating
            # only the formal archive leaves those bytes behind and the reader
            # walks into expanded-ROM fill. Keep every byte between the declared
            # end and the next catalogued archive, exactly as the source has it.
            boundary = int(metadata["archive_offset"]) + len(source_raw[selector])
            following = (int(ordered[position+1][1]["archive_offset"])
                         if position + 1 < len(ordered) else None)
            if metadata["storage"] == "raw" and (following is None or following > boundary):
                if following is None:
                    end = terminal_continuation_end(rom, boundary, selector)
                    next_selector = None
                else:
                    end, next_selector = following, ordered[position+1][0]
                payload = rom[boundary:end] if end is not None else b""
                if end is not None and len(payload) != end - boundary:
                    raise ValueError(f"{selector}: trailing script is truncated in source ROM")
                if any(value != 0xFF for value in payload):
                    continuations[selector] = {
                        "payload": payload, "source_rom_offset": boundary,
                        "source_sha256": sha256(payload),
                        "next_catalog_selector": next_selector,
                        "outbound_entries": [],
                        "reason": "script continues past the declared length; exact source bytes retained",
                    }
            elif metadata["storage"] == "lz77" and source_trailing.get(selector):
                # A compressed archive keeps that same terminator inside its
                # decompressed buffer instead of in ROM. 00/mail is one: the
                # e-mail list draws index 127, whose E7 sits one byte past the
                # payload the table declares. Drop it and the label renderer
                # walks EWRAM with no terminator left to find.
                trailing = source_trailing[selector]
                # E7 ends a script; EA FF 00 00 is waitHold, which the command
                # database marks as always ending one. A longer tail counts as
                # a script only when the archive itself sends control to the
                # terminal index: the request board's body 118 ("this request
                # is in progress") lies past the table, and script 17 jumps to
                # it. Anything else is not known to be a script, so stop
                # rather than guess.
                reached = any(int(match.group(1)) == entry_count
                              for match in ENTRY_TARGET_RE.finditer(text))
                empty = trailing in TERMINAL_EMPTY_SCRIPTS
                ends = trailing.endswith(bytes([SCRIPT_END_COMMAND])) or trailing.endswith(
                    bytes([0xEA, 0xFF, 0x00, 0x00]))
                if not empty and not (reached and ends):
                    raise ValueError(f"{selector}: unexpected bytes past the compressed payload")
                continuations[selector] = {
                    "payload": trailing, "source_rom_offset": None,
                    "archive_offset": int(metadata["archive_offset"]),
                    "source_sha256": sha256(trailing),
                    "next_catalog_selector": None,
                    "outbound_entries": [],
                    "storage_form": "inside_decompressed_buffer",
                    "reason": ("native caller selects terminal empty script inside the decompressed buffer"
                               if empty else
                               "a script jumps to the terminal index; its script lies inside the decompressed buffer"),
                }
            continue
        if metadata["storage"] != "raw":
            raise ValueError(f"{selector}: out-of-table jump in compressed archive")
        if any(item["jump_target"] != entry_count for item in outbound):
            raise ValueError(f"{selector}: jump target exceeds the terminal boundary entry")
        if position + 1 >= len(ordered):
            raise ValueError(f"{selector}: terminal continuation has no following catalog archive")
        next_selector, next_metadata = ordered[position + 1]
        source_offset = int(metadata["archive_offset"])
        continuation_offset = source_offset + len(source_raw[selector])
        continuation_end = int(next_metadata["archive_offset"])
        if continuation_end <= continuation_offset:
            raise ValueError(f"{selector}: terminal continuation extent is empty or overlaps")
        payload = rom[continuation_offset:continuation_end]
        if len(payload) != continuation_end - continuation_offset:
            raise ValueError(f"{selector}: terminal continuation is truncated in source ROM")
        continuations[selector] = {
            "payload": payload,
            "source_rom_offset": continuation_offset,
            "source_sha256": sha256(payload),
            "next_catalog_selector": next_selector,
            "outbound_entries": outbound,
        }
    return continuations


def canonical_tag(name: str, raw_arg: str) -> str:
    raw_arg = raw_arg.strip()
    if name in {"wait", "waitSkip"}:
        return f"[{name} {raw_arg}]"
    return f"[{name} {raw_arg}]"


def source_tracked_tags(interstitial: str) -> list[tuple[int, str]]:
    patterns = {
        "wait": r"(?m)^\s*wait\s*$\s*frames\s*=\s*([^\s]+)",
        "waitSkip": r"(?m)^\s*waitSkip\s*$\s*frames\s*=\s*([^\s]+)",
        "printItem": r"(?ms)^\s*printItem\s*$.*?^\s*item\s*=\s*([^\s]+)",
        "printChip": r"(?ms)^\s*printChip\s*$.*?^\s*chip\s*=\s*([^\s]+)",
        "printCode": r"(?ms)^\s*printCode\s*$.*?^\s*code\s*=\s*([^\s]+)",
        "textSpeed": r"(?m)^\s*textSpeed\s*$\s*delay\s*=\s*([^\s]+)",
    }
    arg_names = {"printItem": "item", "printChip": "chip", "printCode": "code", "textSpeed": "delay"}
    found: list[tuple[int, str]] = []
    for name, pattern in patterns.items():
        for match in re.finditer(pattern, interstitial):
            value = match.group(1)
            argument = value if name in {"wait", "waitSkip"} else f"{arg_names[name]}={value}"
            found.append((match.start(), canonical_tag(name, argument)))
    return sorted(found)


@dataclass(frozen=True)
class DraftToken:
    kind: str
    value: str


def draft_tokens(text: str) -> list[DraftToken]:
    text = text.translate(PUNCTUATION_NORMALIZATION)
    result: list[DraftToken] = []
    cursor = 0
    for match in TOKEN_RE.finditer(text):
        if match.start() > cursor:
            result.append(DraftToken("text", text[cursor:match.start()]))
        value = match.group(0)
        if value.lstrip().startswith("["):
            parsed = TAG_RE.fullmatch(value.strip())
            if not parsed or parsed.group(1) not in TRACKED:
                raise ValueError(f"unsupported authored tag: {value.strip()}")
            result.append(DraftToken("tag", canonical_tag(parsed.group(1), parsed.group(2) or "")))
        elif value.startswith("{"):
            result.append(DraftToken("dynamic", value))
        elif "//" in value:
            result.append(DraftToken("page", "//"))
        else:
            result.append(DraftToken("line", "/"))
        cursor = match.end()
    if cursor < len(text):
        result.append(DraftToken("text", text[cursor:]))
    return result


def render_text_tokens(tokens: list[DraftToken]) -> str:
    if any(token.kind == "tag" for token in tokens):
        raise ValueError("unconsumed authored tag")
    parts: list[str] = []
    for token in tokens:
        if token.kind == "text":
            parts.append(token.value)
        elif token.kind in {"line", "page"}:
            parts.append("\n")
        else:
            raise AssertionError(token.kind)
    value = "".join(parts).strip()
    value = re.sub(r"[ \t]*\n[ \t]*", "\n", value)
    return value


def quote_for_tpl(value: str) -> str:
    if '"""' in value:
        raise ValueError("translation contains an unsupported triple quote")
    if not value:
        # TextPet v1.0.0 rejects an empty literal. A blank glyph keeps the
        # immutable command/quote slot valid when a draft merges source slots.
        return '" "'
    lines = value.split("\n")
    if len(lines) == 1 and '"' not in value:
        return f'"{value}"'
    return '"""\n' + "\n".join("\t" + line for line in lines) + '\n\t"""'


def find_boundary(tokens: list[DraftToken], start: int, kind: str, tags: list[str]) -> tuple[int, int]:
    """Return the token slice end and the first token after the consumed anchor."""
    if tags:
        pos = start
        first = None
        fallback_boundary = None
        for expected in tags:
            while pos < len(tokens) and not (tokens[pos].kind == "tag" and tokens[pos].value == expected):
                if tokens[pos].kind == "page":
                    lookahead = pos + 1
                    while lookahead < len(tokens) and tokens[lookahead].kind in {"line", "page"}:
                        lookahead += 1
                    if (
                        lookahead < len(tokens)
                        and tokens[lookahead].kind == "tag"
                        and tokens[lookahead].value == expected
                    ):
                        if first is None:
                            first = pos
                        pos = lookahead
                        continue
                    if fallback_boundary is None:
                        fallback_boundary = pos
                    pos += 1
                    continue
                if tokens[pos].kind == "tag":
                    # Source control commands are retained byte-for-byte in the
                    # immutable TPL skeleton.  A draft may omit a display-only
                    # anchor (or contain a later anchor); in that case split at
                    # the next authored boundary without consuming it.  This
                    # preserves every source command and keeps the later anchor
                    # available for its actual source slot.
                    boundary = fallback_boundary if fallback_boundary is not None else pos
                    return boundary, boundary
                pos += 1
            if pos >= len(tokens):
                # Keep the source control and put all remaining prose before it.
                boundary = fallback_boundary if fallback_boundary is not None else len(tokens)
                return boundary, boundary
            if first is None:
                first = pos
            pos += 1
        assert first is not None
        return first, pos

    acceptable = {"page"} if kind == "page" else ({"line", "page"} if kind == "line" else set())
    if acceptable:
        for pos in range(start, len(tokens)):
            if tokens[pos].kind == "tag":
                # A draft can merge pages around an inline print command.  End
                # this literal at the command anchor and leave that tag for the
                # next source interstitial, whose command bytes remain intact.
                return pos, pos
            if tokens[pos].kind in acceptable:
                return pos, pos + 1
        # Preserve the source boundary even if the prose draft merged the
        # remaining text.  The following source literal becomes empty rather
        # than deleting or moving a control command.
        return len(tokens), len(tokens)
    return start, start


def source_literal_break_count(match: re.Match[str]) -> int:
    value = match.group(1) if match.group(1) is not None else (match.group(2) or "")
    if match.group(1) is None:
        return value.count(r"\n")
    lines = value.splitlines()
    while lines and not lines[0].strip():
        lines.pop(0)
    while lines and not lines[-1].strip():
        lines.pop()
    return max(0, len(lines) - 1)


def option_literal_layout(match: re.Match[str]) -> tuple[int, str]:
    """Separate interior prose breaks from the suffix positioning an option.

    TextPet's triple quotes remove their framing lines, but a blank content
    line before the closing delimiter is an actual newline consumed by the
    option renderer. Single quotes may encode the same newline as \\n.
    """
    if match.group(1) is not None:
        lines = match.group(1).splitlines()
        value = "\n".join(line.lstrip("\t") for line in lines[1:-1])
    else:
        value = re.sub(r"\\+n", "\n", match.group(2) or "")
    suffix = re.search(r"\s*$", value).group(0)
    return value.rstrip().count("\n"), suffix


def find_dynamic_boundary(tokens: list[DraftToken], start: int, internal_breaks: int) -> tuple[int, int]:
    """Find the draft slash that represents a protected dynamic print slot."""
    skipped = 0
    for pos in range(start, len(tokens)):
        if tokens[pos].kind == "dynamic":
            return pos, pos + 1
        if tokens[pos].kind == "tag":
            return pos, pos
        if tokens[pos].kind not in {"line", "page"}:
            continue
        if skipped < internal_breaks:
            skipped += 1
            continue
        return pos, pos + 1
    return len(tokens), len(tokens)


def transform_script(block: str, translation: str, stable_id: str, *, preserve_option_layout: bool = False) -> tuple[str, dict]:
    quotes = list(QUOTE_RE.finditer(block))
    if not quotes:
        raise ValueError(f"{stable_id}: source script has no text literal")
    tokens = draft_tokens(translation)
    source_tag_counts = Counter(tag for _, tag in source_tracked_tags(block))
    authored_tag_counts = Counter(token.value for token in tokens if token.kind == "tag")
    unsupported_counts = {
        tag: count for tag, count in authored_tag_counts.items()
        if count > source_tag_counts[tag]
    }
    if unsupported_counts:
        raise ValueError(f"authored tags are not a subset of source controls: {unsupported_counts}")
    replacements: list[str] = []
    cursor = 0
    boundary_trace: list[dict] = []

    # Some scripts print an item/chip/code before their first literal.  The
    # authored tag is only an anchor: the source command itself remains in the
    # untouched TPL skeleton, so consume a matching leading tag without adding
    # it to the literal text.
    prefix_tags = [tag for _, tag in source_tracked_tags(block[:quotes[0].start()])]
    for expected in prefix_tags:
        if cursor < len(tokens) and tokens[cursor].kind == "tag" and tokens[cursor].value == expected:
            cursor += 1
            boundary_trace.append({"before_slot": 0, "kind": "tag", "tags": [expected]})

    for index in range(len(quotes) - 1):
        between = block[quotes[index].end():quotes[index + 1].start()]
        tags = [tag for _, tag in source_tracked_tags(between)]
        if tags:
            kind = "tag"
        elif re.search(r"(?m)^\s*(?:printItemAmount|printBuffer)\b", between):
            kind = "dynamic"
        elif re.search(r"(?m)^\s*(?:keyWait|clearMsg|select)\b", between):
            kind = "page"
        elif preserve_option_layout and re.search(r"(?m)^\s*option\b", between):
            kind = "option"
        elif re.search(r"(?m)^\s*(?:option|space)\b", between):
            kind = "line"
        else:
            kind = "flex"
        if kind == "dynamic":
            end, after = find_dynamic_boundary(tokens, cursor, source_literal_break_count(quotes[index]))
        elif kind == "option":
            internal_breaks, option_suffix = option_literal_layout(quotes[index])
            end, after = find_dynamic_boundary(tokens, cursor, internal_breaks)
        else:
            end, after = find_boundary(tokens, cursor, kind, tags)
        if (
            tags
            and any(token.kind == "tag" for token in tokens[end:after])
            and after < len(tokens)
            and tokens[after].kind in {"line", "page"}
        ):
            after += 1
        replacement_text = render_text_tokens(tokens[cursor:end])
        if kind == "option":
            replacement_text += option_suffix
        replacements.append(quote_for_tpl(replacement_text))
        boundary_trace.append({"after_slot": index, "kind": kind, "tags": tags})
        cursor = after

    remaining = tokens[cursor:]
    suffix_tags = [tag for _, tag in source_tracked_tags(block[quotes[-1].end():])]
    suffix_index = 0
    final_tokens: list[DraftToken] = []
    for token in remaining:
        if token.kind != "tag":
            final_tokens.append(token)
            continue
        if suffix_index < len(suffix_tags) and token.value == suffix_tags[suffix_index]:
            suffix_index += 1
            boundary_trace.append({"after_slot": len(quotes) - 1, "kind": "tag", "tags": [token.value]})
        else:
            # The draft sometimes moves a redundant control annotation for
            # readability. Its value/multiplicity was validated against the
            # complete source script above; discard only the annotation while
            # retaining the source command at its immutable original position.
            boundary_trace.append({"kind": "unplaced_authored_tag", "tags": [token.value]})
    replacements.append(quote_for_tpl(render_text_tokens(final_tokens)))
    if len(replacements) != len(quotes):
        raise AssertionError("replacement slot count mismatch")

    pieces: list[str] = []
    source_cursor = 0
    for match, replacement in zip(quotes, replacements):
        pieces.append(block[source_cursor:match.start()])
        pieces.append(replacement)
        source_cursor = match.end()
    pieces.append(block[source_cursor:])
    transformed = "".join(pieces)

    source_skeleton = QUOTE_RE.sub("<TEXT>", block)
    output_skeleton = QUOTE_RE.sub("<TEXT>", transformed)
    if source_skeleton != output_skeleton:
        raise AssertionError(f"{stable_id}: non-text TPL skeleton changed")
    return transformed, {
        "text_slot_count": len(quotes),
        "boundaries": boundary_trace,
        "expected_hangul": "".join(HANGUL_RE.findall("".join(replacements))),
    }


def substitute_literals(block: str, translated: list[str], stable_id: str) -> tuple[str, dict]:
    """Replace each quoted literal in place; every control stays where the source has it.

    The archives the pointer scan recovered are translated slot by slot rather
    than through the draft grammar. That grammar has no way to keep an option's
    trailing newline or space, to leave two literals on one line around a sound
    effect, or to keep a literal's leading space, so a draft either round-trips
    by luck or moves text between slots. Here a slot cannot move: the result
    differs from the source only inside the literals.
    """
    quotes = list(QUOTE_RE.finditer(block))
    if len(translated) != len(quotes):
        raise ValueError(f"{stable_id}: {len(translated)} translated literals for {len(quotes)} source slots")
    values = [value.translate(PUNCTUATION_NORMALIZATION) for value in translated]
    pieces: list[str] = []
    cursor = 0
    for match, value in zip(quotes, values):
        if not value:
            # TextPet v1.0.0 rejects an empty literal.
            raise ValueError(f"{stable_id}: empty translated literal")
        pieces.append(block[cursor:match.start()])
        pieces.append(match.group(0) if value == layout_literal(match) else layout_quote(value))
        cursor = match.end()
    pieces.append(block[cursor:])
    transformed = "".join(pieces)
    if QUOTE_RE.sub("<TEXT>", transformed) != QUOTE_RE.sub("<TEXT>", block):
        raise AssertionError(f"{stable_id}: non-text TPL skeleton changed")
    return transformed, {
        "text_slot_count": len(quotes),
        "boundaries": [],
        "expected_hangul": "".join(HANGUL_RE.findall("".join(values))),
        "literal_substitution": True,
    }


def translate_block(block: str, entry: dict) -> tuple[str, dict]:
    """One protected entry's script before layout, by whichever form it was authored in."""
    if "translated_literals" in entry:
        return substitute_literals(block, entry["translated_literals"], entry["entry_id"])
    # A choice's slots are found by the source's own line count and keep the
    # source's suffix; without that, a question's line break is taken for the
    # option boundary and every choice shifts a slot. The choice gate proves,
    # entry by entry, that the draft agreed with the source's slots.
    return transform_script(block, entry["draft_translation"], entry["entry_id"],
                            preserve_option_layout=(entry["entry_id"] in REVIEWED_IDS
                                                    or choice_layout.has_options(block)))


def translated_text(entry: dict) -> str:
    """Everything an entry will print, for the Hangul the font has to carry."""
    if "translated_literals" in entry:
        return "".join(entry["translated_literals"])
    return entry["draft_translation"]


class ThumbBlob:
    """Small fixed-sequence encoder; Capstone verifies the final placed code."""

    def __init__(self, rom_offset: int):
        self.rom_offset = rom_offset
        self.halfwords: list[int] = []
        self.labels: dict[str, int] = {}
        self.fixups: list[tuple[int, str, str | int]] = []
        self.literals: list[int] = []
        self.code_byte_length = 0

    def emit(self, value: int) -> None:
        self.halfwords.append(value)

    def label(self, name: str) -> None:
        self.labels[name] = len(self.halfwords) * 2

    def bcond(self, condition: int, label: str) -> None:
        self.fixups.append((len(self.halfwords), "cond", (condition << 24) | len(self.fixups)))
        self.halfwords.append(0)
        self.fixups[-1] = (self.fixups[-1][0], f"cond:{condition}", label)

    def branch(self, label: str) -> None:
        self.fixups.append((len(self.halfwords), "branch", label))
        self.halfwords.append(0)

    def ldr_literal(self, register: int, value: int) -> None:
        self.fixups.append((len(self.halfwords), f"literal:{register}", value))
        self.halfwords.append(0)

    def finish(self) -> bytes:
        while (len(self.halfwords) * 2) % 4:
            self.halfwords.append(0x46C0)
        self.code_byte_length = len(self.halfwords) * 2
        literal_positions: dict[int, int] = {}
        for _, kind, target in self.fixups:
            if kind.startswith("literal:") and int(target) not in literal_positions:
                literal_positions[int(target)] = len(self.halfwords) * 2 + len(self.literals) * 4
                self.literals.append(int(target))
        for position, kind, target in self.fixups:
            instruction_offset = position * 2
            pc = self.rom_offset + instruction_offset + 4
            if kind == "branch":
                destination = self.rom_offset + self.labels[str(target)]
                delta = destination - pc
                if delta % 2 or not -2048 <= delta // 2 <= 2047:
                    raise ValueError("Thumb branch is out of range")
                self.halfwords[position] = 0xE000 | ((delta // 2) & 0x7FF)
            elif kind.startswith("cond:"):
                condition = int(kind.split(":", 1)[1])
                destination = self.rom_offset + self.labels[str(target)]
                delta = destination - pc
                if delta % 2 or not -128 <= delta // 2 <= 127:
                    raise ValueError("Thumb conditional branch is out of range")
                self.halfwords[position] = 0xD000 | (condition << 8) | ((delta // 2) & 0xFF)
            elif kind.startswith("literal:"):
                register = int(kind.split(":", 1)[1])
                literal = self.rom_offset + literal_positions[int(target)]
                base = pc & ~3
                delta = literal - base
                if delta < 0 or delta % 4 or delta // 4 > 255:
                    raise ValueError("Thumb literal is out of range")
                self.halfwords[position] = 0x4800 | (register << 8) | (delta // 4)
            else:
                raise AssertionError(kind)
        return struct.pack(f"<{len(self.halfwords)}H{len(self.literals)}I", *self.halfwords, *self.literals)


def make_main_dispatch_trampoline(offset: int) -> tuple[bytes, int]:
    t = ThumbBlob(offset)
    t.emit(0x29F9)                 # cmp r1, #0xF9
    t.bcond(0x1, "normal")        # bne
    t.emit(0x7862)                 # ldrb r2, [r4, #1]
    t.emit(0x2AFC)                 # cmp r2, #0xFC
    t.bcond(0x1, "control")       # bne
    t.emit(0x78A2)                 # ldrb r2, [r4, #2]
    t.emit(0x78E1)                 # ldrb r1, [r4, #3]
    t.emit(0x0209)                 # lsls r1, r1, #8
    t.emit(0x1889)                 # adds r1, r1, r2
    t.ldr_literal(3, ROM_BASE + FONT_BASE_HOOK + 1)
    t.emit(0x46FE)                 # mov lr, pc
    t.emit(0x4718)                 # bx r3
    t.ldr_literal(3, ROM_BASE + 0x00020E80 + 1)
    t.emit(0x46FE)
    t.emit(0x4718)
    t.emit(0x3404)                 # adds r4, #4
    t.emit(0x2000)                 # movs r0, #0
    t.ldr_literal(3, ROM_BASE + 0x00020CEA + 1)
    t.emit(0x4718)
    t.label("normal")
    t.emit(0x29E7)                 # cmp r1, #0xE7
    t.bcond(0x3, "glyph")         # blo
    t.label("control")
    t.emit(0x39E7)                 # subs r1, #0xE7
    t.ldr_literal(3, ROM_BASE + 0x00020C78 + 1)
    t.emit(0x4718)
    t.label("glyph")
    t.ldr_literal(3, ROM_BASE + 0x00020C88 + 1)
    t.emit(0x4718)
    result = t.finish()
    return result, t.code_byte_length


def make_scanner_trampoline(offset: int) -> tuple[bytes, int]:
    t = ThumbBlob(offset)
    t.emit(0x29F9)
    t.bcond(0x1, "normal")
    t.emit(0x7862)
    t.emit(0x2AFC)
    t.bcond(0x1, "control")
    t.ldr_literal(2, ROM_BASE + 0x00020DC8 + 1)
    t.emit(0x46FE)
    t.emit(0x4710)                 # bx r2
    t.emit(0x3301)                 # adds r3, #1
    t.emit(0x3404)                 # adds r4, #4
    t.ldr_literal(2, ROM_BASE + 0x00020D56 + 1)
    t.emit(0x4710)
    t.label("normal")
    t.emit(0x29E7)
    t.bcond(0x2, "control")        # bhs
    t.emit(0x29E5)
    t.bcond(0x0, "double")         # beq
    t.emit(0x29E6)
    t.bcond(0x0, "double")
    t.ldr_literal(2, ROM_BASE + 0x00020D44 + 1)
    t.emit(0x4710)
    t.label("control")
    t.ldr_literal(2, ROM_BASE + 0x00020D36 + 1)
    t.emit(0x4710)
    t.label("double")
    t.ldr_literal(2, ROM_BASE + 0x00020D4E + 1)
    t.emit(0x4710)
    result = t.finish()
    return result, t.code_byte_length


def make_font_base_trampoline(offset: int) -> tuple[bytes, int]:
    t = ThumbBlob(offset)
    t.emit(0x4688)                 # mov r8, r1
    t.emit(0x7822)                 # ldrb r2, [r4]
    t.emit(0x2AF9)
    t.bcond(0x1, "original")
    t.emit(0x7862)
    t.emit(0x2AFC)
    t.bcond(0x1, "original")
    t.ldr_literal(0, ROM_BASE + MASTER_FONT_BASE)
    t.branch("calculate")
    t.label("original")
    t.ldr_literal(0, ROM_BASE + ORIGINAL_FONT_BASE)
    t.label("calculate")
    t.emit(0x0189)                 # lsls r1, r1, #6
    t.emit(0x1840)                 # adds r0, r0, r1
    t.ldr_literal(3, ROM_BASE + 0x00020D8C + 1)
    t.emit(0x4718)
    result = t.finish()
    return result, t.code_byte_length


def hook_stub(offset: int, destination: int, register: int) -> bytes:
    # ldr reg, [pc, #0]; bx reg; .word destination|1
    return struct.pack("<HHI", 0x4800 | (register << 8), 0x4700 | (register << 3), ROM_BASE + destination + 1)


def verify_thumb(code: bytes, code_byte_length: int, offset: int) -> list[str]:
    decoder = Cs(CS_ARCH_ARM, CS_MODE_THUMB | CS_MODE_LITTLE_ENDIAN)
    instructions = list(decoder.disasm(code[:code_byte_length], ROM_BASE + offset))
    if not instructions or sum(item.size for item in instructions) != code_byte_length:
        raise ValueError("Capstone did not decode the declared Thumb code range")
    return [f"0x{item.address:08X}: {item.mnemonic} {item.op_str}".rstrip() for item in instructions]


def apply_expected_write(output: bytearray, source: bytes, start: int, expected: bytes, replacement: bytes) -> None:
    if source[start:start + len(expected)] != expected:
        raise ValueError(f"expected source mismatch at ROM 0x{start:X}")
    output[start:start + len(replacement)] = replacement


SLOT_TRANSLATION_FILENAME = "slot_translations.json"
SLOT_TRANSLATION_KIND = "protected_slot_translation_set"


def apply_slot_translations(entry_map: dict[tuple[str, int], dict], document: dict) -> int:
    """Give each entry the set carries its authored slots in place of its draft.

    These are the entries whose drafts disagree with the source's slots - a
    choice window whose question takes a choice's slot, or a page whose line
    break the draft grammar drops beside a printed name - so they are carried
    literal by literal. A record pins the draft it supersedes: if that draft
    is edited, the slots were reviewed against text that no longer exists, so
    loading stops.
    """
    if document.get("kind") != SLOT_TRANSLATION_KIND or not document.get("validation", {}).get("passed"):
        raise ValueError("unexpected slot translation set")
    for record in document["records"]:
        key = (record["selector"], int(record["entry_index"]))
        entry = entry_map.get(key)
        if entry is None or entry["entry_id"] != record["entry_id"]:
            raise ValueError(f"{record['entry_id']}: slots name an entry the batches lack")
        if "translated_literals" in entry:
            raise ValueError(f"{record['entry_id']}: entry already carries literal slots")
        if sha256(entry["draft_translation"].encode("utf-8")) != record["superseded_draft_sha256"]:
            raise ValueError(f"{record['entry_id']}: draft changed after its slots were "
                             "authored; review the slots against the new draft")
        if record["source_tpl_block_sha256"] != entry["source_tpl_block_sha256"]:
            raise ValueError(f"{record['entry_id']}: slots were authored for another source block")
        if record.get("status") != "machine_draft_needs_human_review":
            raise ValueError(f"{record['entry_id']}: unexpected slot review state")
        entry["translated_literals"] = list(record["translated_literals"])
        entry["slot_translation"] = True
    return len(document["records"])


def load_batches(translations_dir: Path, *, apply_slots: bool = True
                 ) -> tuple[dict[tuple[str, int], dict], dict[str, dict], list[dict]]:
    entry_map: dict[tuple[str, int], dict] = {}
    archive_map: dict[str, dict] = {}
    batch_records: list[dict] = []
    files = sorted(translations_dir.glob("archive_batch_[0-9][0-9][0-9][0-9]_100.json"))
    first_batch = translations_dir / "archive_00_11_batch_0001_100.json"
    if first_batch.is_file():
        files.insert(0, first_batch)
    # The two e-mail archives carry 127-entry batches, so they sit outside the
    # numbered glob the dialogue batches follow. The list uses the mmbn2s
    # command set; the bodies use mmbn2, like ordinary dialogue.
    # These sit outside the numbered glob: the two e-mail archives carry
    # 127-entry batches, and the uncatalogued batch holds the archives the
    # catalogue never listed - ones the game reaches through a code literal
    # rather than the pointer tables the catalogue was built from.
    for name in ("archive_00_mail_batch_0078_127.json",
                 "archive_00_mailbody_batch_0079_127.json",
                 "archive_uncatalogued_batch_0080.json"):
        candidate = translations_dir / name
        if candidate.is_file():
            files.append(candidate)
    if len(files) != 80:
        raise ValueError(f"expected 80 protected batches, found {len(files)}")
    for path in files:
        payload = path.read_bytes()
        document = json.loads(payload)
        kind = document.get("kind")
        if kind not in {"protected_multi_archive_textpet_translation_batch", "protected_textpet_archive_translation_batch"}:
            raise ValueError(f"unexpected protected batch kind: {path.name}")
        if not document.get("validation", {}).get("passed"):
            raise ValueError(f"protected batch validation is not passed: {path.name}")
        if kind == "protected_textpet_archive_translation_batch":
            legacy = document["archive"]
            archive_documents = [{
                "selector": legacy["selector"],
                "archive_offset": legacy["source_rom_offset"],
                **({"payload_byte_length": legacy["payload_byte_length"]}
                   if "payload_byte_length" in legacy else {}),
                "storage": "lz77",
                "stored_byte_length": legacy["compressed_byte_length"],
                "decompressed_sha256": legacy["decompressed_sha256"],
                "tpl_filename": legacy["tpl_filename"],
                "tpl_sha256": legacy["tpl_sha256"],
            }]
        else:
            archive_documents = document["archives"]
        for archive in archive_documents:
            selector = archive["selector"]
            prior = archive_map.get(selector)
            stable = {
                "selector": selector,
                "archive_offset": int(archive.get("archive_offset", archive.get("source_rom_offset"))),
                "storage": archive.get("storage", "lz77"),
                "stored_byte_length": int(archive.get("stored_byte_length", archive.get("compressed_byte_length", archive.get("decompressed_byte_length")))),
                "decompressed_sha256": archive["decompressed_sha256"],
                "tpl_filename": archive["tpl_filename"],
                "tpl_sha256": archive["tpl_sha256"],
                **({"payload_byte_length": int(archive["payload_byte_length"])}
                   if "payload_byte_length" in archive else {}),
            }
            if prior is not None and prior != stable:
                raise ValueError(f"archive metadata conflict for {selector}")
            archive_map[selector] = stable
        for entry in document["entries"]:
            selector = entry.get("selector", archive_documents[0]["selector"])
            entry = dict(entry)
            entry["selector"] = selector
            key = (selector, int(entry["entry_index"]))
            if key in entry_map:
                raise ValueError(f"duplicate translated entry {key}")
            if entry.get("status") != "machine_draft_needs_human_review":
                raise ValueError(f"{entry['entry_id']}: unexpected review state")
            entry_map[key] = entry
        batch_records.append({"filename": path.name, "sha256": sha256(payload), "entry_count": len(document["entries"])})
    slot_path = translations_dir / SLOT_TRANSLATION_FILENAME
    if apply_slots and slot_path.is_file():
        apply_slot_translations(entry_map, json.loads(slot_path.read_bytes()))
    return entry_map, archive_map, batch_records


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-rom", type=Path, required=True)
    parser.add_argument("--base-translation", type=Path, required=True)
    parser.add_argument("--translations-dir", type=Path, required=True)
    parser.add_argument("--analysis-dir", type=Path, required=True)
    parser.add_argument("--textpet-exe", type=Path, required=True)
    parser.add_argument("--plugins-dir", type=Path, required=True)
    parser.add_argument("--exe1-k-font-rom", type=Path, required=True)
    parser.add_argument("--font-permission-record", type=Path, required=True)
    parser.add_argument("--fallback-font", type=Path, required=True)
    parser.add_argument("--fallback-font-index", type=int, default=0)
    parser.add_argument("--fallback-font-size", type=int, default=16)
    parser.add_argument("--output-rom", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--force", action="store_true")
    parser.add_argument("--legacy-menu-renderer", action="store_true", help="Diagnostic only: reproduce pre-MyBoy-fix renderer")
    args = parser.parse_args()

    for output in (args.output_rom, args.manifest):
        if output.exists() and not args.force:
            raise FileExistsError(output)
    source = args.source_rom.read_bytes()
    if sha256(source) != SOURCE_SHA256 or len(source) != 0x800000:
        raise ValueError("supported Rev 1 source ROM identity mismatch")
    if sha256(args.textpet_exe.read_bytes()) != TEXTPET_SHA256:
        raise ValueError("TextPet executable identity mismatch")
    if sha256((args.plugins_dir / "exe2-utf8.tbl").read_bytes()) != TEXTPET_EXE2_TABLE_SHA256:
        raise ValueError("verified TextPet EXE2 table identity mismatch")
    if sha256((args.plugins_dir / "mmbn2.ini").read_bytes()) != TEXTPET_MMBN2_COMMANDS_SHA256:
        raise ValueError("verified TextPet MMBN2 command database identity mismatch")
    exe1 = load_exe1_font(args.exe1_k_font_rom)
    if not args.fallback_font.is_file():
        raise FileNotFoundError(args.fallback_font)
    if args.fallback_font_index < 0 or args.fallback_font_size <= 0:
        raise ValueError("fallback font index and size must be non-negative")
    fallback_font_bytes = args.fallback_font.read_bytes()
    fallback_face = ImageFont.truetype(
        str(args.fallback_font), args.fallback_font_size, index=args.fallback_font_index
    )
    fallback_family, fallback_style = fallback_face.getname()
    permission = json.loads(args.font_permission_record.read_text(encoding="utf-8"))
    if permission.get("source_asset", {}).get("sha256") != EXE1_K_SHA256:
        raise ValueError("font permission record does not identify the selected font source")
    if permission.get("adopted_effect", {}).get("font_reuse_permission_status") != "permission_received_user_attested":
        raise ValueError("font permission is not adopted")

    entries, archives, batches = load_batches(args.translations_dir)
    # 7954 protected batch entries plus the 1241 translated entries of the
    # 25 uncatalogued archives the pointer scan recovered (10 raw, 15 LZ77).
    if len(entries) != 9195:
        raise ValueError(f"protected batch entry count changed: {len(entries)}")
    base_translation_bytes = args.base_translation.read_bytes()
    if sha256(base_translation_bytes) != BASE_TRANSLATION_SHA256:
        raise ValueError("base archive translation identity mismatch")
    base_translation = json.loads(base_translation_bytes)
    base_entries = {int(entry["entry_index"]): entry for entry in base_translation["entries"]}
    if len(base_entries) != 70:
        raise ValueError("base archive translation entry count changed")
    shared_selector = "00/404"
    existing_shared = {index for selector, index in entries if selector == shared_selector}
    carry_indices = set(base_entries) - existing_shared
    if carry_indices != {233, 235}:
        raise ValueError(f"unexpected base-only shared-archive entries: {sorted(carry_indices)}")
    shared_tpl_path = args.analysis_dir / archives[shared_selector]["tpl_filename"]
    shared_tpl_text = shared_tpl_path.read_bytes().decode("utf-8-sig")
    shared_blocks = {
        int(match.group(1)): match.group(0)
        for match in SCRIPT_RE.finditer(shared_tpl_text)
    }
    for index in sorted(carry_indices):
        legacy = base_entries[index]
        source_entry = bytes.fromhex(legacy["original_entry_raw_hex"])
        entries[(shared_selector, index)] = {
            "entry_id": legacy["entry_id"],
            "selector": shared_selector,
            "entry_index": index,
            "source_entry_sha256": sha256(source_entry),
            "source_entry_raw_hex": source_entry.hex(" "),
            "source_tpl_block_sha256": sha256(shared_blocks[index].encode("utf-8")),
            "draft_translation": legacy["draft_translation"],
            "status": "machine_draft_needs_human_review",
            "review_notes": legacy.get("review_notes", []),
            "provenance": "base_archive_translation_addendum",
        }
    batches.append({
        "filename": args.base_translation.name,
        "sha256": BASE_TRANSLATION_SHA256,
        "entry_count": len(carry_indices),
        "role": "base_only_shared_archive_addendum",
    })
    if len(entries) != 9197:
        raise ValueError(f"protected integrated entry count changed: {len(entries)}")
    source_raw: dict[str, bytes] = {}
    source_trailing: dict[str, bytes] = {}
    source_tpl: dict[str, bytes] = {}
    for selector, metadata in archives.items():
        raw, trailing = load_source_archive(source, metadata)
        source_raw[selector] = raw
        source_trailing[selector] = trailing
        tpl_path = args.analysis_dir / metadata["tpl_filename"]
        tpl_bytes = tpl_path.read_bytes()
        if sha256(tpl_bytes) != metadata["tpl_sha256"]:
            raise ValueError(f"{selector}: protected TPL hash mismatch")
        source_tpl[selector] = tpl_bytes
        if HANGUL_ESCAPE in raw:
            raise ValueError(f"{selector}: selected Hangul escape collides with source archive bytes")

    # Archives the map dialogue loader resolves stay in ROM, uncompressed, so the
    # 14,336-byte EWRAM buffer stops bounding how long a translated map script can be.
    rom_resident = dialogue_rom.reachable(
        source, {int(meta["archive_offset"]) for meta in archives.values()})
    board_destinations = bulletin_board_destinations(source)

    physical_continuations = find_raw_physical_continuations(
        source, archives, source_raw, source_tpl, source_trailing)

    physical_translation_path = args.translations_dir / "physical_continuation_translations.json"
    physical_translation_bytes = physical_translation_path.read_bytes()
    physical_translation_document = json.loads(physical_translation_bytes)
    if physical_translation_document.get("kind") != "protected_exe2_physical_continuation_translation_set":
        raise ValueError("unexpected physical continuation translation set kind")
    physical_translations: dict[str, dict] = {}
    for record in physical_translation_document["records"]:
        selector = record["selector"]
        if selector in physical_translations:
            raise ValueError(f"{selector}: duplicate physical continuation translation")
        continuation = physical_continuations.get(selector)
        if continuation is None:
            raise ValueError(f"{selector}: translated physical continuation is not present in the source")
        if record.get("head_of_gap"):
            # A bulk gap: one tail script, then data nothing reads through
            # this archive. The translation replaces the head script only and
            # the relocated copy stops there; the gap itself stays in place.
            payload = continuation["payload"]
            head = int(record["source_byte_length"])
            if (
                record["source_rom_offset"] != continuation["source_rom_offset"]
                or int(record["gap_byte_length"]) != len(payload)
                or record["gap_sha256"] != continuation["source_sha256"]
                or not 0 < head < len(payload)
                or sha256(payload[:head]) != record["source_sha256"]
            ):
                raise ValueError(f"{selector}: physical continuation head identity mismatch")
        elif (
            record["source_rom_offset"] != continuation["source_rom_offset"]
            or int(record["source_byte_length"]) != len(continuation["payload"])
            or record["source_sha256"] != continuation["source_sha256"]
        ):
            raise ValueError(f"{selector}: physical continuation source identity mismatch")
        source_continuation_tpl = args.analysis_dir / "physical_continuation_tpl" / record["source_tpl_filename"]
        if sha256(source_continuation_tpl.read_bytes()) != record["source_tpl_sha256"]:
            raise ValueError(f"{selector}: physical continuation source TPL mismatch")
        translated_tpl_path = args.translations_dir / record["translated_tpl_filename"]
        translated_tpl = translated_tpl_path.read_bytes()
        if sha256(translated_tpl) != record["translated_tpl_sha256"]:
            raise ValueError(f"{selector}: physical continuation translated TPL mismatch")
        if record.get("status") != "machine_draft_needs_human_review":
            raise ValueError(f"{selector}: unexpected physical continuation review state")
        physical_translations[selector] = {"record": record, "tpl": translated_tpl}

    required_hangul = sorted(
        {char for entry in entries.values() for char in HANGUL_RE.findall(translated_text(entry))}
        | {char for item in physical_translations.values() for char in HANGUL_RE.findall(item["tpl"].decode("utf-8-sig"))}
    )
    for char in required_hangul:
        hangul_ordinal(char)

    clean_base = source + bytes((0xFF,)) * (OUTPUT_SIZE - len(source))
    output = bytearray(clean_base)
    expected_writes: list[dict] = []
    archive_reports: list[dict] = []
    skipped_entries = 0

    args.output_rom.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="tmp-exe2-semantic-build-", dir=args.output_rom.parent) as temp_name:
        temp = Path(temp_name)
        plugins = temp / "plugins"
        tpl_input = temp / "tpl"
        bin_output = temp / "bin"
        shutil.copytree(args.plugins_dir, plugins)
        tpl_input.mkdir()
        bin_output.mkdir()
        table_path = plugins / "exe2-utf8.tbl"
        table_text = table_path.read_text(encoding="utf-8-sig")
        table_additions = []
        for char in required_hangul:
            ordinal = hangul_ordinal(char)
            table_additions.append(f"F9FC{ordinal & 0xFF:02X}{ordinal >> 8:02X}={char}")
        table_path.write_text(table_text.rstrip() + "\n" + "\n".join(table_additions) + "\n", encoding="utf-8")
        layout_mapping = table_mapping(table_text + "\n" + "\n".join(table_additions))

        transformed_by_selector: dict[str, bytes] = {}
        transform_meta: dict[tuple[str, int], dict] = {}
        window_breaks: list[dict] = []
        window_checked = 0
        # Printed names at the width the game will draw them: item names are
        # archive 00/359's translated entries, chip names the relocated table.
        name_width = choice_layout.name_widths(
            {index: translated_text(entry) for (selector, index), entry in entries.items()
             if selector == "00/359"},
            printed_chip_names(source))
        for selector, tpl_bytes in source_tpl.items():
            if selector in SKIPPED_NO_LITERAL_POINTER:
                skipped_entries += sum(1 for key in entries if key[0] == selector)
                continue
            text = tpl_bytes.decode("utf-8-sig")
            pieces: list[str] = []
            cursor = 0
            seen: set[int] = set()
            for match in SCRIPT_RE.finditer(text):
                entry_index = int(match.group(1))
                pieces.append(text[cursor:match.start()])
                block = match.group(0)
                entry = entries.get((selector, entry_index))
                if entry is not None:
                    raw = source_raw[selector]
                    offsets = archive_offsets(raw)
                    left, right = offsets[entry_index], offsets[entry_index + 1]
                    source_entry = raw[left:right]
                    if sha256(source_entry) != entry["source_entry_sha256"] or source_entry.hex(" ") != entry["source_entry_raw_hex"]:
                        raise ValueError(f"{entry['entry_id']}: protected source entry mismatch")
                    if sha256(block.encode("utf-8")) != entry["source_tpl_block_sha256"]:
                        raise ValueError(f"{entry['entry_id']}: protected source TPL block mismatch")
                    try:
                        source_block = block
                        block, detail = translate_block(block, entry)
                        if entry['entry_id'] in REVIEWED_IDS:
                            layout_detail = validate_choice_layout(source_block, block, entry['entry_id'])
                        else:
                            block, layout_detail = layout_script(source_block, block, entry["entry_id"])
                        detail["dialogue_layout"] = layout_detail
                        # Every window, not only choices: the whitespace
                        # layout pass measures a printed name as nothing, and
                        # a name is what pushes a line past the box.
                        window_checked += 1
                        found = choice_layout.problems(source_block, block, name_width)
                        if found:
                            window_breaks.append({"entry_id": entry["entry_id"],
                                                  "problems": found})
                        if detail.get("literal_substitution"):
                            # Every slot was authored, so every slot is checked
                            # in the compiled bytes - not only pages the layout
                            # pass happened to rewrite.
                            detail["exact_literals"] = [layout_literal(q) for q in QUOTE_RE.finditer(block)]
                    except (ValueError, AssertionError) as error:
                        raise type(error)(f"{entry['entry_id']}: {error}") from error
                    transform_meta[(selector, entry_index)] = detail
                    seen.add(entry_index)
                pieces.append(block)
                cursor = match.end()
            pieces.append(text[cursor:])
            expected_ids = {key[1] for key in entries if key[0] == selector}
            if seen != expected_ids:
                missing = sorted(expected_ids - seen)
                raise ValueError(f"{selector}: translated scripts missing from TPL: {missing[:10]}")
            transformed = "".join(pieces).encode("utf-8-sig")
            transformed_by_selector[selector] = transformed
            (tpl_input / f"{int(archives[selector]['archive_offset']):07X}.tpl").write_bytes(transformed)

        for selector, item in physical_translations.items():
            name = continuation_archive_name(physical_continuations[selector])
            (tpl_input / f"{name}.tpl").write_bytes(item["tpl"])

        run_textpet(args.textpet_exe, plugins, tpl_input, bin_output)
        placement = ARCHIVE_RELOCATION_BASE
        for selector in sorted(transformed_by_selector, key=lambda item: int(archives[item]["archive_offset"])):
            metadata = archives[selector]
            source_offset = int(metadata["archive_offset"])
            msg_path = bin_output / f"{source_offset:07X}.msg"
            if not msg_path.is_file():
                raise FileNotFoundError(msg_path)
            rebuilt = msg_path.read_bytes()
            rebuilt_offsets = archive_offsets(rebuilt)
            original = source_raw[selector]
            original_offsets = archive_offsets(original)
            if len(rebuilt_offsets) != len(original_offsets):
                raise ValueError(f"{selector}: entry count changed during TextPet rebuild")

            selected_ids = sorted(key[1] for key in entries if key[0] == selector)
            selected_set = set(selected_ids)
            for entry_index in range(len(original_offsets) - 1):
                before = original[original_offsets[entry_index]:original_offsets[entry_index + 1]]
                after = rebuilt[rebuilt_offsets[entry_index]:rebuilt_offsets[entry_index + 1]]
                if entry_index not in selected_set and before != after:
                    raise ValueError(f"{selector}/{entry_index}: untranslated entry changed")
            decoded_hangul: list[str] = []
            for entry_index in selected_ids:
                raw_entry = rebuilt[rebuilt_offsets[entry_index]:rebuilt_offsets[entry_index + 1]]
                layout = transform_meta[(selector, entry_index)].get("dialogue_layout")
                if layout is not None:
                    verify_changed_literals(raw_entry, layout, layout_mapping)
                exact = transform_meta[(selector, entry_index)].get("exact_literals")
                if exact is not None:
                    verify_changed_literals(raw_entry, {
                        "entry_id": f"{selector}/{entry_index}",
                        "pages": [{"status": "changed", "text_after": exact}],
                    }, layout_mapping)
                pos = 0
                while True:
                    pos = raw_entry.find(HANGUL_ESCAPE, pos)
                    if pos < 0:
                        break
                    if pos + 4 > len(raw_entry):
                        raise ValueError(f"{selector}/{entry_index}: truncated Hangul escape")
                    ordinal = raw_entry[pos + 2] | (raw_entry[pos + 3] << 8)
                    try:
                        decoded_hangul.append(hangul_from_ordinal(ordinal))
                    except ValueError as error:
                        raise ValueError(f"{selector}/{entry_index}: {error}") from error
                    pos += 4
            expected_hangul = [
                char
                for entry_index in selected_ids
                for char in transform_meta[(selector, entry_index)]["expected_hangul"]
            ]
            if decoded_hangul != expected_hangul:
                raise ValueError(f"{selector}: rebuilt Hangul sequence differs from the selected translations")

            continuation = physical_continuations.get(selector)
            continuation_payload = continuation["payload"] if continuation is not None else b""
            continuation_translation = physical_translations.get(selector)
            if continuation_translation is not None:
                continuation_msg = bin_output / f"{continuation_archive_name(continuation)}.msg"
                if not continuation_msg.is_file():
                    raise FileNotFoundError(continuation_msg)
                continuation_archive = continuation_msg.read_bytes()
                continuation_offsets = archive_offsets(continuation_archive)
                if len(continuation_offsets) != 2:
                    raise ValueError(f"{selector}: translated continuation must contain exactly one script")
                continuation_payload = continuation_archive[continuation_offsets[0]:continuation_offsets[1]]
                # TextPet silently discards characters absent from its table.
                # Reject a tail unless every authored literal (including its
                # punctuation and whitespace) survives compilation in order.
                tail_literals = [layout_literal(q) for q in QUOTE_RE.finditer(
                    continuation_translation["tpl"].decode("utf-8-sig"))]
                verify_changed_literals(continuation_payload, {
                    "entry_id": f"{selector}/physical-continuation",
                    "pages": [{"status": "changed", "text_after": tail_literals}],
                }, layout_mapping)
            resident = int(metadata["archive_offset"]) in rom_resident
            destination, limit, budget = ewram_budget(
                selector, int(metadata["archive_offset"]), board_destinations)
            decompressed_length = len(rebuilt) + len(continuation_payload)
            # Only a compressed archive is unpacked into that buffer; a raw one
            # is read where it lies in ROM, so the ceiling does not apply to it.
            if metadata["storage"] == "lz77" and not resident and decompressed_length > budget:
                raise ValueError(
                    f"{selector}: decompressed archive is {decompressed_length} bytes, "
                    f"over the {budget}-byte EWRAM budget at 0x{destination:08X} "
                    f"(next allocation 0x{limit:08X}); the source archive is "
                    f"{len(original)} bytes"
                )
            if resident:
                if continuation is not None:
                    raise ValueError(f"{selector}: a ROM-resident archive cannot carry a continuation")
                stored = rebuilt
            elif metadata["storage"] == "lz77":
                if continuation is not None and continuation.get("storage_form") != "inside_decompressed_buffer":
                    raise AssertionError(f"{selector}: compressed continuation passed validation unexpectedly")
                # The terminator travels inside the blob, so it has to be
                # compressed with the payload rather than appended after it.
                stored = compress(rebuilt + continuation_payload)
            else:
                stored = rebuilt + continuation_payload
            placement = (placement + 3) & ~3
            end = placement + len(stored)
            if end > OUTPUT_SIZE:
                raise ValueError("relocated archives exceed the expanded ROM")
            if any(value != 0xFF for value in clean_base[placement:end]):
                raise ValueError(f"{selector}: relocation target is not clean expanded-ROM fill")
            output[placement:end] = stored

            pointer = struct.pack("<I", ROM_BASE + source_offset)
            replacement_pointer = struct.pack("<I", ROM_BASE + placement)
            pointer_locations = [
                pos for pos in range(0, len(source) - 3, 4)
                if source[pos:pos + 4] == pointer
            ]
            if not pointer_locations:
                raise ValueError(f"{selector}: no aligned literal source pointer")
            for pointer_offset in pointer_locations:
                if source[pointer_offset:pointer_offset + 4] != pointer:
                    raise ValueError(f"{selector}: immutable source pointer mismatch")
                output[pointer_offset:pointer_offset + 4] = replacement_pointer
                expected_writes.append({
                    "kind": "archive_pointer",
                    "selector": selector,
                    "rom_offset": pointer_offset,
                    "expected_source_hex": pointer.hex(" "),
                    "replacement_hex": replacement_pointer.hex(" "),
                })
            expected_writes.append({
                "kind": "relocated_archive",
                "selector": selector,
                "rom_offset": placement,
                "byte_length": len(stored),
                "sha256": sha256(stored),
                "storage": "raw" if resident else metadata["storage"],
            })
            archive_report = {
                "selector": selector,
                "source_rom_offset": source_offset,
                "source_decompressed_sha256": sha256(original),
                "translated_entry_count": len(selected_ids),
                "replacement_decompressed_byte_length": len(rebuilt),
                "ewram_destination": destination,
                "ewram_budget": budget,
                "replacement_decompressed_sha256": sha256(rebuilt),
                "replacement_stored_byte_length": len(stored),
                "replacement_stored_sha256": sha256(stored),
                "storage": "raw" if resident else metadata["storage"],
                "source_storage": metadata["storage"],
                "rom_resident_dialogue": resident,
                "relocated_rom_offset": placement,
                "pointer_locations": pointer_locations,
                "untranslated_entries_byte_identical": True,
                "hangul_sequence_verified": True,
            }
            if continuation is not None:
                archive_report["physical_continuation"] = {
                    "reason": continuation.get("reason", "terminal jump target resolves to bytes immediately after the formal raw archive"),
                    "source_rom_offset": continuation["source_rom_offset"],
                    "source_byte_length": len(continuation["payload"]),
                    "source_sha256": continuation["source_sha256"],
                    "storage_form": continuation.get("storage_form", "rom_bytes_after_archive"),
                    "replacement_byte_length": len(continuation_payload),
                    "replacement_sha256": sha256(continuation_payload),
                    "translated": continuation_translation is not None,
                    "next_catalog_selector": continuation["next_catalog_selector"],
                    "outbound_entries": continuation["outbound_entries"],
                }
                if continuation.get("storage_form") != "inside_decompressed_buffer":
                    archive_report["physical_continuation"]["relocated_rom_offset"] = placement + len(rebuilt)
                if continuation_translation is not None:
                    archive_report["physical_continuation"]["translation_asset"] = {
                        "filename": continuation_translation["record"]["translated_tpl_filename"],
                        "sha256": continuation_translation["record"]["translated_tpl_sha256"],
                        "status": continuation_translation["record"]["status"],
                    }
                    if continuation_translation["record"].get("head_of_gap"):
                        # Only the gap's head script was translated and carried.
                        archive_report["physical_continuation"]["translated_head_source_byte_length"] = int(
                            continuation_translation["record"]["source_byte_length"])
            archive_reports.append(archive_report)
            placement = end

    font_start = EXE1_FONT_BASE + HANGUL_BASE_INDEX * FONT_RECORD_BYTES
    font_end = font_start + KS_X_1001_HANGUL_COUNT * FONT_RECORD_BYTES
    master_font = exe1[font_start:font_end]
    if len(master_font) != KS_X_1001_HANGUL_COUNT * FONT_RECORD_BYTES:
        raise ValueError("EXE 1 [K] Hangul font payload is incomplete")
    fallback_records = bytearray()
    for character, ordinal in sorted(FALLBACK_HANGUL.items(), key=lambda item: item[1]):
        expected_ordinal = KS_X_1001_HANGUL_COUNT + len(fallback_records) // FONT_RECORD_BYTES
        if ordinal != expected_ordinal:
            raise ValueError("fallback Hangul ordinals must form a dense suffix")
        fallback_records.extend(encode_4bpp(make_mask(
            args.fallback_font,
            character,
            args.fallback_font_size,
            args.fallback_font_index,
        )))
    master_font += bytes(fallback_records)
    if any(value != 0xFF for value in clean_base[MASTER_FONT_BASE:MASTER_FONT_BASE + len(master_font)]):
        raise ValueError("master Hangul font target is not clean expanded-ROM fill")
    output[MASTER_FONT_BASE:MASTER_FONT_BASE + len(master_font)] = master_font
    expected_writes.append({
        "kind": "master_hangul_font",
        "rom_offset": MASTER_FONT_BASE,
        "record_count": KS_X_1001_HANGUL_COUNT + len(FALLBACK_HANGUL),
        "record_byte_length": FONT_RECORD_BYTES,
        "sha256": sha256(master_font),
    })

    trampolines = [
        ("main_dispatch", TRAMPOLINE_BASE, *make_main_dispatch_trampoline(TRAMPOLINE_BASE)),
        ("scanner", TRAMPOLINE_BASE + 0x100, *make_scanner_trampoline(TRAMPOLINE_BASE + 0x100)),
        ("font_base", TRAMPOLINE_BASE + 0x200, *make_font_base_trampoline(TRAMPOLINE_BASE + 0x200)),
        ("dialogue_reader_base", dialogue_rom.READER_TRAMPOLINE,
         *dialogue_rom.make_reader_trampoline(ThumbBlob, dialogue_rom.READER_TRAMPOLINE)),
    ]
    disassembly: dict[str, list[str]] = {}
    for name, offset, code, code_byte_length in trampolines:
        if any(value != 0xFF for value in clean_base[offset:offset + len(code)]):
            raise ValueError(f"{name} trampoline target is not clean expanded-ROM fill")
        output[offset:offset + len(code)] = code
        disassembly[name] = verify_thumb(code, code_byte_length, offset)
        expected_writes.append({"kind": "thumb_trampoline", "name": name, "rom_offset": offset, "byte_length": len(code), "code_byte_length": code_byte_length, "literal_pool_byte_length": len(code) - code_byte_length, "sha256": sha256(code)})

    hook_specs = [
        (MAIN_DISPATCH_HOOK, bytes.fromhex("e7 29 00 da 08 e0"), hook_stub(MAIN_DISPATCH_HOOK, TRAMPOLINE_BASE, 0)[:6], "main_dispatch"),
        (SCANNER_HOOK, bytes.fromhex("e7 29 04 da e5 29 0e d0"), hook_stub(SCANNER_HOOK, TRAMPOLINE_BASE + 0x100, 0), "scanner"),
        (FONT_BASE_HOOK, bytes.fromhex("88 46 78 48 89 01 40 18"), hook_stub(FONT_BASE_HOOK, TRAMPOLINE_BASE + 0x200, 3), "font_base"),
        *dialogue_rom.hook_specs(),
    ]
    # MAIN_DISPATCH_HOOK uses a 6-byte stub whose literal occupies the two
    # overwritten bytes at 0x20C74..77; build it explicitly as ldr/bx/literal.
    main_stub = hook_stub(MAIN_DISPATCH_HOOK, TRAMPOLINE_BASE, 0)
    hook_specs[0] = (MAIN_DISPATCH_HOOK, source[MAIN_DISPATCH_HOOK:MAIN_DISPATCH_HOOK + 8], main_stub, "main_dispatch")
    for offset, expected, replacement, name in hook_specs:
        if source[offset:offset + len(expected)] != expected:
            raise ValueError(f"{name}: immutable hook source mismatch")
        output[offset:offset + len(replacement)] = replacement
        expected_writes.append({
            "kind": "thumb_hook",
            "name": name,
            "rom_offset": offset,
            "expected_immutable_source_hex": expected.hex(" "),
            "replacement_hex": replacement.hex(" "),
        })

    menu_hook = None
    if not args.legacy_menu_renderer:
        menu_writes, menu_code, menu_hook = menu_hook_writes(source, clean_base)
        # The new allocation and copied pointer slot must not overlap any prior writer.
        from verify_semantic_translation_emulator_rom import expected_range
        prior_ranges = [expected_range(w) for w in expected_writes]
        for write in menu_writes:
            lo, hi, _ = expected_range(write)
            if any(lo < b and a < hi for a, b, _ in prior_ranges):
                raise ValueError("menu renderer overlaps another Expected Write")
        for write in menu_writes:
            start = write["rom_offset"]
            payload = menu_code if start == MENU_HOOK_OFFSET else bytes.fromhex(write["replacement_hex"])
            output[start:start + len(payload)] = payload
        expected_writes.extend(menu_writes)

    pet_writes, pet_graphics = pet_graphics_writes(source, master_font)
    for write in pet_writes:
        start = write['rom_offset']
        payload = bytes.fromhex(write['replacement_hex'])
        output[start:start+len(payload)] = payload
    expected_writes.extend(pet_writes)

    # Chip Folder/Library names, descriptions, and the shared PET submenu UI
    # are static 16-bit relative tables outside TextPet archives.  Relocate
    # them into clean expanded-ROM space and patch every aligned consumer.
    static_writes, static_submenus = static_submenu_writes(source)
    title_writes, submenu_graphics = submenu_graphics_writes(source, master_font)
    static_writes.extend(title_writes)
    menu_writes, title_menu = title_menu_writes(source, master_font)
    static_writes.extend(menu_writes)
    # The OK/ADD message panels of the custom screen are pictures, not text.
    panel_writes, chip_panels = chip_panel_writes(source, master_font)
    static_writes.extend(panel_writes)
    # So are the battle result windows' labels (virus, WINNER, LOSER).
    result_writes, result_windows = result_window_writes(source, master_font)
    static_writes.extend(result_writes)
    from verify_semantic_translation_emulator_rom import expected_range
    prior_ranges = [expected_range(w) for w in expected_writes]
    for write in static_writes:
        lo, hi, _ = expected_range(write)
        clash = next(((a, b, k) for a, b, k in prior_ranges if lo < b and a < hi), None)
        if clash is not None:
            raise ValueError(
                f"static submenu table overlaps another Expected Write: "
                f"{write['kind']} 0x{lo:X}..0x{hi:X} vs {clash[2]} 0x{clash[0]:X}..0x{clash[1]:X}")
        if write["kind"] == "static_table_asset":
            start = write["rom_offset"]
            payload = bytes.fromhex(write["replacement_hex"])
            if any(value != 0xFF for value in clean_base[start:start + len(payload)]):
                raise ValueError(f"static submenu target 0x{start:X} is not clean expanded fill")
            output[start:start + len(payload)] = payload
        else:
            start = write["rom_offset"]
            replacement = bytes.fromhex(write["replacement_hex"])
            output[start:start + len(replacement)] = replacement
    expected_writes.extend(static_writes)

    # A line wider than the dialogue window is not a cosmetic overflow: the
    # renderer keeps writing past the window's reserved tiles and the screen
    # that follows hangs on real hardware, which is how the tutorial battle
    # froze. The original never exceeds the window, so anything that does is
    # ours - refuse to write a ROM that carries one.
    all_layout_overruns = layout_capacity_violations(
        [item["dialogue_layout"] for item in transform_meta.values() if "dialogue_layout" in item])
    # Only the standard dialogue box has a measured geometry. Choice and
    # cursor-positioned windows draw elsewhere, so an overrun measured
    # against 21x3 there is a lead, not a proven defect - record those and
    # stop the build only for the box we know.
    layout_violations = [x for x in all_layout_overruns if x.get("window") != "nonstandard"]
    layout_leads = [x for x in all_layout_overruns if x.get("window") == "nonstandard"]
    if all_layout_overruns or window_breaks:
        report = args.manifest.with_name(args.manifest.stem + '_layout_violations.json')
        report.parent.mkdir(parents=True, exist_ok=True)
        report.write_text(json.dumps(
            {'blocking': layout_violations, 'nonstandard_window_leads': layout_leads,
             'windows': window_breaks},
            ensure_ascii=False, indent=1), encoding='utf-8')
    # A choice window is the same box with a cursor, so its geometry is known
    # too: a shifted choice, or any page past the window the source draws once
    # printed names are counted, is a defect this pipeline made, and the build
    # refuses it like any other.
    if window_breaks:
        lines = [f"{len(window_breaks)} windows break the layout their source draws:"]
        for item in window_breaks[:40]:
            lines.append(f"  {item['entry_id']}: {'; '.join(item['problems'])}")
        raise ValueError(chr(10).join(lines))
    if layout_violations:
        lines = [f"{len(layout_violations)} dialogue pages exceed the "
                 f"{DIALOGUE_WINDOW_CELLS}-cell x {DIALOGUE_WINDOW_ROWS}-row window "
                 f"the source stays inside:"]
        for item in layout_violations:
            where = (f"slots {item['slots']}" if 'slots' in item else f"literal {item['literal']}")
            lines.append(f"  {item['entry_id']} {where}: source "
                         f"{item['source']['rows']}x{max(item['source']['columns'])} -> "
                         f"shipped {item['shipped']['rows']}x{max(item['shipped']['columns'])} "
                         f"({item['blocked_by']})")
        raise ValueError(chr(10).join(lines))

    output_bytes = bytes(output)
    if len(output_bytes) != OUTPUT_SIZE:
        raise AssertionError("final ROM size changed")
    if output_bytes[0xA0:0xC0] != source[0xA0:0xC0]:
        raise AssertionError("GBA header changed unexpectedly")
    from verify_semantic_translation_emulator_rom import verify_final_write_plan
    verify_final_write_plan(source, output_bytes, expected_writes)
    args.output_rom.write_bytes(output_bytes)

    applied_entries = len(entries) - skipped_entries
    manifest = {
        "schema_version": 1,
        "kind": "non_distributable_semantic_translation_development_rom",
        "artifact_role": "emulator_validation_candidate",
        "input_policy": "development_poc_machine_draft",
        "immutable_source": {"filename": args.source_rom.name, "sha256": SOURCE_SHA256, "byte_length": len(source)},
        "toolchain": {
            "textpet": {"filename": args.textpet_exe.name, "sha256": TEXTPET_SHA256},
            "plugins": {
                "exe2_table": {"filename": "exe2-utf8.tbl", "sha256": TEXTPET_EXE2_TABLE_SHA256},
                "mmbn2_commands": {"filename": "mmbn2.ini", "sha256": TEXTPET_MMBN2_COMMANDS_SHA256},
            },
        },
        "clean_build": {
            "built_directly_from_immutable_source": True,
            "expanded_fill_byte": "FF",
            "expanded_output_byte_length": OUTPUT_SIZE,
            "shared_archive_source_rom_offset": int(archives[shared_selector]["archive_offset"]),
        },
        "translation_batches": batches,
        "pet_menu_graphics": pet_graphics,
        "static_submenu_tables": static_submenus,
        "submenu_title_graphics": submenu_graphics,
        "title_menu_graphics": title_menu,
        "chip_panel_graphics": chip_panels,
        "result_window_graphics": result_windows,
        "reviewed_choice_layout": {
            "module_sha256": sha256(Path(__file__).with_name('reviewed_choice_layout.py').read_bytes()),
            "entry_ids": sorted(REVIEWED_IDS),
        },
        "choice_layout": {
            "module_sha256": sha256(Path(__file__).with_name('choice_layout.py').read_bytes()),
            "policy": "entries with option commands keep the source's choice slots and suffixes; "
                      "every translated entry fails the build on a blank or grown choice or a "
                      "page past the source's window, printed names at their real width",
            "checked_entries": window_checked,
            "breaks": len(window_breaks),
        },
        "dialogue_layout": {
            "policy": "whitespace_only_standard_dialogue_21_cells_3_rows",
            "capacity_gate": "build fails when a standard-window page the source fits exceeds 21x3",
            "nonstandard_window_overrun_count": len(layout_leads),
            "module_sha256": sha256(Path(__file__).with_name("dialogue_layout.py").read_bytes()),
            "scope": "Formal translated entries with explicit standard msgOpen and supported controls; choices, dynamic fields and unresolved page capacity remain deferred.",
            "summary": dict(Counter(item["dialogue_layout"]["status"] for item in transform_meta.values() if "dialogue_layout" in item)),
            "entries": [item["dialogue_layout"] for item in transform_meta.values() if "dialogue_layout" in item and item["dialogue_layout"]["status"] != "unchanged"],
        },
        "physical_continuation_translation_set": {
            "filename": physical_translation_path.name,
            "sha256": sha256(physical_translation_bytes),
            "record_count": len(physical_translations),
        },
        "slot_translation_set": {
            "filename": SLOT_TRANSLATION_FILENAME,
            "sha256": sha256((args.translations_dir / SLOT_TRANSLATION_FILENAME).read_bytes())
                      if (args.translations_dir / SLOT_TRANSLATION_FILENAME).is_file() else None,
            "record_count": sum(1 for entry in entries.values() if entry.get("slot_translation")),
        },
        "translation_scope": {
            "protected_batch_entry_count": len(entries),
            "applied_batch_entry_count": applied_entries,
            "base_only_addendum_entry_count": len(carry_indices),
            "overlapping_base_entries_recompiled_from_batch": len(existing_shared),
            "total_unique_translated_entry_count_in_output": applied_entries,
            "translated_physical_continuation_count": len(physical_translations),
            "source_language_physical_continuation_count": len(physical_continuations) - len(physical_translations),
            "skipped": [{
                "selector": "00/357",
                "entry_count": skipped_entries,
                "reason": "No aligned literal pointer to the raw source archive exists; relocation/reference completeness is unresolved.",
            }],
            "review_state": "machine_draft_needs_human_review",
        },
        "encoding": {
            "kind": "collision_screened_four_byte_hangul_escape",
            "prefix_hex": HANGUL_ESCAPE.hex(" "),
            "payload": "little-endian dense Hangul font-record ordinal",
            "required_distinct_hangul": len(required_hangul),
            "source_collision_count_across_verified_archives": 0,
            "punctuation_normalization": {
                "ASCII comma": "Japanese comma glyph",
                "ASCII hyphen and horizontal bar": "Japanese long-vowel-bar glyph",
                "middle dot": "Japanese middle-dot glyph",
            },
        },
        "font": {
            "source_filename": args.exe1_k_font_rom.name,
            "source_sha256": EXE1_K_SHA256,
            "permission_record": args.font_permission_record.name,
            "master_rom_offset": MASTER_FONT_BASE,
            "record_count": KS_X_1001_HANGUL_COUNT + len(FALLBACK_HANGUL),
            "record_byte_length": FONT_RECORD_BYTES,
            "payload_sha256": sha256(master_font),
            "fallback": {
                "reason": "The protected wording uses 쌰, which is outside the EXE1 KS X 1001 Hangul bank.",
                "characters": [
                    {"character": character, "unicode": f"U+{ord(character):04X}", "ordinal": ordinal}
                    for character, ordinal in sorted(FALLBACK_HANGUL.items(), key=lambda item: item[1])
                ],
                "source_filename": args.fallback_font.name,
                "source_sha256": sha256(fallback_font_bytes),
                "face_index": args.fallback_font_index,
                "font_size": args.fallback_font_size,
                "family": fallback_family,
                "style": fallback_style,
                "embedded_source_file": False,
            },
        },
        "archives": archive_reports,
        "hooks": {
            "shared_menu_renderer": menu_hook,
            "isa": "ARM7TDMI Thumb-1 little-endian",
            "marker_intercepted_before_original_F9_handler": True,
            "ordinary_F9_frames_preserved": True,
            "ordinary_Japanese_font_base_preserved": True,
            "legacy_context_font_branch_removed": True,
            "disassembly": disassembly,
        },
        "expected_writes": expected_writes,
        "verification": {
            "immutable_source_identity": True,
            "built_directly_from_immutable_source": True,
            "protected_batch_count": len(batches),
            "protected_entry_count": len(entries),
            "translated_hangul_sequences_match": True,
            "unselected_entries_in_rebuilt_archives_byte_identical": True,
            "relocated_archive_tables_reparse": True,
            "raw_physical_continuations_preserved": len(physical_continuations),
            "translated_physical_continuations_recompiled": len(physical_translations),
            "expanded_targets_were_ff": True,
            "thumb_ranges_disassembled": True,
            "runtime_verification": "PENDING_RUNTIME",
        },
        "output": {"filename": args.output_rom.name, "sha256": sha256(output_bytes), "byte_length": len(output_bytes)},
        "limitations": [
            "The 7,700 protected batch entries and the two non-overlapping base addendum entries are machine drafts and are not release eligible.",
            "The single 쌰 glyph is a recorded Gulim fallback because it is absent from the EXE1 KS X 1001 font bank.",
            "Required source literal slots left empty by merged draft phrasing contain one blank glyph because TextPet v1.0.0 rejects empty literals.",
            "Archive 00/357 remains untranslated because its relocation reference path is unresolved.",
            f"{len(physical_continuations) - len(physical_translations)} preserved physical continuation scripts remain in the source language and require separate translation review.",
            "The F9 FC Hangul escape is collision-free across the 382 verified batch archives, not the still-unclassified remainder of the 427-record catalog.",
            "The new escape and all relocated archive consumers require exact-ROM muted runtime verification before gameplay claims.",
            "This full ROM is a local development artifact and must not be distributed.",
        ],
    }
    args.manifest.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({
        "output": str(args.output_rom),
        "sha256": manifest["output"]["sha256"],
        "translated_entries": applied_entries,
        "skipped_entries": skipped_entries,
        "archive_count": len(archive_reports),
        "required_hangul": len(required_hangul),
    }, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
