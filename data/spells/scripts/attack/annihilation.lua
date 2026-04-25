local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(creature, level, skill, attack, element, factor)
    if not creature then 
        return 0, 0 
    end

    local levelTotal = level / 5
    local multiplier = 0.1670

    local basePhysical = (skill * attack * multiplier) + levelTotal
    
    local minDamage = -(basePhysical * 0.5) 
    local maxDamage = -basePhysical

    local baseElemental = (skill * element * multiplier) + levelTotal
    local minElemental = math.floor(baseElemental * 0.5)
    local maxElemental = math.ceil(baseElemental)
    
    local randomElemental = 0
    if maxElemental > 0 then
        randomElemental = -math.random(minElemental, maxElemental)
    end

    return minDamage, maxDamage, randomElemental
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end