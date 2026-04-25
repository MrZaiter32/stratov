function onUse(cid, item, frompos, item2, topos)
if item.uid == 30032 then
  queststatus = getPlayerStorageValue(cid,30032)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"No Mueras Noob!.")
    item_uid = doPlayerAddItem(cid,2461,1)
   item_uid = doPlayerAddItem(cid,2467,1)
   item_uid = doPlayerAddItem(cid,2643,1)
   item_uid = doPlayerAddItem(cid,2649,1)
   item_uid = doPlayerAddItem(cid,2512,1)
   item_uid = doPlayerAddItem(cid,2382,1)
   item_uid = doPlayerAddItem(cid,2000,1)
   
  
   setPlayerStorageValue(cid,30032,1)

  else
   doPlayerSendTextMessage(cid,22,"Que mas quieres? Ya tienes tus cosas ,Noob!.")
  end
else
  return 0
end
return 1
end