local c = {
    [5917] = {11, "Oriental"},
    [7012] = {12, "Assassin"},
    [7014] = {14, "Pirate"},
    [7013] = {13, "Beggar"},
    [7015] = {15, "Shaman"},
    [7016] = {16, "Norseman"},
    [7017] = {17, "Nightmare"},
    [30027] = {18, "Jester"},
    [7019] = {19, "Brotherhood"},
    [7020] = {20, "Demonhunter"},
    [30030] = {21, "Yalaharian"},
    [7022] = {22, "Warmaster"},
    [30034] = {27, "Angelical"}
}

function onUse(cid, item, frompos, item2, topos)
    local o = c[item.uid]
    if not o then
        return false
    end

    -- Verificar si el jugador ya tiene el outfit
    if canPlayerWearOutfitId(cid, o[1], 0) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You already have the " .. o[2] .. " outfit!")
    else
        doSendMagicEffect(getCreaturePosition(cid), math.random(1, 67))
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You now have the " .. o[2] .. " outfit!")
        doPlayerAddOutfitId(cid, o[1], 0)

        -- Agregar objetos adicionales según el outfit desbloqueado
        if item.uid == 30027 then
            doPlayerAddItem(cid, 7957, 1)
            doPlayerAddItem(cid, 7958, 1)
        elseif item.uid == 5917 then
            doPlayerAddItem(cid, 5917, 1)
        elseif item.uid == 30030 then
            doPlayerAddItem(cid, 9776, 1)
            doPlayerAddItem(cid, 9777, 1)
            doPlayerAddItem(cid, 9778, 1)
            doPlayerAddItem(cid, 15960, 1)
        end
    end

    return true
end
