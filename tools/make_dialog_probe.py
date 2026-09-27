# -*- coding: utf-8 -*-
"""빌드 ROM 사본에 '플래그 바이트 k -> 표 k번째 대사 열기' 스텁을 넣는다 (시험 전용, 배포 금지).

사용: python make_dialog_probe.py 입력ROM 출력ROM 아카이브주소:번호 ...
"""
import struct, sys
from pathlib import Path
rom = bytearray(Path(sys.argv[1]).read_bytes())
pairs = [(int(a, 16), int(i)) for a, i in (x.split(':') for x in sys.argv[3:])]
S = next(off for off in range(len(rom) - 0x1000, 0x00E00000, -0x100) if all(b == 0xFF for b in rom[off:off + 0x200]))
code = [0xB500, 0x490A, 0x7808, 0x2800, 0xD00B, 0x2200, 0x700A, 0x3801,
        0x00C0, 0x4907, 0x1809, 0x6808, 0x6849, 0x4B06, 0x46FE, 0x4718,
        0xBD00, 0x4B05, 0x46FE, 0x4718, 0xBD00, 0x0000]
blob = struct.pack('<%dH' % len(code), *code)
assert len(blob) == 0x2C
table_addr = 0x08000000 + S + 0x3C
blob += struct.pack('<4I', 0x0203FFF0, table_addr, 0x08020B61, 0x08003E05)
for archive, index in pairs:
    blob += struct.pack('<2I', archive, index)
rom[S:S + len(blob)] = blob
assert struct.unpack_from('<I', rom, 0x31C)[0] == 0x08003E05
struct.pack_into('<I', rom, 0x31C, 0x08000000 + S + 1)
Path(sys.argv[2]).write_bytes(rom)
print("stub at 0x%08X, %d dialogues" % (0x08000000 + S, len(pairs)))
