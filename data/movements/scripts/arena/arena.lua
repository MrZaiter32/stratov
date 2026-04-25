function onStepIn(cid, item, pos)

star = {x=1066, y=689, z=9, stackpos=1}

		if item.actionid == 39900 then
		doSummonCreature("Brain deaths",star)
		doPlayerSendTextMessage(cid,22,"Fight")
		else
		doPlayerSendCancel(cid,"Sorry, not possible.")	
		end

return 1
end