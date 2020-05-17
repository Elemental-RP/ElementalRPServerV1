local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX 			    			= nil
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local isInZone                  = false
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

function mysplit (inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	myJob = job.name
end)

AddEventHandler('esx_drugs:hasEnteredMarker', function(zone)
	if myJob == 'police' then
		return
	end
	local action = mysplit(zone, "_")
	ESX.UI.Menu.CloseAll()
	local v = Config.Drugs[""..action[1]..""]
	if action[2] == 'Field' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect', action[1])
		CurrentActionData = {}
	end
	
	if action[2] == 'Processing' then
		ESX.TriggerServerCallback('esx_drugs:getInventoryItem', function(qtd)
			if qtd.count >= v.QToProcess then
				CurrentAction     = zone
				CurrentActionMsg  = _U('press_process', action[1])
				CurrentActionData = {}
			end
		end, v.Item)
	end
	
	if action[2] == 'Dealer' then
		ESX.TriggerServerCallback('esx_drugs:getInventoryItem', function(qtd)
			if qtd ~= nil and qtd.count >= v.QToSell then
				CurrentAction     = zone
				CurrentActionMsg  = _U('press_sell', action[1])
				CurrentActionData = {}
			end
		end, v.ItemTransform)
	end
end)

RegisterNetEvent('esx_drugs:hasExitedMarker')
AddEventHandler('esx_drugs:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_drugs:stopHarvest')
	TriggerServerEvent('esx_drugs:stopTransform')
	TriggerServerEvent('esx_drugs:stopSell')
	ClearPedTasks(PlayerPedId())
end)

-- Drug effect
RegisterNetEvent('esx_drugs:onUse')
AddEventHandler('esx_drugs:onUse', function(drug)
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(0)
	end
	if drug ~= 'meth' then
		TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
	else
		TaskStartScenarioInPlace(GetPlayerPed(-1), "mp_player_intdrink", 0, true)
	end
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(600000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end)

local NPCs = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(Config.Drugs) do
			for i,j in pairs(v.Zones) do
				if(GetDistanceBetweenCoords(coords, j.x, j.y, j.z, true) < Config.DrawDistance) then
					if i == 'Dealer' then
						if NPCs[k] == nil then
							RequestModel(j.NPCHash)
							while not HasModelLoaded(j.NPCHash) do
								Citizen.Wait(100)
							end
							NPCs[k] = CreatePed(1, j.NPCHash, j.x, j.y, j.z, j.h, false, true)
							SetBlockingOfNonTemporaryEvents(NPCs[k], true)
							SetPedDiesWhenInjured(NPCs[k], false)
							SetPedCanPlayAmbientAnims(NPCs[k], true)
							SetPedCanRagdollFromPlayerImpact(NPCs[k], false)
							SetEntityInvincible(NPCs[k], true)
							FreezeEntityPosition(NPCs[k], true)
							TaskStartScenarioInPlace(NPCs[k], "WORLD_HUMAN_SMOKING", 0, true);
						end
					else
						DrawMarker(Config.MarkerType, j.x, j.y, j.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end
			end
		end
	end
end)

if Config.ShowBlips then
	Citizen.CreateThread(function()
		for k,v in pairs(Config.Drugs) do
			for i,j in pairs(v.Zones) do
				local blip = AddBlipForCoord(j.x, j.y, j.z)

				SetBlipSprite (blip, j.sprite)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 0.8)
				SetBlipColour (blip, j.color)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(j.name)
				EndTextCommandSetBlipName(blip)
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Drugs) do
			for i,j in pairs(v.Zones) do
				if(GetDistanceBetweenCoords(coords, j.x, j.y, j.z, true) < Config.ZoneSize.x / 2) then
					isInMarker  = true
					currentZone = k.."_"..i
				end
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
		end
	end
end)

function callPolice(call1, call2, chance, pos)
	if call1 and call2 then
		local can = math.random(0, 100)
		if can <= chance then
			TriggerServerEvent('esx_addons_gcphone:startCall', 'police', _U('act_call_police'), pos, {
				pos = { x = pos.x, y = pos.y, z = pos.z },
			})
		end
	end
end

-- Disable Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if hasAlreadyEnteredMarker then
            DisableControlAction(0, Keys['U'], true) -- Inventario do veiculo
		else
			Citizen.Wait(500)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CurrentAction ~= nil then
			local playerPed = PlayerPedId()
			PedPosition		= GetEntityCoords(playerPed)
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, Keys['E']) then
				local action = mysplit(CurrentAction, '_')
				local cops = Config.Drugs[""..action[1]..""]
				local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
				isInZone = true
				if IsPedInAnyVehicle(GetPlayerPed(-1), 0) then
					TriggerEvent('esx:showNotification', _U('foot_work'))
				elseif action[2] == "Field" then
					ESX.ShowHelpNotification(_U('stop_action', Config.KeyStopAction))
					TriggerServerEvent('esx_drugs:startHarvest', action[1])
					TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
					callPolice(cops.AlertCops, cops.Zones[action[2]].callPolice, cops.Zones[action[2]].callPoliceChance, PlayerCoords)
				elseif action[2] == "Processing" then
					TriggerServerEvent('esx_drugs:startTransform', action[1])
					callPolice(cops.AlertCops, cops.Zones[action[2]].callPolice, cops.Zones[action[2]].callPoliceChance, PlayerCoords)
				elseif action[2] == "Dealer" then
					TriggerServerEvent('esx_drugs:startSell', action[1])
					callPolice(cops.AlertCops, cops.Zones[action[2]].callPolice, cops.Zones[action[2]].callPoliceChance, PlayerCoords)
				else
					isInZone = false
				end
				CurrentAction = nil
			end
		elseif CurrentAction == nil and IsControlJustReleased(0, Keys[Config.KeyStopAction]) then
			TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
		end
	end
end)