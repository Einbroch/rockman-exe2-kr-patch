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
    p.add_argument('--actions', default='none:1:599')
    a = p.parse_args()
    if a.out.exists():
        raise SystemExit('Refusing to overwrite an existing segment')
    sha = digest(a.rom)
    if a.load:
        previous = json.loads((a.load.parent / 'result.json').read_text(encoding='utf-8'))
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
local function write(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local function capture(name)
 write(name..'.png',emu.takeScreenshot())
 local ram=emu.memType.gbaExtWorkRam
 write(name..'.json',string.format('{"frame":%d,"renderer_state":%d,"entry":%d,"col":%d,"row":%d}',frame,emu.read(0x8730,ram),emu.read(0x8731,ram),emu.read(0x873e,ram),emu.read(0x873f,ram)))
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
'''.replace('ROOT', json.dumps(runtime.as_posix())).replace('ACTIONS', lua_actions).replace('LOAD', 'true' if a.load else 'false').replace('TOTAL', str(cursor))
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
    result = {'scope': 'normal controller inputs only; no game RAM or progress injection',
              'rom_path': str(a.rom.resolve()), 'rom_sha256': sha,
              'emulator_path': str(a.mesen.resolve()), 'emulator_sha256': digest(a.mesen),
              'audio_enabled': False, 'command': command, 'input_checkpoint': str(a.load) if a.load else None,
              'timeline': timeline, 'exit_code': run.returncode, 'completed': complete,
              'artifacts': {f.name: digest(f) for f in a.out.iterdir() if f.is_file()}}
    (a.out/'result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print(json.dumps({'completed': complete, 'out': str(a.out), 'exit_code': run.returncode}))
    if not complete:
        print(run.stdout.decode('utf-8', errors='replace'))
        print(run.stderr.decode('utf-8', errors='replace'))
        raise SystemExit(1)


if __name__ == '__main__':
    main()
