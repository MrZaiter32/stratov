function potion(pos, cid)
        doPlayerSetExperienceRate(pos,expfinal)
        doPlayerSendTextMessage(pos,MESSAGE_INFO_DESCR,textofinal)
end

function sendmsg(cid)
   time = 60
   for i = 1, 6 do
      if (isCreature(cid)) then
         addEvent(doPlayerSendTextMessage, i*10*60*1000, cid, MESSAGE_STATUS_DEFAULT, "Tienes "..time - (i*10).. " minutos de experiencia extra.")      else
         break
      end
   end
end 

function onUse(cid, item, frompos, item2, topos)


   local pausa = 60*60*1000 -- (1000 = 1 segundos) tiempo del script cuanto durara
   local texto = "Tienes Exp x2 por 1 Hora, Si Logueas o te mueres pierdes la EXP x1.5."
   textofinal = "Tu Exp Potion Ha Finalizado." -- Texto que irá receber quando o efeito da potion acabar.
   local exp = 1.5 -- cuanto usted quiere que le de la exp potion de exp , ejemplo cada es suplicada x1.5.
   expfinal = 1 -- esto es para que la exp vuelva a su normalidad no mover.
 
                doRemoveItem(item.uid,1)
                doPlayerSetExperienceRate(cid,exp)
                doSendMagicEffect(frompos,30)
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,texto)
            sendmsg (cid)
                addEvent(potion,pausa,cid)

   return true
end