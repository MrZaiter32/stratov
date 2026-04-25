--Circles
AREA_CIRCLE2X2 =
{
{0, 1, 1, 1, 0},
{1, 1, 1, 1, 1},
{1, 1, 3, 1, 1},
{1, 1, 1, 1, 1},
{0, 1, 1, 1, 0}
}

AREA_CIRCLE3X3 =
{
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0}
}

-- Crosses
AREA_CROSS1X1 =
{
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}

AREA_CROSS5X5 =
{
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

AREA_CROSS6X6 =
{
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0}
}

--Squares
AREA_SQUARE1X1 =
{
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

-- Walls
AREA_WALLFIELD = {
{1, 1, 3, 1, 1}
}

AREADIAGONAL_WALLFIELD =
{
{0, 0, 0, 0, 1},
{0, 0, 0, 1, 1},
{0, 1, 3, 1, 0},
{1, 1, 0, 0, 0},
{1, 0, 0, 0, 0},
}

emoteAttack = true
petEmoteAttack = true
refillStatsAtLevel = true

TYPE_NEAR = 1
TYPE_DISTANCE = 2

petExhaust = 3 --in seconds
petSayExhaust = 3 --in seconds

petGainTicks =
{
health = {func = doCreatureAddHealth, time = 3000, count = 1},
mana = {func = doCreatureAddMana, time = 3000, count = 2}
}

petGainHealth = 30
petGainMana = 30
petExpRate = 1.3

carryItems = 10

petItemsBase = 1250
petItems = {}
blockedItems = {6132, 2195}

for i = 1, carryItems do
table.insert(petItems, petItemsBase + i)
end

petBase = 6120
petStorages =
{
pet = petBase + 1000,
level = petBase + 2000,
exp = petBase + 3000,
items = petBase + 4000,
isPet = petBase + 5000,
isDead = petBase + 6000,
exhaust = petBase + 7000,
sayExhaust = petBase + 8000,
moveExhaust = petBase + 9000,
health = petBase + 10000,
mana = petBase + 11000,
buyed = petBase + 12000
}

tables =
{
pet = {},
level = {},
exp = {},
items = {},
isDead = {},
exhaust = {},
health = {},
mana = {},
buyed = {}
}

reviveCost = 1000

pets =
{
[1] =
{
monster = "orc spearman",
vocations = {1, 2, 3, 4},
level = 30,
attacks =
{
[1] = {name = "", level = 30, petLevel = 30, mana = 50, type = TYPE_DISTANCE, range = 10, combat = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_NONE, distEffect = CONST_ANI_SPEAR, damageMin = 0.7, damageMax = 1.0}
}
},
[2] =
{
monster = "fire devil",
vocations = {1, 2},
level = 60,
attacks =
{
[1] = {name = "Fire Strike", level = 60, petLevel = 60, mana = 100, type = TYPE_DISTANCE, combat = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREDAMAGE, distEffect = CONST_ANI_FIRE, damageMin = 1.5, damageMax = 2.0}
}
},
[3] =
{
monster = "minotaur guard",
vocations = {3, 4},
level = 60,

attacks =
{
[1] = {name = "Punch", level = 60, petLevel = 60, mana = 55, type = TYPE_NEAR, combat = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_BLOOD, distEffect = CONST_ANI_NONE, damageMin = 1.5, damageMax = 2.0}
}
},
[4] =
{
monster = "water elemental",
vocations = {2},
level = 95,

attacks =
{
[1] = {name = "Ice Bomb", level = 100, petLevel = 100, mana = 250, type = TYPE_DISTANCE, range = 3, combat = COMBAT_ICEDAMAGE, effect = CONST_ME_ICEAREA, distEffect = CONST_ANI_ICE, damageMin = 1.5, damageMax = 2.0, area = AREA_CROSS1X1},
[2] = {name = "Poison Strike", level = 95, petLevel = 95, mana = 80, type = TYPE_DISTANCE, range = 8, combat = COMBAT_POISONDAMAGE, effect = CONST_ME_GREENRINGS, distEffect = CONST_ANI_POISON, damageMin = 1.2, damageMax = 1.8}
}
},
[5] =
{
monster = "fire elemental",
vocations = {1},
level = 95,
attacks =
{
[1] = {name = "Fire Bomb", level = 100, petLevel = 100, mana = 250, type = TYPE_DISTANCE, range = 3, combat = COMBAT_FIREDAMAGE, effect = CONST_ME_FIRE, distEffect = CONST_ANI_FIRE, damageMin = 1.5, damageMax = 2.0, area = AREA_CROSS1X1},
[2] = {name = "Fire Strike", level = 95, petLevel = 95, mana = 80, type = TYPE_DISTANCE, range = 3, combat = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREDAMAGE, distEffect = CONST_ANI_FIRE, damageMin = 1.2, damageMax = 1.8}
}
},
[6] =
{
monster = "orc warlord",
vocations = {4},
level = 95,
attacks =
{
[1] = {name = "Throw Knife", level = 95, petLevel = 95, mana = 80, type = TYPE_DISTANCE, combat = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_BLOOD, distEffect = CONST_ANI_THROWINGKNIFE, damageMin = 1.5, damageMax = 2.0}
}
},
[7] =
{
monster = "golem",
vocations = {3},
level = 95,
attacks =
{
[1] = {name = "Throw Stone", level = 95, petLevel = 95, mana = 80, type = TYPE_DISTANCE, combat = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_BLOOD, distEffect = CONST_ANI_LARGEROCK, damageMin = 1.5, damageMax = 2.0}
}
},
[8] =
{
monster = "wyrm",
vocations = {1, 2, 3, 4},
level = 135
},
[9] =
{
monster = "RegiRock",
vocations = {1, 2, 3, 4},
level = 10,
cost = 1000,
attacks =
{
[1] = {name = "Fire Bomb", level = 200, petLevel = 200, mana = 300, type = TYPE_DISTANCE, range = 3, combat = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREAREA, distEffect = CONST_ANI_FIRE, damageMin = 1.5, damageMax = 2.0, area = AREA_CROSS1X1},
[2] = {name = "Fire Storm", level = 205, petLevel = 220, mana = 700, type = TYPE_NEAR, range = 8, combat = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREAREA, distEffect = CONST_ANI_FIRE, damageMin = 1.8, damageMax = 2.5, area = AREA_CROSS5X5},
[3] = {name = "Fire Explosion", level = 203, petLevel = 210, mana = 450, type = TYPE_DISTANCE, range = 6, combat = COMBAT_FIREDAMAGE, effect = CONST_ME_EXPLOSIONHIT, distEffect = CONST_ANI_FIRE, damageMin = 1.5, damageMax = 2.1, area = AREA_CIRCLE2X2},
[4] = {name = "Scratch", level = 201, petLevel = 205, mana = 150, type = TYPE_NEAR, range = 1, combat = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_HITAREA, distEffect = CONST_ANI_FIRE, damageMin = 1.3, damageMax = 1.8},
[5] = {name = "Fire Strike", level = 203, petLevel = 210, mana = 100, type = TYPE_DISTANCE, range = 3, combat = COMBAT_FIREDAMAGE, effect = CONST_ME_EXPLOSIONAREA, distEffect = CONST_ANI_FIRE, damageMin = 1.8, damageMax = 1.9}
}
}
}

for i = 1, #pets do
table.insert(tables.pet, petStorages.pet + i)
table.insert(tables.level, petStorages.level + i)
table.insert(tables.exp, petStorages.exp + i)
table.insert(tables.items, petStorages.items + i)
table.insert(tables.isDead, petStorages.isDead + i)
table.insert(tables.exhaust, petStorages.exhaust + i)
table.insert(tables.health, petStorages.health + i)
table.insert(tables.mana, petStorages.mana + i)
table.insert(tables.buyed, petStorages.buyed + i)
end

function gainStat(pid, stat)

if pid and pid > 0 and isMonster(pid) then
stat.func(pid, stat.count)
end
addEvent(gainStat, stat.time, pid, stat)
end

function getLevelByExp(exp)
return math.floor((math.sqrt(3) * math.sqrt(243*(exp+1)^2-48600*(exp+1)+3680000)+27 * (exp+1)-2700)^(1/3)/30^(2/3)-(5*10^(2/3))/(3^(1/3)*(math.sqrt(3)*math.sqrt(243*(exp+1)^2-48600*(exp+1)+3680000)+27*(exp+1)-2700)^(1/3))+2)
end

function getPetInfo(pet)
if isNumber(pet) then
return pets[pet] or false
else
for _, v in pairs(pets) do
if pet:lower() == v.monster then
return v
end
end
end
return false
end

function getPetByLevel(cid)
local level = getPlayerLevel(cid)
local pet
for i = 1, #pets do
v = pets
if level >= v.level and isInArray(v.vocations, getPlayerVocation(cid)) then
pet = v
end
end
return (pet ~= nil and pet or false)
end

function getAttackFormula(pid, attack)
return {
min = ((getPetLevel(pid) * 2) * (1 + attack.damageMin) + getPetLevel(pid)) / 2.5,
max = ((getPetLevel(pid) * 3) * (1 + attack.damageMax) + getPetLevel(pid)) / 2.5
}
end

function doAttack(pid, target, param)

local pet = getPetInfo(getCreatureName(pid))
if pet then
if pet.attacks and pet.attacks[param] then
local attack = pet.attacks[param]
if target > 0 and pid ~= getCreatureTarget(getCreatureMaster(pid)) then
if attack.type and attack.type == TYPE_DISTANCE and getDistanceBetween(getCreaturePosition(pid), getCreaturePosition(target)) > (attack.range or 3) or attack.type == TYPE_NEAR and getDistanceBetween(getCreaturePosition(pid), getCreaturePosition(target)) > (attack.range or 1) then
return doPlayerSendCancel(getCreatureMaster(pid), "Target is too far.") and doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF)
end
if not isSightClear(getCreaturePosition(pid), getCreaturePosition(target), true) then
return doPlayerSendCancel(getCreatureMaster(pid), "There is not enough room.") and doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF)
end
else
return doPlayerSendCancel(getCreatureMaster(pid), "Please select a target first.") and doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF)
end
if getPlayerLevel(getCreatureMaster(pid)) < attack.level then
return doPlayerSendCancel(getCreatureMaster(pid), "You need level " .. attack.level .. " or higher to use this attack.") and doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF)
end
if getPetLevel(pid) < attack.petLevel then
return doPlayerSendCancel(getCreatureMaster(pid), "Your pet needs level " .. attack.petLevel .. " or higher to use this attack.") and doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF)
end
if attack.mana and getCreatureMana(pid) < attack.mana then
return doPlayerSendCancel(getCreatureMaster(pid), "Your pet does not have enough mana.") and doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF)
end
if attack.area then
doCastAreaAttack(pid, target, attack.area, attack)
else
doTargetCombatHealth(pid, target, attack.combat, -getAttackFormula(pid, attack).min, -getAttackFormula(pid, attack).max, attack.effect)
end
doCreatureAddMana(pid, -attack.mana)
if attack.name ~= "" then
if emoteAttack then
doCreatureSay(getCreatureMaster(pid), getCreatureName(pid) .. ", use " .. attack.name .. "!", TALKTYPE_SAY)
end
if petEmoteAttack then
doCreatureSay(pid, attack.name, TALKTYPE_MONSTER)
end
end
return doSendDistanceShoot(getCreaturePosition(pid), (attack.type == TYPE_DISTANCE and getCreaturePosition(target) or getCreaturePosition(pid)), attack.distEffect)
else
return doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF)
end
else
return doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF) and doPlayerSendCancel(getCreatureMaster(pid), "There is a tecnical problem, please contact a gamemaster.")
end
end

