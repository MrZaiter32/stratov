-- Padre Marcelo ver 2.0  (by Conde Sapo)
 
local focus1 = 0
local focus2 = 0
local talk_start = 0
local target = 0 
local following = false 
local attacking = false 
local talkstate = 0
 
cidade = "SpiderBay"  ---  Colocar aqui o nome da cidade que estah o PADRE
dia = os.date("%d")
mes = os.date("%m")
ano = os.date("%Y")
 
mesesChr = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
mesBR = mesesChr[mes*1]
 
Sex1 = 0
Sex2 = 0
 
function onThingMove(creature, thing, oldpos, oldstackpos)
end
 
function onCreatureAppear(creature)
end
 
function onCreatureDisappear(id, stackpos)
    if id == focus1 or id == focus2 then
        if id == focus1 then
            if Sex1 == 1 then
                ceremonyend('O noivo fugiu.')
            else
                ceremonyend('A noiva fugiu.')
            end
        else
            if Sex2 == 1 then
                ceremonyend('O noivo fugiu.')
            else
                ceremonyend('A noiva fugiu.')
            end
        end
    end
end
 
function onCreatureTurn(creature)
end
 
function msgcontains(txt, str)
    return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end
 
function ceremonyend(msg)
    focus1 = 0
    focus2 = 0
    talk_start = 0
    talkstate = 0
    selfSay(msg)
end
 
function onCreatureSay(cid, type, msg)
    msg = string.lower(msg)
    if talkstate == 1 then
        if cid == focus2 then
            if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
                talkstate=2
                doNpcSetCreatureFocus(focus1)
                selfSay('E você ' .. creatureGetName(focus1) .. '! Posso começar a cerimônia?')
            else
                ceremonyend('Volte quando estiver pront' .. Art2 .. '.')
            end
        end
    elseif talkstate == 2 then
        if cid == focus1 then
            if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
                talkstate=3
            else
                ceremonyend('Volte quando estiver pront' .. Art1 .. '.')
            end
        end
    elseif talkstate == 9 then
        if cid == focus1 then
            if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
                talkstate=10
            else
                ceremonyend('Volte quando estiver pront' .. Art1 .. '.')
            end
        end
    elseif talkstate == 11 then
        if cid == focus2 then
            if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
                talkstate=12
            else
                ceremonyend('Volte quando estiver pront' .. Art2 .. '.')
            end
        end
    end    
    if msgcontains(msg, 'hi') and focus1 == 0 and getDistanceToCreature(cid) < 4 then
        -- Pessoa 1 no casamento
        doNpcSetCreatureFocus(cid)
        focus1 = cid
        talk_start = os.clock()
        Casado = getPlayerStorageValue(cid,2424)
        Sex1 = getPlayerSex(cid)
        if Sex1 == 1 then
            Art1 = "o"
            Art2 = "a"
        else
            Art1 = "a"
            Art2 = "o"
        end
        if Casado == -1 then
            selfSay('Oi, ' .. creatureGetName(cid) .. '! Eu sou um Padre, e posso te casar. Onde está '..Art2..' noiv'..Art2..'?!?')
        else
            selfSay('Você já é casad' .. Art1 .. '.')
            talkstate = 0
        end
    end
    if msgcontains(msg, 'hi') and focus1 > 0 and focus2 == 0 and not(cid==focus1) and getDistanceToCreature(cid) < 4 then
        -- Pessoa 2 no casamento
        doNpcSetCreatureFocus(cid)
        Casado = getPlayerStorageValue(cid,2424)
        Sex2 = getPlayerSex(cid)
        if Sex2 == 1 then
            Art2 = "o"
        else
            Art2 = "a"
        end
        if Casado == -1 then
            if Sex1 == Sex2 then
                selfSay('Casamento homosexual ainda nao é permitido nesta paróquia.')
            else
                selfSay('Olá, ' .. creatureGetName(cid) .. '! Chegou '..Art2..'noiv'..Art2..'. Podemos começar?!?')
                focus2 = cid
                talk_start = os.clock()
                talkstate=1
            end
        else
            selfSay('Você já é casad' .. Art2 .. '.')
            talkstate = 0
        end
    end
    if msgcontains(msg, 'casar') and (focus1 == cid or focus2 == cid) then
        selfSay('Casamento é uma cerimônia sagrada.   Oque Deus une, o homem não separa.')
        talk_start = os.clock()
    end
    if msgcontains(msg, 'divorcio') and (focus1 == cid or focus2 == cid) then
        setPlayerStorageValue(cid,2424,-1)
        ceremonyend('OK...  Considere-se divorciad'..Art1..'.')
    end
    if string.find(msg, '(%a*)bye(%a*)') and (focus1 == cid or focus2 == cid) and getDistanceToCreature(cid) < 6 then
        ceremonyend('Vai com DEUS, ' .. creatureGetName(cid) .. '!')
    end
end
 
function onCreatureChangeOutfit(creature)
end
 
