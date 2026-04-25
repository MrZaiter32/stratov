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

-- Menu Potion individual
shopModule:addBuyableItem({'health potion'}, 7618, 40, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 45, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 90, 1, 'strong health potion')
shopModule:addBuyableItem({'strong mana'}, 7589, 70, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 180, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 110, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 200, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 230, 1, 'ultimate health potion')
shopModule:addBuyableItem({'ultimate spirit'}, 16126, 240, 1, 'ultimate spirit potion')
shopModule:addBuyableItem({'mystic mana'}, 16149, 290, 1, 'mystic mana potion')
shopModule:addBuyableItem({'mystic health'}, 16150, 290, 1, 'mystic health potion')
shopModule:addBuyableItem({'mystic strong mana'}, 16155, 330, 1, 'mystic strong mana potion')
shopModule:addBuyableItem({'mystic strong health'}, 16156, 330, 1, 'mystic strong health potion')
shopModule:addBuyableItem({'mystic mana magic'}, 16157, 480, 1, 'mystic mana magic vial')
shopModule:addBuyableItem({'mystic health magic'}, 7488, 480, 'mystic health magic vial')
-- Menu Potion Backpack
shopModule:addBuyableItemContainer({'bp hp'}, 2000, 7618, 900, 1, 'backpack of health potions')
shopModule:addBuyableItemContainer({'bp mp'}, 2001, 7620, 1000, 1, 'backpack of mana potions')
shopModule:addBuyableItemContainer({'bp shp'}, 2000, 7588, 2000, 1, 'backpack of strong health potions')
shopModule:addBuyableItemContainer({'bp smp'}, 2001, 7589, 1600, 1, 'backpack of strong mana potions')
shopModule:addBuyableItemContainer({'bp ghp'}, 2000, 7591, 3800, 1, 'backpack of great health potions')
shopModule:addBuyableItemContainer({'bp gmp'}, 2001, 7590, 2400, 1, 'backpack of great mana potions')
shopModule:addBuyableItemContainer({'bp gsp'}, 1999, 8472, 4200, 1, 'backpack of great spirit potions')
shopModule:addBuyableItemContainer({'bp uhp'}, 2000, 8473, 4800, 1, 'backpack of ultimate health potions')
shopModule:addBuyableItemContainer({'bp usp'}, 2000, 16126, 5000, 1, 'backpack of ultimate spirit potions')
shopModule:addBuyableItemContainer({'bp mmp'}, 2000, 16149, 6000, 1, 'backpack of mystic mana potions')
shopModule:addBuyableItemContainer({'bp mhp'}, 2000, 16150, 6000, 1, 'backpack of mystic health potions')
shopModule:addBuyableItemContainer({'bp msmp'}, 2000, 16155, 7000, 1, 'backpack of mystic strong mana potions')
shopModule:addBuyableItemContainer({'bp mshp'}, 2000, 16156, 7000, 1, 'backpack of mystic strong health potions')
shopModule:addBuyableItemContainer({'bp mmmv'}, 2000, 16157, 10000, 1, 'backpack of mystic mana magic vials')
shopModule:addBuyableItemContainer({'bp mhmv'}, 2000, 7488, 10000, 1, 'backpack of mystic health magic vials')
-- Menu Rune individual
shopModule:addBuyableItem({'magic wall'}, 2293, 350, 'magic wall rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 45, 'destroy field rune')
shopModule:addBuyableItem({'explosion'}, 2313, 250, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 265, 'avl rune')
shopModule:addBuyableItem({'sudden death'}, 2274, 265, 'sudden death rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 700, 'paralyze rune')
shopModule:addBuyableItem({'firebomb'}, 2305, 100, 'firebomb')
-- Menu Holy Runes individual
shopModule:addBuyableItem({'holy explosion'}, 16082, 500, 2, 'holy explosion')
shopModule:addBuyableItem({'holy sudden death'}, 16083, 500, 2, 'holy sudden death')
shopModule:addBuyableItem({'holy avalanche'}, 16096, 500, 2, 'holy avalanche')
shopModule:addBuyableItem({'holy tamesh'}, 16097, 500, 2, 'holy tamesh')
-- Menu Rune Backpack
shopModule:addBuyableItemContainer({'bp xlp'}, 2001, 2313, 5000, 4, 'backpack of explosion runes')
shopModule:addBuyableItemContainer({'bp sd'}, 5926, 2268, 5500, 3, 'backpack of sudden death runes')
shopModule:addBuyableItemContainer({'bp avl'}, 5949, 2274, 5000, 3, 'backpack of avalanche runes')

-- Menu Super Rune Backpack
shopModule:addBuyableItemContainer({'bp ssd'}, 5926, 2263, 7000, 3, 'backpack of great sd runes')
shopModule:addBuyableItemContainer({'bp sxpl'}, 2001, 2312, 7000, 3, 'backpack of great exp runes')
shopModule:addBuyableItemContainer({'bp savl'}, 5949, 2275, 7000, 3, 'backpack of great avl runes')
shopModule:addBuyableItemContainer({'bp uhxpl'}, 2001, 16082, 10000, 3, 'backpack of holy explosion')

-- Menu Wand & Rod (CipSoft)
shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of decay', 'decay'}, 2188, 5000, 'wand of decay')
shopModule:addBuyableItem({'wand of draconia', 'draconia'}, 8921, 7500, 'wand of draconia')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')
shopModule:addBuyableItem({'wand of starstorm', 'starstorm'}, 8920, 18000, 'wand of starstorm')
shopModule:addBuyableItem({'underworld rod', 'underworld'}, 8910, 22000, 'underworld rod')
shopModule:addBuyableItem({'wand of voodoo', 'voodoo'}, 8922, 22000, 'wand of voodoo')
shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'necrotic rod', 'necrotic'}, 2185, 5000, 'necrotic rod')
shopModule:addBuyableItem({'northwind rod', 'northwind'}, 8911, 7500, 'northwind rod')
shopModule:addBuyableItem({'terra rod', 'terra'}, 2181, 10000, 'terra rod')
shopModule:addBuyableItem({'hailstorm rod', 'hailstorm'}, 2183, 15000, 'hailstorm rod')
shopModule:addBuyableItem({'springsprout rod', 'springsprout'}, 8912, 18000, 'springsprout rod')
shopModule:addBuyableItem({'underworld rod', 'underworld'}, 8910, 22000, 'underworld rod')
-- Menu Wand & Rod (DarkKonia)
shopModule:addBuyableItem({'staff of earth'}, 15956, 50000, 'staff of earth')
shopModule:addBuyableItem({'staff of helo'}, 15955, 50000, 'staff of helo')
shopModule:addBuyableItem({'staff of fire'}, 15957, 50000, 'staff of fire')
shopModule:addBuyableItem({'staff of death'}, 15958, 50000, 'staff of death')
shopModule:addBuyableItem({'zolstaharath staff'}, 16102, 1000000, 'zolstaharath staff')
shopModule:addBuyableItem({'frizzaharath staff'}, 16106, 1000000, 'frizzaharath staff')
shopModule:addBuyableItem({'vinozaharath staff'}, 16105, 1000000, 'vinozaharath staff')
shopModule:addBuyableItem({'ahlazaharath staff'}, 16101, 5000000, 'ahlazaharath staff')
shopModule:addBuyableItem({'master magician staff'}, 16099, 100000000000000, 'master magician staff')
-- Extras Items Compra (DarkKonia & CipSoft)
shopModule:addBuyableItem({'master ball'}, 15982, 5000, 'master ball')
shopModule:addBuyableItem({'rocket backpack'}, 15913, 5000, 'rocket backpack')
shopModule:addBuyableItem({'frost backpack'}, 16040, 5000, 'frost backpack')
----------

