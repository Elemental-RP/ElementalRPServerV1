ERP.TiresReplacement = {}
local ERPTR = ERP.TiresReplacement
ERPTR.ESX = ERP.ESX


function ERPTR:Start()
	if not self then return; end
	while not ESX do Citizen.Wait(100); end
	self.ESX = ESX
	while not ESX.IsPlayerLoaded() do Citizen.Wait(100); end
	print("ERP_TiresReplacement:Start() - Successful")
	self.Started = 1
end

local propModel, propSpawned = nil, nil

function ERPTR:deleteProp()
	DetachEntity(propSpawned, 1, 1)
	DeleteObject(propSpawned)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
	propSpawned = nil
end

function ERPTR:GetClosestVehicleTire(vehicle)
	local tireBones = { "wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", 
		"wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"
	}
	local tireIndex = { ["wheel_lf"] = 0, ["wheel_rf"] = 1, ["wheel_lm1"] = 2, ["wheel_rm1"] = 3, ["wheel_lm2"] = 45, ["wheel_rm2"] = 47,
		["wheel_lm3"] = 46, ["wheel_rm3"] = 48, ["wheel_lr"] = 4, ["wheel_rr"] = 5,
	}
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local minDistance = 1.0
	local closestTire = nil
	
	for a = 1, #tireBones do
		local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tireBones[a]))
		local distance = Vdist(plyPos.x, plyPos.y, plyPos.z, bonePos.x, bonePos.y, bonePos.z)

		if closestTire == nil then 
			if distance <= minDistance then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		else
			if distance < closestTire.boneDist then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		end
	end return closestTire
end

function ERPTR:loadAnimDict(dict) while (not HasAnimDictLoaded(dict)) do RequestAnimDict(dict) Citizen.Wait(5) end end
function ERPTR:Draw3DText(x, y, z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.75*scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end


RegisterNetEvent('ERPTR:Use')
AddEventHandler('ERPTR:Use', function()
	local ad = "anim@heists@box_carry@"
	ERPTR:loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	propModel = 'prop_wheel_tyre'
	propSpawned = CreateObject(GetHashKey(propModel), x, y, z + 0.2, true, true, true)
	AttachEntityToEntity(propSpawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.10, 0.26, 0.32, 90.0, 110.0, 0.0, true, true, false, true, 1, true)
	Citizen.Wait(10000)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if propSpawned then
			if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
				local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
				ERPTR:Draw3DText(x, y, z, "~r~[G] ~w~Cancelar")
				local vehicle = ESX.Game.GetClosestVehicle()
				if vehicle ~= nil then
					local tire = ERPTR:GetClosestVehicleTire(vehicle)
					if tire ~= nil then
						ERPTR:Draw3DText(tire.bonePos.x, tire.bonePos.y, tire.bonePos.z, "~g~[E] ~w~Substituir Roda")

						if IsControlJustPressed(0, ERPUtils.Keys["E"]) then
							ClearPedSecondaryTask(PlayerPedId())
							TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant', 0, false)
							FreezeEntityPosition(PlayerPedId(), true)
							exports["erp-progbar"]:StartDelayedFunction("A meter pneu", 5000, function()
							end)
							Citizen.Wait(5000)
							SetVehicleTyreFixed(vehicle, tire.tireIndex, 0, 1)
							TriggerServerEvent('ERPTR:Used')
							ERPTR:deleteProp()
						end
					end
				end
				
				if IsControlJustPressed(0, ERPUtils.Keys["H"]) then
					ERPTR:deleteProp()
				end
			end
		end
	end
end)

RegisterCommand('rtires', function() ERPTR:deleteProp() end)
Citizen.CreateThread(function(...) ERPTR:Start(...); end)
