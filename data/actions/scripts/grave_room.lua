local roomPos  = {x = 443, y = 1412, z = 6}
function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 62423 then 
	if(getPlayerStorageValue(cid, 5808) == 1) and (getPlayerStorageValue(cid, 8266== 1) and (getPlayerStorageValue(cid, 5943) == 1) then
		doTeleportThing(cid, roomPos, true)
		doSendMagicEffect(roomPos, CONST_ME_TELEPORT)
	end
end
return true
end