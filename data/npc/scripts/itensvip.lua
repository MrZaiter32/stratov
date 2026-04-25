local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- STRIKE START --
function jestervip(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
        if getPlayerItemCount(cid,2157) >= 50  then
        if doPlayerRemoveItem(cid,2157,50) then
            npcHandler:say('Aqui esta seu item!', cid)
            doPlayerAddItem(cid,7424,1)
        end
        else
            npcHandler:say('Voce nao tem itens necessarios!', cid)
        end
end
-- STRIKE END --

keywordHandler:addKeyword({'vips'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Eu troco {jester staff} por vips coins."})

local node1 = keywordHandler:addKeyword({'jester staff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer trocar 50 vips coins por 1 jester staff?? Yes or no??'})
    node1:addChildKeyword({'yes'}, jestervip, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, volte quando quizer negociar!', reset = true})
npcHandler:addModule(FocusModule:new())