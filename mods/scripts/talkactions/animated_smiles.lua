local config = {
	exhaust = 1, -- in seconds, prevent spam
	storage = 30050
}

function onSay(cid, words, param, channel)
	if(channel ~= CHANNEL_DEFAULT) then
		return false
	end

	if(exhaustion.check(cid, config.storage)) then -- prevent spam
		return false
	end

	

	exhaustion.set(cid, config.storage, config.exhaust)
	doCreatureSay(cid, words, TALKTYPE_ORANGE_1)
	return true
end