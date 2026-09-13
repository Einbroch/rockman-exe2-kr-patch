local frame = 0
local counts = { main = 0, scanner = 0, font = 0, main_custom = 0, scanner_custom = 0, font_custom = 0 }
local trace = assert(io.open("C:/Users/blari/AppData/Local/Temp/mesen_progression_live_trace.txt", "w"))
trace:write("MESEN_PROGRESSION_TRACE_START\n")
trace:flush()

local function pulse(first, last)
  return frame >= first and frame <= last
end

local function on_input()
  local a = pulse(860, 864)
  if frame >= 1100 and frame <= 3200 and frame % 90 <= 4 then
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

local function write_result()
  local state = emu.getState()
  local file = assert(io.open("C:/Users/blari/AppData/Local/Temp/mesen_progression_smoke_result.txt", "w"))
  file:write(string.format(
    "frames=%d\npc=%s\nmain_hook=%d\nscanner_hook=%d\nfont_hook=%d\nmain_custom=%d\nscanner_custom=%d\nfont_custom=%d\n",
    frame,
    tostring(state["cpu.pc"]),
    counts.main,
    counts.scanner,
    counts.font,
    counts.main_custom,
    counts.scanner_custom,
    counts.font_custom
  ))
  file:close()
end

local function on_end_frame()
  frame = frame + 1
  if frame == 1 or frame % 30 == 0 then
    local state = emu.getState()
    trace:write(string.format(
      "frame=%d pc=%s main=%d scanner=%d font=%d main_custom=%d scanner_custom=%d font_custom=%d\n",
      frame,
      tostring(state["cpu.pc"]),
      counts.main,
      counts.scanner,
      counts.font,
      counts.main_custom,
      counts.scanner_custom,
      counts.font_custom
    ))
    trace:flush()
  end
  if frame >= 1800 then
    write_result()
    trace:close()
    emu.stop(0)
  end
end

emu.addMemoryCallback(function() counts.main = counts.main + 1 end, emu.callbackType.exec, 0x08020C70)
emu.addMemoryCallback(function() counts.scanner = counts.scanner + 1 end, emu.callbackType.exec, 0x08020D28)
emu.addMemoryCallback(function() counts.font = counts.font + 1 end, emu.callbackType.exec, 0x08020D84)
emu.addMemoryCallback(function() counts.main_custom = counts.main_custom + 1 end, emu.callbackType.exec, 0x0883000A)
emu.addMemoryCallback(function() counts.scanner_custom = counts.scanner_custom + 1 end, emu.callbackType.exec, 0x0883010A)
emu.addMemoryCallback(function() counts.font_custom = counts.font_custom + 1 end, emu.callbackType.exec, 0x0883020E)
emu.addEventCallback(on_input, emu.eventType.inputPolled)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
