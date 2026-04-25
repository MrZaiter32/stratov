function onUse(cid, item, frompos, item2, topos)
if item.uid == 30031 then
  queststatus = getPlayerStorageValue(cid,30031)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Haora seras mas poderoso que los pobres.")
   item_uid = doPlayerAddItem(cid,2160,1)
   
  
   setPlayerStorageValue(cid,30031,1)

  else
   doPlayerSendTextMessage(cid,22,"Ya Tienes Tus Items No Seas Golozo.")
  end
else
  return 0
end
return 1
end
