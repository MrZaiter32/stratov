local config = {
			rewards = rewards,
			message = message,
			effect = effect
		}

		function onAdvance(cid, skill, oldLevel, newLevel)
			for _, reward in pairs(config.rewards) do
				if(reward.skill == skill and newLevel >= reward.level
					and getPlayerStorageValue(cid, reward.storage) ~= 1)
				then
					if(not reward.callback or reward.callback(cid, reward)) then
						local continue = true

						if(not reward.inside) then
							if(reward.item and doPlayerAddItem(cid, reward.item, reward.count or 1) == false) then
								continue = false
							end
						elseif(isItemContainer(reward.item)) then
							local container = doCreateItemEx(reward.item, 1)
							for _, item in ipairs(reward.inside) do
								doAddContainerItem(container, item.id, item.count or 1)
							end

							if(doPlayerAddItemEx(cid, container, false) ~= RETURNVALUE_NOERROR) then
								continue = false
							end
						end

						if(continue) then
							setPlayerStorageValue(cid, reward.storage, 1)

							local message = reward.message or config.message
								if(type(reward.message) == 'boolean') then
									message = reward.message
								end

							if(message) then
								local t = {
									["NAME"] = getCreatureName(cid),
									["SKILL"] = SKILL_NAMES[skill],
									["OLDLEVEL"] = oldLevel,
									["NEWLEVEL"] = newLevel,
									["LEVEL"] = reward.level
								}
								if(reward.item) then
									t["ITEM"] = getItemNameById(reward.item)
								end

								doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, tostring(message:gsub("{(.-)}", function(v) return t[v] end)))
							end

							local effect = reward.effect or config.effect
							if(effect) then
								doSendMagicEffect(getCreaturePosition(cid), effect)
							end
						end
					end
				end
			end
			return true
		end