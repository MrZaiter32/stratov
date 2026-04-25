local breakWithItem = 7428 -- Item to release the monster with.
local setActionId = 1000 -- Action id that will be set for an used item.
local breakChanse = 500 -- Break chanse. For example: if breakChanse = 500 then break chanse will be ((CurrentHp/monsterMaxHp)*monsterMaxHp)/500).
local playerLevel = 50 -- Player level needed.
local avalibleMonsters = {"mewtwo", "Zapdos", "raikou"} -- Monsters that is possible to catch. ALWAYS write the name exactly as it is written in the monster files(It does mathers).

local breakEffect = CONST_ME_POFF -- This effect will apear on the item when it breakes.
local usedEffect = CONST_ME_POFF -- This effect will apear on the item if it is used.
local successEffect = CONST_ME_MAGIC_GREEN -- This effect will apear on the monster when it's catched.

local emptyDesc = "It\'s empty." -- Description that will be set for the item when the monster is released.

local messageColor = TALKTYPE_ORANGE_1
local successMessages = {"You\'ve succefully catched the monster.", "Success!!"} -- Success messages when the creature is catched. Message randomizition system.
local failureMessages = {"You\'ve failed to catch the monster.", "The monster ran away."} -- Failure messages. Message randomizition system.
local usedMessages = {"This item is already used", "You\'ve already used this item."} -- One of these messages apears if the item is already used. Message randomizition system.
local abortMessages = {"You\'ve failed to catch the monster.", "The monster is too strong."} -- Abort messages if the monster is in the ignore list above. Message randomizition system.
local notOnGroundMessage = {"Please put the item on the ground first.", "You can\'t release the creature in your backpack."} -- These messages apears if the item is not on the ground. Message randomizition system.
local inOnInvalidGround = {"The item is on a protected zone.", "You can\'t release the monster here."} -- These messages apears if the item is on a protected zone. Message randomizition system.

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid == breakWithItem then
        if itemEx.actionid == setActionId then
            for i = 1, #avalibleMonsters do
                desc = getItemDescriptions(itemEx.uid).special
                local fromS, toS = desc:find(avalibleMonsters[i])
                if toS ~= nil then
                    if toPosition.x ~= CONTAINER_POSITION then
                        if getTilePzInfo(getThingPos(itemEx.uid)) ~= TRUE then
                            doCreateMonster(desc:sub(fromS, toS), toPosition)
                            doSetItemActionId(itemEx.uid, nil)
                            doSetItemSpecialDescription(itemEx.uid, emptyDesc)
                        else
                            sendMessage(cid, inOnInvalidGround, messageColor)
                            doSendMagicEffect(getCreaturePosition(cid), breakEffect)
                        end
                    else
                        sendMessage(cid, notOnGroundMessage, messageColor)
                        doSendMagicEffect(getCreaturePosition(cid), breakEffect)
                    end
                    break
                end
            end
            return TRUE
        end
    end
    if item.actionid > 100 then
        if item.actionid ~= setActionId then
            doSetItemActionId(item.uid, setActionId)
        end
        sendMessage(cid, usedMessages, messageColor)
        doSendMagicEffect(getCreaturePosition(cid), usedEffect)
        return TRUE
    end
    if isMonster(itemEx.uid) == TRUE then
        monsterFullHp, monsterHp = getCreatureMaxHealth(itemEx.uid), getCreatureHealth(itemEx.uid)
        formula = (monsterHp/monsterFullHp)*monsterFullHp
        chanse, bchanse = math.random(1, formula), math.floor(formula)
        if (chanse+breakChanse) >= bchanse then
            s = 0
            for i = 1, #avalibleMonsters do
                if getCreatureName(itemEx.uid) ~= avalibleMonsters[i] then
                    s = s + 1
                end
            end
            if s == #avalibleMonsters then
                sendMessage(cid, abortMessages, messageColor)
                doSendMagicEffect(getCreaturePosition(cid), breakEffect)
                return TRUE
            end
            doSetItemSpecialDescription(item.uid, "It contains a captured ".. getCreatureName(itemEx.uid) ..".")
            doSetItemActionId(item.uid, setActionId)
            doRemoveCreature(itemEx.uid)
            sendMessage(cid, successMessages, messageColor)
            doSendMagicEffect(toPosition, successEffect)
        else
            doRemoveItem(item.uid, 1)
            doSendMagicEffect(getCreaturePosition(cid), breakEffect)
            sendMessage(cid, failureMessages, messageColor)
        end
    else
        doSendMagicEffect(getCreaturePosition(cid), breakEffect)
    end
return TRUE
end

function sendMessage(cid, table, color)
    if table[1] == nil then
        return nil
    end
    messageId = math.random(1, #table)
    doCreatureSay(cid, table[messageId], color)
end