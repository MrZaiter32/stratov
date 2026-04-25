function onUse(cid, item, frompos, item2, topos)
       if doPlayerRemoveMoney(cid, 100000) == TRUE then
           doPlayerAddItem(cid,2173,4000)
       else
           doPlayerSendCancel(cid, "You need 100000gp.")
       end
return 1
end