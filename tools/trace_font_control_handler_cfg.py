#!/usr/bin/env python3
"""Trace bounded Thumb control flow from the 0xE7..0xFF handler-table entries.

This is deliberately a local static audit.  It records only addresses, path
classes, and r4 cursor deltas; it never writes message-stream bytes, glyphs,
or disassembled instruction listings.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from collections import Counter, deque
from dataclasses import dataclass
from pathlib import Path


EXPECTED_ROM_SHA256 = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
ROM_CPU_BASE = 0x08000000
TABLE_OFFSET = 0x20F8C
FIRST_OPCODE = 0xE7
LAST_OPCODE = 0xFF


@dataclass(frozen=True)
class State:
    pc: int
    direct_r4_delta: int | None
    call_seen: bool
    unknown_r4_write: bool


def halfword(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<H", rom, offset)[0]


def u32(rom: bytes, offset: int) -> int:
    return struct.unpack_from("<I", rom, offset)[0]


def sign_extend(value: int, bits: int) -> int:
    sign_bit = 1 << (bits - 1)
    return (value ^ sign_bit) - sign_bit


def is_bl(rom: bytes, pc: int) -> bool:
    if pc + 4 > len(rom):
        return False
    return (halfword(rom, pc) & 0xF800, halfword(rom, pc + 2) & 0xF800) == (0xF000, 0xF800)


def writes_r4(instruction: int) -> bool:
    """Conservatively identify Thumb-1 instructions that can overwrite r4.

    An affirmative result makes the tracked direct delta unknown.  False
    negatives are avoided for the common write encodings used by these
    handlers; false positives merely keep a handler in the unresolved set.
    """
    low_rd = instruction & 7

    # Shift-by-immediate and add/subtract-register/immediate-3 forms.
    if (instruction & 0xE000) == 0x0000:
        return low_rd == 4

    # MOV/CMP/ADD/SUB immediate.  CMP is the only non-writing form.
    if (instruction & 0xE000) == 0x2000:
        operation = (instruction >> 11) & 3
        return low_rd == 4 and operation != 1

    # ALU register operations: TST, CMP and CMN do not write Rd.
    if (instruction & 0xFC00) == 0x4000:
        operation = (instruction >> 6) & 0xF
        return low_rd == 4 and operation not in {8, 10, 11}

    # High-register ADD/MOV.  CMP and BX do not write a destination.
    if (instruction & 0xFC00) == 0x4400:
        operation = (instruction >> 8) & 3
        destination = (instruction & 7) | (((instruction >> 7) & 1) << 3)
        return destination == 4 and operation in {0, 2}

    # Literal and immediate loads whose destination is r4.
    if (instruction & 0xF800) == 0x4800:
        return low_rd == 4
    if (instruction & 0xE000) == 0x6000:
        load = bool(instruction & 0x0800)
        return load and low_rd == 4
    if (instruction & 0xF000) == 0x8000:
        load = bool(instruction & 0x0800)
        return load and low_rd == 4
    if (instruction & 0xF800) == 0x9800:
        return low_rd == 4
    if (instruction & 0xF000) == 0xA000:
        return low_rd == 4

    # Register-offset load/store format; classify any r4 destination/source
    # slot conservatively because bit-level variants share this range.
    if (instruction & 0xF200) == 0x5000:
        return low_rd == 4

    # POP/LDM can restore r4 from memory.
    if (instruction & 0xFE00) == 0xBC00:
        return bool(instruction & (1 << 4))
    if (instruction & 0xF800) == 0xC800:
        return bool(instruction & (1 << 4))

    return False


def terminal_key(name: str, state: State) -> tuple[str, int | None, bool, bool]:
    return name, state.direct_r4_delta, state.call_seen, state.unknown_r4_write


def trace_handler(rom: bytes, entry: int, max_states: int, max_span: int) -> dict[str, object]:
    """Explore direct Thumb branches without following calls or indirect jumps."""
    pending: deque[State] = deque([State(entry, 0, False, False)])
    visited: set[State] = set()
    terminals: Counter[tuple[str, int | None, bool, bool]] = Counter()
    instruction_steps = 0

    while pending:
        state = pending.popleft()
        if state in visited:
            continue
        if len(visited) >= max_states:
            terminals[terminal_key("state_limit", state)] += 1
            continue
        if not (0 <= state.pc <= len(rom) - 2):
            terminals[terminal_key("outside_rom", state)] += 1
            continue
        if abs(state.pc - entry) > max_span:
            terminals[terminal_key("outside_local_span", state)] += 1
            continue
        visited.add(state)
        instruction_steps += 1
        instruction = halfword(rom, state.pc)

        if is_bl(rom, state.pc):
            pending.append(State(state.pc + 4, state.direct_r4_delta, True, state.unknown_r4_write))
            continue

        # Thumb POP with PC and BX LR are direct returns from the local frame.
        if (instruction & 0xFE00) == 0xBC00 and instruction & 0x0100:
            terminals[terminal_key("return", state)] += 1
            continue
        if (instruction & 0xFF87) == 0x4700 and ((instruction >> 3) & 0xF) == 14:
            terminals[terminal_key("return", state)] += 1
            continue

        # BX to a non-LR register is an indirect transfer that cannot be
        # followed statically in this audit.
        if (instruction & 0xFF87) == 0x4700:
            terminals[terminal_key("indirect_transfer", state)] += 1
            continue

        next_delta = state.direct_r4_delta
        next_unknown = state.unknown_r4_write
        if (instruction & 0xFF00) == 0x3400:  # ADD r4, #imm8
            if next_delta is not None:
                next_delta += instruction & 0xFF
        elif (instruction & 0xFF00) == 0x3C00:  # SUB r4, #imm8
            if next_delta is not None:
                next_delta -= instruction & 0xFF
        elif writes_r4(instruction):
            next_delta = None
            next_unknown = True

        successor = State(state.pc + 2, next_delta, state.call_seen, next_unknown)

        # Conditional B<cond>; include both local possibilities.  0xE is an
        # undefined encoding and 0xF is SWI, so neither is treated as a branch.
        if (instruction & 0xF000) == 0xD000:
            condition = (instruction >> 8) & 0xF
            if condition <= 0xD:
                target = state.pc + 4 + (sign_extend(instruction & 0xFF, 8) << 1)
                pending.append(successor)
                pending.append(State(target, next_delta, state.call_seen, next_unknown))
                continue

        # Unconditional B.
        if (instruction & 0xF800) == 0xE000:
            target = state.pc + 4 + (sign_extend(instruction & 0x7FF, 11) << 1)
            pending.append(State(target, next_delta, state.call_seen, next_unknown))
            continue

        pending.append(successor)

    terminal_counts = Counter(item[0] for item, count in terminals.items() for _ in range(count))
    return_paths = [(key, count) for key, count in terminals.items() if key[0] == "return"]
    direct_values = sorted({key[1] for key, _ in return_paths if key[1] is not None})
    return_count = sum(count for _, count in return_paths)
    return_with_call = sum(count for key, count in return_paths if key[2])
    return_with_unknown = sum(count for key, count in return_paths if key[3])
    all_terminal_returns = bool(terminals) and set(terminal_counts) == {"return"}
    exact_local_width = (
        direct_values[0]
        if all_terminal_returns and len(direct_values) == 1 and return_count > 0
        and return_with_call == 0 and return_with_unknown == 0
        else None
    )
    return {
        "entry_rom_offset": entry,
        "explored_states": len(visited),
        "instruction_steps": instruction_steps,
        "limits": {"max_states": max_states, "max_span_bytes": max_span},
        "terminal_counts": dict(sorted(terminal_counts.items())),
        "return_path_count": return_count,
        "return_direct_r4_delta_values": direct_values,
        "return_paths_with_call": return_with_call,
        "return_paths_with_unknown_r4_write": return_with_unknown,
        "local_static_width_candidate": exact_local_width,
        "interpretation": (
            "candidate" if exact_local_width is not None else "unresolved"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--max-states", type=int, default=1024)
    parser.add_argument("--max-span", type=lambda value: int(value, 0), default=0x1000)
    args = parser.parse_args()
    if args.max_states <= 0 or args.max_span <= 0:
        raise ValueError("--max-states and --max-span must be positive")

    rom = args.rom.read_bytes()
    digest = hashlib.sha256(rom).hexdigest()
    if digest != EXPECTED_ROM_SHA256:
        raise ValueError(f"unexpected ROM SHA-256: {digest}")

    entries = []
    for opcode in range(FIRST_OPCODE, LAST_OPCODE + 1):
        table_entry = TABLE_OFFSET + (opcode - FIRST_OPCODE) * 4
        target = u32(rom, table_entry)
        if not target & 1:
            raise ValueError(f"non-Thumb handler table entry for opcode {opcode:#x}")
        handler = (target & ~1) - ROM_CPU_BASE
        if not 0 <= handler < len(rom):
            raise ValueError(f"handler outside ROM for opcode {opcode:#x}")
        trace = trace_handler(rom, handler, args.max_states, args.max_span)
        trace["opcode"] = opcode
        trace["handler_thumb_cpu_address"] = target
        entries.append(trace)

    candidates = [
        {"opcode": item["opcode"], "width": item["local_static_width_candidate"]}
        for item in entries if item["local_static_width_candidate"] is not None
    ]
    report = {
        "schema_version": 1,
        "input": {"filename": args.rom.name, "sha256": digest},
        "scope": {
            "opcode_range": [FIRST_OPCODE, LAST_OPCODE],
            "table_rom_offset": TABLE_OFFSET,
            "entry_count": len(entries),
        },
        "summary": {
            "local_static_width_candidate_count": len(candidates),
            "local_static_width_candidates": candidates,
            "unresolved_count": len(entries) - len(candidates),
        },
        "entries": entries,
        "interpretation_notice": (
            "A candidate is only a bounded local control-flow result: all explored terminals returned with one direct "
            "r4 delta and no observed call or r4 overwrite. It is not a confirmed command name, parser specification, "
            "or reinsertion permission. Calls and indirect transfers are intentionally not followed."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
