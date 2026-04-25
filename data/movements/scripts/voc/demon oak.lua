function onStepIn(cid, item, pos)

local sorcerer = {x=1542, y=922, z=6}
local druid = {x=1542, y=922, z=6}
local paladin = {x=1542, y=922, z=6}
local knight = {x=1542, y=922, z=6}

if getPlayerLookDir(cid) == 0 then
newdir = 2
elseif getPlayerLookDir(cid) == 1 then
newdir = 3
elseif getPlayerLookDir(cid) == 2 then
newdir = 0
else
newdir = 1
end

if item.actionid == 7821 then
if getPlayerVocation(cid) == 17 or getPlayerVocation(cid) == 21 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,sorcerer)
doSendMagicEffect(sorcerer,10)
	doPlayerSetVocation(cid,21)
else
doPlayerSendCancel(cid, "Only Wizards of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7822 then
if getPlayerVocation(cid) == 18 or getPlayerVocation(cid) == 22 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,druid)
doSendMagicEffect(druid,10)
	doPlayerSetVocation(cid,22)
else
doPlayerSendCancel(cid, "Only Ancient Druids of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7823 then
if getPlayerVocation(cid) == 19 or getPlayerVocation(cid) == 23 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,paladin)
doSendMagicEffect(paladin,10)
	doPlayerSetVocation(cid,23)	
else
doPlayerSendCancel(cid, "Only Snipers of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7824 then
if getPlayerVocation(cid) == 20 or getPlayerVocation(cid) == 24 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,knight)
doSendMagicEffect(knight,10)
	doPlayerSetVocation(cid,24)
else
doPlayerSendCancel(cid, "Only Lord Knights of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
end
end