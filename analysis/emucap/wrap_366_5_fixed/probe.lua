
local root="C:/Users/Public/Documents/ESTsoft/CreatorTemp/exe2-wrap-i0shhr11"
local frame=0
local ram=emu.memType.gbaExtWorkRam
local maxcol=0
local maxrow=0
local function w(off,v) emu.write(off,v,ram) end
local function u32(off,v) for i=0,3 do w(off+i,math.floor(v/256^i)%256) end end
local function pulse(n) return frame>=n and frame<n+3 end
local function capture(name)
 local f=assert(io.open(root..'/'..name..'.png','wb'));f:write(emu.takeScreenshot());f:close()
 local g=assert(io.open(root..'/'..name..'.json','w'))
 g:write(string.format('{"frame":%d,"entry":%d,"col":%d,"row":%d,"x_tile":%d,"y_tile":%d,"max_col":%d,"max_row":%d}',frame,emu.read(0x8731,ram),emu.read(0x873E,ram),emu.read(0x873F,ram),emu.read(0x874A,ram),emu.read(0x874B,ram),maxcol,maxrow));g:close()
end
emu.addEventCallback(function()
 local keyA=pulse(860) or (frame>=1100 and frame<1750 and frame%90<4) or pulse(2050) or pulse(2400)
 emu.setInput({start=pulse(700),a=keyA,b=false,left=false,right=false,up=false,down=false},0)
end,emu.eventType.inputPolled)
emu.addEventCallback(function()
 frame=frame+1
 if frame==1800 then
  local f=assert(io.open(root..'/archive.bin','rb'));local data=f:read('*a');f:close()
  for i=1,#data do w(0x38800+i-1,data:byte(i)) end
  for _,off in ipairs({2,4,5,6,9,14,15,17,18,20}) do w(0x8730+off,0) end
  w(0x8730,1);w(0x8731,5);w(0x8738,2)
  u32(0x8754,0x02038800+791);u32(0x8758,0x02038800);u32(0x875C,0x02038800+791)
 end
 if frame>1800 and frame<2400 then
  maxcol=math.max(maxcol,emu.read(0x873E,ram));maxrow=math.max(maxrow,emu.read(0x873F,ram))
 end
 if frame==2020 then capture('first_page') end
 if frame==2350 then capture('second_page') end
 if frame==2500 then capture('after_confirm');emu.stop(0) end
end,emu.eventType.endFrame)
