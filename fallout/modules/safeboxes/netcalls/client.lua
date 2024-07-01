net.Receive("liaSafeboxOpen", function()
    local entity = net.ReadEntity()
    local safeboxInvID = net.ReadUInt(32)
    local money = net.ReadFloat()
    hook.Run("SafeboxOpen", entity, safeboxInvID, money)
end)

netstream.Hook("safeboxMoney", function(value)
    MODULE.curMoney = value
    if IsValid(MODULE.widthdrawText) then MODULE.widthdrawText:SetText(lia.currency.get(value)) end
end)
