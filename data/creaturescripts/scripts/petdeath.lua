function onDeath(cid, corpse, deathList)
    -- Verificar si la criatura es una mascota
    if not isPet(cid) then
        return true
    end

    -- Obtener el dueño de la mascota
    local master = getCreatureMaster(cid)
    if master then
        -- Almacenar el estado de muerte de la mascota
        setPlayerStorageValue(master, 55000, 1)

        -- Enviar mensaje al dueño notificando la muerte de su mascota
        doPlayerSendTextMessage(master, MESSAGE_STATUS_CONSOLE_BLUE, "Your pet is dead.")
    end

    return true
end