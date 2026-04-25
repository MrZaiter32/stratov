local monsters ={
        --name = storage
        ["dragon"]=55004,
        ["dragon lord"]=55004
}

function onKill(cid, target)
        local monster = monsters[getCreatureName(target):lower()]
        if(isPlayer(target)== FALSE and monster and getPlayerStorageValue(cid,76669)==2)then
                if getPlayerStorageValue(cid, monster)<200then 
                        local killedMonsters = getPlayerStorageValue(cid, monster)
            if(killedMonsters ==-1)then
                killedMonsters =1
                        end
                        setPlayerStorageValue(cid, monster, killedMonsters +1)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have killed ".. killedMonsters .." of 200 dragons.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have killed enough dragons.")
                        setPlayerStorageValue(cid,76669,3)
                end
        end
        return TRUE
end