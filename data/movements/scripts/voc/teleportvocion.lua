function onStepIn(cid, item, pos)

local sorcerer = {x=941, y=1000, z=7}
local druid = {x=941, y=1000, z=7}
local paladin = {x=941, y=1000, z=7}
local knight = {x=941, y=1000, z=7}

if getPlayerLookDir(cid) == 0 then
newdir = 2
elseif getPlayerLookDir(cid) == 1 then
newdir = 3
elseif getPlayerLookDir(cid) == 2 then
newdir = 0
else
newdir = 1
end

if item.actionid == 7901 then
if getPlayerVocation(cid) == 0 or getPlayerVocation(cid) == 0 and getPlayerLevel(cid) >= 8 and isPremium(cid) == true then
doTeleportThing(cid,sorcerer)
doSendMagicEffect(sorcerer,10)
	doPlayerSetVocation(cid,1)
else
doPlayerSendCancel(cid, "Only players of level 10 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7902 then
if getPlayerVocation(cid) == 0 or getPlayerVocation(cid) == 0 and getPlayerLevel(cid) >= 8 and isPremium(cid) == true then
doTeleportThing(cid,druid)
doSendMagicEffect(druid,10)
	doPlayerSetVocation(cid,2)
else
doPlayerSendCancel(cid, "Only players of level 10 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7903 then
if getPlayerVocation(cid) == 0 or getPlayerVocation(cid) == 0 and getPlayerLevel(cid) >= 8 and isPremium(cid) == true then
doTeleportThing(cid,paladin)
doSendMagicEffect(paladin,10)
	doPlayerSetVocation(cid,3)	
else
doPlayerSendCancel(cid, "Only players of level 10 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7904 then
if getPlayerVocation(cid) == 0 or getPlayerVocation(cid) == 0 and getPlayerLevel(cid) >= 8 and isPremium(cid) == true then
doTeleportThing(cid,knight)
doSendMagicEffect(knight,10)
	doPlayerSetVocation(cid,4)
else
doPlayerSendCancel(cid, "Only players of level 10 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
end
end