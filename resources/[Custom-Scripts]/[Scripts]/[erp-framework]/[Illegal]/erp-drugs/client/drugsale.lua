ESX = nil

local streetName
local _
local playerGender

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
	TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)
end)

local oPlayer = false
local InVehicle = false
local playerpos = false
local canSellDrugs = false

Citizen.CreateThread(function()
    while(true) do
		oPlayer = GetPlayerPed(-1)
        InVehicle = IsPedInAnyVehicle(oPlayer, true)
		playerpos = GetEntityCoords(oPlayer)
        Citizen.Wait(500)
    end
end)

RequestAnimDict("mp_common")
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local handle, ped = FindFirstPed()
		local success
		repeat
			success, ped = FindNextPed(handle)
			local pos = GetEntityCoords(ped)
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerpos.x, playerpos.y, playerpos.z, true)
			if distance < 2 and CanSellToPed(ped) and canSellDrugs then
				if canSellDrugs and not InVehicle then
					ESX.ShowHelpNotification("Pressiona ~g~ ~INPUT_VEH_HEADLIGHT~ ~s~ para vender ~r~drogas~s~")
					if IsControlJustPressed(1,74) then
						local chance = math.random(1,2)
						oldped = ped
						TaskStandStill(ped,5000.0)
						SetEntityAsMissionEntity(ped)
						FreezeEntityPosition(ped,true)
						FreezeEntityPosition(oPlayer,true)
						SetEntityHeading(ped,GetHeadingFromVector_2d(pos.x-playerpos.x,pos.y-playerpos.y)+180)
						SetEntityHeading(oPlayer,GetHeadingFromVector_2d(pos.x-playerpos.x,pos.y-playerpos.y))
						exports["erp-progbar"]:StartDelayedFunction("A vender drogas...", 5000, function()
						end)
						Citizen.Wait(5000)
						if chance == 1 then
							TaskPlayAnim(oPlayer, "mp_common", "givetake2_a", 8.0, 8.0, 2000, 0, 1, 0,0,0)
							TaskPlayAnim(ped, "mp_common", "givetake2_a", 8.0, 8.0, 2000, 0, 1, 0,0,0)
							TriggerServerEvent("erp-drugs:sellDrugs")
						else
							chance = math.random(1,2)
							if chance == 1 then
								TriggerServerEvent('esx_outlawalert:drugsaleInProgress',pos,streetName)
								ESX.ShowNotification("Esta pessoa ~r~rejeitou~s~ a tua oferta")
								exports['mythic_notify']:SendAlert('inform', 'Esta pessoa rejeitou a tua oferta')
							else
								exports['mythic_notify']:SendAlert('inform', 'Esta pessoa rejeitou a tua oferta')
							end
						end
						SetPedAsNoLongerNeeded(oldped)
						FreezeEntityPosition(ped,false)
						FreezeEntityPosition(oPlayer,false)
						Citizen.Wait(10000)
						break
					end
				end
			end
		until not success
		EndFindPed(handle)
	end
end)

Citizen.CreateThread(function()
	while true do
		TriggerServerEvent("erp-drugs:canSellDrugs")
		Citizen.Wait(10000)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		streetName,_ = GetStreetNameAtCoord(playerpos.x, playerpos.y, playerpos.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)

function CanSellToPed(ped)
	if not IsPedAPlayer(ped) and not IsPedInAnyVehicle(ped,false) and not IsEntityDead(ped) and IsPedHuman(ped) and GetEntityModel(ped) ~= GetHashKey("s_m_y_cop_01") and GetEntityModel(ped) ~= GetHashKey("s_m_y_dealer_01") and GetEntityModel(ped) ~= GetHashKey("mp_m_shopkeep_01") and ped ~= oldped and canSellDrugs then 
		return true
	end
	return false
end

RegisterNetEvent("erp-drugs:canSellDrugs")
AddEventHandler("erp-drugs:canSellDrugs", function(soldAmount)
	canSellDrugs = soldAmount
end)