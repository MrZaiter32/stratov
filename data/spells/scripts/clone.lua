local removeTime = 120 --time to remove the clones
local HAVE_CLONE = 65543 --storage to know if you have clones or not
local arr = {
    {
        {1},
        {2}
    },
 
    {
        {1, 0, 1},
        {0, 2, 0}
    },
     
    {
        {1, 0, 1},
        {0, 2, 0},
        {1, 0, 1}
    },
     
    {
        {1, 0, 1},
        {1, 2, 1},
        {1, 0, 1}
    },
     
    {
        {1, 1, 1},
        {1, 2, 1},
        {1, 1, 1}
    },
     
    {
        {1, 1, 0, 1, 1},
        {1, 0, 1, 0, 1},
        {0, 1, 2, 1, 0},
        {1, 0, 1, 0, 1},
        {1, 1, 0, 1, 1}
    }
}

local function removeCreatures(cid, creature)
        setPlayerStorageValue(cid, HAVE_CLONE, 0)
        if isCreature(creature) == TRUE then
                doRemoveCreature(creature)
        end
end

function onTargetTile(cid, pos)
local creature = doSummonCreature("Clon", pos)
        doConvinceCreature(cid, creature)
        setCreatureMaxHealth(creature, getCreatureMaxHealth(cid))
        doCreatureAddHealth(creature, getCreatureMaxHealth(cid))
        setCreatureMaxMana(creature, getCreatureMaxMana(cid))
        doCreatureAddMana(creature, getCreatureMaxMana(cid))
        doChangeSpeed(creature, getCreatureBaseSpeed(cid))
        doSetCreatureOutfit(creature, getCreatureOutfit(cid), -1)
        addEvent(removeCreatures, removeTime * 1000, cid, creature)
        return TRUE
end

local combat = {}
for i = 1, 6 do
        combat[i] = createCombatObject()
        setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_POFF)
        setCombatArea(combat[i], createCombatArea(arr[i]))
        _G["onTargetTile" .. i] = onTargetTile
        setCombatCallback(combat[i], CALLBACK_PARAM_TARGETTILE, "onTargetTile" .. i)
end
 
function onCastSpell(cid, var)
local level = getPlayerLevel(cid)
        if getPlayerStorageValue(cid, HAVE_CLONE) < 1 then
                if level < 30 then
                        doCombat(cid, combat[1], var)
                elseif level < 60 then
                        doCombat(cid, combat[2], var)
                elseif level < 80 then
                        doCombat(cid, combat[3], var)
                elseif level < 95 then
                        doCombat(cid, combat[4], var)
                elseif level < 120 then
                        doCombat(cid, combat[5], var)
                else
                        doCombat(cid, combat[6], var)
                end
                setPlayerStorageValue(cid, HAVE_CLONE, 1)
        else
                doPlayerSendCancel(cid, "You already have clones.")
        end
end 