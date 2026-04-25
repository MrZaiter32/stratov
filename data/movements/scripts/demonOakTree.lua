function onStepOut(cid, item, position, fromPosition)
if item.uid == 32193 then
	doTransformItem(item.uid, 2709, 0)
end
return true
end