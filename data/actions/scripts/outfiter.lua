function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 10503 and (getPlayerStorageValue(cid, 8000) == EMPTY_STORAGE) then
		doPlayerAddOutfit(cid, 803, 3)
		doPlayerAddOutfit(cid, 809, 3)
		setPlayerStorageValue(cid, 8000, 1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
  		doPlayerSendTextMessage(cid,22,"Congratulations, you have received Angelical addon!")
                doRemoveItem(item.uid, 1)
	else
		doPlayerSendCancel(cid,"You have already received this addon!.")
	end
end
