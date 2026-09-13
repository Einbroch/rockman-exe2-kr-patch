local frame = 0

local function render(value)
  if type(value) == "number" then
    return string.format("%d (0x%X)", value, value)
  end
  return tostring(value)
end

local function on_end_frame()
  frame = frame + 1
  if frame ~= 1 then
    return
  end
  local state = emu.getState()
  local keys = {}
  for key, _ in pairs(state) do
    table.insert(keys, key)
  end
  table.sort(keys)
  local file = assert(io.open("C:/Users/blari/AppData/Local/Temp/mesen_gba_state_keys.txt", "w"))
  for _, key in ipairs(keys) do
    local value = state[key]
    if type(value) == "table" then
      local nested = {}
      for child, _ in pairs(value) do
        table.insert(nested, child)
      end
      table.sort(nested)
      for _, child in ipairs(nested) do
        file:write(key .. "." .. child .. "=" .. render(value[child]) .. "\n")
      end
    else
      file:write(key .. "=" .. render(value) .. "\n")
    end
  end
  file:close()
  emu.stop(0)
end

emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
