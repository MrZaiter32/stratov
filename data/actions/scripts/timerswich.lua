--  Script made by Menfes
--	Credits to Darad for helping me with the simple idea about os.time() xD
--	100% credits to the one who made timeDiff >>Colandus<<(its little buggy when it comes to seconds
--	ex.onUse (tibian time) ->00:32 Please come back in  minutes and 30 seconds.
--	(Bug, its 0 minutes, but it still show "minutes")

function onUse(cid, item, fromPosition, itemEx, toPosition)
local waitTime = 5*60   	-- in minutes, if u want seconds, remove *60
local itemName = "a magic ball" -- don't forget the prefix "a" or "an"
local itemId = 7632 		-- the item ID :)
local storage = 123456		-- playerstorage number

--! Nabs don't configure !--
local queststatus = getPlayerStorageValue(cid,storage)
if queststatus + (waitTime) <= os.time() then
	setPlayerStorageValue(cid,storage,os.time())
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found ".. itemName ..".")
		doPlayerAddItem(cid,itemId,1)
	elseif getPlayerStorageValue(cid, storage)-os.time()+(waitTime) <= 60 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty, come back in ".. getPlayerStorageValue(cid, storage)-os.time()+(waitTime) .." seconds.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty, come back in ".. timeString(getPlayerStorageValue(cid, storage)-os.time()+(waitTime)) ..".")
	end
return true
end