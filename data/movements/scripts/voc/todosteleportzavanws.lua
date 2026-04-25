function onStepIn(cid, item, pos)

local sorcerer = {x=943, y=978, z=3}
local druid = {x=943, y=978, z=3}
local paladin = {x=943, y=978, z=3}
local knight = {x=943, y=978, z=3}

if getPlayerLookDir(cid) == 0 then
newdir = 2
elseif getPlayerLookDir(cid) == 1 then
newdir = 3
elseif getPlayerLookDir(cid) == 2 then
newdir = 0
else
newdir = 1
end

if item.actionid == 7817 then
if getPlayerVocation(cid) == 25 or getPlayerVocation(cid) == 29 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,sorcerer)
doSendMagicEffect(sorcerer,10)
	doPlayerSetVocation(cid,29)
else
doPlayerSendCancel(cid, "Only Wizards (World Secure) of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7818 then
if getPlayerVocation(cid) == 26 or getPlayerVocation(cid) == 30 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,druid)
doSendMagicEffect(druid,10)
	doPlayerSetVocation(cid,30)
else
doPlayerSendCancel(cid, "Only Ancient Druids (World Secure) of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7819 then
if getPlayerVocation(cid) == 27 or getPlayerVocation(cid) == 31 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,paladin)
doSendMagicEffect(paladin,10)
	doPlayerSetVocation(cid,31)	
else
doPlayerSendCancel(cid, "Only Snipers (World Secure) of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7820 then
if getPlayerVocation(cid) == 28 or getPlayerVocation(cid) == 32 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,knight)
doSendMagicEffect(knight,10)
	doPlayerSetVocation(cid,32)
else
doPlayerSendCancel(cid, "Only Lord Knights (World Secure) of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
end
end