﻿CLASS.name = "BOS Mutant Enlisted"
CLASS.desc = "Mutant"
CLASS.faction = FACTION_BOS
CLASS.color = Color(15, 77, 21)
CLASS.isDefault = false
function CLASS:onSpawn(client)
    local char = client:getChar()
    client:SetMaxHealth(500 + client:getChar():getAttrib("end", 0) * 5)
    client:SetHealth(500 + client:getChar():getAttrib("end", 0) * 5)
end

CLASS_BOSMUTANTENLISTED = CLASS.index
