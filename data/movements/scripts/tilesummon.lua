local monsters = {
      [1] = {name = "hero", chance = 10},
      [2] = {name = "dragon lord", chance = 10},
      [2] = {name = "demon", chance = 10},
      [4] = {name = "dragon", chance = 10}
}

function onStepIn(cid, item, pos)

local r = math.random(1,4)
local gb = {x = getCreaturePosition(cid).x + math.random(-1,1), y = getCreaturePosition(cid).y + math.random(-1,1), z = getCreaturePosition(cid).z}
         
         if (getCreatureCondition(cid, CONDITION_INFIGHT) == FALSE) and (isPlayer(cid)) then
            if (math.random(1,100) <= monsters[r].chance) and (isPlayer(cid)) then
               if (getTilePzInfo(gb) == FALSE) and (isPlayer(cid)) then
                  local monster = doCreateMonster(monsters[r].name, gb)
                  return doPlayerSendTextMessage(cid, 27, "A wild ".. monsters[r].name .." appeared!") and doSendMagicEffect(gb, 10) and doChallengeCreature(cid, monster)
               elseif (getTilePzInfo(gb) == TRUE) and (isPlayer(cid)) then
                      return doPlayerSendCancel(cid, "Nothing!")
               end
            elseif (getTilePzInfo(gb) == TRUE) and (isPlayer(cid)) then
                   return doPlayerSendCancel(cid, "Nothing!")
            end
         elseif (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) and (isPlayer(cid)) then
                return doPlayerSendCancel(cid, "You are in fight!")
         end
    return true
end