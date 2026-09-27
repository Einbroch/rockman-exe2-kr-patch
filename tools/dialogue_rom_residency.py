"""Keep the map dialogue archives in ROM instead of unpacking them to EWRAM.

A map load decompresses that map's dialogue archive to EWRAM 0x02038800, and
unpacks the map's sprite blocks to 0x0203C000 just before it, so the archive has
14,336 bytes to live in. None of the 382 source archives comes near that - the
largest is 13,408 - but Hangul costs four bytes a character, and six translated
archives overrun and replace the sprite block headers with text. The sprite part
walker then builds its list pointer out of text bytes and never finds the 0xFF
that ends the list: black screen, audio still running. Mesen hides it because
its unmapped reads happen to end the walk; My Boy! does not.

Exactly three instructions in the whole ROM name that buffer. One of them,
0x0E594C, is not an archive base at all - that path copies graphics into the
same region and uses it as scratch - so it is left alone. The other two are the
decompression destination and the archive base the dialogue reader is started
with. Both can be redirected, because every reader reaches the archive through
that one base pointer and no game code ever writes to the unpacked archive.

So the archives stay in ROM, uncompressed, and the loader records where the
archive is instead of unpacking it. The EWRAM ceiling stops applying to them.
"""
import struct

ROM_BASE = 0x08000000

# The loader resolves an archive through these three area tables.
DIALOGUE_TABLES = (0x22804, 0x22828, 0x2287C)
TABLE_REGION = range(0x22000, 0x23000)
# Reached when area/subarea select the fixed opening-area archive.
DIRECT_ARCHIVE_LITERAL = 0x20B04

# "ldr r1,[pc,#0x24]; bl 0xE8690; pop {r5,pc}" plus its two padding bytes.
LOADER_TAIL = 0x20AEE
LOADER_TAIL_SOURCE = bytes.fromhex("09 49 c7 f0 ce fd 20 bd 00 00")
# "ldr r0,[pc,#4]; bl 0x20B60; pop {r5,pc}" inside show-dialogue-entry.
READER_BODY = 0x20B0C
READER_BODY_SOURCE = bytes.fromhex("01 48 00 f0 27 f8 20 bd")
START_MESSAGE = 0x20B60

# No RAM slot: an earlier attempt parked the archive pointer in the freed
# buffer's top word and battle wiped it, so the reader read a base of zero and
# walked memory until the emulator stopped responding. The reader instead calls
# the loader, which resolves the pointer from the area tables and now simply
# returns it, so nothing has to survive in RAM between the two.
RESOLVE_ARCHIVE = 0x20AB0

READER_TRAMPOLINE = 0x00830440

# The area tables and every sub-table they name lie in one list that ends
# where the three tables of the other lookup (0x20B18, raw archives read in
# place, no unpacking) begin.
LOADER_TABLE_END = 0x22B10
ARCHIVE_POINTER_RANGE = range(ROM_BASE + 0x00700000, ROM_BASE + 0x00800000)

# 157 through the three area tables, plus the opening area's direct literal.
# (0x074B590, Yaito's house, sits in the table at 0x0228A8 but was missing
# from the catalogue until the pointer scan recovered it.) Until V0.9.27 the
# walk stopped at the first zero slot and read at most 64 slots per table, so
# the Mother Computer room (00/17, right after a zero) and 00/157-00/161 (past
# the window) stayed compressed while the loader no longer unpacked them: their
# scripts were read out of LZ77 bytes, and NPCs and plug-in points did nothing.
EXPECTED_ARCHIVE_COUNT = 158
# Five more slots name an archive the catalogue does not hold: one empty
# 254-entry archive, stored compressed five times. They need a raw copy too.
EXPECTED_UNCATALOGUED_TARGETS = 5


