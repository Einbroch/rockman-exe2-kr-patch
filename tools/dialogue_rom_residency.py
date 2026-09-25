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

# 151 through the three area tables, plus the opening area's direct literal.
# (0x074B590, Yaito's house, sits in the table at 0x0228A8 but was missing
# from the catalogue until the pointer scan recovered it.)
EXPECTED_ARCHIVE_COUNT = 152


def reachable(rom: bytes, known_archive_offsets: set[int]) -> set[int]:
    """Every archive the map dialogue loader can resolve, walked from the tables.

    Self-validating: every pointer the walk accepts has to be an archive the
    build already knows about, and the count is pinned, so a wrong walk is a
    build failure rather than a silently short list.
    """
    found: set[int] = set()
    direct = struct.unpack_from("<I", rom, DIRECT_ARCHIVE_LITERAL)[0] - ROM_BASE
    if direct not in known_archive_offsets:
        raise ValueError("the loader's direct archive literal is not a known archive")
    found.add(direct)
    pending, visited = list(DIALOGUE_TABLES), set()
    while pending:
        table = pending.pop(0)
        if table in visited:
            continue
        visited.add(table)
        for index in range(64):
            entry = table + index * 4
            if entry + 4 > len(rom):
                break
            value = struct.unpack_from("<I", rom, entry)[0]
            if not ROM_BASE <= value < ROM_BASE + 0x00800000:
                break
            offset = value - ROM_BASE
            if offset in known_archive_offsets:
                found.add(offset)
            elif offset in TABLE_REGION:
                pending.append(offset)
    if len(found) != EXPECTED_ARCHIVE_COUNT:
        raise ValueError(
            f"map dialogue loader resolves {len(found)} archives, expected {EXPECTED_ARCHIVE_COUNT}"
        )
    return found


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
