"""Read-only, exact-ROM-bound Mesen memory snapshot for PET asset analysis."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile
import shutil

p = argparse.ArgumentParser()
p.add_argument('--rom', type=Path, required=True)
p.add_argument('--state', type=Path, required=True)
p.add_argument('--mesen', type=Path, required=True)
p.add_argument('--out', type=Path, required=True)
a = p.parse_args()
digest = lambda f: hashlib.sha256(f.read_bytes()).hexdigest()
previous = json.loads((a.state.parent/'result.json').read_text(encoding='utf-8'))
assert previous['rom_sha256'] == digest(a.rom)
assert previous['emulator_sha256'] == digest(a.mesen)
assert previous['artifacts'][a.state.name] == digest(a.state)
assert not a.out.exists()
runtime = Path(tempfile.mkdtemp(prefix='exe2-pet-memory-'))
shutil.copy2(a.state, runtime/'input.mss')
lua = r'''
local root=ROOT
local function output(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local ready=false
local frames=0
local id
id=emu.addMemoryCallback(function()
 emu.removeMemoryCallback(id,emu.callbackType.exec,0,0x0fffffff)
 local f=assert(io.open(root..'/input.mss','rb'));local data=f:read('*a');f:close()
 assert(emu.loadSavestate(data));ready=true
end,emu.callbackType.exec,0,0x0fffffff)
emu.addEventCallback(function()
 if not ready then return end
 frames=frames+1
 if frames<3 then return end
 local types={}
 for k,v in pairs(emu.memType) do types[#types+1]=k..'='..tostring(v) end
 table.sort(types);output('memory_types.txt',table.concat(types,'\n'))
 local state={}
 for k,v in pairs(emu.getState()) do state[#state+1]=k..'='..tostring(v) end
 table.sort(state);output('state.txt',table.concat(state,'\n'))
 for _,def in ipairs({{'gbaVideoRam',0x18000},{'gbaPaletteRam',0x400},{'gbaSpriteRam',0x400},{'gbaExtWorkRam',0x40000},{'gbaIntWorkRam',0x8000}}) do
  local kind=emu.memType[def[1]]
  if kind then
   local bytes={}
   for n=0,def[2]-1 do bytes[#bytes+1]=string.char(emu.read(n,kind)) end
   output(def[1]..'.bin',table.concat(bytes))
  end
 end
 output('screen.png',emu.takeScreenshot());output('complete.txt','true');emu.stop(0)
end,emu.eventType.endFrame)
'''.replace('ROOT',json.dumps(runtime.as_posix()))
(runtime/'probe.lua').write_text(lua,encoding='utf-8')
r=subprocess.run([str(a.mesen.resolve()),'--testRunner','--noAudio','--enableStdout','--timeout=60',str(runtime/'probe.lua'),str(a.rom.resolve())],cwd=a.mesen.parent,capture_output=True,timeout=80)
shutil.copytree(runtime,a.out)
(a.out/'stdout.txt').write_bytes(r.stdout+r.stderr)
assert r.returncode==0 and (a.out/'complete.txt').exists(), r.stdout
(a.out/'result.json').write_text(json.dumps({'rom_sha256':digest(a.rom),'emulator_sha256':digest(a.mesen),'input_state_sha256':digest(a.state),'scope':'read-only memory observation after bound savestate load; no load-path claim','audio_enabled':False},indent=2),encoding='utf-8')
print(a.out)
