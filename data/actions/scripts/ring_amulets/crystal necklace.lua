function onUse(cid, item, frompos, item2, topos)
       if doPlayerRemoveMoney(cid, 300000) == 1 then
           doPlayerAddItem(cid,2125,4000)
       else
           doPlayerSendCancel(cid, "You need 300000 gp.")
       end
return 1
end