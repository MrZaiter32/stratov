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

-- Menu Pure Energy (DarkKonia)

shopModule:addBuyableItem({'pure energy'}, 8306, 1000000, 'pure energy')
--shopModule:addBuyableItem({'stamina refill'}, 2137, 250000, 'stamina refill')
--shopModule:addBuyableItem({'Doll Addon'}, 15910, 1500000, 'Doll Addon')
--shopModule:addBuyableItem({'Holy arrow'}, 16055, 3000000, 'Holy arrow')
--shopModule:addBuyableItem({'Ranger bow'}, 16060, 3000000, 'Ranger bow')
--shopModule:addBuyableItem({'Holy Magic Sword'}, 16084, 3000000, 'Holy Magic Sword')
--shopModule:addBuyableItem({'Holy Thunder Hammer'}, 16086, 3000000, 'Holy Thunder Hammer')
--shopModule:addBuyableItem({'Holy Stonecutter Axe'}, 16085, 3000000, 'Holy Stonecutter Axe')
--shopModule:addBuyableItem({'Sacred Staff'}, 16133, 3000000, 'Sacred Staff')
--shopModule:addBuyableItem({'x2Boots of haste'}, 15960, 3000000, 'x2Boots of haste')
--shopModule:addBuyableItem({'Trato con la muerte'}, 16841, 2000000, 'Trato con la muerte')
--shopModule:addBuyableItem({'Coraza de Aquila'}, 16840, 2000000, 'Coraza de Aquila')
--shopModule:addBuyableItem({'Pantalones embrujados del Sr. Yan'}, 16839, 2000000, 'Pantalones embrujados del Sr. Yan')
--shopModule:addBuyableItem({'Calcetines de Lut'}, 16836, 2000000, 'Calcetines de Lut')
--shopModule:addBuyableItem({'Corona del primus'}, 16623, 2000000, 'Corona del primus')
--shopModule:addBuyableItem({'La capa de los Lican'}, 16911, 2000000, 'La capa de los Lican')
--shopModule:addBuyableItem({'Quijote de Akan'}, 16910, 2000000, 'Quijote de Akan')
--shopModule:addBuyableItem({'Viaje de Bryner'}, 16446, 2000000, 'Viaje de Bryner')
--shopModule:addBuyableItem({'Semblante de Gunes'}, 16770, 2000000, 'Semblante de Gunes')
--shopModule:addBuyableItem({'Dominio de Aughild'}, 16363, 2000000, 'Dominio de Aughild')
--shopModule:addBuyableItem({'Baupres del Capitan Escarlata'}, 16407, 2000000, 'Baupres del Capitan Escarlata')
--shopModule:addBuyableItem({'Danzantes de Rivera'}, 16159, 2000000, 'Danzantes de Rivera')
--shopModule:addBuyableItem({'Memoria de Cain'}, 16837, 2000000, 'Memoria de Cain')
--shopModule:addBuyableItem({'Manto de los Rydraelm'}, 16838, 2000000, 'Manto de los Rydraelm')
--shopModule:addBuyableItem({'Trato con la muerte'}, 16835, 2000000, 'Trato con la muerte')
--shopModule:addBuyableItem({'Surcadoras de flamas'}, 16391, 2000000, 'Surcadoras de flamas')

-- Menu Gems (DarkKonia)

shopModule:addSellableItem({'black pearl', 'blackpearl'}, 2144,280, 'black pearl')
shopModule:addSellableItem({'small topaz', 'smalltopaz'}, 9970,200, 'small topaz')
shopModule:addSellableItem({'small diamond', 'smalldiamond'}, 2145,300, 'small diamond')
shopModule:addSellableItem({'small sapphire', 'smallsapphire'}, 2146,250, 'small sapphire')
shopModule:addSellableItem({'small ruby', 'smallruby'}, 2147,250, 'small ruby')
shopModule:addSellableItem({'small emerald', 'smallemerald'}, 2149,250, 'small emerald')
shopModule:addSellableItem({'small amethyst', 'smallamethyst'}, 2150,200, 'small amethyst')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

