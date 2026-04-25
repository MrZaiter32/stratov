local config = {
	storage = 7500,
	mailbox = {
		{x = 926, y = 984, z = 6} -- mailbox location on map : 926] [Y: 984] [Z: 6].
	}
}
 
local ranks = {
	["Aora tu Eres Master"] = {
		c = {
			level = 300,
			prize = {2160, 100}
		}
	},
}
 
local function doPlayerAddDepotItems(cid, pos, town, items, notify) -- credits to Chojy for idea.
	local parcel = doCreateItemEx(2595)
	local label = doAddContainerItem(parcel, 2599)
	doSetItemText(label, getCreatureName(cid) .."\n".. town)
	doAddContainerItemEx(parcel, items)
	doTeleportThing(parcel, pos)
	if(notify == true) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your reward has been sent to your depot because you were unable to carry it.")
	end
 
	return true
end
 
function onAdvance(cid, skill, oldLevel, newLevel)
	for desc, i in pairs(ranks) do
		if skill == SKILL__LEVEL then
			if newLevel >= i.c.level then
				if getCreatureStorage(cid, config.storage) < newLevel then
 
					local id = doCreateItemEx(i.c.prize[1], i.c.prize[2] or 1)
					if(doPlayerAddItemEx(cid, id, false) ~= RETURNVALUE_NOERROR) then
						doPlayerAddDepotItems(cid, config.mailbox[1], getTownName(getPlayerTown(cid)), id, true)
					end
 
					doCreatureSetStorage(cid, config.storage, newLevel)
					doSendMagicEffect(getThingPos(cid), CONST_ME_GIFT_WRAPS)
					doCreatureSay(cid, "Congratulations! You are now a " .. desc .. ".", TALKTYPE_MONSTER)
					break
				end
			end
		end
	end
 
	return true
end