local frame = 0

local function on_end_frame()
  frame = frame + 1
  if frame == 1 or frame % 60 == 0 then
    local state = emu.getState()
    emu.log(string.format("BOOT_SMOKE frame=%d pc=%s", frame, tostring(state["cpu.pc"])))
  end
  if frame >= 600 then
    emu.log("BOOT_SMOKE PASS frames=600")
    emu.stop(0)
  end
end

emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
