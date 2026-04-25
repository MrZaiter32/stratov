local firstItems =
{
	9932
}

function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) == TRUE then
		if getPlayerStorageValue(cid, 30059) == -1 then
			for i = 1, table.maxn(firstItems) do
				doPlayerAddItem(cid, firstItems[i], 1)
			end
			if getPlayerSex(cid) == 0 then
				doPlayerAddItem(cid, 15996, 1)
			else
				doPlayerAddItem(cid, 15996, 1)
			end
			local bag = doPlayerAddItem(cid, 1998, 1)
			doAddContainerItem(bag, 16042, 1)
			doAddContainerItem(bag, 16027, 1)
			doAddContainerItem(bag, 8905, 1)
			doAddContainerItem(bag, 15961, 1)
			doAddContainerItem(bag, 15953, 1)
			doAddContainerItem(bag, 16078, 1)
			doAddContainerItem(bag, 16062, 1)
			doAddContainerItem(bag, 16100, 1)
			setPlayerStorageValue(cid, 30059, 1)
		end
	end
 	return TRUE
end