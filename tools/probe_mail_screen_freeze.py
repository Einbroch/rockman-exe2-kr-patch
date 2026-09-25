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


NL = chr(10)
Q = chr(34)


def sp_probe_lua(spec: str) -> str:
    """Record the stack pointer each time one of these addresses executes.

    A stack imbalance is invisible in a post-mortem dump. The only way to see
    it is to watch the pointer cross the same call boundary twice.
    """
    if not spec.strip():
        return ''
    fmt = ("{" + Q + "n" + Q + ":%d," + Q + "pc" + Q + ":%d,"
           + Q + "sp" + Q + ":%d," + Q + "frame" + Q + ":%d}")
    template = (
        "emu.addMemoryCallback(function()" + NL
        + " if not ready or spAt>=SP_LIMIT then return end" + NL
        + " spAt=spAt+1" + NL
        + " local s=emu.getState()" + NL
        + " spLog[#spLog+1]=string.format(QUOTE" + fmt + "QUOTE,"
        + "spAt,ADDRESS,s[QQcpu.r13QQ] or 0,frame)" + NL
        + "end,emu.callbackType.exec,ADDRESS,ADDRESS)")
    parts = []
    for item in spec.split(','):
        address = str(int(item.strip(), 0))
        parts.append(template.replace('ADDRESS', address)
                             .replace('QUOTE', chr(39))
                             .replace('QQ', chr(39)))
    return NL.join(parts)


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
local ring={}
local ringAt=0
local ringSize=RING
local frameStats={}
local execRom=0
local execIwram=0
local readArchive=0
local spLog={}
local spAt=0
local SP_LIMIT=4000
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
 if #frameStats>0 then write('frame_stats.json','['..table.concat(frameStats,',')..']') end
 if #spLog>0 then write('sp_log.json','['..table.concat(spLog,',')..']') end
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
if TRAP_HIGH==0 then
 emu.addMemoryCallback(function(address)
  if not ready then return end
  pcs[#pcs+1]=string.format('{"frame":%d,"ewram_exec":%d}',frame,address)
  capture('ewram_execution');emu.stop(3)
 end,emu.callbackType.exec,0x02000000,0x02ffffff)
end
if FRAME_STATS then
 -- Per-frame work, so a frame that cannot finish in time names itself.
 emu.addMemoryCallback(function() execRom=execRom+1 end,
  emu.callbackType.exec,0x08000000,0x09ffffff)
 emu.addMemoryCallback(function() execIwram=execIwram+1 end,
  emu.callbackType.exec,0x03000000,0x03007fff)
 emu.addMemoryCallback(function() readArchive=readArchive+1 end,
  emu.callbackType.read,0x08960000,0x09ffffff)
end
SP_PROBES
if RING>0 then
 -- Keep only the last few thousand executed addresses. A trap then reports the
 -- road that led to it, which is the one thing a post-mortem dump cannot show.
 local function push(address)
  -- The interrupt dispatcher runs hundreds of times a frame and would fill the
  -- ring with noise, hiding the game code that actually went wrong.
  if address>=0x030062F0 and address<0x03006440 then return end
  ringAt=ringAt+1
  ring[(ringAt%ringSize)+1]=address
 end
 emu.addMemoryCallback(function(address) push(address) end,
  emu.callbackType.exec,0x08000000,0x09ffffff)
 emu.addMemoryCallback(function(address) push(address) end,
  emu.callbackType.exec,0x03000000,0x03007fff)
end
if TRAP_HIGH>0 then
 -- Execution reaching the reset vectors means the game branched somewhere
 -- impossible. Freeze the evidence before the BIOS clears IWRAM on its way
 -- round the reset, so the stack that led here is still readable.
 local trapped=false
 emu.addMemoryCallback(function(address)
  if trapped or not ready or frame<TRAP_AFTER then return end
  trapped=true
  local s=emu.getState()
  local parts={}
  for i=0,15 do parts[#parts+1]=string.format('"r%d":%d',i,s['cpu.r'..i] or 0) end
  parts[#parts+1]=string.format('"trap":%d',address)
  parts[#parts+1]=string.format('"frame":%d',frame)
  write('trap_regs.json','{'..table.concat(parts,',')..'}')
  local function region(name,memType,size)
   local out={}
   for i=0,size-1 do out[#out+1]=string.char(emu.read(i,memType,false)) end
   write(name,table.concat(out))
  end
  if RING>0 then
   local out={}
   for i=1,ringSize do
    local at=((ringAt+i)%ringSize)+1
    if ring[at]~=nil then out[#out+1]=string.format('%d',ring[at]) end
   end
   write('trap_ring.json','['..table.concat(out,',')..']')
  end
  region('trap_iwram.bin',emu.memType.gbaIntWorkRam,0x8000)
  region('trap_ewram.bin',emu.memType.gbaExtWorkRam,0x40000)
  capture('trap');emu.stop(4)
 end,emu.callbackType.exec,TRAP_LOW,TRAP_HIGH)
end
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
 if WATCH_LOG>0 then
  -- Grouping by instruction hides ordering, and ordering is the whole story
  -- when a stack slot is written correctly 194 times and wrongly once.
  local log={}
  local at=0
  local function record(kind)
   return function(address,value)
    if not ready then return end
    at=at+1
    local s=emu.getState()
    log[(at%WATCH_LOG)+1]=string.format(
     '{"n":%d,"kind":"%s","address":%d,"value":%d,"pc":%d,"sp":%d,"mode":%d,"frame":%d}',
     at,kind,address,value or -1,pc_of(s),s['cpu.r13'] or 0,s['cpu.pipeline.mode'] or 0,frame)
   end
  end
  emu.addMemoryCallback(record('write'),emu.callbackType.write,WATCH_LOW,WATCH_HIGH)
  emu.addMemoryCallback(record('read'),emu.callbackType.read,WATCH_LOW,WATCH_HIGH)
  local function flushLog()
   local rows={}
   for i=1,WATCH_LOG do
    local item=log[((at+i)%WATCH_LOG)+1]
    if item~=nil then rows[#rows+1]=item end
   end
   write('watch_log.json','['..table.concat(rows,',')..']')
  end
  emu.addEventCallback(flushLog,emu.eventType.endFrame)
 end
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
 if FRAME_STATS then
  frameStats[#frameStats+1]=string.format('{"frame":%d,"rom":%d,"iwram":%d,"archive_reads":%d}',
   frame,execRom,execIwram,readArchive)
  if #frameStats>400 then table.remove(frameStats,1) end
  execRom=0;execIwram=0;readArchive=0
 end
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
    p.add_argument('--trap-low', type=lambda x: int(x, 0), default=0)
    p.add_argument('--trap-high', type=lambda x: int(x, 0), default=0)
    p.add_argument('--frame-stats', action='store_true',
                   help='Count executed instructions and archive reads per frame')
    p.add_argument('--sp-probe', default='',
                   help='Comma separated addresses; records the stack pointer at each')
    p.add_argument('--ring', type=int, default=0,
                   help='Keep this many recent ROM execution addresses for the trap report')
    p.add_argument('--trap-after', type=int, default=900,
                   help='Arm the trap only after this many frames, so boot does not trip it')
    p.add_argument('--watch-low', type=lambda x: int(x, 0), default=0)
    p.add_argument('--watch-high', type=lambda x: int(x, 0), default=0)
    p.add_argument('--watch-log', type=int, default=0,
                   help='Keep this many recent accesses to the watched range, in order')
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
              .replace('WATCH_HIGH', str(a.watch_high))
              .replace('WATCH_LOG', str(a.watch_log))
              .replace('TRAP_LOW', str(a.trap_low))
              .replace('TRAP_HIGH', str(a.trap_high))
              .replace('TRAP_AFTER', str(a.trap_after))
              .replace('RING', str(a.ring))
              .replace('SP_PROBES', sp_probe_lua(a.sp_probe))
              .replace('FRAME_STATS', 'true' if a.frame_stats else 'false'))
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
