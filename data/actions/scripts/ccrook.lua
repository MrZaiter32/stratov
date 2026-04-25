function onUse(cid, item, frompos, item2, topos)
if item.uid == 30033 then
  queststatus = getPlayerStorageValue(cid,30033)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"JA! No te emociones, Y cuida este dinero ,Que lo nesesitaras en el viaje.")
    item_uid = doPlayerAddItem(cid,2152,100)
     
  
   setPlayerStorageValue(cid,30033,1)

  else
   doPlayerSendTextMessage(cid,22,"Creo que eres retrasado!")
  end
else
  return 0
end
return 1
end