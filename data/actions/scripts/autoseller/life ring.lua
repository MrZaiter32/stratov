function onUse(cid, item, frompos, item2, topos)
   
       if doPlayerRemoveMoney(cid, 5000) == TRUE then
           doPlayerAddItem(cid,2168,1)
       else
           doPlayerSendCancel(cid, "You need 5000 gp.")
       end
   
       return 1
   end