def loader_targets(rom: bytes) -> dict[int, list[int]]:
    """Every archive the map dialogue loader can resolve, with the slots naming it.

    Walks area tables to sub-tables to archives. A zero slot is an area or sub
    area without dialogue and is skipped, not an end; a table runs until a slot
    holds something other than zero, a table pointer or an archive pointer, and
    never past LOADER_TABLE_END.
    """
    def u32(position: int) -> int:
        return struct.unpack_from("<I", rom, position)[0]

    sub_tables: set[int] = set()
    for table in DIALOGUE_TABLES:
        position = table
        while position < LOADER_TABLE_END:
            value = u32(position)
            if ROM_BASE + TABLE_REGION.start <= value < ROM_BASE + LOADER_TABLE_END:
                sub_tables.add(value - ROM_BASE)
            elif value and value not in ARCHIVE_POINTER_RANGE:
                break
            position += 4
    targets: dict[int, list[int]] = {}
    for table in sorted(sub_tables):
        position = table
        while position < LOADER_TABLE_END:
            value = u32(position)
            if value in ARCHIVE_POINTER_RANGE:
                targets.setdefault(value - ROM_BASE, []).append(position)
            elif value and not ROM_BASE + TABLE_REGION.start <= value < ROM_BASE + TABLE_REGION.stop:
                break
            position += 4
    for slots in targets.values():
        slots[:] = sorted(set(slots))
    return targets


def reachable(rom: bytes, known_archive_offsets: set[int]) -> set[int]:
    """Every catalogued archive the map dialogue loader can resolve.

    Self-validating: the catalogued count and the count of targets outside the
    catalogue are both pinned, so a wrong walk is a build failure rather than a
    silently short list.
    """
    direct = struct.unpack_from("<I", rom, DIRECT_ARCHIVE_LITERAL)[0] - ROM_BASE
    if direct not in known_archive_offsets:
        raise ValueError("the loader's direct archive literal is not a known archive")
    targets = loader_targets(rom)
    found = {offset for offset in targets if offset in known_archive_offsets} | {direct}
    if len(found) != EXPECTED_ARCHIVE_COUNT:
        raise ValueError(
            f"map dialogue loader resolves {len(found)} archives, expected {EXPECTED_ARCHIVE_COUNT}"
        )
    outside = [offset for offset in targets if offset not in known_archive_offsets]
    if len(outside) != EXPECTED_UNCATALOGUED_TARGETS:
        raise ValueError(
            f"map dialogue loader names {len(outside)} archives outside the catalogue, "
            f"expected {EXPECTED_UNCATALOGUED_TARGETS}"
        )
    return found


def uncatalogued_targets(rom: bytes, known_archive_offsets: set[int]) -> dict[int, list[int]]:
    """Loader targets the catalogue does not hold, with their table slots."""
    return {offset: slots for offset, slots in loader_targets(rom).items()
            if offset not in known_archive_offsets}


def _stub(offset: int, destination: int, register: int) -> bytes:
    """ldr reg,[pc,#0]; bx reg; .word destination|1 - the literal lands at +4."""
    if offset % 4:
        raise ValueError("stub needs a 4-byte aligned site for its literal")
    return struct.pack("<HHI", 0x4800 | (register << 8), 0x4700 | (register << 3),
                       ROM_BASE + destination + 1)


def _loader_stub() -> bytes:
    """pop {r5,pc} and padding: resolve the pointer into r0, then just return."""
    return struct.pack("<HHHHH", 0xBD20, 0x46C0, 0x46C0, 0x46C0, 0x46C0)


def make_reader_trampoline(blob_cls, offset: int) -> tuple[bytes, int]:
    """Resolve this map's archive, then start the message from it.

    Entered with the entry index in r1 and the caller's {r5,lr} already pushed
    by the function whose body this replaces, so it returns with pop {r5,pc}.
    """
    t = blob_cls(offset)
    t.emit(0xB402)                 # push {r1}      - the resolver clobbers r1
    t.ldr_literal(3, ROM_BASE + RESOLVE_ARCHIVE + 1)
    t.emit(0x46FE)                 # mov lr, pc
    t.emit(0x4718)                 # bx r3          - r0 = archive pointer
    t.emit(0xBC02)                 # pop {r1}
    t.ldr_literal(3, ROM_BASE + START_MESSAGE + 1)
    t.emit(0x46FE)                 # mov lr, pc
    t.emit(0x4718)                 # bx r3
    t.emit(0xBD20)                 # pop {r5, pc}
    return t.finish(), t.code_byte_length


def hook_specs() -> list[tuple[int, bytes, bytes, str]]:
    return [
        (LOADER_TAIL, LOADER_TAIL_SOURCE, _loader_stub(), "dialogue_loader_return"),
        (READER_BODY, READER_BODY_SOURCE,
         _stub(READER_BODY, READER_TRAMPOLINE, 3), "dialogue_reader_base"),
    ]
