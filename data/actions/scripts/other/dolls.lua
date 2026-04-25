local book = {"Weirdo, you're a weirdo! Actually all of you are!", "Pie for breakfast, pie for lunch and pie for dinner!", "All hail the control panel!", "I own, Tibiacity owns, perfect match!", "Hug me! Feed me! Hail me!"}
local dragon = {"Fchhhhhh!", "Zchhhhhh!"}
local news = {"It's news to me.", "News, updated as infrequently as possible!", "Extra! Extra! Read all about it!", "Fresh off the press!"}
local norseman = {"Hail TibiaNordic!", "So cold..", "Run, mammoth!"}
local santa = {"Ho ho ho!", "Jingle bells, jingle bells...", "Have you been naughty?", "Have you been nice?", "Merry Christmas!", "Can you stop squeezing me now... I'm starting to feel a little sick."}
local skull = {"It's not winning that matters, but winning in style.", "Today's your lucky day. Probably.", "Do not meddle in the affairs of dragons, for you are crunchy and taste good with ketchup.", "That is one stupid question.", "You'll need more rum for that.", "Do or do not. There is no try.", "You should do something you always wanted to.", "If you walk under a ladder and it falls down on you it probably means bad luck.", "Never say 'oops'. Always say 'Ah, interesting!'", "Five steps east, fourteen steps south, two steps north and seventeen steps west!"}

function onUse(cid, item, frompos, item2, topos)
local n = math.random(1, 20)

	if item.itemid == 5791 then
		if n == 1 then
		doCreatureSay(cid,"Aaa... CHOO!", 0x13)
		doSendMagicEffect(frompos, 6)
		doTransformItem(item.uid,6566)
		doDecayItem(item.uid)
		elseif n == 2 then
		doCreatureSay(cid,"You... will.... burn!!", 0x13)
 		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -1, -1, CONST_ME_FIREATTACK)
		doTransformItem(item.uid,6566)
		doDecayItem(item.uid)
		elseif n == 3 then
		doCreatureSay(cid,"Grooaaaaar *cough*", 0x13)
		doSendMagicEffect(getPlayerPosition(cid), 2)
		doTransformItem(item.uid,6566)
		doDecayItem(item.uid)
		else
		doCreatureSay(cid, dragon[math.random(1, #dragon)], 0x13)
		doTransformItem(item.uid,6566)
		doDecayItem(item.uid)
		end
	elseif item.itemid == 8974 then
		doCreatureSay(cid,"ARE YOU PREPARED TO FACE YOUR DESTINY?", 0x13)
		doTransformItem(item.uid,8975)
		doDecayItem(item.uid)
	elseif item.itemid == 5080 then
		doCreatureSay(cid,"Hug me!", 0x13)
		doTransformItem(item.uid,6568)
		doDecayItem(item.uid)
	elseif item.itemid == 6512 then
		doCreatureSay(cid, santa[math.random(1, #santa)], 0x13)
		doTransformItem(item.uid,6567)
		doDecayItem(item.uid)
	elseif item.itemid == 8981 then
		doCreatureSay(cid, news[math.random(1, #news)], 0x13)
		doTransformItem(item.uid,9004)
		doDecayItem(item.uid)
	elseif item.itemid == 8977 then
		doCreatureSay(cid, book[math.random(1, #book)], 0x13)
		doTransformItem(item.uid,9002)
		doDecayItem(item.uid)
	elseif item.itemid == 8982 then
		doCreatureSay(cid, norseman[math.random(1, #norseman)], 0x13)
		doTransformItem(item.uid,8985)
		doDecayItem(item.uid)
	elseif item.itemid == 5669 then
		doCreatureSay(cid, skull[math.random(1, #skull)], 0x13)
		doSendMagicEffect(frompos, 13)
		doTransformItem(item.uid,5670)
		doDecayItem(item.uid)
	elseif item.itemid == 5670 then
		doPlayerSendTextMessage(cid,25,"It is not time yet.")
		doSendMagicEffect(frompos, 12)
	elseif item.itemid == 7183 then
		doTransformItem(item.uid,7184)
		doDecayItem(item.uid)
	elseif item.itemid == 9006 then
		doTransformItem(item.uid,9007)
		doDecayItem(item.uid)
		end
	return 0
end
