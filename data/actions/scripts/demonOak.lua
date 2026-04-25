function onUse(cid, item, fromPosition, itemEx, toPosition)

local onePerQuest = "yes"
local level = 120
local positions =
{
	kick = { x = 479, y = 1414, z = 7 },
	summon =
	{
		{x=482, y=1429, z=7},
		{x=474, y=1429, z=7},
		{x=484, y=1435, z=7},
		{x=473, y=1436, z=7}
	}
}

local summons =
{
	[1] = {"Demon", "Grim Reaper", "the old widow", "Demon Skeleton"},
	[2] = {"Dark Torturer", "Banshee", "Betrayed Wraith", "Blightwalker"},
	[3] = {"Bonebeast", "Braindeath", "Diabolic Imp", "the old widow"},
	[4] = {"Hand of Cursed Fate", "Lich", "Undead Dragon", "demon"},
	[5] = {"braindeath", "Demon", "plaguesmith", "Diabolic Imp"},
	[6] = {"Demon Skeleton", "Banshee", "the old widow", "plaguesmith"},
	[7] = {"Dark Torturer", "Undead Dragon", "Demon", "Demon"},
	[8] = {"the old widow", "Betrayed Wraith", "the old widow", "Giant Spider"},
	[9] = {"Demon", "Banshee", "Blightwalker", "the old widow"},
	[10] = {"Grim Reaper", "Demon", "Diabolic Imp", "Braindeath"},
	[11] = {"Banshee", "Grim Reaper", "Hand of Cursed fate", "Demon"}
}

local areaPosition =
{
	{x=468, y=1424, z=7, stackpos = 255},
	{x=493, y=1442, z=7, stackpos = 255}
}

local demonOak = {8288, 8289, 8290, 8291}
local storages =
{
	done = 35700,
	cutTree = 36901
}

local blockingTree =
{
	[2709] = {32193, 3669}
}

if blockingTree[itemEx.itemid] and itemEx.uid == blockingTree[itemEx.itemid][1] then
if getPlayerLevel(cid) < level then
	doPlayerSendCancel(cid, "You need level " .. level .. " or more to enter this quest.")
	return false
end

if getPlayerStorageValue(cid, storages.done) > 0 then
	doPlayerSendCancel(cid, "You already done this quest.")
	return true
end

if getPlayerStorageValue(cid, storages.cutTree) > 0 then
	return false
end

if onePerQuest == "yes" then
local players = getPlayersOnline()
for _, pid in ipairs(players) do
if isInRange(getCreaturePosition(pid), areaPosition[1], areaPosition[2]) then
	doPlayerSendCancel(cid, "Wait until " .. getCreatureName(pid) .. " finish the quest.")
	return true
	end
end
end

	doTransformItem(itemEx.uid, blockingTree[itemEx.itemid][2])
	doSendMagicEffect(toPosition, CONST_ME_POFF)
	doMoveCreature(cid, SOUTH)
	doPlayerSetStorageValue(cid, storages.cutTree, 1)
	return true

elseif isInArray(demonOak, itemEx.itemid) then

local get = getPlayerStorageValue(cid, itemEx.itemid)
if get == -1 then
	get = 1
end

if(getPlayerStorageValue(cid, 8288) == 12 and getPlayerStorageValue(cid, 8289) == 12 and getPlayerStorageValue(cid, 8290) == 12 and getPlayerStorageValue(cid, 8291) == 12) then
	doTeleportThing(cid, positions.kick)
	doPlayerSetStorageValue(cid, storages.done, 1)
	return true
end

if getPlayerStorageValue(cid, itemEx.itemid) > 11 then
	doSendMagicEffect(toPosition, CONST_ME_POFF)
	return true
end

if(math.random(100) <= 10) then
	doPlayerSetStorageValue(cid, itemEx.uid, 12)
	return true
end


if summons[get] then
for i = 1, #summons[get] do
	doCreateMonster(summons[get][i], positions.summon[i])
end
	doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
	doPlayerSetStorageValue(cid, itemEx.itemid, get + 1)
if math.random(100) >= 50 then
	doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -270, -310, CONST_ME_BIGPLANTS)
	end
	end
return false
end
end