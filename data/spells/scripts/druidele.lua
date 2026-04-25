local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 30)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, FALSE)

local condition2 = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition2, CONDITION_PARAM_SUBID, 2)
setConditionParam(condition2, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 2 * 60 * 1000)
setConditionParam(condition2, CONDITION_PARAM_HEALTHGAIN, 1)
setConditionParam(condition2, CONDITION_PARAM_HEALTHTICKS, 1500)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat3, COMBAT_PARAM_AGGRESSIVE, FALSE)

local condition3 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition3, CONDITION_PARAM_SUBID, 3)
setConditionParam(condition3, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition3, CONDITION_PARAM_TICKS, 2 * 60 * 1000)
setConditionParam(condition3, CONDITION_PARAM_STAT_MAGICLEVEL, -10)

function onCastSpell(cid, var,param)
pos = getCreaturePosition(cid)

	local mana = (400)
    if(getCreatureMana(cid) < mana) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
		doSendMagicEffect(pos, CONST_ME_POFF)
		return LUA_ERROR
	end
	if(doCombat(cid, combat, var) ~= LUA_NO_ERROR) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		doSendMagicEffect(pos, CONST_ME_POFF)
		
		return LUA_ERROR
	end
	doSetCreatureOutfit(cid,{lookType = 211, lookHead =  getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet, lookAddons = getCreatureOutfit(cid).lookAddons},2 * 60 * 1000)
    doAddCondition(cid, condition)
    doAddCondition(cid, condition2)
    doAddCondition(cid, condition3)
	doCreatureAddMana(cid, -mana, FALSE)
	doPlayerAddSpentMana(cid, mana)
	return LUA_NO_ERROR
end