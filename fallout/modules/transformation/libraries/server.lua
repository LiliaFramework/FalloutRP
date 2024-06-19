----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local MODULE = MODULE
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MODULE:transformStart(client, item)
    client.transforming = true
    local npc = item.npc
    local scale = item.tscale
    local duration = item.duration
    local color = item.tcolor
    local material = item.tmaterial
    local tempScale = client:GetModelScale()
    local tempColor = client:GetColor()
    local tempMat = client:GetMaterial()
    client:Freeze(true)
    client:SetModelScale(scale, duration)
    client:SetColor(color)
    client:SetMaterial(material)
    if item.sound then
        client:EmitSound(item.sound)
    end

    if item.preTransform then
        item:preTransform(client)
    end

    timer.Simple(
        duration,
        function()
            if IsValid(client) then
                timer.Simple(
                    1.5,
                    function()
                        if client:Alive() then
                            client.transforming = nil
                            client:Freeze(false)
                            client:SetModelScale(tempScale)
                            client:SetColor(tempColor)
                            client:SetMaterial(tempMat)
                            local entity = ents.Create(npc)
                            entity:SetPos(client:GetPos())
                            entity.transformedPlayer = client
                            entity:Spawn()
                            MODULE:npcPossess(client, entity)
                            if item.postTransform then
                                item:postTransform(client)
                            end
                        end
                    end
                )
            end
        end
    )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MODULE:transformEnd(client)
    if client and IsValid(client) then
        client:Freeze(false)
        client:Kill()
        client:Spawn()
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MODULE:npcPossess(client, entity)
    local SpawnControllerObject = ents.Create("obj_vj_npccontroller")
    SpawnControllerObject.TheController = client
    SpawnControllerObject:SetControlledNPC(entity)
    SpawnControllerObject:Spawn()
    SpawnControllerObject:StartControlling()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MODULE:OnNPCKilled(entity, attacker, inflictor)
    local client = entity.transformedPlayer
    timer.Simple(
        0,
        function()
            MODULE:transformEnd(client)
        end
    )
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------