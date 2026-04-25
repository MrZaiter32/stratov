more examples
	-- {skill = SKILL_SWORD, level = 110, storage = 3102, item = 2400, message = "Take this as a reward for advancing in 120 sword fighting level!", effect = 61}

	message player see when getting reward, you can also personalize it for every reward
	-- message = "Congratulations, you advanced in {SKILL} level {LEVEL} and received {ITEM} as a reward!"

	uncomment if you want to see magic effect when reward is added
	-- effect = 30 -- magic effect id

	items in a backpack
	-- {skill = SKILL__LEVEL, level = 50, storage = 3103, item = 2000,
	-- 		inside = {
	-- 			{id = 2160, count = 1},
	-- 			{id = 2152, count = 50},
	-- 			{id = 2195}
	-- 		}
	-- 	}

	only for specified vocations (in this case - sorcerers & druids)
	--	{skill = SKILL_AXE, level = 50, storage = 3104, item = 7884,
	--		callback = function(cid, reward)
	--			return isInArray({1, 2, 5, 6}, getPlayerVocation(cid))
	--		end
	--	}

	this one will only broadcast message (without giving any reward)
	--	{skill = SKILL__LEVEL, level = 300, storage = 3105, message = false,
	--		callback = function(cid, reward)
	--			doBroadcastMessage(getCreatureName(cid) .. " has advanced to Level 300. Congratulations!", MESSAGE_EVENT_ADVANCE)
	--			return true
	--		end
	--	}