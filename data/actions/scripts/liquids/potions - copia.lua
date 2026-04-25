local config = {
	removeOnUse = "yes",
	usableOnTarget = "no", -- can be used on target? (fe. healing friend)
	splashable = "no",
	realAnimation = "yes", -- make text effect visible only for players in range 1x1
	healthMultiplier = 1.0,
	manaMultiplier = 1.0
}

config.removeOnUse = getBooleanFromString(config.removeOnUse)
config.usableOnTarget = getBooleanFromString(config.usableOnTarget)
config.splashable = getBooleanFromString(config.splashable)
config.realAnimation = getBooleanFromString(config.realAnimation)

local POTIONS = {
	[8704] = {empty = 7636, splash = 2, health = {50, 100}, mana = {20, 30}}, -- small health potion
	[7618] = {empty = 7636, splash = 2, health = {100, 150}, mana = {50, 100}}, -- health potion
	[7620] = {empty = 7636, splash = 7, health = {50, 100}, mana = {100, 150}}, -- mana potion
	
	[7588] = {empty = 7634, level = 30, splash = 2, health = {350, 400}, mana = {100, 150}}, -- strong health potion
	[7589] = {empty = 7634, level = 30, splash = 7, health = {100, 150}, mana = {350, 400}}, -- strong mana potion
	
	[7591] = {empty = 7635, level = 90, splash = 2, health = {600, 800}, mana = {200, 250}, vocations = {4, 8, 12, 16, 20, 24, 28, 32, 3, 7, 11, 15, 19, 23, 27, 31}, vocStr = "knights and paladins"}, -- great health potion
	[7590] = {empty = 7635, level = 90, splash = 7, health = {200, 250}, mana = {600, 800}, vocations = {1, 5, 9, 13, 17, 21, 25, 29, 2 , 6, 10, 14, 18, 22, 26, 30, 3, 7, 11, 15, 19, 23, 27, 31}, vocStr = "sorcerers, druids and paladins"}, -- great mana potion
	
	[8472] = {empty = 7635, level = 120, splash = 3, health = {300, 300}, mana = {800, 1000}, vocations = {1, 5, 9, 13, 17, 21, 25, 29, 2 , 6, 10, 14, 18, 22, 26, 30, 3, 7, 11, 15, 19, 23, 27, 31}, vocStr = "sorcerers, druids and paladins"}, -- great spirit potion
	[8473] = {empty = 7635, level = 120, splash = 2, health = {1000, 1400}, mana = {500, 800}, vocations = {4, 8, 12, 16, 20, 24, 28, 32, 3, 7, 11, 15, 19, 23, 27, 31}, vocStr = "knights and paladins"}, -- ultimate health potion
		
	[16126] = {empty = 7635, level = 150, splash = 3, health = {400, 400}, mana = {1000, 1500}, vocations = {1, 5, 9, 13, 17, 21, 25, 29, 2, 6, 10, 14, 18, 22, 26, 30}, vocStr = "sorcerers and druids"} -- ultimate spirit potion
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local potion = POTIONS[item.itemid]
	if(not potion) then
		return false
	end

	if(not isPlayer(itemEx.uid)) then
		if(not config.splashable) then
			return false
		end

		if(toPosition.x == CONTAINER_POSITION) then
			toPosition = getThingPos(item.uid)
		end

		doDecayItem(doCreateItem(2016, potion.splash, toPosition))
		doTransformItem(item.uid, potion.empty)
		return true
	end

	if(hasCondition(cid, CONDITION_EXHAUST_HEAL)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end

	if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and
		not getPlayerCustomFlagValue(cid, PlayerCustomFlag_GamemasterPrivileges))
	then
		doCreatureSay(itemEx.uid, "Only " .. potion.vocStr .. (potion.level and (" of level " .. potion.level) or "") .. " or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return true
	end

	local health = potion.health
	if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.healthMultiplier))) then
		return false
	end

	local mana = potion.mana
	if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.manaMultiplier))) then
		return false
	end

	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	if(not realAnimation) then
		doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1)
	else
		doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1, false, itemEx.uid)
	end

	doAddCondition(cid, exhaust)
	if(not potion.empty or config.removeOnUse) then
		doRemoveItem(item.uid)
		return true
	end

	doTransformItem(item.uid, potion.empty)
	return true
end
