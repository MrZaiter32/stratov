function isSorcerer(cid, promoted)
	local arr = {1, 5, 21, 29}
	if(promoted) then
		table.remove(arr, 1)
	end

	return isInArray(arr, getPlayerVocation(cid))
end

function isDruid(cid, promoted)
	local arr = {2, 6, 22, 30}
	if(promoted) then
		table.remove(arr, 1)
	end

	return isInArray(arr, getPlayerVocation(cid))
end

function isPaladin(cid, promoted)
	local arr = {3, 7, 23, 31}
	if(promoted) then
		table.remove(arr, 1)
	end

	return isInArray(arr, getPlayerVocation(cid))
end

function isKnight(cid, promoted)
	local arr = {4, 8, 24, 32}
	if(promoted) then
		table.remove(arr, 1)
	end

	return isInArray(arr, getPlayerVocation(cid))
end

function isRookie(cid, promoted)
	return not promoted and getPlayerVocation(cid) == 0
end

