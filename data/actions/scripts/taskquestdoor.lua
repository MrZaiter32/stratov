local function doorEnter(cid, item, toPosition)
	doTransformItem(item.uid, item.itemid + 1)
	doTeleportThing(cid, toPosition)
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
 
	local doorStorage = 98 -- (Must be the same in npcs)
 
	if(getPlayerStorageValue(cid, doorStorage) > 0) then
		doorEnter(cid, item, toPosition)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You can only enter if you've done Rangelongs task!")
		return true
	end
 
	return true
end