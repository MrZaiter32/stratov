function onCombat(cid, target)
local config = {   --configuração
chance = 10,        -- chance de dar furious attack (em porcentagem)
duracao = 1 * 1000, -- duração do furious attack (editar somente o primeiro numero, o 1 no caso)
storage = 1314 -- storage para não dar um furious attack enquanto já estiver acontecendo.
}

         if isKnight(cid) then    -- aqui voce coloca a voc que quer que use o attack (isKnight, isSorcerer, isPaladin ou isDruid)
local chance = math.random(0,100)
local pos = getCreaturePosition(cid)
function stop()
         doPlayerSetExtraAttackSpeed(cid,0)
         doSendMagicEffect(pos, 30)
         setPlayerStorageValue(cid, config.storage, 0)
         return true
end

             if chance <= config.chance then
                       if (getPlayerStorageValue(cid,config.storage) <= 0) then
                        doPlayerSetExtraAttackSpeed(cid, 2000)
                        doSendAnimatedText(pos, "Take This", 20)
                        setPlayerStorageValue(cid, config.storage, 1)
                        addEvent(stop, config.duracao)
                        doSendMagicEffect(pos, 29)
                       end
                end
             end
return true
end