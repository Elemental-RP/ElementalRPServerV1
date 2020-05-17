ESX = nil
local PlayerData = nil
local CurrentEventNum = nil
local StopMission = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end
	PlayerData = ESX.GetPlayerData()
	
end)

RegisterNetEvent("erp-drugs:startMission")
AddEventHandler("erp-drugs:startMission",function(spot,type)
	local num = math.random(1,#Config.MissionPosition)
	local numy = 0
	while Config.MissionPosition[num].InUse and numy < 100 do
		numy = numy+1
		num = math.random(1,#Config.MissionPosition)
	end
	if numy == 100 then
		exports['mythic_notify']:SendAlert('inform', 'Nenhuma missão disponível, tenta mais tarde')
	else
		CurrentEventNum = num
		TriggerEvent("erp-drugs:startTheEvent",num,type)
		exports['mythic_notify']:SendAlert('inform', 'Segue a localização no teu mapa e rouba '..type)
	end
	
end)

RegisterNetEvent("erp-drugs:startTheEvent")
AddEventHandler("erp-drugs:startTheEvent",function(num,typey)
	RequestModel(-459818001)
	while not HasModelLoaded(-459818001) do
		Citizen.Wait(100)
	end
	-- Makes the job unavailable for everyone
	local loc = Config.MissionPosition[num]
	local typed = typey
	Config.MissionPosition[num].InUse = true
	local playerped = GetPlayerPed(-1)
	TriggerServerEvent("erp-drugs:syncMissionData",Config.MissionPosition)
	local taken = false
	local blip = CreateMissionBlip(loc.Location)
	AddRelationshipGroup('DrugsNPC')
	AddRelationshipGroup('PlayerPed')
	for k,v in pairs(loc.GoonSpawns) do
		pedy = CreatePed(7,-459818001,v.x,v.y,v.z,0,true,true)
		SetPedRelationshipGroupHash(pedy, 'DrugsNPC')
		GiveWeaponToPed(pedy,GetHashKey("WEAPON_PISTOL"),100,false,false)
		SetPedDropsWeaponsWhenDead(pedy, false)
		SetPedFleeAttributes(pedy, 0, false)
	end
	SetRelationshipBetweenGroups(5,GetPedRelationshipGroupDefaultHash(playerped),'DrugsNPC')
	SetRelationshipBetweenGroups(5,'DrugsNPC',GetPedRelationshipGroupDefaultHash(playerped))
	TaskCombatPed(pedy,playerped, 0, 16)
	while not taken and not StopMission do
		Citizen.Wait(10)
		
		if GetDistanceBetweenCoords(loc.Location, GetEntityCoords(GetPlayerPed(-1))) < 2.5 then
			ESX.Game.Utils.DrawText3D(loc.Location,"Pressiona ~g~[E]~s~ para roubar as ~y~drogas~s~",1,0)
			if IsControlJustPressed(1,38) then					
					exports["erp-progbar"]:StartDelayedFunction("A roubar drogas...", 15000, function()
					end)
					Citizen.Wait(15000)
				if GetDistanceBetweenCoords(loc.Location, GetEntityCoords(GetPlayerPed(-1))) < 2.5 then
					exports['mythic_notify']:SendAlert('sucess', 'Missão Completa: Tu roubaste as drogas com sucesso')
					TriggerServerEvent("erp-drugs:reward",(Config.Reward[typed]),typed)
					RemoveBlip(blip)
					Config.MissionPosition[num].InUse = false
					TriggerServerEvent("erp-drugs:syncMissionData",Config.MissionPosition)	
					taken = true
					break
				else
					exports['mythic_notify']:SendAlert('error', 'Missão Falhada: Afastaste demasiado das drogas')
					RemoveBlip(blip)
					Config.MissionPosition[num].InUse = false
					TriggerServerEvent("erp-drugs:syncMissionData",Config.MissionPosition)
					taken = true
					break
				end
			end
		end
		
		if StopMission == true then
			exports['mythic_notify']:SendAlert('sucess', 'Missão Falhada: Tu morreste')
			Config.MissionPosition[num].InUse = false
		end
		
	end
	RemoveBlip(blip)
	Config.MissionPosition[num].InUse = false
	TriggerServerEvent("erp-drugs:syncMissionData",Config.MissionPosition)
end)

function CreateMissionBlip(location)
	local blip = AddBlipForCoord(location.x,location.y,location.z)
	SetBlipSprite(blip, 1)
	SetBlipColour(blip, 5)
	AddTextEntry('MYBLIP', "Missão de Droga")
	BeginTextCommandSetBlipName('MYBLIP')
	AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)
	SetBlipScale(blip, 0.9) -- set scale
	SetBlipAsShortRange(blip, true)
	return blip
end

RegisterNetEvent("erp-drugs:syncMissionData")
AddEventHandler("erp-drugs:syncMissionData",function(data)
	Config.MissionPosition = data
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	CancelEvent("erp-drugs:startMission")
	StopMission = true
	RemoveBlip(blip)
	TriggerServerEvent("erp-drugs:syncMissionData",Config.MissionPosition)
	Citizen.Wait(5000)
	StopMission = false
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)
