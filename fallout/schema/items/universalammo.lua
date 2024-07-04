ITEM.name = "Box of Ammunition"
ITEM.desc = "A box that contains sixty bullets.\nUse items with the gun you want loaded out."
ITEM.model = "models/Items/BoxSRounds.mdl"
ITEM.ammoAmount = 60
ITEM.category = "Ammunition"
ITEM.allowedWeapons = {"Anti-Material Rifle, .45 Handgun, 9MM Pistol, Chinese Assault Rifle"}
if CLIENT then
    function ITEM:paintOver(item, w, h)
        draw.SimpleText(item.ammoAmount, "DermaDefault", w, h - 5, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, color_black)
    end
end

ITEM.functions.use = {
    name = "Load",
    tip = "useTip",
    icon = "icon16/add.png",
    onRun = function(item)
        local client = item.player
        local weapon = client:GetActiveWeapon()
        if not IsValid(weapon) then return false end
        if not table.hasvalue(item.allowedWeapons, weapon:GetClass()) then
            client:PrintMessage(HUD_PRINTTALK, "This weapon may not be resupplied.")
            client:EmitSound("Player.DenyWeaponSelection")
            return false
        end

        client:GiveAmmo(item.ammoAmount, weapon:GetPrimaryAmmoType(), false)
        client:PrintMessage(HUD_PRINTTALK, "You picked up some ammo.")
        client:EmitSound("items/ammo_pickup.wav", 110)
        return true
    end,
    onCanRun = function(item)
        local client = item.player
        local weapon = client:GetActiveWeapon()
        if not IsValid(weapon) then return false end
        return not IsValid(item.entity)
    end
}
