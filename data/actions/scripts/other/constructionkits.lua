local CONSTRUCTIONS = {
	[3901] = 1666, [3902] = 1670, [3903] = 1652, [3904] = 1674, [3905] = 1658,
	[3906] = 3813, [3907] = 3817, [3908] = 1619, [3909] = 1614, [3910] = 2105,
	[3911] = 1614, [3912] = 3806, [3913] = 3807, [3914] = 3809, [3915] = 1716,
	[3916] = 1724, [3917] = 1732, [3918] = 1775, [3919] = 1774, [3920] = 1750,
	[3921] = 3832, [3922] = 2095, [3923] = 2098, [3924] = 2064, [3925] = 2582,
	[3926] = 2117, [3927] = 1728, [3928] = 1442, [3929] = 1446, [3930] = 1447,
	[3931] = 2034, [3932] = 2604, [3933] = 2080, [3934] = 2084, [3935] = 3821,
	[3936] = 3811, [3937] = 2101, [3938] = 3812, [5086] = 5046, [5087] = 5055,
	[5088] = 5056, [6114] = 6111, [6115] = 6109, [6372] = 6356, [6373] = 6371,
	[8692] = 8688, [9974] = 9975
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(fromPosition.x == CONTAINER_POSITION) then
		doPlayerSendCancel(cid, "Put the construction kit on the floor first.")
	elseif(not getTileInfo(fromPosition).house) then
		doPlayerSendCancel(cid,"You may construct this only inside a house.")
	elseif(CONSTRUCTIONS[item.itemid] ~= nil) then
		doTransformItem(item.uid, CONSTRUCTIONS[item.itemid])
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	else
		return false
	end

	return true
end
