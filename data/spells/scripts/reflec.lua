local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_FOOD)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
if exhaustion.check(cid,2000) == true then
doPlayerSendCancel(cid, "You are exhausted.")
return false
end
local i = 1
local pos = getPlayerPosition(cid)
function doSpellEffects(cid)
local Effects = {
{x=pos.x - 1,y=pos.y,z=pos.z},
{x=pos.x - 1,y=pos.y - 1,z=pos.z},
{x=pos.x,y=pos.y - 1,z=pos.z},
{x=pos.x + 1,y=pos.y - 1,z=pos.z},
{x=pos.x + 1,y=pos.y,z=pos.z},
{x=pos.x + 1,y=pos.y + 1,z=pos.z},
{x=pos.x,y=pos.y + 1,z=pos.z},
{x=pos.x - 1,y=pos.y + 1,z=pos.z},
{x=pos.x - 1,y=pos.y,z=pos.z},
}
doSendMagicEffect(Effects[i], 12)
i = i + 1
continue(50, 9, cid)
end

local v = 1
function doGreenEffects(cid)
local effect = {
{x=pos.x - 1,y=pos.y - 1,z=pos.z},
{x=pos.x,y=pos.y - 1,z=pos.z},
{x=pos.x + 1,y=pos.y - 1,z=pos.z},
{x=pos.x + 1,y=pos.y,z=pos.z},
{x=pos.x + 1,y=pos.y + 1,z=pos.z},
{x=pos.x,y=pos.y + 1,z=pos.z},
{x=pos.x - 1,y=pos.y + 1,z=pos.z},
{x=pos.x - 1,y=pos.y,z=pos.z},
}
doSendMagicEffect(effect[v], 14)
v = v + 1
continue(50, 8, cid)
end

   doSpellEffects(cid)
   if isCreature(cid) then
   addEvent(doGreenEffects, 450, cid)
   end
   exhaustion.set(cid,2000,5)
   setPlayerStorageValue(cid, 10096, 1)   
   return doCombat(cid, combat, var)
end