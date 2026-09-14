"""Create a candidate-ROM savestate from a compatible prior checkpoint.

This is a runtime-test helper only.  It does not patch RAM or progress flags:
Mesen loads the existing state, executes the exact candidate ROM for a few
frames, and serializes a new checkpoint whose continuation is candidate-bound.
The provenance is recorded so this is never mistaken for a cold-start proof.
"""
from __future__ import annotations
import argparse, hashlib, json, subprocess, tempfile
from pathlib import Path

def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument('--rom', type=Path, required=True)
    p.add_argument('--mesen', type=Path, required=True)
    p.add_argument('--input-state', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    a = p.parse_args()
    if a.out.exists(): raise FileExistsError(a.out)
    a.out.mkdir(parents=True)
    runtime = Path(tempfile.mkdtemp(prefix='exe2-seed-'))
    state = runtime / 'input.mss'; state.write_bytes(a.input_state.read_bytes())
    lua = f'''local root={json.dumps(runtime.as_posix())}
local loaded=false
local saved=false
local frame=0
emu.addEventCallback(function()
 frame=frame+1
 if not loaded then
  local f=assert(io.open(root..'/input.mss','rb')); local d=f:read('*a'); f:close()
  assert(emu.loadSavestate(d),'prior state could not be loaded into candidate')
  loaded=true
 elseif frame>=4 and not saved then
  local f=assert(io.open(root..'/candidate.mss','wb')); f:write(emu.createSavestate()); f:close()
  saved=true; emu.stop(0)
 end
end,emu.eventType.endFrame)
'''
    script=runtime/'seed.lua'; script.write_text(lua,encoding='utf-8')
    run=subprocess.run([str(a.mesen.resolve()),'--testRunner','--noAudio','--enableStdout','--timeout=30',str(script),str(a.rom.resolve())],cwd=a.mesen.parent,capture_output=True,timeout=45)
    if run.returncode or not (runtime/'candidate.mss').exists():
        raise RuntimeError((run.stderr + run.stdout).decode('utf-8','replace'))
    target=a.out/'checkpoint.mss'; target.write_bytes((runtime/'candidate.mss').read_bytes())
    result={'kind':'candidate_bound_state_seed','rom_sha256':digest(a.rom),'emulator_sha256':digest(a.mesen),'input_state_sha256':digest(a.input_state),'output_state_sha256':digest(target),'provenance':'loaded prior checkpoint, executed exact candidate for four frames, and reserialized; not a cold-start proof'}
    (a.out/'result.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False,indent=2))
if __name__=='__main__': main()
