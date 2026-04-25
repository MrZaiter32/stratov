function onUse(cid, item, frompos, item2, topos)
    if item.uid == 30030 then
        local questStatus = getPlayerStorageValue(cid, 30030)

        if questStatus == -1 or questStatus == 0 then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Yalaharian outfit.")

            doPlayerAddItem(cid, 9776, 1)
            doPlayerAddItem(cid, 9777, 1)
            doPlayerAddItem(cid, 9778, 1)

            setPlayerStorageValue(cid, 30030, 1)
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It's empty.")
        end
    else
        return false
    end
    
    return true
end
