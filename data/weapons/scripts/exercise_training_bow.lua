function onUseWeapon(player, variant)
	local skillRate = 3 -- same config.lua
	player:addSkillTries(SKILL_DISTANCE, 20*skillRate)	
    return true
end

