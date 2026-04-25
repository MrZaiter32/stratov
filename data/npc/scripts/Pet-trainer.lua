
local keywordHandler = KeywordHandler:new()
    local npcHandler = NpcHandler:new(keywordHandler)
    NpcSystem.parseParameters(npcHandler)
    local talkState = {}

    function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
    function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
    function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
    function onThink()                    npcHandler:onThink()                    end

   

    local playerReturnPosition = function(cid)
    doTeleportThing(cid.uid, returnPosition)
    doSendMagicEffect(returnPosition, CONST_ME_TELEPORT)
    return true
    end

    function creatureSayCallback(cid, type, msg)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    if msgcontains(msg, 'revivir') then
        selfSay('Usted Quiere revivir su PET?', cid)
        talkState[talkUser] = 1
    elseif talkState[talkUser] == 1 then
    if msgcontains(msg, 'yes') then
    
     if getPlayerStorageValue(cid, 55000) > 0 then    -------> storage de revivir
     
     if(getPlayerMoney(cid) >= 20000) then   ----------------> costo de revivir 2 cristales
     
     setPlayerStorageValue(cid, 55000, -1)

     doPlayerRemoveMoney(cid, 20000)  ------------> remueve el dinero
     
     selfSay('Su pet a vuelto a la vida!', cid)
     
     else
     
     selfSay('Usted no tiene dinero para revivir su PET!', cid)
     
     end
     
     else
        
        selfSay('Su pet no esta muerto!', cid)
        
        end
    else
        talkState[talkUser] = -1
        selfSay('come back later if you want a mission.', cid)
    end
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())