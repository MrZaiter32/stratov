local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- Inicial Data

-- Menu Itemes de vocacion

shopModule:addSellableItem({'underworld rod', 'underworld'}, 8910, 11000, 'underworld rod')
shopModule:addSellableItem({'energy soil', 'energysoil'}, 8303, 30000, 'energy soil')
shopModule:addSellableItem({'gold ingot', 'goldingot'}, 9971, 200000, 'gold ingot')
shopModule:addSellableItem({'glob of acid slime', 'globofacidslime'}, 9967, 1000, 'glob of acid slime')
shopModule:addSellableItem({'glob of tar', 'globoftar'}, 9968, 1000, 'glob of tar')
shopModule:addSellableItem({'crystal of balance', 'crystalofbalance'}, 9942, 15000, 'crystal of balance')
shopModule:addSellableItem({'crystal ring', 'crystalring'}, 2124, 2000, 'crystal ring')
shopModule:addSellableItem({'hibiscus dress', 'hibiscusdress'}, 8873, 5000, 'hibiscus dress')
shopModule:addSellableItem({'nails', 'nails'}, 8309, 100, 'nails')
---- Final Data

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. Will you help me? If you do, I sell runes, potions and wands-rods! Just say ({menu potions} - {menu runes} - {menu super runes} - {menu mystic potions}). And say {trade} and see what I am selling.")
keywordHandler:addKeyword({'menu potions'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell potions ({bp hp} - backpack of health potions), ({bp mp} - backpack of mana potions), ({bp shp} - backpack of strong health potions), ({bp smp} - backpack of strong mana potions), ({bp ghp} - backpack of great health potions), ({bp gmp} - backpack of great mana potions), ({bp gsp} - backpack of great spirit potions), ({bp uhp} - backpack of ultimate health potions), ({bp usp} - backpack of ultimate spirit potions).'})
keywordHandler:addKeyword({'menu mystic potions'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell potions ({bp mmp} - backpack of mystic mana potion), ({bp mhp} - backpack of mystic health potions), ({bp mshp} - backpack of mystic strong health potions), ({bp msmp} - backpack of mystic strong mana potions), ({bp mmmv} - backpack of mystic mana magic vials), ({bp mhmv} - backpack of mystic health magic vials).'})
keywordHandler:addKeyword({'menu runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell runes ({bp xlp} - backpack of explosion runes), ({bp sd} - backpack of sudden death runes), ({bp avl} - backpack of avalanche runes), ({bp ssd} - backpack of great sd runes), ({bp sxpl} - backpack of great exp runes), ({bp savl} - backpack of great avl runes).'})

local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}

	if(msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand')) then
		if(isSorcerer(cid) or isDruid(cid)) then
			if(getPlayerStorageValue(cid, 30002) <= 0) then
				selfSay('So you ask me for a {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '} to begin your advanture?', cid)
				talkState[talkUser] = 1
			else
				selfSay('What? I have already gave you one {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			doPlayerAddItem(cid, items[getPlayerVocation(cid)], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			setPlayerStorageValue(cid, 30002, 1)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())