
local root="C:/Users/Public/Documents/ESTsoft/CreatorTemp/exe2-choice-renderer-h7xge1tx"
local frame=0
local ready=false
local ram=emu.memType.gbaExtWorkRam
local function output(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local function once(fn)
 local id
 id=emu.addMemoryCallback(function()
  emu.removeMemoryCallback(id,emu.callbackType.exec,0,0x0fffffff);fn()
 end,emu.callbackType.exec,0,0x0fffffff)
end
once(function()
 local f=assert(io.open(root..'/input.mss','rb'));local data=f:read('*a');f:close()
 assert(emu.loadSavestate(data));ready=true
end)
local function w(offset,value) emu.write(offset,value,ram) end
local function u32(offset,value)
 for i=0,3 do w(offset+i,math.floor(value/256^i)%256) end
end
local function capture(name)
 output(name..'.png',emu.takeScreenshot())
 output(name..'.json',string.format('{"frame":%d,"entry":%d,"state":%d,"col":%d,"row":%d}',frame,emu.read(0x8731,ram),emu.read(0x8730,ram),emu.read(0x873e,ram),emu.read(0x873f,ram)))
end
local function pulse(n) return frame>=n and frame<n+4 end
emu.addEventCallback(function()
 local a=false
 for n=250,450-1,200 do a=a or pulse(n) end
 if "alternate"~='cancel' then a=a or pulse(450+180) end
 emu.setInput({a=a,b="alternate"=='cancel' and pulse(450+180),right="alternate"=='alternate' and pulse(450+60),left=false,up=false,down=false,start=false,select=false,l=false,r=false},0)
end,emu.eventType.inputPolled)
emu.addEventCallback(function()
 if not ready then return end
 frame=frame+1
 if frame==30 then
  local f=assert(io.open(root..'/archive.bin','rb'));local data=f:read('*a');f:close()
  for i=1,#data do w(0x38800+i-1,data:byte(i)) end
  for _,offset in ipairs({2,4,5,6,9,14,15,17,18,20}) do w(0x8730+offset,0) end
  w(0x8730,1);w(0x8731,6);w(0x8738,2)
  u32(0x8754,0x02038800+970);u32(0x8758,0x02038800);u32(0x875c,0x02038800+970)
 end
 for n=150,450-1,200 do if frame==n then capture('page_'..n) end end
 if frame==450 then capture('choice_default') end
 if frame==450+120 then capture('choice_selected') end
 if frame==450+380 then
  capture('branch')
  once(function() output('checkpoint.mss',emu.createSavestate());output('complete.txt','true');emu.stop(0) end)
 end
end,emu.eventType.endFrame)
