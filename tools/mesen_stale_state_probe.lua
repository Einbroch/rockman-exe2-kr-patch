local state_file = assert(io.open("C:/Users/blari/AppData/Local/Temp/exe2_stale_probe.ss1", "rb"))
local state_data = state_file:read("*all")
state_file:close()

local trace = assert(io.open("C:/Users/blari/AppData/Local/Temp/mesen_stale_state_probe.txt", "w"))
trace:write(string.format("state_bytes=%d\n", #state_data))
trace:flush()

local loaded = false
local frame = 0
local post_load_frames = 0

local function load_once()
  if loaded then
    return
  end
  loaded = true
  trace:write("load_requested=true\n")
  trace:flush()
  emu.loadSavestate(state_data)
end

local function on_end_frame()
  frame = frame + 1
  if loaded then
    post_load_frames = post_load_frames + 1
  end
  if frame % 30 == 0 then
    trace:write(string.format("frame=%d loaded=%s\n", frame, tostring(loaded)))
    trace:flush()
  end
  if loaded and post_load_frames >= 300 then
    trace:write("STALE_STATE_PROBE_COMPLETED\n")
    trace:close()
    emu.stop(0)
  end
end

emu.addMemoryCallback(load_once, emu.callbackType.exec, 0x080000C0)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
