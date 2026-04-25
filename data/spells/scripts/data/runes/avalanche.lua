local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(creature, level, maglevel)
    if not creature then 
        return 0, 0 
    end

    local min = -(maglevel * 2) - (level / 5) - 80
    local max = -(maglevel * 10) - (level / 5) - 450
    
    return math.floor(min), math.ceil(max)
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end