local THESNAPPER_POSITION = {x = 1000, y = 1000, z = 7}
local HIDE_POSITION = {x = 1000, y = 1000, z = 7}
local THEBLOODTUSK_POSITION = {x = 1000, y = 1000, z = 7}
local SHARDHEAD_POSITION = {x = 1000, y = 1000, z = 7}
local THUL_POSITION = {x = 1000, y = 1000, z = 7}
local ESMERALDA_POSITION = {x = 1000, y = 1000, z = 7}
local THEOLDWIDOW_POSITION = {x = 1000, y = 1000, z = 7}
local THEMANY_POSITION = {x = 1000, y = 1000, z = 7}
local LEVIATHAN_POSITION = {x = 1000, y = 1000, z = 7}
local STONECRACKER_POSITION = {x = 1000, y = 1000, z = 7}
local THENOXIUSSPAWN_POSITION = {x = 1000, y = 1000, z = 7}
local MERIKHTHESLAUGHTERER_POSITION = {x = 100, y = 1000, z = 7}
local FAHIMTHEWISE_POSITION = {x = 1000, y = 1000, z = 7}
local RANDOMPIRATEBOSS_POSITION = {x = 1000, y = 1000, z = 7}
local THEHORNEDFOX_POSITION = {x = 1000, y = 1000, z = 7}
local NECROPHARUS_POSITION = {x = 1000, y = 1000, z = 7}


