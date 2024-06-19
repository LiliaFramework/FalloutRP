local MODULE = MODULE
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
local DEFAULT_LOCK_SOUND = "doors/default_locked.wav"
local DEFAULT_OPEN_SOUND = "items/ammocrate_open.wav"
local OPEN_TIME = 0.7
function ENT:Initialize()
	self:SetModel("models/items/ammocrate_grenade.mdl")
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self.receivers = {}
	if isfunction(self.PostInitialize) then self:PostInitialize() end
	self:PhysicsInit(SOLID_VPHYSICS)
	local physObj = self:GetPhysicsObject()
	if IsValid(physObj) then
		physObj:EnableMotion(true)
		physObj:Wake()
	end
end

function ENT:openInv(activator)
	local char = activator:getChar()
	self:ResetSequence("Close")
	timer.Create("CloseLid" .. self:EntIndex(), 2, 1, function() if IsValid(self) then self:ResetSequence("Open") end end)
	activator:setAction(L("@safeboxOpening", activator), OPEN_TIME, function()
		if activator:GetPos():Distance(self:GetPos()) > 96 then
			activator.liaSafeboxEntity = nil
			return
		end

		self.receivers[activator] = true
		local data = MODULE.charInventoryIDs[char:getID()]
		if data then
			local invID = data[1]
			local inv = lia.item.inventories[invID]
			if inv then
				inv:sync(activator)
				net.Start("liaSafeboxOpen")
				net.WriteEntity(self)
				net.WriteUInt(invID, 32)
				net.WriteFloat(data[2] or 0, 32)
				net.Send(activator)
				self:EmitSound(DEFAULT_OPEN_SOUND)
			else
				if lia.inventory and lia.inventory.loadByID then
					lia.inventory.loadByID(invID):next(function(inventory)
						if inventory then
							inventory.isSafebox = true
							MODULE:SafeboxInventorySet(inventory)
							inventory:sync(activator)
							net.Start("liaSafeboxOpen")
							net.WriteEntity(self)
							net.WriteUInt(invID, 32)
							net.WriteFloat(data[2] or 0, 32)
							net.Send(activator)
							self:EmitSound(DEFAULT_OPEN_SOUND)
						end
					end)
				end
			end
		else
			local width = 5
			local height = 3
			if lia.inventory and lia.inventory.instance then
				lia.inventory.instance("grid", {
					w = width,
					h = height
				}):next(function(inventory)
					inventory.isSafebox = true
					MODULE:SafeboxInventorySet(inventory)
					MODULE.charInventoryIDs[char:getID()] = {inventory:getID(), 0, width, height}
					MODULE:saveStorage()
					inventory:sync(activator)
					net.Start("liaSafeboxOpen")
					net.WriteEntity(self)
					net.WriteUInt(inventory:getID(), 32)
					net.WriteFloat(0, 32)
					net.Send(activator)
					self:EmitSound(DEFAULT_OPEN_SOUND)
				end, function(err) ErrorNoHalt("Unable to create safebox inventory for " .. client:Name() .. "\n" .. err .. "\n") end)
			end
		end
	end)
end

function ENT:Use(activator)
	local char = activator:getChar()
	if not char then return end
	if (activator.liaNextOpen or 0) > CurTime() then return end
	self:openInv(activator)
	activator.liaNextOpen = CurTime() + OPEN_TIME * 1.5
end