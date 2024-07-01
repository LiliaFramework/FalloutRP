local MODULE = MODULE
MODULE.charInventoryIDs = MODULE.charInventoryIDs or {}
function MODULE:saveStorage()
    local data = {}
    for _, entity in ipairs(ents.FindByClass("safebox")) do
        data[#data + 1] = {entity:GetPos(), entity:GetAngles(),}
    end

    self:setData({self.charInventoryIDs, data})
end

function MODULE:SaveData()
    self:saveStorage()
end

function MODULE:StorageItemRemoved(entity, inventory)
    self:saveStorage()
end

function MODULE:LoadData()
    local gData = self:getData() or {{}, {}}
    self.charInventoryIDs = gData[1] or {}
    local data = gData[2] or {}
    for _, info in ipairs(data) do
        local position, angles = unpack(info)
        local storage = ents.Create("safebox")
        storage:SetPos(position)
        storage:SetAngles(angles)
        storage:Spawn()
        storage:SetSolid(SOLID_VPHYSICS)
        storage:PhysicsInit(SOLID_VPHYSICS)
        local physObject = storage:GetPhysicsObject()
        if physObject then physObject:EnableMotion() end
    end

    self.loadedData = true
end

function MODULE:OnCharacterDelete(client, id)
    local data = self.charInventoryIDs[id]
    if not data then return end
    local invId = data[1]
    lia.inventory.deleteByID(invId)
    self.charInventoryIDs[id] = nil
end

function MODULE:WidthdrawMoney(client, corpse, amount)
    local data = self.charInventoryIDs[client:getChar():getID()]
    if not data then return end
    local oldMoney = data[2]
    if amount <= oldMoney then
        self.charInventoryIDs[client:getChar():getID()][2] = oldMoney - amount
        netstream.Start(client, "safeboxMoney", self.charInventoryIDs[client:getChar():getID()][2])
        client:getChar():giveMoney(amount)
    end
end

function MODULE:DepositMoney(client, corpse, amount)
    local data = self.charInventoryIDs[client:getChar():getID()]
    if not data then return end
    local oldMoney = data[2]
    local oldCharMoney = client:getChar():getMoney()
    if amount <= oldCharMoney then
        self.charInventoryIDs[client:getChar():getID()][2] = oldMoney + amount
        netstream.Start(client, "safeboxMoney", self.charInventoryIDs[client:getChar():getID()][2])
        client:getChar():takeMoney(amount)
    end
end

local PROHIBITED_ACTIONS = {
    ["Equip"] = true,
    ["EquipUn"] = true,
}

function MODULE:CanPlayerInteractItem(client, action, itemObject, data)
    local inventory = lia.item.inventories[itemObject.invID]
    if inventory and inventory.isSafebox == true and PROHIBITED_ACTIONS[action] then return false, "forbiddenActionStorage" end
end

local MAX_ACTION_DISTANCE = 128
local RULES = {
    AccessIfStorageReceiver = function(inventory, action, context)
        local client = context.client
        if not IsValid(client) then return end
        local char = client:getChar()
        if not char then return end
        local safeboxData = MODULE.charInventoryIDs[char:getID()]
        if not safeboxData then return end
        local safeboxInvID = safeboxData[1]
        local storageInv = lia.item.inventories[safeboxInvID]
        local storage = context.safebox or client.liaSafeboxEntity
        if not IsValid(storage) then return end
        if storageInv ~= inventory then return end
        local distance = storage:GetPos():Distance(client:GetPos())
        if distance > MAX_ACTION_DISTANCE then return false end
        if storage.receivers[client] then return true end
    end
}

function MODULE:SafeboxInventorySet(inventory)
    inventory:addAccessRule(RULES.AccessIfStorageReceiver)
end
return RULES
