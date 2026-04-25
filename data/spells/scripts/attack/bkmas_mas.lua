local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(creature, level, maglevel)
    if not creature then 
        return 0, 0 
    end

    local basePower = (level / 5) + (maglevel * 4)
    local minDamage = -((basePower * 5.6) + 400)
    local maxDamage = -((basePower * 6.0) + 700)

    return math.floor(minDamage), math.ceil(maxDamage)
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end