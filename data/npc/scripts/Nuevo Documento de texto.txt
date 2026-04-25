local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg) end
function onThink()					npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
 
	-- CFG
	local configA = {
		reward = true,
		experience = true,
		skill = true,
		door = true,
		missions = 6 -- Must be more than 1 and under 7 missions (6)
	}
	local rewardE = {{2160, 1}, {2160, 3}} -- item, count
	local experienceE = 480000 -- exp
	local skillE = {{4, 1}, {5, 2}} -- skillid, count
 
	local mission = {
	-- Info about what to kill for every mission. [1] = first mission and [2] second mission and so on...
		[1] = "You have to kill 50 Dragons, 20 Dragon Lords.",
		[2] = "You have to kill 4 Wyrms and 9 Demons.",
		[3] = "You have to kill 6 Demodras and 9 Dragon Lords.",
		[4] = "You have to kill 40 Vampires and 60 Ghouls.",
		[5] = "You have to kill 40 Behemoths and 40 Wyverns.",
		[6] = "You have to kill 30 Juggernauts and 10 Cyclops."
	}
 
	local Cmissions = {
		-- {monsterStorage1, monsterstorage2} (Must be the same in creaturescripts)
		[1] = {101, 102}, -- Enter empty storages
		[2] = {103, 104},
		[3] = {105, 106},
		[4] = {107, 108},
		[5] = {109, 110},
		[6] = {111, 112}
	}
 
	local questStorage = 100 -- Enter empty storage (Must be the same in creaturescripts)
	local questMission = 99 -- Enter empty storage
	local doorStorage = 98 -- Enter empty storage (Must be the same in actions)
 
	-- Don't touch --
	local getStorage = getPlayerStorageValue(cid, questStorage)
	local getMission = getPlayerStorageValue(cid, questMission)
 
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
	if(msgcontains(msg, 'quest') or msgcontains(msg, 'mission')) then
		if(getStorage < 0) then
			if(getMission < 0) then
				if(configA.missions >= 0) then
					selfSay('You are on your first task. You want to continue?', cid)
					talkState[talkUser] = 1
				end
			end
		elseif(getStorage == 1) then
			selfSay("You aren't done with your task yet. Go and continue.", cid)
			talkState[talkUser] = 0
		elseif(getStorage == 2) then
				setPlayerStorageValue(cid, questStorage, 3)
				setPlayerStorageValue(cid, questMission, 1)
				selfSay("There you are! Talk to me again for more information!", cid)
 
			if(configA.missions == 1) then
			setPlayerStorageValue(cid, questStorage, 18)
				if(configA.reward == true) then
					for i = 1, #rewardE do
						doPlayerAddItem(cid, rewardE[i][1], rewardE[i][2])
					end
				end
				if(configA.experience == true) then
					doPlayerAddExperience(cid, experienceE)
				end
				if(configA.skill == true) then
					for i = 1, #skillE do
						doPlayerAddSkill(cid, skillE[i][1], skillE[i][2])
					end
				end
				if(configA.door == true) then
					setPlayerStorageValue(cid, doorStorage, 1)
				end
			end
 
		elseif(getStorage == 3) then
			if(getMission == 1) then
				if(configA.missions >= 1) then
					selfSay('You are on your second task. You want to continue?', cid)
					talkState[talkUser] = 2
				end
			end
		elseif(getStorage == 4) then
			selfSay("You aren't done with your task yet. Go and continue.", cid)
			talkState[talkUser] = 0
		elseif(getStorage == 5) then
				setPlayerStorageValue(cid, questStorage, 6)
				setPlayerStorageValue(cid, questMission, 2)
				selfSay("There you are! Talk to me again for more information!", cid)
 
			if(configA.missions == 2) then
			setPlayerStorageValue(cid, questStorage, 18)
				if(configA.reward == true) then
					for i = 1, #rewardE do
						doPlayerAddItem(cid, rewardE[i][1], rewardE[i][2])
					end
				end
				if(configA.experience == true) then
					doPlayerAddExperience(cid, experienceE)
				end
				if(configA.skill == true) then
					for i = 1, #skillE do
						doPlayerAddSkill(cid, skillE[i][1], skillE[i][2])
					end
				end
				if(configA.door == true) then
					setPlayerStorageValue(cid, doorStorage, 1)
				end
			end
 
 
		elseif(getStorage == 6) then
			if(getMission == 2) then
				if(configA.missions >= 2) then
					selfSay('You are on your third task. You want to continue?', cid)
					talkState[talkUser] = 3
				end
			end
		elseif(getStorage == 7) then
			selfSay("You aren't done with your task yet. Go and continue.", cid)
			talkState[talkUser] = 0
		elseif(getStorage == 8) then
				setPlayerStorageValue(cid, questStorage, 9)
				setPlayerStorageValue(cid, questMission, 3)
				selfSay("There you are! Talk to me again for more information!", cid)
 
			if(configA.missions == 3) then
			setPlayerStorageValue(cid, questStorage, 18)
				if(configA.reward == true) then
					for i = 1, #rewardE do
						doPlayerAddItem(cid, rewardE[i][1], rewardE[i][2])
					end
				end
				if(configA.experience == true) then
					doPlayerAddExperience(cid, experienceE)
				end
				if(configA.skill == true) then
					for i = 1, #skillE do
						doPlayerAddSkill(cid, skillE[i][1], skillE[i][2])
					end
				end
				if(configA.door == true) then
					setPlayerStorageValue(cid, doorStorage, 1)
				end
			end
 
 
		elseif(getStorage == 9) then
			if(getMission == 3) then
				if(configA.missions >= 3) then
					selfSay('You are on your fourth task. You want to continue?', cid)
					talkState[talkUser] = 4
				end
			end
		elseif(getStorage == 10) then
			selfSay("You aren't done with your task yet. Go and continue.", cid)
			talkState[talkUser] = 0
		elseif(getStorage == 11) then
				setPlayerStorageValue(cid, questStorage, 12)
				setPlayerStorageValue(cid, questMission, 4)
				selfSay("There you are! Talk to me again for more information!", cid)
 
			if(configA.missions == 4) then
			setPlayerStorageValue(cid, questStorage, 18)
				if(configA.reward == true) then
					for i = 1, #rewardE do
						doPlayerAddItem(cid, rewardE[i][1], rewardE[i][2])
					end
				end
				if(configA.experience == true) then
					doPlayerAddExperience(cid, experienceE)
				end
				if(configA.skill == true) then
					for i = 1, #skillE do
						doPlayerAddSkill(cid, skillE[i][1], skillE[i][2])
					end
				end
				if(configA.door == true) then
					setPlayerStorageValue(cid, doorStorage, 1)
				end
			end
 
 
		elseif(getStorage == 12) then
			if(getMission == 4) then
				if(configA.missions >= 4) then
					selfSay('You are on your fifth task. You want to continue?', cid)
					talkState[talkUser] = 5
				end
			end
		elseif(getStorage == 13) then
			selfSay("You aren't done with your task yet. Go and continue.", cid)
			talkState[talkUser] = 0
		elseif(getStorage == 14) then
				setPlayerStorageValue(cid, questStorage, 15)
				setPlayerStorageValue(cid, questMission, 5)
				selfSay("There you are! Talk to me again for more information!", cid)
 
			if(configA.missions == 5) then
			setPlayerStorageValue(cid, questStorage, 18)
				if(configA.reward == true) then
					for i = 1, #rewardE do
						doPlayerAddItem(cid, rewardE[i][1], rewardE[i][2])
					end
				end
				if(configA.experience == true) then
					doPlayerAddExperience(cid, experienceE)
				end
				if(configA.skill == true) then
					for i = 1, #skillE do
						doPlayerAddSkill(cid, skillE[i][1], skillE[i][2])
					end
				end
				if(configA.door == true) then
					setPlayerStorageValue(cid, doorStorage, 1)
				end
			end
 
 
		elseif(getStorage == 15) then
			if(getMission == 5) then
				if(configA.missions >= 5) then
					selfSay('You are on your sixth task. You want to continue?', cid)
					talkState[talkUser] = 6
				end
			end
		elseif(getStorage == 16) then
			selfSay("You aren't done with your task yet. Go and continue.", cid)
			talkState[talkUser] = 0
		elseif(getStorage == 17) then
				setPlayerStorageValue(cid, questStorage, 18)
				setPlayerStorageValue(cid, questMission, 6)
				selfSay("There you are! You have now done the whole mission!", cid)
 
			if(configA.missions == 6) then
			setPlayerStorageValue(cid, questStorage, 18)
				if(configA.reward == true) then
					for i = 1, #rewardE do
						doPlayerAddItem(cid, rewardE[i][1], rewardE[i][2])
					end
				end
				if(configA.experience == true) then
					doPlayerAddExperience(cid, experienceE)
				end
				if(configA.skill == true) then
					for i = 1, #skillE do
						doPlayerAddSkill(cid, skillE[i][1], skillE[i][2])
					end
				end
				if(configA.door == true) then
					setPlayerStorageValue(cid, doorStorage, 1)
				end
			end
 
		elseif(getStorage == 18) then
			selfSay("You have already done all my tasks.", cid)
			talkState[talkUser] = 0
		end
 
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
			selfSay("".. mission[1] .." You want to do it?", cid)
			talkState[talkUser] = 7
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then
			for i = 1, #Cmissions[1] do
				setPlayerStorageValue(cid, Cmissions[1][i], 0)
			end
			setPlayerStorageValue(cid, questStorage, 1)
			selfSay("You can go and kill them now!", cid)
			talkState[talkUser] = 0
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
			selfSay("".. mission[2] .." You want to do it?", cid)
			talkState[talkUser] = 8
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then
			for i = 1, #Cmissions[2] do
				setPlayerStorageValue(cid, Cmissions[2][i], 0)
			end
			setPlayerStorageValue(cid, questStorage, 4)
			selfSay("You can go and kill them now!", cid)
			talkState[talkUser] = 0
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
			selfSay("".. mission[3] .." You want to do it?", cid)
			talkState[talkUser] = 9
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 9) then
			for i = 1, #Cmissions[3] do
				setPlayerStorageValue(cid, Cmissions[3][i], 0)
			end
			setPlayerStorageValue(cid, questStorage, 7)
			selfSay("You can go and kill them now!", cid)
			talkState[talkUser] = 0
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
			selfSay("".. mission[4] .." You want to do it?", cid)
			talkState[talkUser] = 10
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then
			for i = 1, #Cmissions[4] do
				setPlayerStorageValue(cid, Cmissions[4][i], 0)
			end
			setPlayerStorageValue(cid, questStorage, 10)
			selfSay("You can go and kill them now!", cid)
			talkState[talkUser] = 0
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
			selfSay("".. mission[5] .." You want to do it?", cid)
			talkState[talkUser] = 11
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 11) then
			for i = 1, #Cmissions[5] do
				setPlayerStorageValue(cid, Cmissions[5][i], 0)
			end
			setPlayerStorageValue(cid, questStorage, 13)
			selfSay("You can go and kill them now!", cid)
			talkState[talkUser] = 0
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then
			selfSay("".. mission[6] .." You want to do it?", cid)
			talkState[talkUser] = 12
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 12) then
			for i = 1, #Cmissions[6] do
				setPlayerStorageValue(cid, Cmissions[6][i], 0)
			end
			setPlayerStorageValue(cid, questStorage, 16)
			selfSay("You can go and kill them now!", cid)
			talkState[talkUser] = 0
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())