function onStepIn(cid, item, pos)

local sorcerer = {x=941, y=1003, z=7}
local druid = {x=941, y=1003, z=7}
local paladin = {x=941, y=1003, z=7}
local knight = {x=941, y=1003, z=7}

if getPlayerLookDir(cid) == 0 then
newdir = 2
elseif getPlayerLookDir(cid) == 1 then
newdir = 3
elseif getPlayerLookDir(cid) == 2 then
newdir = 0
else
newdir = 1
end

if item.actionid == 7813 then
if getPlayerVocation(cid) == 5 and getPlayerItemCount(cid, 16947) == 1 and isPremium(cid) == true then
doPlayerRemoveItem(cid,16947 ,1)
doTeleportThing(cid,sorcerer)
doSendMagicEffect(sorcerer,10)
	doPlayerSetVocation(cid,21)
else	
doPlayerSendCancel(cid, "Only Master Sorcerer with Provoc Gem able to enter this portal")
doMoveCreature(cid, newdir)
end

elseif item.actionid == 7814 then
if getPlayerVocation(cid) == 6 and getPlayerItemCount(cid, 16947) == 1 and isPremium(cid) == true then
doPlayerRemoveItem(cid,16947,1)
doTeleportThing(cid,druid)
doSendMagicEffect(druid,10)
	doPlayerSetVocation(cid,22)
else
doPlayerSendCancel(cid, "Only Elder Druid with Provoc Gem able to enter this portal")
doMoveCreature(cid, newdir)
end

elseif item.actionid == 7815 then
if getPlayerVocation(cid) == 7 and getPlayerItemCount(cid, 16947) == 1 and isPremium(cid) == true then
doPlayerRemoveItem(cid, 16947,1)
doTeleportThing(cid,paladin)
doSendMagicEffect(paladin,10)
	doPlayerSetVocation(cid,23)	
else
doPlayerSendCancel(cid, "Only Royal Paladin with Provoc Gem able to enter this portal")
doMoveCreature(cid, newdir)
end

elseif item.actionid == 7816 then
if getPlayerVocation(cid) == 8 and getPlayerItemCount(cid, 16947) == 1 and isPremium(cid) == true then
doPlayerRemoveItem(cid, 16947,1)
doTeleportThing(cid,knight)
doSendMagicEffect(knight,10)
	doPlayerSetVocation(cid,24)
else
doPlayerSendCancel(cid, "Only Elite Knights with Provoc Gem able to enter this portal")
doMoveCreature(cid, newdir)
end
end
end