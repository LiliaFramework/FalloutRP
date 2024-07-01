ITEM.name = "Transform Base"
ITEM.desc = ""
ITEM.model = "models/props_c17/lampShade001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.icon = "icons/hud/caps.png"
--[[
ITEM.npc = "classname" --put the npc you want the item to transform them into here
ITEM.tscale = 1 --player scale by the end of the transformation before they get replaced by the thing
ITEM.duration = 5 --how many seconds the transformation takes
ITEM.tcolor = Color(255,255,255) --changes the color of the player to this during transformation
ITEM.tmaterial = "" --changes material to this during transformation
ITEM.sound = "" --plays a sound
--]]
ITEM.functions.use = {
    name = "Use",
    tip = "useTip",
    icon = "icon16/book.png",
    onRun = function(item)
        local client = item.player
        local char = client:getChar()
        if char and client:Alive() then lia.module.list["transform"]:transformStart(client, item) end
    end,
    onCanRun = function(item) return not IsValid(item.entity) end
}

function ITEM:preTransform(client)
end

function ITEM:postTransform(client)
end
