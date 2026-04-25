local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ANI_ONYXARROW)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NONE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, -800, -900,-1500, -1600)

local arr= {
{0,0,0,0,0,1,0,0,0,0,0},
{0,0,0,0,1,1,1,0,0,0,0},
{0,0,0,1,1,1,1,1,0,0,0},
{0,0,1,1,1,1,1,1,1,0,0},
{0,0,1,0,1,1,1,0,1,0,0},
{0,0,1,0,0,2,0,0,1,0,0},
{0,0,1,0,0,0,0,0,1,0,0},
{0,0,1,1,1,1,1,1,1,0,0},
{0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, 
combat, var)
end

