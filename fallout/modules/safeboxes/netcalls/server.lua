util.AddNetworkString("liaSafeboxOpen")
util.AddNetworkString("liaSafeboxExit")
util.AddNetworkString("liaSafeboxTransfer")
net.Receive("liaSafeboxExit", function(_, client)
    local storage = client.liaSafeboxEntity
    if IsValid(storage) then storage.receivers[client] = nil end
    client.liaSafeboxEntity = nil
end)

netstream.Hook("safeboxDpMny", function(client, amount)
    if not isnumber(amount) then return end
    if not IsValid(client) then return end
    if not client:getChar() then return end
    local clientSafebox = client.liaSafeboxEntity
    if not IsValid(clientSafebox) then return end
    local distance = clientSafebox:GetPos():Distance(client:GetPos())
    if distance > 128 then return false end
    MODULE:DepositMoney(client, clientSafebox, amount)
end)

netstream.Hook("safeboxWdMny", function(client, amount)
    if not isnumber(amount) then return end
    if not IsValid(client) then return end
    if not client:getChar() then return end
    local clientSafebox = client.liaSafeboxEntity
    if not IsValid(clientSafebox) then return end
    local distance = clientSafebox:GetPos():Distance(client:GetPos())
    if distance > 128 then return false end
    MODULE:WidthdrawMoney(client, clientSafebox, amount)
end)