shopModule:addBuyableItem({'vampiric crest'}, 9955, 2500000, 'vampiric crest')
shopModule:addBuyableItem({'star wand', 'starwand'}, 7735, 500000, 'star wand')
shopModule:addBuyableItem({'signet ring', 'signetring'}, 7697, 20000, 'signet ring')
shopModule:addBuyableItem({'terran shield', 'terranshield'}, 8909, 5000000, 'terran shield')
shopModule:addBuyableItem({'fiery shield', 'fieryshield'}, 8906, 5000000, 'fiery shield')
shopModule:addBuyableItem({'icy shield', 'icyshield'}, 8907, 5000000, 'icy shield')
shopModule:addBuyableItem({'magic lightwand'}, 2163, 400, 'magic lightwand')
----------
shopModule:addSellableItem({'wand of vortex', 'vortex'}, 2190, 50, 'wand of vortex')
shopModule:addSellableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 500, 'wand of dragonbreath')
shopModule:addSellableItem({'wand of decay', 'decay'}, 2188, 2500, 'wand of decay')
shopModule:addSellableItem({'wand of draconia', 'draconia'}, 8921, 3750, 'wand of draconia')
shopModule:addSellableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 5000, 'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno', 'inferno'},2187, 7500, 'wand of inferno')
shopModule:addSellableItem({'wand of starstorm', 'starstorm'}, 8920, 9000, 'wand of starstorm')
shopModule:addSellableItem({'wand of voodoo', 'voodoo'}, 8922, 11000, 'wand of voodoo')
shopModule:addSellableItem({'snakebite rod', 'snakebite'}, 2182, 250,'snakebite rod')
shopModule:addSellableItem({'moonlight rod', 'moonlight'}, 2186, 500,   'moonlight rod')
shopModule:addSellableItem({'necrotic rod', 'necrotic'}, 2185, 2500, 'necrotic rod')
shopModule:addSellableItem({'northwind rod', 'northwind'}, 8911, 3750, 'northwind rod')
shopModule:addSellableItem({'terra rod', 'terra'}, 2181, 5000, 'terra rod')
shopModule:addSellableItem({'hailstorm rod', 'hailstorm'}, 2183, 7500, 'hailstorm rod')
shopModule:addSellableItem({'springsprout rod', 'springsprout'}, 8912, 9000, 'springsprout rod')
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
keywordHandler:addKeyword({'menu runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell runes ({bp xlp} - backpack of explosion runes), ({bp sd} - backpack of sudden death runes), ({bp avl} - backpack of avalanche runes), ({bp ssd} - backpack of great sd runes), ({bp sxpl} - backpack of great exp runes), ({bp uhxpl} - backpack of ultimate exp runes), ({bp savl} - backpack of great avl runes).'})

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
