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

if item.actionid == 7825 then
if getPlayerVocation(cid) == 25 or getPlayerVocation(cid) == 29 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,sorcerer)
doSendMagicEffect(sorcerer,10)
	doPlayerSetVocation(cid,29)
else
doPlayerSendCancel(cid, "Only Wizards (World Secure) of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7826 then
if getPlayerVocation(cid) == 26 or getPlayerVocation(cid) == 30 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,druid)
doSendMagicEffect(druid,10)
	doPlayerSetVocation(cid,30)
else
doPlayerSendCancel(cid, "Only Ancient Druids (World Secure) of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7827 then
if getPlayerVocation(cid) == 27 or getPlayerVocation(cid) == 31 and getPlayerLevel(cid) >= 80 and isPremium(cid) == true then
doTeleportThing(cid,paladin)
doSendMagicEffect(paladin,10)
	doPlayerSetVocation(cid,31)	
else
doPlayerSendCancel(cid, "Only Snipers (World Secure) of level 80 or higher are able to enter this portal")
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7828 then
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