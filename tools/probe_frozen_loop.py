"""Load a savestate of a hung frame and report which addresses the CPU runs.

A frame-boundary sample tells you almost nothing about a game stuck inside one
frame: it lands wherever the interrupt happened to leave the CPU. This counts
executed addresses instead, over ranges given on the command line, so the loop
names itself. Registers are captured at the first hit of the busiest address.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import tempfile

LUA = r'''
local root=ROOT
local counts={}
local order={}
local regs=nil
local frames=0
local function write(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local function note(address)
 local hit=counts[address]
 if hit==nil then counts[address]=1;order[#order+1]=address else counts[address]=hit+1 end
 if regs==nil and #order>WARMUP then
  local s=emu.getState()
  local parts={}
  for i=0,15 do parts[#parts+1]=string.format('"r%d":%d',i,s['cpu.r'..i] or 0) end
  parts[#parts+1]=string.format('"pc_pipeline":%d',s['cpu.pipeline.execute.address'] or 0)
  parts[#parts+1]=string.format('"at":%d',address)
  regs='{'..table.concat(parts,',')..'}'
 end
end
RANGES
local function dumpRegion(name,memType,first,size)
 local parts={}
 for i=first,first+size-1 do parts[#parts+1]=string.char(emu.read(i,memType,false)) end
 write(name,table.concat(parts))
end
local function dump()
 if DUMP then
  dumpRegion('ewram.bin',emu.memType.gbaExtWorkRam,0,0x40000)
  dumpRegion('iwram.bin',emu.memType.gbaIntWorkRam,0,0x8000)
 end
 local rows={}
 for _,address in ipairs(order) do
  rows[#rows+1]=string.format('{"address":%d,"count":%d}',address,counts[address])
 end
 write('exec_counts.json','['..table.concat(rows,',')..']')
 write('regs.json',regs or 'null')
 write('frames.txt',tostring(frames))
end
local function onceExec(fn)
 local id
 id=emu.addMemoryCallback(function()
  emu.removeMemoryCallback(id,emu.callbackType.exec,0,0x0fffffff)
  fn()
 end,emu.callbackType.exec,0,0x0fffffff)
end
onceExec(function()
 local f=assert(io.open(root..'/input.mss','rb'));local data=f:read('*a');f:close()
 assert(emu.loadSavestate(data),'State load failed')
end)
emu.addEventCallback(function()
 frames=frames+1
 if frames>=TOTAL then
  dump()
  write('screen.png',emu.takeScreenshot())
  emu.stop(0)
 end
end,emu.eventType.endFrame)
'''


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--rom', type=Path, required=True)
    p.add_argument('--mesen', type=Path, required=True)
    p.add_argument('--state', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--range', action='append', required=True,
                   help='low:high, e.g. 0:0x3fff')
    p.add_argument('--frames', type=int, default=20)
    p.add_argument('--dump-memory', action='store_true', help='Also write EWRAM and IWRAM')
    p.add_argument('--warmup', type=int, default=8,
                   help='distinct addresses to see before capturing registers')
    a = p.parse_args()
    if a.out.exists():
        raise SystemExit('Refusing to overwrite an existing observation')
    ranges = []
    for item in a.range:
        low, _, high = item.partition(':')
        ranges.append((int(low, 0), int(high, 0)))
    lua_ranges = '\n'.join(
        'emu.addMemoryCallback(function(address) note(address) end,'
        'emu.callbackType.exec,%d,%d)' % (low, high) for low, high in ranges)
    runtime = Path(tempfile.mkdtemp(prefix='exe2-frozen-'))
    shutil.copy2(a.state, runtime / 'input.mss')
    lua = (LUA.replace('ROOT', json.dumps(runtime.as_posix()))
              .replace('RANGES', lua_ranges)
              .replace('WARMUP', str(a.warmup))
              .replace('TOTAL', str(a.frames))
              .replace('DUMP', 'true' if a.dump_memory else 'false'))
    (runtime / 'probe.lua').write_text(lua, encoding='utf-8')
    command = [str(a.mesen.resolve()), '--testRunner', '--noAudio', '--enableStdout',
               '--timeout=120', str(runtime / 'probe.lua'), str(a.rom.resolve())]
    run = subprocess.run(command, cwd=a.mesen.parent, capture_output=True, timeout=180)
    a.out.mkdir(parents=True)
    for file in runtime.iterdir():
        shutil.copy2(file, a.out / file.name)
    (a.out / 'stdout.txt').write_bytes(run.stdout)
    (a.out / 'stderr.txt').write_bytes(run.stderr)
    print(json.dumps({'return_code': run.returncode,
                      'files': sorted(f.name for f in a.out.iterdir())},
                     ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
