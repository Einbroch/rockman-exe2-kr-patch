
local root="C:/Users/Public/Documents/ESTsoft/CreatorTemp/exe2-play-3mjtgts2"
local actions={{start=0,release=1,finish=601,keys={}},{start=601,release=607,finish=727,keys={"start"}},{start=727,release=733,finish=913,keys={"a"}},{start=913,release=919,finish=1099,keys={"l"}}}
local frame=0
local ready=not false
local final=false
local petLoads={}
local petMaps={}
local function write(name,data)
 local f=assert(io.open(root..'/'..name,'wb'));f:write(data);f:close()
end
local function capture(name)
 write(name..'.png',emu.takeScreenshot())
 local ram=emu.memType.gbaExtWorkRam
 write(name..'.json',string.format('{"frame":%d,"renderer_state":%d,"entry":%d,"col":%d,"row":%d}',frame,emu.read(0x8730,ram),emu.read(0x8731,ram),emu.read(0x873e,ram),emu.read(0x873f,ram)))
 if true then
  local function dump(first,size)
   local data={}
   for i=first,first+size-1 do data[#data+1]=string.char(emu.read(i,emu.memType.gbaVideoRam)) end
   return table.concat(data)
  end
  write(name..'_pet_tiles.bin',dump(0xc800,0xac0))
  write(name..'_bg0_map.bin',dump(0xe000,0x800))
  write('pet_asset_trace.json','{"loads":['..table.concat(petLoads,',')..'],"maps":['..table.concat(petMaps,',')..']}')
 end
 if true then
  local cpu=emu.getState()
  local regs={}
  for i=0,15 do regs[#regs+1]=string.format('"r%d":%d',i,cpu['cpu.r'..i]) end
  write(name..'_cpu.json','{'..table.concat(regs,',')..'}')
 end
end
if true then
 emu.addMemoryCallback(function()
  local s=emu.getState()
  if s['cpu.r0']==0x087d7fbc then
   petLoads[#petLoads+1]=string.format('{"frame":%d,"source":%d,"destination":%d,"word_count":%d}',frame,s['cpu.r0'],s['cpu.r1'],s['cpu.r2'])
  end
 end,emu.callbackType.exec,0x08000a28,0x08000a28)
 emu.addMemoryCallback(function()
  local s=emu.getState();local ptr=s['cpu.r3']
  if ptr==0x087d8adc or ptr==0x087d8ce4 or ptr==0x087d8eec or ptr==0x087d90f4 then
   if #petMaps==0 or petMaps.last~=ptr then
    petMaps[#petMaps+1]=string.format('{"frame":%d,"source":%d,"width":%d,"height":%d}',frame,ptr,s['cpu.r4'],s['cpu.r5']);petMaps.last=ptr
   end
  end
 end,emu.callbackType.exec,0x08001870,0x08001870)
end
if true then
 local hookHits=0
 local nativeHits=0
 local labels={}
 local events={}
 local fault=nil
 local function event(address)
  if not ready then return end
  local s=emu.getState()
  local fields={string.format('"pc":%d',address)}
  for i=0,15 do fields[#fields+1]=string.format('"r%d":%d',i,s['cpu.r'..i]) end
  events[#events+1]='{'..table.concat(fields,',')..'}'
  if #events>120 then table.remove(events,1) end
 end
 local function traceResult(invalid)
  if invalid then fault=invalid end
  local encoded={}
  for _,label in ipairs(labels) do encoded[#encoded+1]=string.format('{"archive":%d,"entry":%d}',label.archive,label.entry) end
  write('menu_trace.json',string.format('{"hangul_hook_hits":%d,"native_f9_hits":%d,"invalid_stream":%s,"labels":[%s]}',hookHits,nativeHits,fault or 'null',table.concat(encoded,',')))
  write('menu_cpu_events.json','['..table.concat(events,',')..']')
 end
 for _,addr in ipairs({0x08830000,0x08830100,0x08830200,0x03006dc8,0x0300707c}) do
  emu.addMemoryCallback(function() event(addr) end,emu.callbackType.exec,addr,addr)
 end
 emu.addMemoryCallback(function(addr)
  if not ready then return end
  event(addr);traceResult(nil);capture('unexpected_ewram_execution');emu.stop(3)
 end,emu.callbackType.exec,0x02000000,0x02ffffff)
 emu.addMemoryCallback(function()
  hookHits=hookHits+1
 end,emu.callbackType.exec,0x08830300,0x08830300)
 emu.addMemoryCallback(function()
  nativeHits=nativeHits+1
 end,emu.callbackType.exec,0x0300707c,0x0300707c)
 emu.addMemoryCallback(function()
  local cpu=emu.getState()
  labels[#labels+1]={archive=cpu['cpu.r0'],entry=cpu['cpu.r1']}
 end,emu.callbackType.exec,0x08020f38,0x08020f38)
 emu.addMemoryCallback(function()
  local pos=emu.getState()['cpu.r0']
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
 if frame>=1099 then
  final=true
  onceExec(function()
   write('checkpoint.mss',emu.createSavestate())
   write('complete.txt',tostring(frame))
   emu.stop(0)
  end)
 end
end,emu.eventType.endFrame)
