function onKill(cid, target, lastHit)
    if not isMonster(target) or getExperienceStage(cid) < 0.1 then
        return true
    end

    local monsterName = getCreatureName(target)
    local monsterInfo = getMonsterInfo(monsterName)

    if not monsterInfo or monsterInfo.experience < 1 then
        return true
    end

    local pet = getPlayerPet(cid)
    if pet then
        local expGain = monsterInfo.experience * petExpRate
        doPetAddExperience(pet, expGain)

        local newLevel = getLevelByExp(getPetExperience(pet))
        local oldLevel = getPetLevel(pet)

        if newLevel > oldLevel then
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
                "Your pet advanced from level " .. oldLevel .. " to level " .. newLevel .. ".")
            doPetSetLevel(pet, newLevel)

            if refillStatsAtLevel then
                doCreatureAddHealth(pet, getCreatureMaxHealth(pet) - getCreatureHealth(pet))
                doCreatureAddMana(pet, getCreatureMaxMana(pet) - getCreatureMana(pet))
            end
        end
    end

    return true
end
