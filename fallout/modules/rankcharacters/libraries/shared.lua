----------------------------------------------------------------------------------------------
function MODULE:GetMaxPlayerCharacter(ply)
    local rank = ply:GetUserGroup()
    local defchars = lia.config.MaxCharacters
    if not rank then return defchars end
    if self.OverrideCharLimit[rank] then return self.OverrideCharLimit[rank] end
    return defchars
end
----------------------------------------------------------------------------------------------