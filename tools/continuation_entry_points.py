"""Code that jumps straight into a physical continuation.

A raw archive's physical continuation is relocated with the archive, and the
archive pointer is redirected. But some continuations hold a second, tiny
archive of their own - a one-entry boundary table (02 00) and one script - that
game code loads directly through a literal of its own. The ending's "そして・・・
世界に へいわが もどった" (00/334), and the item and chip lines after 00/226 and
00/347, are reached only that way. Redirecting the archive pointer alone left
those literals aiming at the Japanese bytes still sitting at the old address.

This module finds those literals from the source ROM, locates the same small
archive inside the recompiled continuation, keeps its table 4-byte aligned as
the original is, and says where each literal has to point.
"""
import struct

ROM_BASE = 0x08000000
END = 0xE7
LDR_WINDOW = 1024


def _loaded_by_code(source: bytes, literal: int) -> bool:
    """True when a Thumb `ldr rX, [pc, #imm]` within 1 KB before reads this word."""
    for back in range(2, LDR_WINDOW, 2):
        pc = literal - back
        if pc < 0:
            break
        halfword = struct.unpack_from("<H", source, pc)[0]
        if halfword & 0xF800 == 0x4800 and ((pc + 4) & ~3) + (halfword & 0xFF) * 4 == literal:
            return True
    return False


def _is_archive_header(data: bytes, offset: int) -> bool:
    if offset + 2 > len(data):
        return False
    size = struct.unpack_from("<H", data, offset)[0]
    if size < 2 or size % 2 or offset + size > len(data):
        return False
    table = [struct.unpack_from("<H", data, offset + k)[0] for k in range(0, size, 2)]
    return table[0] == size and all(a <= b for a, b in zip(table, table[1:]))


def code_literals_to_archives(source: bytes) -> list[tuple[int, int]]:
    """Every (literal offset, target) where code loads a pointer to an archive header."""
    found = []
    for literal in range(0, len(source) - 3, 4):
        value = struct.unpack_from("<I", source, literal)[0] - ROM_BASE
        if 0 <= value < len(source) and _is_archive_header(source, value) and _loaded_by_code(source, literal):
            found.append((literal, value))
    return found


def code_entry_points(literals: list[tuple[int, int]], start: int, end: int) -> list[tuple[int, int]]:
    """The literals that aim strictly inside (start, end)."""
    return [(literal, target) for literal, target in literals if start < target < end]


def place_entry_points(source_payload: bytes, source_start: int, payload: bytes,
                       payload_address: int, entry_points: list[tuple[int, int]]):
    """Re-align the small archives in a recompiled continuation.

    Returns (new payload, {literal offset: new ROM offset}). Each small archive
    follows the tail script's `end` and zero padding in the source. The same
    shape - E7, zeros, 02 00 and the script's first two bytes - must occur
    exactly once in the recompiled payload. The padding is then resized so the
    table lands on a 4-byte boundary like the original.
    """
    targets = {}
    payload = bytearray(payload)
    for literal, target in sorted(entry_points, key=lambda item: item[1]):
        relative = target - source_start
        if target % 4:
            raise ValueError(f"source small archive at 0x{target:X} is not word aligned")
        zeros = 0
        while source_payload[relative - 1 - zeros] == 0x00:
            zeros += 1
        if source_payload[relative - 1 - zeros] != END:
            raise ValueError(f"small archive at 0x{target:X} does not follow an end command")
        head = source_payload[relative:relative + 4]
        needle = bytes([END]) + bytes(zeros) + head
        hits = [i for i in range(len(payload)) if payload[i:i + len(needle)] == needle]
        if len(hits) != 1:
            raise ValueError(f"small archive at 0x{target:X} found {len(hits)} times in the recompiled continuation")
        padding_at = hits[0] + 1
        header = padding_at + zeros
        shortfall = (-(payload_address + header)) % 4
        payload[padding_at:padding_at] = bytes(shortfall)
        header += shortfall
        if not _is_archive_header(bytes(payload), header):
            raise ValueError(f"relocated small archive for 0x{target:X} has no valid table")
        targets[literal] = payload_address + header
    return bytes(payload), targets
