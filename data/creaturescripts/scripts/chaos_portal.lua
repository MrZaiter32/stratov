local teleport_time = 120
local position = {x = 1603, y = 1110, z = 11} -- Donde aparece el portal
local destination = {x = 1660, y = 1157, z = 11} -- Donde lleva el portal

local function removePortal(pos)
    local tile = getTileItemById(pos, 1387)
    if tile.uid > 0 then
        doRemoveItem(tile.uid)
        doSendMagicEffect(pos, CONST_ME_POFF)
    end
end

function onDeath(cid, corpse, deathList)
    doCreateTeleport(1387, destination, position)
    doSendMagicEffect(position, CONST_ME_TELEPORT)

    for _, killer in ipairs(deathList) do
        if isPlayer(killer) then
            doPlayerSendTextMessage(killer, MESSAGE_EVENT_ADVANCE, "A portal has appeared! You have " .. teleport_time .. " seconds to enter.")
        end
    end

    addEvent(removePortal, teleport_time * 1000, position)
    print("[ChaosPortal] Portal creado con éxito.")
    return true
end
