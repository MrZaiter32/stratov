function onStepIn(cid, item, position, fromPosition)
local playerpos = getPlayerPosition(cid)

	if item.actionid == 12581 and getPlayerLevel(cid) >= 600 then 
		doTeleportThing(cid, {x = playerpos.x-1, y = playerpos.y, z = playerpos.z}, false)
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
	else
		doPlayerSendTextMessage(cid,22,"No puedes pasar.. El rey admite 600 o mas.")
	end
	return true
end