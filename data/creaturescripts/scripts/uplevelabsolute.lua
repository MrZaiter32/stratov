local prizes = {
[50] = {id = 2160, count = 20}, -- at level 50 reward 3 item id 2160
[100] = {id = 2160, count = 50},
}

local storage = 34807
function onAdvance(player, skill, oldLevel, newLevel)
  if skill == 8 then
    for i = oldLevel+1, newLevel do -- just checking if he jumps multiple levels and pass 2+ prize levels
        if i > player:getStorageValue(storage) then
            local currentPrize = prizes[i]
            if currentPrize then
                player:setStorageValue(storage, i)
                local item = player:addItem(currentPrize.id, currentPrize.count)
                player:sendTextMessage(22, "Congratulations! You received "..currentPrize.count.."x "..item:getName().." for reaching level "..i..".")
            end
        end
    end
  end
    return true
end

function onLogin(player)
     player:registerEvent("advanceRewards")
    return true
end