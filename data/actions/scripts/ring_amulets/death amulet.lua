function onUse(cid, item, frompos, item2, topos)
       if doPlayerRemoveMoney(cid, 300000) == TRUE then
           doPlayerAddItem(cid,7890,4000)
       else
           doPlayerSendCancel(cid, "You need 300000 gp.")
       end
return 1
end