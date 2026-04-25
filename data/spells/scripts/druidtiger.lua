local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2 * 60 * 1000)  -- Duración en milisegundos
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, -100)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, false)

local condition2 = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition2, CONDITION_PARAM_SUBID, 2)
setConditionParam(condition2, CONDITION_PARAM_BUFF, true)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 2 * 60 * 1000) -- Duración en milisegundos
setConditionParam(condition2, CONDITION_PARAM_HEALTHGAIN, 1)
setConditionParam(condition2, CONDITION_PARAM_HEALTHTICKS, 1500)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat3, COMBAT_PARAM_AGGRESSIVE, false)

local condition3 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition3, CONDITION_PARAM_SUBID, 3)
setConditionParam(condition3, CONDITION_PARAM_BUFF, true)
setConditionParam(condition3, CONDITION_PARAM_TICKS, 2 * 60 * 1000) -- Duración en milisegundos
setConditionParam(condition3, CONDITION_PARAM_STAT_MAGICLEVEL, 25)

local condition4 = createConditionObject(CONDITION_HASTE)
setConditionParam(condition4, CONDITION_PARAM_TICKS, 2 * 60 * 1000) -- Duración en milisegundos
setConditionFormula(condition4, 1.8, -72, 2.8, -72)

function onCastSpell(cid, var)
    local pos = getCreaturePosition(cid)

    local mana = 400
    if getCreatureMana(cid) < mana then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
        doSendMagicEffect(pos, CONST_ME_POFF)
        return LUA_ERROR
    end

    if doCombat(cid, combat, var) ~= LUA_NO_ERROR then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
        doSendMagicEffect(pos, CONST_ME_POFF)
        return LUA_ERROR
    end

    -- Aplicar el cambio de apariencia temporal
    doSetCreatureOutfit(cid, {
        lookType = 125,
        lookHead = getCreatureOutfit(cid).lookHead,
        lookBody = getCreatureOutfit(cid).lookBody,
        lookLegs = getCreatureOutfit(cid).lookLegs,
        lookFeet = getCreatureOutfit(cid).lookFeet,
        lookAddons = getCreatureOutfit(cid).lookAddons
    }, 2 * 60 * 1000) -- Duración en milisegundos

    -- Agregar las condiciones sin que interfieran con otras hechizos
    doAddCondition(cid, condition)
    doAddCondition(cid, condition2)
    doAddCondition(cid, condition3)
    doAddCondition(cid, condition4)

    -- Reducir el mana del jugador
    doCreatureAddMana(cid, -mana, false)
    doPlayerAddSpentMana(cid, mana)

    return LUA_NO_ERROR
end
