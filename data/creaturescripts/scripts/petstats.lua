function onStatsChange(cid, attacker, type, combat, value)
    -- Verificar si el jugador tiene una mascota y si el atacante es su mascota
    local pet = getPlayerPet(cid)
    if pet and pet == attacker then
        return false -- Evita que la mascota afecte las estadísticas del jugador
    end
    return true -- Permite los cambios de estadísticas en otras circunstancias
end