function onUse(cid, item, frompos, item2, topos)
   
       if doPlayerRemoveMoney(cid, 15000) == TRUE then
           doPlayerAddItem(cid,2396,1)
       else
           doPlayerSendCancel(cid, "You need 15000 gp.")
       end
   
       return 1
   end