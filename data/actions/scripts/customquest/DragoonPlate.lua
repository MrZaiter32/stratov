local c = {
	[16116] = {25, "Infernus"}
}

function onUse(cid, item, frompos, item2, topos)
local o = c[item.uid]
if item.uid == 16116 then
  queststatus = getPlayerStorageValue(cid,16068)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a Caesar's Plate and have the "..o[2].." outfit!.")
   item_uid = doPlayerAddItem(cid,16068,1)
   doPlayerAddOutfitId(cid, o[1], 0)
   setPlayerStorageValue(cid,16068,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

