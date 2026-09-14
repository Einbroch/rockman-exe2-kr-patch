"""Focused real-renderer choices from an exact-ROM field checkpoint (muted).

The archive/renderer is deliberately injected, not a natural NPC interaction.
After entry, only normal A/B/directional input advances the actual scripts.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import struct
import subprocess
import tempfile
from gba_lz77 import decompress

p=argparse.ArgumentParser()
for name in ('rom','manifest','state','mesen','out'):
    p.add_argument('--'+name,type=Path,required=True)
p.add_argument('--entry',type=int,choices=(6,7,8,10),required=True)
p.add_argument('--mode',choices=('default','alternate','cancel'),required=True)
a=p.parse_args()
digest=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
m=json.loads(a.manifest.read_text(encoding='utf-8'))
s=json.loads((a.state.parent/'result.json').read_text(encoding='utf-8'))
assert digest(a.rom)==m['output']['sha256']==s['rom_sha256']
assert s['emulator_sha256']==digest(a.mesen) and s['artifacts'][a.state.name]==digest(a.state)
assert not a.out.exists()
archive=next(x for x in m['archives'] if x['selector']=='00/404')
raw,_=decompress(a.rom.read_bytes(),archive['relocated_rom_offset'])
assert hashlib.sha256(raw).hexdigest()==archive['replacement_decompressed_sha256']
entry_offset=struct.unpack_from('<H',raw,a.entry*2)[0]
runtime=Path(tempfile.mkdtemp(prefix='exe2-choice-renderer-'))
(runtime/'archive.bin').write_bytes(raw)
shutil.copy2(a.state,runtime/'input.mss')
pages={6:1,7:0,8:3,10:1}[a.entry]
choice_frame=250+200*pages
lua=r'''
local root=ROOT
local frame=0
local ready=false
local ram=emu.memType.gbaExtWorkRam
local function output(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local function once(fn)
 local id
 id=emu.addMemoryCallback(function()
  emu.removeMemoryCallback(id,emu.callbackType.exec,0,0x0fffffff);fn()
 end,emu.callbackType.exec,0,0x0fffffff)
end
once(function()
 local f=assert(io.open(root..'/input.mss','rb'));local data=f:read('*a');f:close()
 assert(emu.loadSavestate(data));ready=true
end)
local function w(offset,value) emu.write(offset,value,ram) end
local function u32(offset,value)
 for i=0,3 do w(offset+i,math.floor(value/256^i)%256) end
end
local function capture(name)
 output(name..'.png',emu.takeScreenshot())
 output(name..'.json',string.format('{"frame":%d,"entry":%d,"state":%d,"col":%d,"row":%d}',frame,emu.read(0x8731,ram),emu.read(0x8730,ram),emu.read(0x873e,ram),emu.read(0x873f,ram)))
end
local function pulse(n) return frame>=n and frame<n+4 end
emu.addEventCallback(function()
 local a=false
 for n=250,CHOICE-1,200 do a=a or pulse(n) end
 if MODE~='cancel' then a=a or pulse(CHOICE+180) end
 emu.setInput({a=a,b=MODE=='cancel' and pulse(CHOICE+180),right=MODE=='alternate' and pulse(CHOICE+60),left=false,up=false,down=false,start=false,select=false,l=false,r=false},0)
end,emu.eventType.inputPolled)
emu.addEventCallback(function()
 if not ready then return end
 frame=frame+1
 if frame==30 then
  local f=assert(io.open(root..'/archive.bin','rb'));local data=f:read('*a');f:close()
  for i=1,#data do w(0x38800+i-1,data:byte(i)) end
  for _,offset in ipairs({2,4,5,6,9,14,15,17,18,20}) do w(0x8730+offset,0) end
  w(0x8730,1);w(0x8731,ENTRY);w(0x8738,2)
  u32(0x8754,0x02038800+OFFSET);u32(0x8758,0x02038800);u32(0x875c,0x02038800+OFFSET)
 end
 for n=150,CHOICE-1,200 do if frame==n then capture('page_'..n) end end
 if frame==CHOICE then capture('choice_default') end
 if frame==CHOICE+120 then capture('choice_selected') end
 if frame==CHOICE+380 then
  capture('branch')
  once(function() output('checkpoint.mss',emu.createSavestate());output('complete.txt','true');emu.stop(0) end)
 end
end,emu.eventType.endFrame)
'''
for key,value in {'ROOT':json.dumps(runtime.as_posix()),'ENTRY':str(a.entry),'OFFSET':str(entry_offset),'CHOICE':str(choice_frame),'MODE':json.dumps(a.mode)}.items():
    lua=lua.replace(key,value)
(runtime/'probe.lua').write_text(lua,encoding='utf-8')
r=subprocess.run([str(a.mesen.resolve()),'--testRunner','--noAudio','--enableStdout','--timeout=60',str(runtime/'probe.lua'),str(a.rom.resolve())],cwd=a.mesen.parent,capture_output=True,timeout=80)
shutil.copytree(runtime,a.out)
(a.out/'stdout.txt').write_bytes(r.stdout+r.stderr)
assert r.returncode==0 and (a.out/'complete.txt').exists(),r.stdout[-1000:]
for name in ('choice_default','choice_selected','branch'):
    assert (a.out/(name+'.png')).stat().st_size>100
branch=json.loads((a.out/'branch.json').read_text())
expected={'default':{6:8,7:8,8:8,10:16},'alternate':{6:7,7:7,8:9,10:10},'cancel':{6:6,7:7,8:8,10:10}}[a.mode][a.entry]
assert branch['entry']==expected,(branch,expected)
report={'status':'PASS_RENDERER_BRANCH_CHECK','rom_sha256':digest(a.rom),'emulator_sha256':digest(a.mesen),
        'entry':a.entry,'mode':a.mode,'branch':branch,'expected_branch_entry':expected,
        'audio_enabled':False,'scope':'archive/renderer injection after exact-ROM natural field checkpoint; subsequent normal controller input; not natural NPC entry',
        'artifacts':{f.name:digest(f) for f in a.out.iterdir() if f.is_file()}}
(a.out/'result.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
print(json.dumps({'entry':a.entry,'mode':a.mode,'branch':branch,'status':report['status']}))
