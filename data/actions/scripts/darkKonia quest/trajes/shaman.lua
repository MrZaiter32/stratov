function onUse(cid, item, frompos, item2, topos)
    if item.uid == 3982 then
        local questStatus = getPlayerStorageValue(cid, 30024)
        
        if questStatus == -1 or questStatus == 0 then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Shaman outfit.")
            
            doPlayerAddItem(cid, 3961, 1)
            doPlayerAddItem(cid, 2501, 1)
            doPlayerAddItem(cid, 3982, 1)
            
            setPlayerStorageValue(cid, 30024, 1)
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It's empty.")
        end
    else
        return false
    end
    
    return true
end

