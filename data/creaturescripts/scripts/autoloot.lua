local stor = 7575

local function autoloot(cid, pos, lootMap)
    if not isPlayer(cid) then return end

    local corpse = nil
    
    for i = 255, 1, -1 do
        pos.stackpos = i
        local item = getThingFromPos(pos)
        if item.uid > 0 and isContainer(item.uid) then
            if getItemAttribute(item.uid, "corpseowner") == cid then
                corpse = item.uid
                break
            end
        end
    end

    if not corpse then return end

    local lootedItems = {}
    
    local function scanContainer(uid)
        for k = getContainerSize(uid) - 1, 0, -1 do
            local tmp = getContainerItem(uid, k)
            if tmp.uid > 0 then
                if lootMap[tmp.itemid] then
                    local added = doPlayerAddItem(cid, tmp.itemid, math.max(1, tmp.type))
                    
                    if added then
                        lootedItems[tmp.itemid] = (lootedItems[tmp.itemid] or 0) + math.max(1, tmp.type)
                        doRemoveItem(tmp.uid)
                    end
                elseif isContainer(tmp.uid) then
                    scanContainer(tmp.uid)
                end
            end
        end
    end

    scanContainer(corpse)

    local msgParts = {}
    for itemId, count in pairs(lootedItems) do
        table.insert(msgParts, count .. "x " .. getItemNameById(itemId))
    end

    if #msgParts > 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Looted: " .. table.concat(msgParts, ", ") .. ".")
    end
end

function onKill(cid, target, lastHit)
    if isMonster(target) then
        local infos = getPlayerStorageValue(cid, stor)
        if infos == -1 or infos == "" then return true end

        local list = tostring(infos):gsub("_", ""):explode(",")
        if #list == 0 then return true end

        for _, idStr in ipairs(list) do
            local id = tonumber(idStr)
            if id then
                lootMap[id] = true
            end
        end

        addEvent(autoloot, 150, cid, getCreaturePosition(target), lootMap)
    end
    return true
end