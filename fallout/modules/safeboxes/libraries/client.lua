function MODULE:transferItem(itemID)
    if not lia.item.instances[itemID] then return end
    net.Start("liaSafeboxTransfer")
    net.WriteUInt(itemID, 32)
    net.SendToServer()
end

function MODULE:exitSafebox()
    net.Start("liaSafeboxExit")
    net.SendToServer()
end

function MODULE:widthdrawMoney(panel)
    local entry = self.widthdrawEntry
    local value = tonumber(entry:GetValue()) or 0
    if self.curMoney >= value and value > 0 then
        surface.PlaySound("hgn/crussaria/items/itm_gold_up.wav")
        netstream.Start("safeboxWdMny", value)
        entry:SetValue(0)
    elseif value < 0 then
        lia.util.notify(L("safeboxInvalid"))
        entry:SetValue(0)
    elseif value == 0 then
        entry:SetValue(0)
    else
        lia.util.notify(L("safeboxNotEnough"))
        entry:SetValue(0)
    end
end

function MODULE:depositMoney(panel)
    local entry = self.depositEntry
    local value = tonumber(entry:GetValue()) or 0
    if value and value > 0 then
        if LocalPlayer():getChar():hasMoney(value) then
            surface.PlaySound("hgn/crussaria/items/itm_gold_down.wav")
            netstream.Start("safeboxDpMny", value)
            entry:SetValue(0)
        else
            lia.util.notify(L("safeboxCharMoney"))
            entry:SetValue(0)
        end
    else
        entry:SetValue(0)
        if value < 0 then lia.util.notify(L("safeboxInvalid")) end
    end
end

function MODULE:SafeboxOpen(storage, safeboxInvId, money)
    self.curMoney = money
    local PADDING = 4
    if not isnumber(safeboxInvId) then return end
    local localInv = LocalPlayer():getChar() and LocalPlayer():getChar():getInv()
    local storageInv = lia.item.inventories[safeboxInvId]
    if not localInv or not storageInv then return self:exitSafebox() end
    local localInvPanel = localInv:show()
    local storageInvPanel = storageInv:show()
    storageInvPanel:SetTitle("Safebox")
    local w, h = localInvPanel:GetSize()
    localInvPanel:SetSize(w, h + 75)
    w, h = storageInvPanel:GetSize()
    storageInvPanel:SetSize(w, h + 75)
    self.depositText = localInvPanel:Add("DLabel")
    self.depositText:Dock(BOTTOM)
    self.depositText:DockMargin(0, 0, localInvPanel:GetWide() / 2, 0)
    self.depositText:SetTextColor(color_white)
    self.depositText:SetFont("liaGenericFont")
    self.depositText:SetText(lia.currency.get(LocalPlayer():getChar():getMoney()))
    self.depositText.Think = function()
        local char = LocalPlayer():getChar()
        if char and IsValid(storage) then
            self.depositText:SetText(lia.currency.get(char:getMoney()))
        else
            localInvPanel:Close()
        end
    end

    self.depositEntry = localInvPanel:Add("DTextEntry")
    self.depositEntry:Dock(BOTTOM)
    self.depositEntry:SetNumeric(true)
    self.depositEntry:DockMargin(localInvPanel:GetWide() / 2, 0, 0, 0)
    self.depositEntry:SetValue(0)
    self.depositEntry.OnEnter = self:depositMoney()
    self.depositButton = localInvPanel:Add("DButton")
    self.depositButton:Dock(BOTTOM)
    self.depositButton:DockMargin(localInvPanel:GetWide() / 2, 40, 0, -40)
    self.depositButton:SetTextColor(Color(255, 255, 255))
    self.depositButton:SetText(L"safeboxDeposit")
    self.depositButton.DoClick = self:depositMoney()
    self.widthdrawText = storageInvPanel:Add("DLabel")
    self.widthdrawText:Dock(BOTTOM)
    self.widthdrawText:DockMargin(0, 0, storageInvPanel:GetWide() / 2, 0)
    self.widthdrawText:SetTextColor(color_white)
    self.widthdrawText:SetFont("liaGenericFont")
    self.widthdrawText:SetText(lia.currency.get(self.curMoney))
    self.widthdrawEntry = storageInvPanel:Add("DTextEntry")
    self.widthdrawEntry:Dock(BOTTOM)
    self.widthdrawEntry:SetNumeric(true)
    self.widthdrawEntry:DockMargin(storageInvPanel:GetWide() / 2, 0, 0, 0)
    self.widthdrawEntry:SetValue(self.curMoney or 0)
    self.widthdrawEntry.OnEnter = self:widthdrawMoney()
    self.widthdrawButton = storageInvPanel:Add("DButton")
    self.widthdrawButton:Dock(BOTTOM)
    self.widthdrawButton:DockMargin(storageInvPanel:GetWide() / 2, 40, 0, -40)
    self.widthdrawButton:SetTextColor(Color(255, 255, 255))
    self.widthdrawButton:SetText(L"safeboxWithdraw")
    self.widthdrawButton.DoClick = self:widthdrawMoney()
    localInvPanel:ShowCloseButton(true)
    storageInvPanel:ShowCloseButton(true)
    local extraWidth = (storageInvPanel:GetWide() + PADDING) / 2
    localInvPanel:Center()
    storageInvPanel:Center()
    localInvPanel.x = localInvPanel.x + extraWidth
    storageInvPanel:MoveLeftOf(localInvPanel, PADDING)
    local firstToRemove = true
    localInvPanel.oldOnRemove = localInvPanel.OnRemove
    storageInvPanel.oldOnRemove = storageInvPanel.OnRemove
    local function exitStorageOnRemove(panel)
        if firstToRemove then
            firstToRemove = false
            self:exitSafebox()
            local otherPanel = panel == localInvPanel and storageInvPanel or localInvPanel
            if IsValid(otherPanel) then otherPanel:Remove() end
        end

        panel:oldOnRemove()
    end

    hook.Run("OnCreateSafeboxPanel", localInvPanel, storageInvPanel, storage)
    localInvPanel.OnRemove = exitStorageOnRemove
    storageInvPanel.OnRemove = exitStorageOnRemove
end