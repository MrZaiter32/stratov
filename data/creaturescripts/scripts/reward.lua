rewards = {
			{skill = SKILL__LEVEL, level = 50, storage = 3100, item = 2160, count = 20, message = "Congratulations, you advanced in {SKILL} level {LEVEL} and received {ITEM} as a reward!", effect = 30},
			{skill = SKILL__LEVEL, level = 80, storage = 3109, item = 2160, count = 25, message = "Congratulations, you advanced in {SKILL} level {LEVEL} and received {ITEM} as a reward!", effect = 30},
			{skill = SKILL__LEVEL, level = 80, storage = 3112, item = 8889, message = "Congratulations, you advanced in {SKILL} level {LEVEL} and received {ITEM} as a reward!", effect = 30,
				callback = function(cid, reward)
					return isInArray({3, 6, 9, 12, 15, 18, 21, 24}, getPlayerVocation(cid))
				end
			},
			{skill = SKILL__LEVEL, level = 50, storage = 3113, item = 2466, message = "Congratulations, you advanced in {SKILL} level {LEVEL} and received {ITEM} as a reward!", effect = 30,
				callback = function(cid, reward)
					return isInArray({2, 5, 8, 11, 14, 17, 20, 23, 3, 6, 9, 12, 15, 18, 21, 24}, getPlayerVocation(cid))
				end
			},
			{skill = SKILL__LEVEL, level = 80, storage = 3118, item = 8891, message = "Congratulations, you advanced in {SKILL} level {LEVEL} and received {ITEM} as a reward!", effect = 30,
				callback = function(cid, reward)
					return isInArray({2, 5, 8, 11, 14, 17, 20, 23}, getPlayerVocation(cid))
				end
			},
			{skill = SKILL__LEVEL, level = 50, storage = 3115, item = 2656, message = "Congratulations, you advanced in {SKILL} level {LEVEL} and received {ITEM} as a reward!", effect = 30,
				callback = function(cid, reward)
					return isInArray({1, 4, 7, 10, 13, 16, 19, 22}, getPlayerVocation(cid))
				end
			},
			{skill = SKILL__LEVEL, level = 80, storage = 3116, item = 8890, message = "Congratulations, you advanced in {SKILL} level {LEVEL} and received {ITEM} as a reward!", effect = 30,
				callback = function(cid, reward)
					return isInArray({1, 4, 7, 10, 13, 16, 19, 22}, getPlayerVocation(cid))
				end
			},
			{skill = SKILL__LEVEL, level = 300, storage = 3117, message = true,
				callback = function(cid, reward)
					doBroadcastMessage(getCreatureName(cid) .. " has advanced to Level 300. Congratulations!", MESSAGE_EVENT_ADVANCE)
				return true
				end
			},
			{skill = SKILL__LEVEL, level = 30, storage = 3101, message = "Congratulations, take this as a reward for advancing at 30 level!", effect = 30, item = 2000,
				inside = {
					{id = 2160, count = 15}
				}
			},
			{skill = SKILL__LEVEL, level = 10, storage = 50183, message = "Felicidades, ahora puedes tomas los quest de vocation avanzada en el ultimo piso del DP de Fynn.", effect = 30,
				callback = function(cid, reward)
					return isInArray({7, 8, 9, 10, 11, 12}, getPlayerVocation(cid))
				end
			},
			{skill = SKILL__LEVEL, level = 10, storage = 50184, message = "Felicidades, ahora puedes tomas los quest de vocation avanzada en el ultimo piso del DP de Fynn.", effect = 30,
				callback = function(cid, reward)
					return isInArray({19, 20, 21, 22, 23, 24}, getPlayerVocation(cid))
				end
			},
			{skill = SKILL__LEVEL, level = 250, storage = 10614, item = 10614, message = "Congratulations, take this as a reward for advancing at 250 level!. And turn off, ArenaQuest.", effect = 30}
		}