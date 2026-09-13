"""Replay the PET choice in muted Mesen with a documented renderer intervention."""
import argparse
import hashlib
import json
import struct
import subprocess
import tempfile
import shutil
from pathlib import Path
from gba_lz77 import decompress

p = argparse.ArgumentParser()
p.add_argument('--rom', type=Path, required=True)
p.add_argument('--manifest', type=Path, required=True)
p.add_argument('--output-dir', type=Path, required=True)
p.add_argument('--mesen', type=Path, required=True)
a = p.parse_args()
rom = a.rom.read_bytes()
m = json.loads(a.manifest.read_text(encoding='utf-8'))
assert hashlib.sha256(rom).hexdigest() == m['output']['sha256']
archive = next(x for x in m['archives'] if x['selector'] == '00/404')
raw, _ = decompress(rom, archive['relocated_rom_offset'])
assert hashlib.sha256(raw).hexdigest() == archive['replacement_decompressed_sha256']
entry = struct.unpack_from('<H', raw, 20)[0]
a.output_dir.mkdir(parents=True, exist_ok=True)
runtime_dir = Path(tempfile.mkdtemp(prefix='exe2-pet-choice-'))
payload_path = runtime_dir / 'archive.bin'
payload_path.write_bytes(raw)
out = runtime_dir.as_posix()
lua = r'''
local root = ROOT
local frame = 0
local ram = emu.memType.gbaExtWorkRam
local function w(off, val) emu.write(off, val, ram) end
local function u32(off, val)
  for i=0,3 do w(off+i, math.floor(val / 256^i) % 256) end
end
local function capture(name)
  local f=assert(io.open(root..'/'..name..'.png','wb'))
  f:write(emu.takeScreenshot()); f:close()
  local g=assert(io.open(root..'/'..name..'.json','w'))
  g:write(string.format('{"frame":%d,"entry":%d,"renderer_status":%d}',frame,emu.read(0x8731,ram),emu.read(0x8730,ram))); g:close()
end
local function inject()
  local f=assert(io.open(root..'/archive.bin','rb'));local data=f:read('*a');f:close()
  for i=1,#data do w(0x38800+i-1,data:byte(i)) end
  for _,off in ipairs({2,4,5,6,9,14,15,17,18,20}) do w(0x8730+off,0) end
  w(0x8730,1);w(0x8731,10);w(0x8738,2)
  u32(0x8754,0x02038800+ENTRY);u32(0x8758,0x02038800);u32(0x875C,0x02038800+ENTRY)
end
local function pulse(n) return frame>=n and frame<n+3 end
emu.addEventCallback(function()
 local keyA=pulse(860) or (frame>=1100 and frame<1750 and frame%90<4)
 for _,n in ipairs({2050,2420,2700,3070,3350}) do keyA=keyA or pulse(n) end
 emu.setInput({start=pulse(700),a=keyA,b=pulse(3720),right=pulse(2970),left=false,up=false,down=false},0)
end,emu.eventType.inputPolled)
emu.addEventCallback(function()
 frame=frame+1
 if frame==1800 or frame==2500 or frame==3150 then inject() end
 if frame==2020 then capture('first_page') end
 if frame==2320 then capture('choice_default') end
 if frame==2480 then capture('yes_branch') end
 if frame==2940 then capture('choice_repeat') end
 if frame==3010 then capture('choice_alternate') end
 if frame==3130 then capture('no_branch') end
 if frame==3600 then capture('choice_cancel') end
 if frame==3720 then emu.setInput({b=true,a=false},0) end
 if frame==3860 then capture('cancel_branch');emu.stop(0) end
end,emu.eventType.endFrame)
'''.replace('ROOT',json.dumps(out, ensure_ascii=False)).replace('ENTRY',str(entry))
lua_path = runtime_dir/'probe.lua'
lua_path.write_text(lua,encoding='utf-8')
r = subprocess.run([str(a.mesen.resolve()),'--testRunner','--noAudio','--enableStdout','--timeout=90',str(lua_path),str(a.rom.resolve())],cwd=a.mesen.parent,capture_output=True)
for artifact in runtime_dir.iterdir():
    shutil.copy2(artifact, a.output_dir/ artifact.name)
(a.output_dir/'stdout.txt').write_bytes(r.stdout)
(a.output_dir/'stderr.txt').write_bytes(r.stderr)
report={'rom_sha256':m['output']['sha256'],'exit_code':r.returncode,'audio_enabled':False,'scope':'renderer intervention at frame 1800, then real input and rendering; not natural map entry','screenshots':[x.name for x in a.output_dir.glob('*.png')]}
(a.output_dir/'result.json').write_text(json.dumps(report,indent=2),encoding='utf-8')
print(json.dumps(report,indent=2))
raise SystemExit(r.returncode)
