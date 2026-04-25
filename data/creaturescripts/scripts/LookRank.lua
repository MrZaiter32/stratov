local t = {
	[100] = {"Master"}
}
 
local storage = 7500
function onLook(cid, thing, position, lookDistance)
	if isPlayer(thing.uid) then
		local voc = getPlayerVocation(thing.uid)
		if t[getCreatureStorage(thing.uid, storage)] then
			if cid == thing.uid then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You see yourself. " .. (voc == 0 and "You have no vocation" or "You are " .. getVocationInfo(voc).description) .. ".\nYou are also ranked as " .. t[getCreatureStorage(thing.uid, storage)][1] .. ".")
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You see " .. getCreatureName(thing.uid) .. " (Level: " .. getPlayerLevel(thing.uid) .. "). " .. (getPlayerSex(thing.uid) == 0 and "She" or "He") .. " " .. (voc == 0 and 'has no vocation' or 'is ' .. getVocationInfo(voc).description) .. ". " .. (getPlayerSex(thing.uid) == 0 and "\nShe" or "\nHe") .. " is also " .. t[getCreatureStorage(thing.uid, storage)][1] .. ".")
			end
 
			return false
		end
	end
 
	return true
end