function callPet(cid, petId)

for i = 1, #tables do
for y = 1, #tables do
if getCreatureStorage(cid, tables[y]) < 0 then
doCreatureSetStorage(cid, tables[y], 0)
end
end
end

local pet = getPetInfoById(petId)
if not pet then
return doPlayerSendCancel(cid, "Something is wrong.")
end

if getPlayerLevel(cid) < pet.level then
return doPlayerSendCancel(cid, "You need level " .. pet.level .. " or higher to call this pet.")
end
if pet.cost and pet.cost > 0 then
if getCreatureStorage(cid, tables.buyed[petId]) < 1 then
return doPlayerSendCancel(cid, "You need to buy this pet first.") and doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
end
end

local ret = doCreateMonster(pet.monster, getCreaturePosition(cid))

if getCreatureStorage(cid, tables.level[petId]) < 1 then
doCreatureSetStorage(cid, tables.level[petId], pet.level)
end

if getCreatureStorage(cid, tables.exp[petId]) < 1 then
doCreatureSetStorage(cid, tables.exp[petId], getExperienceForLevel(pet.level))
end

if getCreatureStorage(cid, tables.level[petId]) < pet.level then
doCreatureSetStorage(cid, tables.level[petId], pet.level)
elseif getPlayerLevel(cid) * 3 < getCreatureStorage(cid, tables.level[petId]) then
doCreatureSetStorage(cid, tables.level[petId], pet.level)
doCreatureSetStorage(cid, tables.exp[petId], getExperienceForLevel(pet.level))
end