function onThink() 
    if focus1 ~= 0 then
        -- Olha pro focus1
        doNpcSetCreatureFocus(focus1)
    elseif focus2 ~= 0 then
        -- Olha pro focus2
        doNpcSetCreatureFocus(focus2)
    else
        -- Fala uma fraze
        rand = math.random(1, 400)
        if rand == 1 then
            selfSay('Hic.')
        elseif rand == 2 then
            selfSay('AMÉM !')
        elseif rand == 3 then
            selfSay('Aleluia irmãos...')
        elseif rand == 4 then
            selfSay('Pode entrar...')
        elseif rand == 5 then
            selfSay('Domingo agora vai ter sermão.')
        end
    end
    if talkstate==3 and (os.clock() - talk_start) > 10 then
        selfSay('Estamos aqui reunidos na presença de Deus para unir essas duas pessoas,')
        talk_start = os.clock()
        talkstate=4
    elseif talkstate==4 and (os.clock() - talk_start) > 6 then
        selfSay('nos sagrados votos do matrimônio.');
        talk_start = os.clock()
        talkstate=5
    elseif talkstate==5 and (os.clock() - talk_start) > 6 then
        selfSay('Se tiver alguem presente que conheça um motivo para evitar esse casamento,')
        talk_start = os.clock()
        talkstate=6
    elseif talkstate==6 and (os.clock() - talk_start) > 8 then
        selfSay('que fale agora ou cale-se para sempre!');
        talk_start = os.clock()
        talkstate=61
    elseif talkstate==61 and (os.clock() - talk_start) > 6 then
        P1pos = getPlayerPosition(focus1)
        P2pos = getPlayerPosition(focus2)
        AtchinPos = {x=P1pos.x, y=P1pos.y+4, z=P1pos.z}
        CofPos = {x=P2pos.x-2, y=P2pos.y, z=P2pos.z}
        doSendAnimatedText(AtchinPos,"Atchin",5)
        doSendAnimatedText(CofPos,"Cof Cof",33)
        talkstate=62
    elseif talkstate==62 and (os.clock() - talk_start) > 6 then
        AtchinPos = {x=P2pos.x+2, y=P1pos.y-1, z=P1pos.z}
        CofPos = {x=P2pos.x-1, y=P2pos.y+4, z=P2pos.z}
        doSendAnimatedText(AtchinPos,"Criii Criii",71)
        doSendAnimatedText(CofPos,"Psiuuu!",152)
        talkstate=7
    elseif talkstate==7 and (os.clock() - talk_start) > 6 then
        selfSay('Comecemos então a cerimônia.');
        talk_start = os.clock()
        talkstate=8
    elseif talkstate==8 and (os.clock() - talk_start) > 6 then
        if Sex1 == 1 then
            Parc = "sua legitima esposa"
        else
            Parc = "seu legitimo marido"
        end
 
        doNpcSetCreatureFocus(focus1)
        selfSay('Você ' .. creatureGetName(focus1) .. ' aceita ' .. creatureGetName(focus2) .. ' como ' .. Parc .. '?')
        talk_start = os.clock()
        talkstate=9
    elseif talkstate==10 and (os.clock() - talk_start) > 6 then
        if Sex2 == 1 then
            Parc = "sua legitima esposa"
        else
            Parc = "seu legitimo marido"
        end
 
        doNpcSetCreatureFocus(focus2)
        selfSay('Você ' .. creatureGetName(focus2) .. ' aceita ' .. creatureGetName(focus1) .. ' como ' .. Parc .. '?')
        talk_start = os.clock()
        talkstate=11
    elseif talkstate==12 and (os.clock() - talk_start) > 6 then
 
        ----  No anel DELE o nome DELA  (e vice-versa)
 
        TextoCasorio = 'FÓRUM TIBIANO DE NOTAS E OFICIOS\n\nCertidão de Casamento\n-----------------\n\nEste Documento comprova o amor puro e verdadeiro entre \n' .. getPlayerName(focus1) .. ' e ' .. getPlayerName(focus2) .. '.\n\nCerimônia realizada por Padre Marcelo.\nTestemunhas presentes confirmam o enlace.\n\n'..cidade..', '..dia..' de '..mesBR..' de '..ano
 
        anel1 = doPlayerAddItem(focus1,2121,1)
        doSetItemSpecialDescription(anel1,getPlayerName(focus2) .. ' - ' .. os.date("%d/%m/%y"))
        certif1 = doPlayerAddItem(focus1,1953,1)
        doSetItemText(certif1,TextoCasorio)
 
        anel2 = doPlayerAddItem(focus2,2121,1)
        doSetItemSpecialDescription(anel2,getPlayerName(focus1) .. ' - ' .. os.date("%d/%m/%y"))
        certif2 = doPlayerAddItem(focus2,1953,1)
        doSetItemText(certif2,TextoCasorio)
 
        setPlayerStorageValue(focus1,2424,1)
        setPlayerStorageValue(focus2,2424,1)
        ceremonyend('Eu vos declaro Marido e Mulher.  Pode beijar a noiva.')
        talk_start = os.clock()
        talkstate=0
    end
    if (os.clock() - talk_start) > 100 then
        if focus1 > 0 or focus2 > 0 then
            ceremonyend('Cerimônia interrompida por indecisão.')
        end
    end
end