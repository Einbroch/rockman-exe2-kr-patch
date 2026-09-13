
local root="C:/Users/Public/Documents/ESTsoft/CreatorTemp/exe2-play-59i66wdz"
local actions={{start=0,release=1,finish=600,keys={}},{start=600,release=602,finish=782,keys={"start"}},{start=782,release=784,finish=1024,keys={"a"}},{start=1024,release=1026,finish=1176,keys={"a"}}}
local frame=0
local ready=not false
local final=false
local function write(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local function capture(name)
 write(name..'.png',emu.takeScreenshot())
 local ram=emu.memType.gbaExtWorkRam
 write(name..'.json',string.format('{"frame":%d,"renderer_state":%d,"entry":%d,"col":%d,"row":%d}',frame,emu.read(0x8730,ram),emu.read(0x8731,ram),emu.read(0x873e,ram),emu.read(0x873f,ram)))
end
local function onceExec(fn)
 local id
 id=emu.addMemoryCallback(function()
  emu.removeMemoryCallback(id,emu.callbackType.exec,0,0x0fffffff)
  fn()
 end,emu.callbackType.exec,0,0x0fffffff)
end
if false then
 onceExec(function()
  local f=assert(io.open(root..'/input.mss','rb'));local data=f:read('*a');f:close()
  assert(emu.loadSavestate(data),'State load failed')
  write('loaded.txt','true');ready=true
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
 for i,a in ipairs(actions) do
  if frame==a.finish then capture(string.format('step_%03d',i)) end
 end
 if frame>=1176 then
  final=true
  onceExec(function()
   write('checkpoint.mss',emu.createSavestate())
   write('complete.txt',tostring(frame))
   emu.stop(0)
  end)
 end
end,emu.eventType.endFrame)