if getLevelByExp(getCreatureStorage(cid, tables.exp[petId])) < getCreatureStorage(cid, tables.level[petId]) then
doCreatureSetStorage(cid, tables.exp[petId], getExperienceForLevel(getCreatureStorage(cid, tables.level[petId])))
end

if getCreatureStorage(cid, tables.health[petId]) < 1 then
doCreatureSetStorage(cid, tables.health[petId], getCreatureStorage(cid, tables.level[petId]) * petGainHealth)
end

if getCreatureStorage(cid, tables.mana[petId]) < 1 then
doCreatureSetStorage(cid, tables.mana[petId], getCreatureStorage(cid, tables.level[petId]) * petGainMana)
end

doCreatureSetStorage(ret, tables.level[petId], getCreatureStorage(cid, tables.level[petId]))
doCreatureSetStorage(ret, tables.exp[petId], getCreatureStorage(cid, tables.exp[petId]))

doConvinceCreature(cid, ret)
doCreatureSetStorage(ret, petStorages.isPet, 1)
doSendMagicEffect(getCreaturePosition(ret), CONST_ME_TELEPORT)
setCreatureMaxHealth(ret, getPetLevel(ret) * petGainHealth)
doCreatureAddHealth(ret, -getCreatureHealth(ret) + getCreatureStorage(cid, tables.health[petId]))
setCreatureMaxMana(ret, getPetLevel(ret) * petGainMana)
doCreatureAddMana(ret, -getCreatureMana(ret) + getCreatureStorage(cid, tables.mana[petId]))
for _, v in pairs(petGainTicks) do
gainStat(ret, v)
end
return doCreatureSay(cid, "Go pet!", TALKTYPE_SAY)
end

