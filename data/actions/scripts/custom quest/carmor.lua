function onUse(cid, item, frompos, item2, topos)
   
       if doPlayerRemoveMoney(cid, 200000) == TRUE then
           doPlayerAddItem(cid,7368,100)
       else
           doPlayerSendCancel(cid, "You need 200000 gp.")
       end
   
       return 1
   end