local teleport_time = 120 -- segundos antes de que desaparezca el portal

-- Tabla de monstruos con [posición del portal], [posición a donde lleva]
local monsters = {
    ["chaos imperor"]  = {portal_pos = {x=1603, y=1110, z=11}, destination = {x=1660, y=1156, z=11}},
    ["chaos destroyer"] = {portal_pos = {x=1244, y=1124, z=10}, destination = {x=1261, y=1111, z=10}},
    ["chaos littium"]   = {portal_pos = {x=550, y=575, z=14},   destination = {x=611, y=571, z=14}}
}

-- Elimina el teleport después de X segundos
local function removePortal(pos)
    local tile = getTileItemById(pos, 1387)
    if tile.uid > 0 then
        doRemoveItem(tile.uid)
        doSendMagicEffect(pos, CONST_ME_POFF)
        print("[ChaosPortal] Portal eliminado.")
    else
        print("[ChaosPortal] No se encontró teleport en la posición.")
    end
end

function onDeath(cid, corpse, deathList)
    local monsterName = string.lower(getCreatureName(cid))
    local data = monsters[monsterName]

    if not data then
        print("[ChaosPortal] El monstruo '" .. monsterName .. "' no está configurado.")
        return true
    end

    -- Crear teleport
    local teleport = doCreateTeleport(1387, data.destination, data.portal_pos)
    if teleport then
        doSendMagicEffect(data.portal_pos, CONST_ME_TELEPORT)
        print("[ChaosPortal] Portal creado para " .. monsterName)
    else
        print("[ChaosPortal] Error al crear portal para " .. monsterName)
        return true
    end

    -- Enviar mensaje a los jugadores que participaron
    for _, killer in ipairs(deathList) do
        if isPlayer(killer) then
            doPlayerSendTextMessage(killer, MESSAGE_EVENT_ADVANCE,
                "A portal has appeared! You have " .. teleport_time .. " seconds to enter.")
        end
    end

    -- Quitar el teleport después de X segundos
    addEvent(removePortal, teleport_time * 1000, data.portal_pos)

    return true
end
