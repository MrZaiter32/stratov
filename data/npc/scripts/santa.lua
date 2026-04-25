random_items = {
{10,16011,1},   -- 1% to get rare amulet
{450,2114,1},   -- 45% to get piggy bank
{200,2160,25},   -- 20% to get piggy bank
{80,2688,8},   -- 8% to get 8 candy canes
{80,2110,1},   -- 8% to get doll
{200,2178,1},  -- 20% to get carbon
{400,2674,15}, -- 40% to get 15 red apples
{450,2675,10}, -- 45% to get 10 oranges
{1000,2687,8}  -- 100% to get 8 cookies
}
PRESENT_STORAGE = 54164 -- storage ID



local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

function santaNPC(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if (parameters.present == true) then
        if (getPlayerStorageValue(cid, PRESENT_STORAGE) < 1) then
            local item = {}
            local reward = 0
            local count = ""
            for i = 1, #random_items do
                item = random_items[i]
                if (math.random(0,999) < item[1]) then
                    reward = item[2]
                    subType = item[3]
                    if subType > 1 then
                        count = subType .. " "
                    end
                    break
                end
            end
            doPlayerAddItem(cid, reward, subType)
            setPlayerStorageValue(cid, PRESENT_STORAGE, 1)
            npcHandler:say('... ...! I got ' .. count .. getItemNameById(reward) .. ' ... ...', cid)
        else
            npcHandler:say('... ...', cid)
        end
    else
        npcHandler:say('... ...', cid)
    end
    npcHandler:resetNpc()
    return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "... ... |PLAYERNAME| ... ... {trick treating} ...")

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false})
local yesNode = KeywordNode:new({'trick treating'}, santaNPC, {present = true})

local node = keywordHandler:addKeyword({'trick treating'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Trick treating!'})
    node:addChildKeywordNode(yesNode)
    node:addChildKeywordNode(noNode)
npcHandler:addModule(FocusModule:new()) 