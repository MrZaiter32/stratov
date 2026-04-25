function onUse(cid, item, frompos, item2, topos)
if item.uid == 2160 then -- Action de quest
queststatus = getPlayerStorageValue(cid,2160) -- Store de quest
if queststatus == -1 or queststatus == false then
	doPlayerSendTextMessage(cid,22,"You have found a 2 Crystal Coins.") -- Descripcion de Quest
		item_uid = doPlayerAddItem(cid,2160,2) -- Cantidad
		setPlayerStorageValue(cid,2160,1) -- Store de quest
	else
		doPlayerSendTextMessage(cid,22,"it\'s empty.")
	end
else
return false
end
return true
end