function doCastAreaAttack(pid, target, area, attack)
local center = {}
local areaxx = {}
center.y = math.floor(#area/2)+1
for y = 1, #area do
for x = 1, #area[y] do
local number = area[y][x]
if number > 0 then
center.x = math.floor(table.getn(area[y])/2)+1
if attack.type == TYPE_DISTANCE then
table.insert(areaxx, {x = getCreaturePosition(target).x + x - center.x, y = getCreaturePosition(target).y + y - center.y, z = getCreaturePosition(target).z})
else
table.insert(areaxx, {x = getCreaturePosition(pid).x + x - center.x, y = getCreaturePosition(pid).y + y - center.y, z = getCreaturePosition(pid).z})
end
end
end
end
for i = 1, #areaxx do
doAreaCombatHealth(pid, attack.combat, areaxx, 0, -getAttackFormula(pid, attack).min, -getAttackFormula(pid, attack).max, attack.effect)
end
end

function isPet(pid)
local id = getPetIdByName(getCreatureName(pid))
return getCreatureStorage(pid, petStorages.isPet) > 0 and true or false
end

function doPetAddExperience(pid, exp)

local id = getPetIdByName(getCreatureName(pid))
exp = math.ceil(exp)
doCreatureSetStorage(getCreatureMaster(pid), tables.exp[id], getPetExperience(pid) + exp)
doSendAnimatedText(getCreaturePosition(pid), exp, getConfigValue("gainExperienceColor"))
return true
end

function getPetExperience(pid)
local id = getPetIdByName(getCreatureName(pid))
return getCreatureStorage(getCreatureMaster(pid), tables.exp[id])
end

function getPetLevel(pid)
local id = getPetIdByName(getCreatureName(pid))
return getCreatureStorage(getCreatureMaster(pid), tables.level[id])
end

function doPetSetLevel(pid, level)

local id = getPetIdByName(getCreatureName(pid))
doCreatureSetStorage(getCreatureMaster(pid), tables.level[id], level)
setCreatureMaxHealth(pid, getPetLevel(pid) * petGainHealth)
setCreatureMaxMana(pid, getPetLevel(pid) * petGainMana)
return true
end

function getPlayerPet(cid)
local pet
if #getCreatureSummons(cid) < 1 then
pet = false
end

for _, it in ipairs(getCreatureSummons(cid)) do
if isPet(it) then
pet = it
break
end
end
return pet
end

function getPetIdByName(name)

local id = 0
for k, it in pairs(pets) do
if it.monster:lower() == name:lower() then
id = k
break
end
end
return (id > 0 and id or false)
end

function getTopItem(p)
p.stackpos = 0
local v = getThingFromPos(p)
repeat
p.stackpos = p.stackpos + 1
v = getThingFromPos(p)
until v.itemid == 0
p.stackpos = p.stackpos - 1
return getThingFromPos(p)
end

function getPetInfoById(pet)
for k, v in pairs(pets) do
if k == pet then
return v
end
end
return false
end

if not getCreatureStorage then
getCreatureStorage = getPlayerStorageValue
doCreatureSetStorage = doPlayerSetStorageValue
end