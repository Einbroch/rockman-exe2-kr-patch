
local root="C:/Users/Public/Documents/ESTsoft/CreatorTemp/exe2-pet-memory-jd1_e37v"
local function output(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local ready=false
local id
id=emu.addMemoryCallback(function()
 emu.removeMemoryCallback(id,emu.callbackType.exec,0,0x0fffffff)
 local f=assert(io.open(root..'/input.mss','rb'));local data=f:read('*a');f:close()
 assert(emu.loadSavestate(data));ready=true
end,emu.callbackType.exec,0,0x0fffffff)
emu.addEventCallback(function()
 if not ready then return end
 local types={}
 for k,v in pairs(emu.memType) do types[#types+1]=k..'='..tostring(v) end
 table.sort(types);output('memory_types.txt',table.concat(types,'\n'))
 local state={}
 for k,v in pairs(emu.getState()) do state[#state+1]=k..'='..tostring(v) end
 table.sort(state);output('state.txt',table.concat(state,'\n'))
 for _,def in ipairs({{'gbaVideoRam',0x18000},{'gbaPaletteRam',0x400},{'gbaSpriteRam',0x400},{'gbaExtWorkRam',0x40000},{'gbaIntWorkRam',0x8000}}) do
  local kind=emu.memType[def[1]]
  if kind then
   local bytes={}
   for n=0,def[2]-1 do bytes[#bytes+1]=string.char(emu.read(n,kind)) end
   output(def[1]..'.bin',table.concat(bytes))
  end
 end
 output('screen.png',emu.takeScreenshot());output('complete.txt','true');emu.stop(0)
end,emu.eventType.endFrame)
