function onUse(cid, item, frompos, item2, topos)
   
       if doPlayerRemoveMoney(cid, 20000) == TRUE then
           doPlayerAddItem(cid,2399,100)
       else
           doPlayerSendCancel(cid, "You need 20000 gp.")
       end
   
       return 1
   end