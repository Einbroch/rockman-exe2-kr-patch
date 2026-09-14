
local root="C:/Users/Public/Documents/ESTsoft/CreatorTemp/exe2-play-3wzl6ju8"
local actions={{start=0,release=1,finish=600,keys={}},{start=600,release=606,finish=726,keys={"start"}},{start=726,release=732,finish=912,keys={"a"}},{start=912,release=918,finish=1038,keys={"start"}}}
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
if true then
 local hookHits=0
 local nativeHits=0
 local labels={}
 local function traceResult(invalid)
  local encoded={}
  for _,label in ipairs(labels) do encoded[#encoded+1]=string.format('{"archive":%d,"entry":%d}',label.archive,label.entry) end
  write('menu_trace.json',string.format('{"hangul_hook_hits":%d,"native_f9_hits":%d,"invalid_stream":%s,"labels":[%s]}',hookHits,nativeHits,invalid or 'null',table.concat(encoded,',')))
 end
 emu.addMemoryCallback(function()
  hookHits=hookHits+1
 end,emu.callbackType.exec,0x08830300,0x08830300)
 emu.addMemoryCallback(function()
  nativeHits=nativeHits+1
 end,emu.callbackType.exec,0x0300707c,0x0300707c)
 emu.addMemoryCallback(function()
  local cpu=emu.getState().cpu
  labels[#labels+1]={archive=cpu.r0,entry=cpu.r1}
 end,emu.callbackType.exec,0x08020f38,0x08020f38)
 emu.addMemoryCallback(function()
  local pos=emu.getState().cpu.r0
  if pos>=0x10000000 then
   traceResult(tostring(pos));capture('invalid_menu_stream');emu.stop(2)
  end
 end,emu.callbackType.exec,0x03006df0,0x03006df0)
 emu.addEventCallback(function() traceResult(nil) end,emu.eventType.endFrame)
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
 if frame>=1038 then
  final=true
  onceExec(function()
   write('checkpoint.mss',emu.createSavestate())
   write('complete.txt',tostring(frame))
   emu.stop(0)
  end)
 end
end,emu.eventType.endFrame)
