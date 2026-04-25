function onStepIn(cid, item, position, fromPosition)
local blockingTreePosition = {x=478, y=1419, z=7}
local firstTree = doCreateItem(2709, 1, blockingTreePosition)
	if(item.itemid == 103) then
		doSetItemActionId(firstTree, 7788)
	end
return true
end