local tasks = {
    [1] = {questStarted = 1510, questStorage = 65000, killsRequired = 200, raceName = "Son of Verminors", rewards = {{enable = true, type = "exp", values = 2360000}, {enable = true, type = "money", values = 25000}}},
    [2] = {questStarted = 1511, questStorage = 65001, killsRequired = 200, raceName = "Plaguesmiths", rewards = {{enable = true, type = "exp", values = 1800000}, {enable = true, type = "money", values = 25000}}},
    [3] = {questStarted = 1512, questStorage = 65002, killsRequired = 100, raceName = "Rotworms", rewards = {{enable = true, type = "exp", values = 16000}, {enable = true, type = "money", values = 25000}}},
    [4] = {questStarted = 1513, questStorage = 65003, killsRequired = 100, raceName = "Cyclops", rewards = {{enable = true, type = "exp", values = 30000}, {enable = true, type = "money", values = 25000}}},
    [5] = {questStarted = 1514, questStorage = 65004, killsRequired = 200, raceName = "Heros", rewards = {{enable = true, type = "exp", values = 480000}, {enable = true, type = "money", values = 25000}}},
    [6] = {questStarted = 1515, questStorage = 65005, killsRequired = 200, raceName = "Dragons", rewards = {{enable = true, type = "exp", values = 280000}, {enable = true, type = "money", values = 25000}}},
    [7] = {questStarted = 1516, questStorage = 65006, killsRequired = 100, raceName = "Dragon Lords", rewards = {{enable = true, type = "exp", values = 420000}, {enable = true, type = "money", values = 25000}}},
    [8] = {questStarted = 1517, questStorage = 65007, killsRequired = 200, raceName = "Frost Dragons", rewards = {{enable = true, type = "exp", values = 840000}, {enable = true, type = "money", values = 25000}}},
    [9] = {questStarted = 1518, questStorage = 65008, killsRequired = 200, raceName = "Warlocks", rewards = {{enable = true, type = "exp", values = 1600000}, {enable = true, type = "money", values = 25000}}},
    [10] = {questStarted = 1519, questStorage = 65009, killsRequired = 150, raceName = "Hydras", rewards = {{enable = true, type = "exp", values = 630000}, {enable = true, type = "money", values = 25000}}},
    [11] = {questStarted = 1520, questStorage = 65010, killsRequired = 150, raceName = "Demons", rewards = {{enable = true, type = "exp", values = 1800000}, {enable = true, type = "money", values = 25000}}},
    [12] = {questStarted = 1521, questStorage = 65011, killsRequired = 100, raceName = "Vampires", rewards = {{enable = true, type = "exp", values = 141500}, {enable = true, type = "money", values = 25000}}},
    [13] = {questStarted = 1522, questStorage = 65012, killsRequired = 200, raceName = "Demon Outcasts", rewards = {{enable = true, type = "exp", values = 3480000}, {enable = true, type = "money", values = 25000}}},
    [14] = {questStarted = 1523, questStorage = 65013, killsRequired = 200, raceName = "Serpent Spawns", rewards = {{enable = true, type = "exp", values = 940000}, {enable = true, type = "money", values = 25000}}},
    [15] = {questStarted = 1524, questStorage = 65014, killsRequired = 150, raceName = "Grim Reapers", rewards = {{enable = true, type = "exp", values = 1650000}, {enable = true, type = "money", values = 25000}}},
    [16] = {questStarted = 1525, questStorage = 65015, killsRequired = 200, raceName = "Behemoths", rewards = {{enable = true, type = "exp", values = 1000000}, {enable = true, type = "money", values = 25000}}},
    [17] = {questStarted = 1526, questStorage = 65016, killsRequired = 150, raceName = "Bog Raiders", rewards = {{enable = true, type = "exp", values = 480000}, {enable = true, type = "money", values = 25000}}},
    [18] = {questStarted = 1527, questStorage = 65017, killsRequired = 200, raceName = "Choking Fears", rewards = {{enable = true, type = "exp", values = 2490000}, {enable = true, type = "money", values = 25000}}},
    [19] = {questStarted = 1528, questStorage = 65018, killsRequired = 200, raceName = "Crystal Spiders", rewards = {{enable = true, type = "exp", values = 860000}, {enable = true, type = "money", values = 25000}}},
    [20] = {questStarted = 1529, questStorage = 65019, killsRequired = 100, raceName = "Giant Spiders", rewards = {{enable = true, type = "exp", values = 502000}, {enable = true, type = "money", values = 25000}}},
    [21] = {questStarted = 1530, questStorage = 65020, killsRequired = 100, raceName = "Nightmares", rewards = {{enable = true, type = "exp", values = 537500}, {enable = true, type = "money", values = 25000}}},
    [22] = {questStarted = 1531, questStorage = 65021, killsRequired = 200, raceName = "Undead Dragons", rewards = {{enable = true, type = "exp", values = 3380000}, {enable = true, type = "money", values = 25000}}},
    [23] = {questStarted = 1532, questStorage = 65022, killsRequired = 100, raceName = "Betrayed Wraiths", rewards = {{enable = true, type = "exp", values = 1200000}, {enable = true, type = "money", values = 25000}}},
    [24] = {questStarted = 1533, questStorage = 65023, killsRequired = 200, raceName = "Blightwalkers", rewards = {{enable = true, type = "exp", values = 2340000}, {enable = true, type = "money", values = 25000}}},
    [25] = {questStarted = 1534, questStorage = 65024, killsRequired = 400, raceName = "Dark Torturers", rewards = {{enable = true, type = "exp", values = 3720000}, {enable = true, type = "money", values = 25000}}},
    [26] = {questStarted = 1535, questStorage = 65025, killsRequired = 100, raceName = "Defilers", rewards = {{enable = true, type = "exp", values = 1110000}, {enable = true, type = "money", values = 25000}}},
    [27] = {questStarted = 1536, questStorage = 65026, killsRequired = 200, raceName = "Destroyers", rewards = {{enable = true, type = "exp", values = 2700000}, {enable = true, type = "money", values = 25000}}},
    [28] = {questStarted = 1537, questStorage = 65027, killsRequired = 100, raceName = "Furys", rewards = {{enable = true, type = "exp", values = 1350000}, {enable = true, type = "money", values = 25000}}},
    [29] = {questStarted = 1538, questStorage = 65028, killsRequired = 100, raceName = "Hellhounds", rewards = {{enable = true, type = "exp", values = 1360000}, {enable = true, type = "money", values = 25000}}},
    [30] = {questStarted = 1539, questStorage = 65029, killsRequired = 100, raceName = "Juggernauts", rewards = {{enable = true, type = "exp", values = 1562500}, {enable = true, type = "money", values = 25000}}}
}

