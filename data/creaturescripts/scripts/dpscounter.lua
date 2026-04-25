local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_SUBID, 82936)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 10000)
 
function getDamageDone(cid, targetpos)
	targetpos.x = targetpos.x - 1
	if(isPlayer(cid)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Average DPS: ".. getPlayerStorageValue(cid, 82936) / 10 .."")
		doCreatureSay(cid, "You are currently dealing an average of ".. getPlayerStorageValue(cid, 82936) / 10 .." damage per second.", TALKTYPE_ORANGE_1, false, 0, targetpos)
		return setPlayerStorageValue(cid, 82936, 0)
	end
	return true
end
 
function onStatsChange(cid, attacker, type, combat, value)
	if(type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) then
		if(not isPlayer(attacker)) then
			return true
		end
 
		setPlayerStorageValue(attacker, 82936, getPlayerStorageValue(attacker, 82936) + value)
 
		if(getCreatureCondition(attacker, CONDITION_EXHAUST, 82936) == false) then
			setPlayerStorageValue(attacker, 82936, 0)
			addEvent(getDamageDone, 9900, attacker, getCreaturePosition(cid))
			doAddCondition(attacker, exhaust)
		end
	end
    return true
end
