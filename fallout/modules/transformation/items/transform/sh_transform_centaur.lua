ITEM.name = "Centaur Strain"
ITEM.desc = "A strain of F.E.V. that will transform the user into a Centar"
ITEM.model = "models/mosi/fallout4/props/aid/mysteriousserum.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "SPECIAL"
ITEM.npc = "npc_centaur" --put the npc you want the item to transform them into here
ITEM.tscale = 0.8 --player scale by the end of the transformation before they get replaced by the thing
ITEM.duration = 10 --how many seconds the transformation takes
ITEM.tcolor = Color(255, 165, 0) --changes the color of the player to this during transformation
ITEM.tmaterial = "models/flesh" --changes material to this during transformation
ITEM.sound = "" --plays a sound
function ITEM:preTransform(client)
    local effectData = EffectData()
    effectData:SetOrigin(client:GetPos() + client:GetUp() * 2)
    effectData:SetScale(5)
    for i = 0, 10 do
        timer.Simple(i, function()
            util.Effect("VortDispel", effectData)
            client:EmitSound("ambient/machines/thumper_hit.wav", 100, 50)
        end)
    end
end

function ITEM:postTransform(client)
end