local rankStorage = 32150
local choose = {}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function getTasksStarted(cid)
    local tmp = {}
    for k, v in pairs(tasks) do
        if getCreatureStorage(cid, v.questStarted) == 1 then
            table.insert(tmp, k)
        end
    end
    return tmp
end

function getTaskByName(name)
    for k, v in pairs(tasks) do
        if v.raceName:lower() == name:lower() then
            return k
        end
    end
    return false
end

function creatureSayCallback(cid, type, msg)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
    if isInArray({"task", "tasks"}, msg:lower()) then
        selfSay("There you can see the following tasks, please tell me the {number of the task} that you want to do. If you want to finish a task say, example: {report dragon lords}. To change your current task to another you can {cancel} tasks.", cid)
        local text = ""
        for i = 1, table.maxn(tasks) do
           text = text .. (text == "" and "" or "\n") .. i .. " - " .. tasks[i].raceName .. (getCreatureStorage(cid, tasks[i].questStarted) == 1 and " [...]" or getCreatureStorage(cid, tasks[i].questStarted) == 2 and " [x]" or "")
        end
        return doShowTextDialog(cid, 5956, text)

    elseif getTaskByName(msg) or tasks[tonumber(msg)] then
        msg = (getTaskByName(msg) or tonumber(msg))
        if getCreatureStorage(cid, tasks[msg].questStarted) == 1 then
            selfSay("You already started this task.", cid)
            talkState[talkUser] = 0
            return true
        end
        if getCreatureStorage(cid, tasks[msg].questStarted) == 2 then
            selfSay("You already finished this task.", cid)
            talkState[talkUser] = 0
            return true
        end
        local startedTasks = getTasksStarted(cid)
        if #startedTasks > 0 then
        selfSay("You already started " .. tasks[startedTasks[1]].raceName .. " task. You cannot start more then one task at once. If you want to finish a task say, example: {report dragon lords}. To change your current task to another you can {cancel} tasks.", cid)
        talkState[talkUser] = 0
        return true
        end
        if tasks[msg].level and getPlayerLevel(cid) < tasks[msg].level then
            selfSay("You need level " .. tasks[msg].level .. " or higher to make this task.", cid)
            talkState[talkUser] = 0
            return true
        end
        selfSay("Are you sure that do you want to start the task number " .. msg .. "? In this task you will need to defeat " .. tasks[msg].killsRequired .. " " .. tasks[msg].raceName .. ".", cid)
        choose[cid] = msg
        talkState[talkUser] = 1
    elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
        doCreatureSetStorage(cid, tasks[choose[cid]].questStarted, 1)
        doCreatureSetStorage(cid, tasks[choose[cid]].questStorage, 0)
        selfSay("You have started the task number " .. choose[cid] .. ", remember... in this task you will need to defeat " .. tasks[choose[cid]].killsRequired .. " " .. tasks[choose[cid]].raceName .. ". Good luck!", cid)
        talkState[talkUser] = 0
        return true
elseif msg:lower() == "cancel" then
   local startedTasks = getTasksStarted(cid)

   if #startedTasks == 0 then
      selfSay("You don't have any task started.", cid)
      talkState[talkUser] = 0
      return true
   end

   selfSay("Do you want to cancel " .. tasks[startedTasks[1]].raceName .. " task? Are you sure?", cid)
   talkState[talkUser] = 2
   return true

