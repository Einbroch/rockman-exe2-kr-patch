"""Execute the real shared label renderer on actual archive entries in Unicorn.

This is a bounded CPU/renderer experiment, not Android/My Boy runtime proof.
Only the ROM's relocated IWRAM code and caller interface are initialized.
Native game code queues the resulting VRAM transfer; no renderer is simulated.
"""
import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path
from menu_hangul_hook import HOOK_ADDRESS, ORIGINAL_HANDLER
from unicorn import Uc, UcError, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE
from unicorn.arm_const import *

BASE = 0x08000000
BUFFER = 0x02002000
STACK = 0x03007E00
STOP = 0x08001000
REGS = [UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R2, UC_ARM_REG_R3,
        UC_ARM_REG_R4, UC_ARM_REG_R5, UC_ARM_REG_R6, UC_ARM_REG_R7,
        UC_ARM_REG_R8, UC_ARM_REG_R9, UC_ARM_REG_R10]


def machine(rom):
    uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
    uc.ctl_set_cpu_model(UC_CPU_ARM_TI925T)  # ARMv4T CPU; no Thumb-2.
    for address, size in [(BASE, 0x1000000), (0x02000000, 0x40000),
                          (0x03000000, 0x8000), (0x04000000, 0x1000), (0x06000000, 0x20000)]:
        uc.mem_map(address, size)
    uc.mem_write(BASE, rom)
    # Includes the native F9 FC out-of-range lookup at 03007188. Bytes through
    # 030071FF matched Claude's observed IWRAM dump, not invented zero padding.
    uc.mem_write(0x03006C00, rom[0x1E6100:0x1E6700])
    uc.mem_write(0x03000068, struct.pack('<I', 0x02000100))
    return uc


def run_entry(uc, archive, entry, font=0x086973B0, limit=30000):
    uc.mem_write(BUFFER-64, b'\xa5'*(0x1000+128))
    uc.mem_write(0x02000100, b'\0'*0x100)
    for reg, value in zip(REGS, [archive, entry, BUFFER, 0x06000000, 12, 1, font, 0, 0, 0, 0x03000000]):
        uc.reg_write(reg, value)
    uc.reg_write(UC_ARM_REG_SP, STACK)
    uc.reg_write(UC_ARM_REG_LR, STOP|1)
    observations = {'hook_hits': 0, 'native_f9_hits': 0, 'glyphs': [], 'invalid_stream': None}
    def trace(cpu, address, size, _):
        if address == HOOK_ADDRESS:
            observations['hook_hits'] += 1
        if address == (ORIGINAL_HANDLER & ~1):
            observations['native_f9_hits'] += 1
        if address == 0x03006E54:
            observations['glyphs'].append([cpu.reg_read(UC_ARM_REG_R6), cpu.reg_read(UC_ARM_REG_R1)])
        if address == 0x03006DF0:
            pos = cpu.reg_read(UC_ARM_REG_R0)
            if not BASE <= pos < BASE+0x1000000:
                observations['invalid_stream'] = f'0x{pos:08X}'
                cpu.emu_stop()
    handle = uc.hook_add(UC_HOOK_CODE, trace)
    error = None
    try:
        uc.emu_start(0x08020F39, STOP, count=limit)
    except UcError as exc:
        error = str(exc)
    uc.hook_del(handle)
    return {**observations, 'error': error,
            'returned': uc.reg_read(UC_ARM_REG_PC) == STOP,
            'pc': f'0x{uc.reg_read(UC_ARM_REG_PC):08X}',
            'stream': f'0x{uc.reg_read(UC_ARM_REG_R0):08X}',
            'count': uc.reg_read(UC_ARM_REG_R0),
            'stack_balanced': uc.reg_read(UC_ARM_REG_SP) == STACK}, bytes(uc.mem_read(BUFFER, 12*64))


