function onUse(cid, item, frompos, item2, topos)
   
       if doPlayerRemoveMoney(cid, 50000) == TRUE then
           doPlayerAddItem(cid,2173,1)
       else
           doPlayerSendCancel(cid, "You need 50000 gp.")
       end
   
       return 1
   end