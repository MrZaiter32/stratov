local combat1 = createCombatObject() -- Spell By Alkaliine
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_STUN)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_SLEEP)

local condition1 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, 15000)
setConditionParam(condition1, CONDITION_PARAM_SPEED, -1000)
setConditionFormula(condition1, -0.9, 0, -0.9, 0)
setCombatCondition(combat1, condition1)

local condition2 = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 15000)
setCombatCondition(combat1, condition2)

arr1 = {
{0, 3, 0}
}

arr2 = {
{0, 3, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
doPlayerAddMana(cid, -600)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
end  