def expected_glyphs(payload):
    result, cursor = [], 0
    while cursor < len(payload):
        value = payload[cursor]
        if value == 0xE7:
            return result
        if payload[cursor:cursor+2] == b'\xf9\xfc':
            result.append((0x08840000, struct.unpack_from('<H', payload, cursor+2)[0]))
            cursor += 4
        elif value in (0xE5, 0xE6):
            result.append((0x086973B0, payload[cursor+1] + (0xE5 if value == 0xE5 else 0x1E5)))
            cursor += 2
        elif value < 0xE5:
            result.append((0x086973B0, value))
            cursor += 1
        else:
            raise ValueError(f'unclassified menu control {value:02X}')
    raise ValueError('label without terminator')


def verify(rom, base):
    uc = machine(rom)
    table_size = struct.unpack_from('<H', rom, base)[0]
    offsets = struct.unpack_from(f'<{table_size//2}H', rom, base)
    results = []
    for entry, (lo, hi) in enumerate(zip(offsets, offsets[1:])):
        if lo == hi:
            continue
        glyphs = expected_glyphs(rom[base+lo:base+hi])
        assert len(glyphs) <= 12, (entry, len(glyphs))
        outcome, tile_bytes = run_entry(uc, BASE+base, entry)
        assert outcome['returned'] and outcome['stack_balanced'], (entry, outcome)
        assert outcome['count'] == len(glyphs), (entry, outcome)
        padded = glyphs + [(0x086973B0, 0)]*(12-len(glyphs))
        expected = b''.join(rom[font-BASE+i*64:font-BASE+(i+1)*64] for font, i in padded)
        assert tile_bytes == expected, ('font pixels differ', entry)
        assert bytes(uc.mem_read(BUFFER-64, 64)) == b'\xa5'*64
        assert bytes(uc.mem_read(BUFFER+12*64, 64)) == b'\xa5'*64
        results.append({'entry': entry, 'characters': len(glyphs), 'hangul': outcome['hook_hits']})
    return results


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--baseline', type=Path, required=True)
    p.add_argument('--fixed', type=Path, required=True)
    p.add_argument('--report', type=Path, required=True)
    a = p.parse_args()
    old, fixed = a.baseline.read_bytes(), a.fixed.read_bytes()
    before, _ = run_entry(machine(old), 0x08900F00, 15)
    assert not before['returned'], 'negative baseline did not expose renderer fault'
    menu_base = struct.unpack_from('<I', fixed, 0x0251E8)[0] - BASE
    fixed_results = verify(fixed, menu_base)
    native_results = verify(fixed, 0x7D98D4)
    item_base = struct.unpack_from('<I', fixed, 0x21B84)[0]
    terminal, _ = run_entry(machine(fixed), item_base, 159)
    assert terminal['returned'] and terminal['count'] == 0 and terminal['stack_balanced'], terminal
    # Native F9 subcommands must keep their old behavior and register effects.
    native_controls = []
    for subcommand in range(5):
        outcomes = []
        for rom, entrypoint in [(old, ORIGINAL_HANDLER), (fixed, HOOK_ADDRESS|1)]:
            uc = machine(rom)
            uc.mem_write(0x02001000, bytes([0xF9, subcommand, 0, 0]))
            uc.reg_write(UC_ARM_REG_R0, 0x02001000)
            uc.reg_write(UC_ARM_REG_LR, STOP|1)
            uc.reg_write(UC_ARM_REG_SP, STACK)
            uc.emu_start(entrypoint, STOP, count=200)
            outcomes.append([uc.reg_read(r) for r in REGS])
        assert outcomes[0] == outcomes[1], subcommand
        native_controls.append(subcommand)
    result = {'status': 'PASS_CPU_RENDERER_REGRESSION',
              'scope': 'ARMv4T shared tile renderer, not Android app execution',
              'baseline_sha256': hashlib.sha256(old).hexdigest(),
              'fixed_sha256': hashlib.sha256(fixed).hexdigest(),
              'baseline_entry_15': before, 'fixed_korean_labels': len(fixed_results),
              'native_japanese_labels': len(native_results),
              'empty_subchip_terminal_entry_159': terminal,
              'pixel_exact_font_records': True, 'stack_and_buffer_guards': True,
              'native_f9_subcommands_unchanged': native_controls,
              'labels': fixed_results}
    a.report.write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print(json.dumps({k:v for k,v in result.items() if k!='labels'}, indent=2))


if __name__ == '__main__':
    main()
