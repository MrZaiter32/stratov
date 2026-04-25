local questCreatures =
{
    ["son of verminor"] = {questStarted = 1510, questStorage = 65000, creatureStorage = 15000, killsRequired = 200, raceName = "Son of Verminors"},

    ["plaguesmith"] = {questStarted = 1511, questStorage = 65001, creatureStorage = 15007, killsRequired = 200, raceName = "Plaguesmiths"},

    ["rotworm"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15011, killsRequired = 100, raceName = "Rotworms"},
    ["carriom worm"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15012, killsRequired = 100, raceName = "Rotworms"},

    ["cyclops"] = {questStarted = 1513, questStorage = 65003, creatureStorage = 15013, killsRequired = 100, raceName = "Cyclops"},
    ["cyclops smith"] = {questStarted = 1513, questStorage = 65003, creatureStorage = 15014, killsRequired = 100, raceName = "Cyclops"},
    ["cyclops drone"] = {questStarted = 1513, questStorage = 65003, creatureStorage = 15015, killsRequired = 100, raceName = "Cyclops"},


    ["hero"] = {questStarted = 1514, questStorage = 65004, creatureStorage = 15016, killsRequired = 200, raceName = "Heros"},

    ["dragon"] = {questStarted = 1515, questStorage = 65005, creatureStorage = 15017, killsRequired = 200, raceName = "Dragons"},

    ["dragon lord"] = {questStarted = 1516, questStorage = 65006, creatureStorage = 15018, killsRequired = 100, raceName = "Dragon Lords"},

    ["frost dragon"] = {questStarted = 1517, questStorage = 65007, creatureStorage = 15019, killsRequired = 200, raceName = "Frost Dragons"},

    ["warlock"] = {questStarted = 1518, questStorage = 65008, creatureStorage = 15020, killsRequired = 200, raceName = "Warlocks"},

    ["hydra"] = {questStarted = 1519, questStorage = 65009, creatureStorage = 15021, killsRequired = 150, raceName = "Hydras"},

    ["demon"] = {questStarted = 1520, questStorage = 65010, creatureStorage = 15022, killsRequired = 150, raceName = "Demons"},

    ["vampire bride"] = {questStarted = 1521, questStorage = 65011, creatureStorage = 15027, killsRequired = 100, raceName = "Vampires"},
    ["vampire"] = {questStarted = 1521, questStorage = 65011, creatureStorage = 15028, killsRequired = 100, raceName = "Vampires"},

    ["demon outcast"] = {questStarted = 1522, questStorage = 65012, creatureStorage = 15032, killsRequired = 200, raceName = "Demon Outcasts"},

    ["serpent spawn"] = {questStarted = 1523, questStorage = 65013, creatureStorage = 15036, killsRequired = 200, raceName = "Serpent Spawns"},

    ["grim reaper"] = {questStarted = 1524, questStorage = 65014, creatureStorage = 15040, killsRequired = 150, raceName = "Grim Reapers"},

    ["behemoth"] = {questStarted = 1525, questStorage = 65015, creatureStorage = 15041, killsRequired = 200, raceName = "Behemoths"},

    ["bog raider"] = {questStarted = 1526, questStorage = 65016, creatureStorage = 15048, killsRequired = 150, raceName = "Bog Raiders"},

    ["choking fear"] = {questStarted = 1527, questStorage = 65017, creatureStorage = 15049, killsRequired = 200, raceName = "Choking Fears"},

    ["crystal spider"] = {questStarted = 1528, questStorage = 65018, creatureStorage = 15050, killsRequired = 200, raceName = "Crystal Spiders"},

    ["giant spider"] = {questStarted = 1529, questStorage = 65019, creatureStorage = 15051, killsRequired = 100, raceName = "Giant Spiders"},

    ["nightmare"] = {questStarted = 1530, questStorage = 65020, creatureStorage = 15052, killsRequired = 100, raceName = "Nightmares"},

    ["undead dragon"] = {questStarted = 1531, questStorage = 65021, creatureStorage = 15053, killsRequired = 200, raceName = "Undead Dragons"},

    ["betrayed wraith"] = {questStarted = 1532, questStorage = 65022, creatureStorage = 15054, killsRequired = 100, raceName = "Betrayed Wraiths"},
    ["blightwalker"] = {questStarted = 1533, questStorage = 65023, creatureStorage = 15055, killsRequired = 200, raceName = "Blightwalkers"},

    ["dark torturer"] = {questStarted = 1534, questStorage = 65024, creatureStorage = 15056, killsRequired = 400, raceName = "Dark Torturers"},
    ["defiler"] = {questStarted = 1535, questStorage = 65025, creatureStorage = 15057, killsRequired = 100, raceName = "defilers"},

    ["destroyer"] = {questStarted = 1536, questStorage = 65026, creatureStorage = 15058, killsRequired = 200, raceName = "Destroyers"},

    ["fury"] = {questStarted = 1537, questStorage = 65027, creatureStorage = 15071, killsRequired = 100, raceName = "Furys"},

    ["hellhound"] = {questStarted = 1538, questStorage = 65028, creatureStorage = 15073, killsRequired = 100, raceName = "Hellhounds"},

    ["juggernaut"] = {questStarted = 1539, questStorage = 65029, creatureStorage = 15075, killsRequired = 100, raceName = "Juggernauts"}
}

local msgType = MESSAGE_STATUS_CONSOLE_ORANGE

function onKill(cid, target, lastHit)

local creature = questCreatures[getCreatureName(target):lower()]

    if creature then
        if isPlayer(target) or isSummon(target) then return true end

        if getCreatureStorage(cid, creature.questStarted) > 0 then
            if getCreatureStorage(cid, creature.questStorage) < creature.killsRequired then
                if getCreatureStorage(cid, creature.questStorage) < 0 then
                    doCreatureSetStorage(cid, creature.questStorage, 0)
                end

                if getCreatureStorage(cid, creature.creatureStorage) < 0 then
                    doCreatureSetStorage(cid, creature.creatureStorage, 0)
                end
                doCreatureSetStorage(cid, creature.questStorage, getCreatureStorage(cid, creature.questStorage) + 1)
                doCreatureSetStorage(cid, creature.creatureStorage, getCreatureStorage(cid, creature.creatureStorage) + 1)
                doPlayerSendTextMessage(cid, msgType, getCreatureStorage(cid, creature.creatureStorage) .. " " .. getCreatureName(target) .. " defeated. Total [" .. getCreatureStorage(cid, creature.questStorage) .. "/" .. creature.killsRequired .. "] " .. creature.raceName .. ".")
            end
        end
    end
    return true
end
