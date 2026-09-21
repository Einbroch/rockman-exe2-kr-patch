"""Muted normal-input play segments, with exact-ROM bound checkpoints.

No game RAM, script, position or progress flag is written. Savestates are
created/loaded only in a main CPU execution callback as required by Mesen.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import tempfile


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--rom', type=Path, required=True)
    p.add_argument('--mesen', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--load', type=Path)
    p.add_argument('--cross-rom-seed', action='store_true', help='Explicit diagnostic seed only; never fresh-boot or save compatibility evidence')
    p.add_argument('--trace-menu', action='store_true', help='Read-only shared-label renderer fault/hook trace')
    p.add_argument('--trace-pet-assets', action='store_true', help='Read-only PET graphics loader, map selector and VRAM evidence')
    p.add_argument('--actions', default='none:1:599')
    a = p.parse_args()
    if a.out.exists():
        raise SystemExit('Refusing to overwrite an existing segment')
    sha = digest(a.rom)
    if a.load:
        previous = json.loads((a.load.parent / 'result.json').read_text(encoding='utf-8'))
        if not a.cross_rom_seed:
            assert previous['rom_sha256'] == sha, 'State belongs to a different ROM'
        assert previous['emulator_sha256'] == digest(a.mesen), 'Different emulator'
        assert previous['artifacts'][a.load.name] == digest(a.load), 'State hash mismatch'
    actions = []
    for item in a.actions.split(','):
        keys, held, wait = item.split(':')
        buttons = [] if keys == 'none' else keys.split('+')
        assert set(buttons) <= set('a b l r start select up down left right'.split())
        held, wait = int(held), int(wait)
        assert 1 <= held <= 3600 and 0 <= wait <= 3600
        actions.append((buttons, held, wait))
    runtime = Path(tempfile.mkdtemp(prefix='exe2-play-'))
    if a.load:
        shutil.copy2(a.load, runtime / 'input.mss')
    timeline = []
    cursor = 0
    for keys, held, wait in actions:
        timeline.append({'start': cursor, 'release': cursor+held,
                         'end': cursor+held+wait, 'keys': keys})
        cursor += held+wait
    lua_actions = '{' + ','.join('{start=%d,release=%d,finish=%d,keys={%s}}' % (
        x['start'], x['release'], x['end'], ','.join(json.dumps(k) for k in x['keys']))
        for x in timeline) + '}'
    lua = r'''
local root=ROOT
local actions=ACTIONS
local frame=0
local ready=not LOAD
local final=false
local petLoads={}
local petMaps={}
local function write(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local function capture(name)
 write(name..'.png',emu.takeScreenshot())
 local ram=emu.memType.gbaExtWorkRam
 write(name..'.json',string.format('{"frame":%d,"renderer_state":%d,"entry":%d,"col":%d,"row":%d}',frame,emu.read(0x8730,ram),emu.read(0x8731,ram),emu.read(0x873e,ram),emu.read(0x873f,ram)))
 if TRACE_PET_ASSETS then
  local function dump(first,size)
   local data={}
   for i=first,first+size-1 do data[#data+1]=string.char(emu.read(i,emu.memType.gbaVideoRam)) end
   return table.concat(data)
  end
  write(name..'_pet_tiles.bin',dump(0xc800,0xac0))
  write(name..'_vram.bin',dump(0x0000,0x10000))
  write(name..'_bg0_map.bin',dump(0xe000,0x800))
  write(name..'_bg1_map.bin',dump(0xe800,0x800))
  write(name..'_bg2_map.bin',dump(0xf000,0x800))
  write(name..'_bg3_map.bin',dump(0xf800,0x800))
  write('pet_asset_trace.json','{"loads":['..table.concat(petLoads,',')..'],"maps":['..table.concat(petMaps,',')..']}')
 end
 if TRACE_MENU then
  local cpu=emu.getState()
  local regs={}
  for i=0,15 do regs[#regs+1]=string.format('"r%d":%d',i,cpu['cpu.r'..i]) end
  write(name..'_cpu.json','{'..table.concat(regs,',')..'}')
 end
end
if TRACE_PET_ASSETS then
 emu.addMemoryCallback(function()
  local s=emu.getState()
  if s['cpu.r0']==0x087d7fbc or (s['cpu.r1']>=0x06000000 and s['cpu.r1']<0x06004000) then
   petLoads[#petLoads+1]=string.format('{"frame":%d,"source":%d,"destination":%d,"word_count":%d}',frame,s['cpu.r0'],s['cpu.r1'],s['cpu.r2'])
  end
 end,emu.callbackType.exec,0x08000a28,0x08000a28)
 emu.addMemoryCallback(function()
  local s=emu.getState();local ptr=s['cpu.r3']
  if ptr==0x087d8adc or ptr==0x087d8ce4 or ptr==0x087d8eec or ptr==0x087d90f4 then
   if #petMaps==0 or petMaps.last~=ptr then
    petMaps[#petMaps+1]=string.format('{"frame":%d,"source":%d,"width":%d,"height":%d}',frame,ptr,s['cpu.r4'],s['cpu.r5']);petMaps.last=ptr
   end
  end
 end,emu.callbackType.exec,0x08001870,0x08001870)
end
if TRACE_MENU then
 local hookHits=0
 local nativeHits=0
 local labels={}
 local events={}
 local fault=nil
 local function event(address)
  if not ready then return end
  local s=emu.getState()
  local fields={string.format('"pc":%d',address)}
  for i=0,15 do fields[#fields+1]=string.format('"r%d":%d',i,s['cpu.r'..i]) end
  events[#events+1]='{'..table.concat(fields,',')..'}'
  if #events>120 then table.remove(events,1) end
 end
 local function traceResult(invalid)
  if invalid then fault=invalid end
  local encoded={}
  for _,label in ipairs(labels) do encoded[#encoded+1]=string.format('{"archive":%d,"entry":%d}',label.archive,label.entry) end
  write('menu_trace.json',string.format('{"hangul_hook_hits":%d,"native_f9_hits":%d,"invalid_stream":%s,"labels":[%s]}',hookHits,nativeHits,fault or 'null',table.concat(encoded,',')))
  write('menu_cpu_events.json','['..table.concat(events,',')..']')
 end
 for _,addr in ipairs({0x08830000,0x08830100,0x08830200,0x03006dc8,0x0300707c}) do
  emu.addMemoryCallback(function() event(addr) end,emu.callbackType.exec,addr,addr)
 end
 emu.addMemoryCallback(function(addr)
  if not ready then return end
  event(addr);traceResult(nil);capture('unexpected_ewram_execution');emu.stop(3)
 end,emu.callbackType.exec,0x02000000,0x02ffffff)
 emu.addMemoryCallback(function()
  hookHits=hookHits+1
 end,emu.callbackType.exec,0x08830300,0x08830300)
 emu.addMemoryCallback(function()
  nativeHits=nativeHits+1
 end,emu.callbackType.exec,0x0300707c,0x0300707c)
 emu.addMemoryCallback(function()
  local cpu=emu.getState()
  labels[#labels+1]={archive=cpu['cpu.r0'],entry=cpu['cpu.r1']}
  if cpu['cpu.r0']==0x08940000 and cpu['cpu.r1']>=64 and cpu['cpu.r1']<=67 then
   local fields={}
   for i=0,15 do fields[#fields+1]=string.format('"r%d":%d',i,cpu['cpu.r'..i]) end
   write('save_label_'..cpu['cpu.r1']..'.json','{'..table.concat(fields,',')..'}')
  end
 end,emu.callbackType.exec,0x08020f38,0x08020f38)
 emu.addMemoryCallback(function()
  local pos=emu.getState()['cpu.r0']
  if pos>=0x10000000 then
   traceResult(tostring(pos));capture('invalid_menu_stream');emu.stop(2)
  end
 end,emu.callbackType.exec,0x03006df0,0x03006df0)
 emu.addEventCallback(function() traceResult(nil) end,emu.eventType.endFrame)
end
local function onceExec(fn)
 local id
 id=emu.addMemoryCallback(function()
  emu.removeMemoryCallback(id,emu.callbackType.exec,0,0x0fffffff)
  fn()
 end,emu.callbackType.exec,0,0x0fffffff)
end
if LOAD then
 onceExec(function()
  local f=assert(io.open(root..'/input.mss','rb'));local data=f:read('*a');f:close()
  assert(emu.loadSavestate(data),'State load failed')
  write('loaded.txt','true');ready=true
 end)
end
emu.addEventCallback(function()
 local keys={a=false,b=false,l=false,r=false,start=false,select=false,up=false,down=false,left=false,right=false}
 if ready and not final then
  for _,a in ipairs(actions) do
   if frame>=a.start and frame<a.release then
    for _,k in ipairs(a.keys) do keys[k]=true end
   end
  end
 end
 emu.setInput(keys,0)
end,emu.eventType.inputPolled)
emu.addEventCallback(function()
 if not ready or final then return end
 frame=frame+1
 for i,a in ipairs(actions) do
  if frame==a.finish then capture(string.format('step_%03d',i)) end
 end
 if frame>=TOTAL then
  final=true
  onceExec(function()
   write('checkpoint.mss',emu.createSavestate())
   write('complete.txt',tostring(frame))
   emu.stop(0)
  end)
 end
end,emu.eventType.endFrame)
'''.replace('ROOT', json.dumps(runtime.as_posix())).replace('ACTIONS', lua_actions).replace('LOAD', 'true' if a.load else 'false').replace('TOTAL', str(cursor)).replace('TRACE_MENU', 'true' if a.trace_menu else 'false').replace('TRACE_PET_ASSETS', 'true' if a.trace_pet_assets else 'false')
    script = runtime / 'segment.lua'
    script.write_text(lua, encoding='utf-8')
    command = [str(a.mesen.resolve()), '--testRunner', '--noAudio', '--enableStdout',
               '--timeout=90', str(script), str(a.rom.resolve())]
    run = subprocess.run(command, cwd=a.mesen.parent, capture_output=True, timeout=110)
    a.out.mkdir(parents=True)
    for file in runtime.iterdir():
        shutil.copy2(file, a.out/file.name)
    (a.out/'stdout.txt').write_bytes(run.stdout)
    (a.out/'stderr.txt').write_bytes(run.stderr)
    complete = run.returncode == 0 and (a.out/'checkpoint.mss').exists() and (a.out/'complete.txt').exists()
    if a.trace_menu:
        # A Lua callback error must not silently turn missing observations into PASS.
        trace_path = a.out/'menu_trace.json'
        complete = complete and trace_path.exists()
        if trace_path.exists():
            complete = complete and json.loads(trace_path.read_text())['invalid_stream'] is None
        complete = complete and all((a.out/f'step_{i+1:03d}_cpu.json').exists() for i in range(len(actions)))
    if a.trace_pet_assets:
        complete = complete and (a.out/'pet_asset_trace.json').exists()
        complete = complete and all((a.out/f'step_{i+1:03d}_pet_tiles.bin').exists() for i in range(len(actions)))
    result = {'scope': 'normal controller inputs only; no game RAM or progress injection',
              'rom_path': str(a.rom.resolve()), 'rom_sha256': sha,
              'emulator_path': str(a.mesen.resolve()), 'emulator_sha256': digest(a.mesen),
              'audio_enabled': False, 'command': command, 'input_checkpoint': str(a.load) if a.load else None,
              'checkpoint_provenance': {'cross_rom_diagnostic_seed':a.cross_rom_seed,
                  'source_rom_sha256':previous['rom_sha256'] if a.load else None,
                  'input_state_sha256':digest(a.load) if a.load else None,
                  'fresh_boot':not bool(a.load)},
              'timeline': timeline, 'exit_code': run.returncode, 'completed': complete,
              'artifacts': {f.name: digest(f) for f in a.out.iterdir() if f.is_file()}}
    (a.out/'result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print(json.dumps({'completed': complete, 'out': str(a.out), 'exit_code': run.returncode}))
    if not complete:
        print(run.stdout.decode('utf-8', errors='replace')[-2000:])
        print(run.stderr.decode('utf-8', errors='replace')[-2000:])
        raise SystemExit(1)


if __name__ == '__main__':
    main()
