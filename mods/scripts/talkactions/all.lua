local config = {
	rateExperience = getConfigInfo('rateExperience'),
	rateSkill = getConfigInfo('rateSkill'),
	rateLoot = getConfigInfo('rateLoot'),
	rateMagic = getConfigInfo('rateMagic'),
	rateSpawn = getConfigInfo('rateSpawn'),
	protectionLevel = getConfigInfo('protectionLevel'),
	worldType = getConfigInfo('worldType'),
	ownerName = getConfigInfo('ownerName'),
	ownerEmail = getConfigInfo('ownerEmail'),
	supportsystem = getConfigInfo('supportsystem'),
	stages = getBooleanFromString(getConfigInfo('experienceStages'))
}
function onSay(cid, words, param, channel)
	local exp = config.rateExperience
	if(config.stages == true) then
		exp = getExperienceStage(getPlayerLevel(cid))
	end
	guild = "None"
		news = "OTClient Funcionando"
		name = getPlayerName(cid)
		level = getPlayerLevel(cid)
		access = getPlayerAccess(cid)
		version = "21.0"
		motto = "Buen dia "
	local hours = math.ceil(getWorldUpTime() / 3600) - 1
	local minutes = math.ceil((getWorldUpTime() - (3600 * hours)) / 60)
	if minutes == 60 then
		minutes = 0
		hours = hours + 1
	end
	doPlayerPopupFYI(cid, "Bienvenido a DarkKonia Fantasy II \n\nServer Informacion\nExperience rate: x" .. exp .. "\nLoot rate: x" .. config.rateLoot .. "\nMagic/Skill rate: x" .. config.rateMagic .. "\nSpawns rate: x" .. config.rateSpawn .. "\nProtection level: " .. config.protectionLevel .. "\nWorld Type: " .. config.worldType .. "\nOwners: " .. config.ownerName .. "\nEmails Support: " .. config.ownerEmail .. "\nTutors & Support: " .. config.supportsystem .. "\n\nNews:\n" .. news .." \n  \n\n You are Logged in as:\n Name: " .. name .."\n Level: " .. level .."\n Access: " .. access .."\n\n Server Version: " .. version .." \n Uptime:  ".. hours .."  hours and " .. minutes .." minutes.")
	return true
end