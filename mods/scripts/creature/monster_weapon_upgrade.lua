--[[
	** Monster weapon upgrader by slawkens **
	** Updated to version 2.0 by Martyx **

	[ignore_monsters]
	- type "yes" and only by the [monsters] the weapon gain kills
	[monsters]
	• {"..","..",".."} - list of monsters where weapon gain kills
	[ingore_weapons]
	- type "yes" and only the [weapons] can be upgraded
	[weapons]
	•	[2395] = {100, 1, 3},
			|       |   |  |
			|       |   |  •> extraAttackLimit
			|       |   •> extraAttack
			|       •> kills
			•> id of the weapon
	[default]
	• kills - how much monsters must be killed
	• extraAttack - how much extraAttack points will this weapon get
	• extraAttackLimit - you can set limit of extraAttack points added
]]--

local ignore_monsters = "no"
local monsters = {"Frost Dragon","Black knight","Dragon","Dragon Lord","Demon","DemonFrost","Hero","Behemoth","DemonEarth","Energy Elemental","Fury"}

local ingore_weapons = "no"
local weapons = {
-- DragonBone STaff, Fire Sword, Knight Axe --
        [7430] = {50, 4, 8},
        [7750] = {50, 4, 8},
        [2392] = {50, 4, 8},
-- Skull Staff, Bright Sword, Fire Axe --
        [2436] = {100, 4, 12},
        [2432] = {100, 4, 12},
        [2407] = {100, 4, 12},
-- Blessed Sceptre, Justice Seeker, Royal Axe --
        [7429] = {150, 4, 20},
        [7434] = {150, 4, 20},
        [7390] = {150, 4, 20},
-- Thunder Hammer, Magic Sword, Stonecutter Axe --
        [2421] = {200, 4, 28},
        [2431] = {200, 4, 28},
        [2400] = {200, 4, 28},
-- Hammer of Knowldge, Avenger Sword, Glorious Axe --
        [7422] = {250, 4, 36},
        [7454] = {250, 4, 36},
        [6528] = {250, 4, 36},
-- Arcane Staff, Magic LongSword, Great Axe --
        [2453] = {300, 4, 44},
        [2415] = {300, 4, 44},
        [2390] = {300, 4, 44},
-- Obsidian truncheon, Solar Blade, Solar Axe --
        [8928] = {400, 4, 48},
        [8925] = {400, 4, 48},
        [8931] = {400, 4, 48},
-- Gaia Hammer, Ultima Weapon, Rune Axe -
        [8931] = {500, 4, 60},
        [8931] = {500, 4, 60},
        [8931] = {500, 4, 60}
} -- weapon end --

local default = {
        500,   -- kills
        4,     -- extraAttack
        60      -- extraAttackLimit
} -- default end --

function onKill(cid, target)
	if(isPlayer(target) == true) then
		return true
end

if (string.lower(ignore_monsters) == "no" and isInArray(monsters, getCreatureName(target)) == true or string.lower(ignore_monsters) == "yes") then

local playerWeapon = getPlayerWeapon(cid, true)
	if(playerWeapon.itemid == 0) then
		return true
end

local weapon = weapons[getPlayerWeapon(cid).itemid]
	if string.lower(ingore_weapons) == "yes" then
		weapon = default
end

if (string.lower(ingore_weapons) == "no" and (not weapon) == FALSE or string.lower(ingore_weapons) == "yes") then

local currentExtraAttack = getItemExtraAttack(playerWeapon.uid)
	if(currentExtraAttack >= weapon[3]) then
		return true
end

local add = weapon[2]
	if(currentExtraAttack + add > weapon[3]) then
		add = currentExtraAttack - weapon[3]
end

if(playerWeapon.actionid ~= 0) then
	if(playerWeapon.actionid >= weapon[1]+9999) then
		doSetItemActionId(playerWeapon.uid, 10000)
		setItemExtraAttack(playerWeapon.uid, currentExtraAttack + add)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations! Your weapon received +" ..add.. " attack points and now have total extra damage of +" .. getItemExtraAttack(playerWeapon.uid) .. " points!")
		doSetItemSpecialDescription(playerWeapon.uid, "["..(playerWeapon.actionid-9999).."/"..weapon[1].." | ".. getItemExtraAttack(playerWeapon.uid).."/"..weapon[3].."]")
	else
		doSetItemActionId(playerWeapon.uid, playerWeapon.actionid + 1)
		doSetItemSpecialDescription(playerWeapon.uid, "["..(playerWeapon.actionid-9999).."/"..weapon[1].." | ".. getItemExtraAttack(playerWeapon.uid).."/"..weapon[3].."]")
	end
	else
		doSetItemActionId(playerWeapon.uid, 10001)
		doSetItemSpecialDescription(playerWeapon.uid, "[1/"..weapon[1].." | ".. getItemExtraAttack(playerWeapon.uid).."/"..weapon[3].."]")
	end
	end
end
return true
end