"""Drive the game to the e-mail screen and record why it stops responding.

Three instruments, all read-only:

* every BIOS LZ77 decompression is logged with its source, destination and the
  length its stream header declares, so a destination buffer written past its
  original end shows up as a number rather than a guess;
* the program counter is sampled once per frame into a ring buffer, so a frozen
  build names the loop it sits in instead of only showing a still picture;
* execution leaving the ROM for EWRAM is trapped, which is what a text stream
  parsed with the wrong argument count eventually does.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import tempfile

SWI_LZ77_CALL_SITE = 0x080E8690


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


LUA = r'''
local root=ROOT
local actions=ACTIONS
local frame=0
local ready=not LOAD
local final=false
local lz={}
local pcs={}
local hooks={}
local keys_dumped=false
local capturing=false
local stream={}
local calls={}
local region={}
local regionOrder={}
local function write(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local function pc_of(s)
 -- r15 carries the prefetch, and reads back as rubbish at a frame boundary.
 -- The pipeline's execute stage names the instruction actually running.
 return s['cpu.pipeline.execute.address'] or s['cpu.r15'] or 0
end
local function flush()
 write('lz77.json','['..table.concat(lz,',')..']')
 if TRACE_STREAM then
  write('stream.json','['..table.concat(stream,',')..']')
  write('render_calls.json','['..table.concat(calls,',')..']')
 end
 write('pc_samples.json','['..table.concat(pcs,',')..']')
 if WATCH_HIGH>0 then
  local rows={}
  for _,key in ipairs(regionOrder) do
   local hit=region[key]
   rows[#rows+1]=string.format('{"pc":%d,"kind":"%s","count":%d,"first":%d,"low":%d,"high":%d}',
    hit.pc,hit.kind,hit.count,hit.first,hit.low,hit.high)
  end
  write('region_access.json','['..table.concat(rows,',')..']')
 end
 local parts={}
 for address,count in pairs(hooks) do parts[#parts+1]=string.format('"%d":%d',address,count) end
 write('hook_hits.json','{'..table.concat(parts,',')..'}')
end
local function capture(name)
 write(name..'.png',emu.takeScreenshot())
 flush()
end
local function byte(address)
 return emu.read(address,emu.memType.gbaMemory,false)
end
for _,address in ipairs({0x08830000,0x08830100,0x08830200,0x08830300,0x0300707c,0x03006dc8}) do
 hooks[address]=0
 emu.addMemoryCallback(function() hooks[address]=hooks[address]+1 end,
  emu.callbackType.exec,address,address)
end
emu.addMemoryCallback(function()
 local s=emu.getState()
 local source=s['cpu.r0']
 local header=byte(source)+byte(source+1)*256+byte(source+2)*65536+byte(source+3)*16777216
 lz[#lz+1]=string.format('{"frame":%d,"source":%d,"destination":%d,"header":%d}',
  frame,source,s['cpu.r1'],header)
 if TRACE_STREAM and s['cpu.r1']==MAIL_BUFFER then capturing=true end
end,emu.callbackType.exec,SWI_SITE,SWI_SITE)
if TRACE_STREAM then
 -- 0x03006DE6 is "ldrh r1,[r0,r1]": r0 is still the archive base, r1 the
 -- doubled entry index, r2 the tile destination the label will be drawn into.
 emu.addMemoryCallback(function()
  if not capturing or #calls>=200 then return end
  local s=emu.getState()
  calls[#calls+1]=string.format('{"n":%d,"archive":%d,"index":%d,"destination":%d}',
   #stream,s['cpu.r0'],math.floor(s['cpu.r1']/2),s['cpu.r2'])
 end,emu.callbackType.exec,0x03006de6,0x03006de6)
 -- 0x03006DF0 is "ldrb r1,[r0]": one record per stream byte the loop consumes.
 emu.addMemoryCallback(function()
  if not capturing or #stream>=STREAM_LIMIT then return end
  local s=emu.getState()
  local at=s['cpu.r0']
  stream[#stream+1]=string.format('{"at":%d,"byte":%d,"destination":%d,"col":%d,"drawn":%d}',
   at,byte(at),s['cpu.r2'],s['cpu.r4'],s['cpu.r5'])
 end,emu.callbackType.exec,0x03006df0,0x03006df0)
end
emu.addMemoryCallback(function(address)
 if not ready then return end
 pcs[#pcs+1]=string.format('{"frame":%d,"ewram_exec":%d}',frame,address)
 capture('ewram_execution');emu.stop(3)
end,emu.callbackType.exec,0x02000000,0x02ffffff)
if WATCH_HIGH>0 then
 -- Who else touches the bytes past the original buffer's end? Group by the
 -- instruction doing it, so one decompression does not drown out a real user.
 local function note(kind)
  return function(address)
   if not ready then return end
   local pc=pc_of(emu.getState())
   local key=kind..':'..pc
   local hit=region[key]
   if hit==nil then
    hit={pc=pc,kind=kind,count=0,first=frame,low=address,high=address}
    region[key]=hit;regionOrder[#regionOrder+1]=key
   end
   hit.count=hit.count+1
   if address<hit.low then hit.low=address end
   if address>hit.high then hit.high=address end
  end
 end
 emu.addMemoryCallback(note('write'),emu.callbackType.write,WATCH_LOW,WATCH_HIGH)
 emu.addMemoryCallback(note('read'),emu.callbackType.read,WATCH_LOW,WATCH_HIGH)
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
  ready=true
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
 local s=emu.getState()
 if not keys_dumped then
  keys_dumped=true
  local names={}
  for key,value in pairs(s) do
   if type(value)=='number' then names[#names+1]=string.format('%q:%d',key,value) end
  end
  table.sort(names)
  write('state_keys.json','{'..table.concat(names,',')..'}')
 end
 local regs={}
 for i=0,15 do regs[#regs+1]=string.format('%d',s['cpu.r'..i] or 0) end
 pcs[#pcs+1]=string.format('{"frame":%d,"pc":%d,"mode":%d,"r":[%s]}',
  frame,pc_of(s),s['cpu.pipeline.mode'] or 0,table.concat(regs,','))
 if #pcs>3000 then table.remove(pcs,1) end
 for i,a in ipairs(actions) do
  if frame==a.finish then capture(string.format('step_%03d',i)) end
 end
 if frame>=TOTAL then
  final=true
  onceExec(function()
   flush();write('checkpoint.mss',emu.createSavestate());write('complete.txt',tostring(frame))
   emu.stop(0)
  end)
 end
end,emu.eventType.endFrame)
'''


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--rom', type=Path, required=True)
    p.add_argument('--mesen', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--load', type=Path)
    p.add_argument('--actions', default='none:1:600')
    p.add_argument('--timeout', type=int, default=180)
    p.add_argument('--trace-stream', action='store_true',
                   help='Record every byte the label renderer consumes after the mail archive loads')
    p.add_argument('--mail-buffer', type=lambda x: int(x, 0), default=0x02023000)
    p.add_argument('--stream-limit', type=int, default=4000)
    p.add_argument('--watch-low', type=lambda x: int(x, 0), default=0)
    p.add_argument('--watch-high', type=lambda x: int(x, 0), default=0)
    a = p.parse_args()
    if a.out.exists():
        raise SystemExit('Refusing to overwrite an existing observation')
    actions = []
    for item in a.actions.split(','):
        names, held, wait = item.split(':')
        buttons = [] if names == 'none' else names.split('+')
        assert set(buttons) <= set('a b l r start select up down left right'.split())
        actions.append((buttons, int(held), int(wait)))
    timeline, cursor = [], 0
    for buttons, held, wait in actions:
        timeline.append({'start': cursor, 'release': cursor + held,
                         'end': cursor + held + wait, 'keys': buttons})
        cursor += held + wait
    lua_actions = '{' + ','.join('{start=%d,release=%d,finish=%d,keys={%s}}' % (
        x['start'], x['release'], x['end'], ','.join(json.dumps(k) for k in x['keys']))
        for x in timeline) + '}'
    runtime = Path(tempfile.mkdtemp(prefix='exe2-mailprobe-'))
    if a.load:
        shutil.copy2(a.load, runtime / 'input.mss')
    lua = (LUA.replace('ROOT', json.dumps(runtime.as_posix()))
              .replace('ACTIONS', lua_actions)
              .replace('SWI_SITE', str(SWI_LZ77_CALL_SITE))
              .replace('LOAD', 'true' if a.load else 'false')
              .replace('TOTAL', str(cursor))
              .replace('TRACE_STREAM', 'true' if a.trace_stream else 'false')
              .replace('MAIL_BUFFER', str(a.mail_buffer))
              .replace('STREAM_LIMIT', str(a.stream_limit))
              .replace('WATCH_LOW', str(a.watch_low))
              .replace('WATCH_HIGH', str(a.watch_high)))
    script = runtime / 'probe.lua'
    script.write_text(lua, encoding='utf-8')
    command = [str(a.mesen.resolve()), '--testRunner', '--noAudio', '--enableStdout',
               '--timeout=' + str(a.timeout), str(script), str(a.rom.resolve())]
    run = subprocess.run(command, cwd=a.mesen.parent, capture_output=True, timeout=a.timeout + 40)
    a.out.mkdir(parents=True)
    for file in runtime.iterdir():
        shutil.copy2(file, a.out / file.name)
    (a.out / 'stdout.txt').write_bytes(run.stdout)
    (a.out / 'stderr.txt').write_bytes(run.stderr)
    (a.out / 'result.json').write_text(json.dumps({
        'rom': str(a.rom), 'rom_sha256': digest(a.rom),
        'emulator_sha256': digest(a.mesen), 'actions': a.actions,
        'total_frames': cursor, 'return_code': run.returncode,
        'artifacts': {f.name: digest(f) for f in sorted(a.out.iterdir()) if f.is_file()},
    }, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(json.dumps({'return_code': run.returncode,
                      'files': sorted(f.name for f in a.out.iterdir())},
                     ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
