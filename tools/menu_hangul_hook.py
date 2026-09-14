"""Rev 1 shared tile-label renderer: decode F9 FC without losing native controls.

The table at ROM 1E625C is copied with its renderer to IWRAM 03006D5C.
Only its F9 slot changes. The original IWRAM routine and all other controls
stay in place, so every caller of 08020F38 receives the same decoder fix.
"""
from pathlib import Path
import hashlib
import struct
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'external/menu_debug_python'))
from keystone import Ks, KS_ARCH_ARM, KS_MODE_THUMB, __version__ as KS_VERSION
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB, __version__ as CS_VERSION

TABLE_SLOT = 0x1E62A4
ORIGINAL_HANDLER = 0x0300707D
HOOK_OFFSET = 0x830300
HOOK_ADDRESS = 0x08000000 + HOOK_OFFSET
MASTER_FONT_ADDRESS = 0x08840000
DRAW_GLYPH = 0x03006E55


def compile_hook():
    if KS_VERSION != '0.9.2':
        raise ValueError('menu hook requires keystone-engine 0.9.2')
    # r0=stream, r2=tile buffer, r3=active, r4/r5=column/count,
    # r6=native font, r9=character count, r10=game context. r1/r7 scratch.
    asm = f'''.syntax unified
    .cpu arm7tdmi
    .thumb
    ldrb r7, [r0, #1]
    cmp r7, #0xfc
    bne original
    push {{r6, lr}}
    ldrb r1, [r0, #3]
    lsls r1, r1, #8
    ldrb r7, [r0, #2]
    adds r1, r1, r7
    ldr r6, font
    ldr r7, draw
    mov lr, pc
    bx r7
    adds r0, #4
    mov r7, r9
    adds r7, #1
    mov r9, r7
    pop {{r6, pc}}
original:
    ldr r7, legacy
    bx r7
    .balign 4
font: .word {MASTER_FONT_ADDRESS}
draw: .word {DRAW_GLYPH}
legacy: .word {ORIGINAL_HANDLER}
'''
    assembler = Ks(KS_ARCH_ARM, KS_MODE_THUMB)
    encoded, _ = assembler.asm(asm, HOOK_ADDRESS)
    blob = bytes(encoded)
    code_length = 38  # 19 Thumb-1 instructions; 2 bytes alignment then literals.
    instructions = list(Cs(CS_ARCH_ARM, CS_MODE_THUMB).disasm(blob[:code_length], HOOK_ADDRESS))
    if len(instructions) != 19 or any(i.size != 2 for i in instructions):
        raise ValueError('unexpected ARM7TDMI Thumb instruction boundaries')
    for i in instructions:
        # Independent decode -> full ARM assembler -> byte identity.
        rebuilt, _ = assembler.asm('.cpu arm7tdmi\n.thumb\n' + i.mnemonic + ' ' + i.op_str, i.address)
        if bytes(rebuilt) != i.bytes:
            raise ValueError(f'assembler/disassembler disagreement at {i.address:08X}')
    if struct.unpack('<III', blob[-12:]) != (MASTER_FONT_ADDRESS, DRAW_GLYPH, ORIGINAL_HANDLER):
        raise ValueError('menu hook literal pool mismatch')
    return blob, code_length, [f'0x{i.address:08X}: {i.mnemonic} {i.op_str}' for i in instructions]


def planned_writes(source, clean_base):
    blob, length, listing = compile_hook()
    expected = struct.pack('<I', ORIGINAL_HANDLER)
    if source[TABLE_SLOT:TABLE_SLOT+4] != expected:
        raise ValueError('Rev 1 menu F9 table source mismatch')
    if clean_base[HOOK_OFFSET:HOOK_OFFSET+len(blob)] != b'\xff'*len(blob):
        raise ValueError('menu hook allocation is not clean expanded ROM')
    writes = [
        {'kind': 'thumb_hook', 'name': 'menu_f9_handler_pointer', 'rom_offset': TABLE_SLOT,
         'expected_immutable_source_hex': expected.hex(' '),
         'replacement_hex': struct.pack('<I', HOOK_ADDRESS | 1).hex(' '),
         'encoding': 'IWRAM copied handler pointer; not executable instruction bytes'},
        {'kind': 'thumb_trampoline', 'name': 'menu_f9_hangul', 'rom_offset': HOOK_OFFSET,
         'byte_length': len(blob), 'code_byte_length': length,
         'literal_pool_byte_length': len(blob)-length,
         'sha256': hashlib.sha256(blob).hexdigest()},
    ]
    return writes, blob, {'isa': 'ARM7TDMI ARMv4T Thumb-1',
                          'keystone': KS_VERSION, 'capstone': CS_VERSION,
                          'assembly_roundtrip': True, 'disassembly': listing,
                          'native_F9_preserved': True,
                          'iwram_copy_slot': '0x03006DA4'}
