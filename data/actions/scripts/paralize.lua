local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.9, 40, -0.9, 0)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (not (isDruid(cid) or isSorcerer(cid))) and (getPlayerGroupId(cid) <= 6) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your vocation cannot use this rune.")
		return false
	end

	if (getPlayerMana(cid) < 2000) and (getPlayerGroupId(cid) <= 3) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don't have enough mana points.")
		return false
	end

	if (not (isPlayer(itemEx.uid))) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You may use paralyze only on players.")
		return false
	end

	if(getTilePzInfo(getCreaturePosition(cid)) == TRUE or getTilePzInfo(getCreaturePosition(itemEx.uid)) == TRUE) and (getPlayerGroupId(cid) <= 3) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can't paralyze in protection zone.")
		return false
	end
	doAddCondition(itemEx.uid, condition)
	doPlayerAddMana(cid, -2000)
	if(item.type > 1) then
		doTransformItem(item.uid, item.itemid, item.type-1)
	else
		doRemoveItem(item.uid)
	end
	return true
end