"""Muted renderer replay of exact ROM text; bypasses map and prefix checks only."""
import argparse
import hashlib
import json
import shutil
import struct
import subprocess
import tempfile
from pathlib import Path
from gba_lz77 import decompress

p = argparse.ArgumentParser()
p.add_argument('--rom', type=Path, required=True)
p.add_argument('--manifest', type=Path, required=True)
p.add_argument('--selector', required=True)
p.add_argument('--entry', type=int, required=True)
p.add_argument('--skip-prefix', type=int, default=0)
p.add_argument('--output-dir', type=Path, required=True)
p.add_argument('--mesen', type=Path, required=True)
a = p.parse_args()
rom = a.rom.read_bytes()
m = json.loads(a.manifest.read_text(encoding='utf-8'))
sha = hashlib.sha256(rom).hexdigest()
assert sha == m['output']['sha256']
item = next(x for x in m['archives'] if x['selector'] == a.selector)
start = item['relocated_rom_offset']
raw = decompress(rom, start)[0] if item['storage'] == 'lz77' else rom[start:start+item['replacement_decompressed_byte_length']]
assert hashlib.sha256(raw).hexdigest() == item['replacement_decompressed_sha256']
assert len(raw) <= 0x7800
entry, end = struct.unpack_from('<HH', raw, a.entry*2)
entry += a.skip_prefix
assert entry < end
assert raw[entry:entry+2] == bytes.fromhex('ed 00'), 'Probe must enter at the observed mugshotShow command boundary'
a.output_dir.mkdir(parents=True, exist_ok=True)
runtime = Path(tempfile.mkdtemp(prefix='exe2-wrap-'))
(runtime/'archive.bin').write_bytes(raw)
lua = r'''
local root=ROOT
local frame=0
local ram=emu.memType.gbaExtWorkRam
local maxcol=0
local maxrow=0
local function w(off,v) emu.write(off,v,ram) end
local function u32(off,v) for i=0,3 do w(off+i,math.floor(v/256^i)%256) end end
local function pulse(n) return frame>=n and frame<n+3 end
local function capture(name)
 local f=assert(io.open(root..'/'..name..'.png','wb'));f:write(emu.takeScreenshot());f:close()
 local g=assert(io.open(root..'/'..name..'.json','w'))
 g:write(string.format('{"frame":%d,"entry":%d,"col":%d,"row":%d,"x_tile":%d,"y_tile":%d,"max_col":%d,"max_row":%d}',frame,emu.read(0x8731,ram),emu.read(0x873E,ram),emu.read(0x873F,ram),emu.read(0x874A,ram),emu.read(0x874B,ram),maxcol,maxrow));g:close()
end
emu.addEventCallback(function()
 local keyA=pulse(860) or (frame>=1100 and frame<1750 and frame%90<4) or pulse(2050) or pulse(2400)
 emu.setInput({start=pulse(700),a=keyA,b=false,left=false,right=false,up=false,down=false},0)
end,emu.eventType.inputPolled)
emu.addEventCallback(function()
 frame=frame+1
 if frame==1800 then
  local f=assert(io.open(root..'/archive.bin','rb'));local data=f:read('*a');f:close()
  for i=1,#data do w(0x38800+i-1,data:byte(i)) end
  for _,off in ipairs({2,4,5,6,9,14,15,17,18,20}) do w(0x8730+off,0) end
  w(0x8730,1);w(0x8731,INDEX);w(0x8738,2)
  u32(0x8754,0x02038800+ENTRY);u32(0x8758,0x02038800);u32(0x875C,0x02038800+ENTRY)
 end
 if frame>1800 and frame<2400 then
  maxcol=math.max(maxcol,emu.read(0x873E,ram));maxrow=math.max(maxrow,emu.read(0x873F,ram))
 end
 if frame==2020 then capture('first_page') end
 if frame==2350 then capture('second_page') end
 if frame==2500 then capture('after_confirm');emu.stop(0) end
end,emu.eventType.endFrame)
'''.replace('ROOT', json.dumps(runtime.as_posix())).replace('INDEX', str(a.entry)).replace('ENTRY', str(entry))
script = runtime/'probe.lua'
script.write_text(lua, encoding='utf-8')
run = subprocess.run([str(a.mesen.resolve()), '--testRunner', '--noAudio', '--enableStdout', '--timeout=90', str(script), str(a.rom.resolve())], cwd=a.mesen.parent, capture_output=True)
for artifact in runtime.iterdir():
    shutil.copy2(artifact, a.output_dir/artifact.name)
(a.output_dir/'stdout.txt').write_bytes(run.stdout)
(a.output_dir/'stderr.txt').write_bytes(run.stderr)
report = {'rom_sha256': sha, 'emulator_sha256': hashlib.sha256(a.mesen.read_bytes()).hexdigest(),
          'selector': a.selector, 'entry': a.entry, 'skip_prefix_bytes': a.skip_prefix,
          'audio_enabled': False, 'exit_code': run.returncode,
          'scope': 'exact decompressed ROM archive injected at 02038800; renderer entry at mugshotShow; natural map and prefix checks bypassed',
          'evidence': {x.name: hashlib.sha256(x.read_bytes()).hexdigest() for x in a.output_dir.iterdir() if x.suffix in {'.png', '.lua'}}}
(a.output_dir/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
raise SystemExit(run.returncode)
