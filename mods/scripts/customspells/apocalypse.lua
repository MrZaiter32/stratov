-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT,novo125)
setCombatParam(combat0_Brush, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NOVO26)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{1, 1, 1},
{1, 3, 1},
{1, 1, 1}}))
setCombatFormula(combat0_Brush, COMBAT_FORMULA_SKILL, 3, 4, 3, 4)
local dfcombat0_Brush = {CONST_ANI_ENERGY,1,1,1,0,0,0,0,-1,-1,-1,-1,0,-1,1,0,1,1,-1}

-- Areas/Combat for 700ms
local combat7_Brush = createCombatObject()
setCombatParam(combat7_Brush, COMBAT_PARAM_EFFECT,novo125)
setCombatParam(combat7_Brush, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NOVO26)
setCombatParam(combat7_Brush, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatArea(combat7_Brush,createCombatArea({{1, 1, 1, 1, 1},
{1, 0, 0, 0, 1},
{1, 0, 2, 0, 1},
{1, 0, 0, 0, 1},
{1, 1, 1, 1, 1}}))
setCombatFormula(combat7_Brush, COMBAT_FORMULA_SKILL, 3, 4, 3, 4)
local dfcombat7_Brush = {CONST_ANI_ENERGY,2,2,2,1,2,0,2,-1,2,-2,1,-2,0,-2,-1,-2,-2,-2,-2,-1,-2,0,-2,1,-2,2,-1,2,0,2,1,2}

-- Areas/Combat for 1200ms
local combat12_Brush = createCombatObject()
setCombatParam(combat12_Brush, COMBAT_PARAM_EFFECT,novo125)
setCombatParam(combat12_Brush, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NOVO26)
setCombatParam(combat12_Brush, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatArea(combat12_Brush,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 1, 0, 0, 0, 0, 1},
{1, 1, 0, 0, 0, 0, 1},
{1, 0, 0, 2, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1, 1}}))
setCombatFormula(combat12_Brush, COMBAT_FORMULA_SKILL, 3, 4, 3, 4)
local dfcombat12_Brush = {CONST_ANI_ENERGY,3,3,3,2,3,1,3,0,3,-1,3,-2,3,-3,2,-3,1,-3,0,-3,-1,-3,-2,-3,-2,-2,-2,-1,-3,-1,-3,0,-3,-2,-3,-3,-3,1,-3,2,-3,3,-2,3,-1,3,0,3,1,3,2,3}

-- Areas/Combat for 1500ms
local combat15_Brush = createCombatObject()
setCombatParam(combat15_Brush, COMBAT_PARAM_EFFECT,novo125)
setCombatParam(combat15_Brush, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NOVO26)
setCombatParam(combat15_Brush, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatArea(combat15_Brush,createCombatArea({{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 0, 0, 0, 0, 0, 0, 1, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 2, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1}}))
setCombatFormula(combat15_Brush, COMBAT_FORMULA_SKILL, 3, 4, 3, 4)
local dfcombat15_Brush = {CONST_ANI_ENERGY,4,4,4,3,4,2,4,1,4,0,4,-1,4,-2,4,-3,3,-3,3,-4,2,-4,4,-4,1,-4,0,-4,-1,-4,-2,-4,-3,-4,-4,-4,-4,-3,-4,-2,-4,-1,-4,0,-4,1,-4,2,-4,3,-4,4,-3,4,-2,4,-1,4,0,4,1,4,2,4,3,4}

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos) -- Part
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then -- Emit distance effects
			local i = 2;
			while (i < #dirList) do
				doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i],y=dirEmitPos.y-dirList[i+1],z=dirEmitPos.z},dirList[1])
				i = i + 2
			end		
		end
	end
end

function onCastSpell(cid, var)
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_Brush,cid,var,dfcombat0_Brush,startPos)
	addEvent(RunPart,700,combat7_Brush,cid,var,dfcombat7_Brush,startPos)
	addEvent(RunPart,1200,combat12_Brush,cid,var,dfcombat12_Brush,startPos)
	addEvent(RunPart,1500,combat15_Brush,cid,var,dfcombat15_Brush,startPos)
	return true
end