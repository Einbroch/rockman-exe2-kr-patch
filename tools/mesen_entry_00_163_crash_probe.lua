local frame = 0
local targetHits = 0
local invalidPc = false
local targetStart = 0x088CE324 + 528
local targetEnd = 0x088CE324 + 574
local trace = assert(io.open("C:/Users/blari/AppData/Local/Temp/mesen_entry_00_163_crash_probe.txt", "w"))

local function pulse(first, last)
  return frame >= first and frame <= last
end

local function on_input()
  local a = pulse(860, 864)
  if frame >= 1050 and frame <= 5000 and frame % 45 <= 4 then
    a = true
  end
  emu.setInput({
    start = pulse(700, 704),
    a = a,
    b = false,
    up = false,
    down = false,
    left = false,
    right = false
  }, 0)
end

local function write_cpu(prefix, state)
  trace:write(string.format(
    "%s frame=%d pc=%08X sp=%08X lr=%08X r0=%08X r1=%08X r2=%08X r3=%08X r4=%08X r5=%08X r6=%08X r7=%08X r8=%08X\n",
    prefix,
    frame,
    state.cpu.r15,
    state.cpu.r13,
    state.cpu.r14,
    state.cpu.r0,
    state.cpu.r1,
    state.cpu.r2,
    state.cpu.r3,
    state.cpu.r4,
    state.cpu.r5,
    state.cpu.r6,
    state.cpu.r7,
    state.cpu.r8
  ))
  trace:flush()
end

local function on_main_hook()
  local state = emu.getState()
  if state.cpu.r4 >= targetStart and state.cpu.r4 < targetEnd then
    targetHits = targetHits + 1
    write_cpu("TARGET", state)
  end
end

local function on_end_frame()
  frame = frame + 1
  local state = emu.getState()
  local pc = state.cpu.r15
  if pc == 0x71683800 or pc >= 0x0E010000 then
    invalidPc = true
    write_cpu("INVALID", state)
    trace:close()
    emu.stop(2)
    return
  end
  if frame >= 5000 then
    write_cpu("END", state)
    trace:write(string.format("target_hits=%d invalid_pc=%s\n", targetHits, tostring(invalidPc)))
    trace:close()
    emu.stop(0)
  end
end

emu.addMemoryCallback(on_main_hook, emu.callbackType.exec, 0x08020C70)
emu.addEventCallback(on_input, emu.eventType.inputPolled)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
