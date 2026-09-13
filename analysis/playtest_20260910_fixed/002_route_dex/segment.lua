
local root="C:/Users/Public/Documents/ESTsoft/CreatorTemp/exe2-play-ff12n3_e"
local actions={{start=0,release=6,finish=16,keys={"up"}},{start=16,release=61,finish=81,keys={"left"}},{start=81,release=126,finish=146,keys={"up"}},{start=146,release=191,finish=211,keys={"left"}},{start=211,release=247,finish=257,keys={"left"}},{start=257,release=263,finish=273,keys={"up"}},{start=273,release=283,finish=293,keys={"left"}},{start=293,release=299,finish=309,keys={"up"}},{start=309,release=354,finish=364,keys={"down"}},{start=364,release=404,finish=414,keys={"left"}},{start=414,release=454,finish=464,keys={"down"}},{start=464,release=519,finish=529,keys={"left"}},{start=529,release=564,finish=574,keys={"down"}},{start=574,release=640,finish=650,keys={"left"}},{start=650,release=656,finish=666,keys={"up"}},{start=666,release=674,finish=684,keys={"left"}},{start=684,release=690,finish=870,keys={"a"}}}
local frame=0
local ready=not true
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
if true then
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
 if frame>=870 then
  final=true
  onceExec(function()
   write('checkpoint.mss',emu.createSavestate())
   write('complete.txt',tostring(frame))
   emu.stop(0)
  end)
 end
end,emu.eventType.endFrame)