elseif msgcontains(msg, "yes") and talkState[talkUser] == 2 then
   local startedTasks = getTasksStarted(cid)

   if #startedTasks == 0 then
      selfSay("You don't have any task started.", cid)
      talkState[talkUser] = 0
      return true
   end

   doCreatureSetStorage(cid, tasks[startedTasks[1]].questStarted, -1)
   doCreatureSetStorage(cid, tasks[startedTasks[1]].questStorage, -1)
   selfSay("Task " .. tasks[startedTasks[1]].raceName .. " cancelled. Now you can choose other task.", cid)
   talkState[talkUser] = 0
   return true
    elseif msg:lower() == "report" then
        local t = getTasksStarted(cid)
        local response = "You are currently making " .. (#t > 1 and "these" or "this") .. " task" .. (#t > 1 and "s" or "") .. ":\n"
        if table.maxn(t) > 0 then
            for _, tsk in ipairs(t) do
                if getCreatureStorage(cid, tasks[tsk].questStorage) < 0 then
                    doCreatureSetStorage(cid, tasks[tsk].questStorage, 0)
                end
                response = response .. " Name: " .. tasks[tsk].raceName .. " Kills: " .. getCreatureStorage(cid, tasks[tsk].questStorage) .. " - " .. tasks[tsk].killsRequired .. ".\n"
            end
            response = response .. "Please say report and the name of the task that do you want to report, example: 'Report Trolls'."
            return selfSay(response, cid)
        else
            return selfSay("You need to start at least one task first.", cid)
        end
    elseif string.sub(msg:lower(), 0, 6) == "report" then
        local t = getTaskByName(string.sub(msg, 8, string.len(msg)))
        if not t then
            return selfSay("That task does not exists.", cid)
        end

        if getCreatureStorage(cid, tasks[t].questStarted) == 2 then
            return selfSay("You already finished this task.", cid)
        end

        if getCreatureStorage(cid, tasks[t].questStarted) < 1 then
            return selfSay("You don't have started this task.", cid)
        end

        if tasks[t].killsRequired > getCreatureStorage(cid, tasks[t].questStorage) then
            return selfSay("Current " .. getCreatureStorage(cid, tasks[t].questStorage) .. " " .. tasks[t].raceName .. " killed, you need to kill " .. tasks[t].killsRequired .. ".", cid)
        end

        for i = 1, table.maxn(tasks[t].rewards) do
            for k_, reward in pairs(tasks[t].rewards) do
                if(reward.enable) then
                    if isInArray({"boss", "teleport", 1}, reward.type) then
                        doTeleportThing(cid, reward.values)
                    elseif isInArray({"exp", "experience", 2}, reward.type) then
                        doPlayerAddExperience(cid, reward.values)
                    elseif isInArray({"item", 3}, reward.type) then
                        doPlayerAddItem(cid, reward.values[1], reward.values[2])
                    elseif isInArray({"money", 4}, reward.type) then
                        doPlayerAddMoney(cid, reward.values)
                    elseif isInArray({"storage", "stor", 5}, reward.type) then
                        doCreatureSetStorage(cid, reward.values[1], reward.values[2])
                    elseif isInArray({"points", "rank", 2}, reward.type) then
                        doCreatureSetStorage(cid, rankStorage, getCreatureStorage(cid, rankStorage) + reward.values)
                    else
                        print("[Warning - Npc::KillingInTheNameOf] Wrong reward type: " .. (reward.type or "nil") .. ", reward could not be loaded.")
                    end
                end
            end
        end
        local rank = getCreatureStorage(cid, rankStorage)
        selfSay("Great!... you have finished the task number " .. t .. "" .. (rank > 4 and ", you are a " or "") .. "" .. (((rank > 4 and rank < 10) and ("Huntsman") or (rank > 9 and rank < 20) and ("Ranger") or (rank > 19 and rank < 30) and ("Big Game Hunter") or (rank > 29 and rank < 50) and ("Trophy Hunter") or (rank > 49) and ("Elite Hunter")) or "") .. ". Good job.", cid)
        return doCreatureSetStorage(cid, tasks[t].questStarted, 2)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
