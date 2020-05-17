ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    TriggerEvent('es:setMoneyDisplay', 0.0)
	ESX.UI.HUD.SetDisplay(0.0)
    ESX.PlayerData = ESX.GetPlayerData()
end)

local toghud = true

RegisterCommand('toggleui', function(source, args, rawCommand)
    if toghud then 
        toghud = false
        SendNUIMessage({
            action = 'hidecar'
        })
    else
        toghud = true
        if IsPedInAnyVehicle(PlayerPedId()) then
            SendNUIMessage({
                action = 'showcar'
            })
        end
    end
end)

RegisterNetEvent('hud:toggleui')
AddEventHandler('hud:toggleui', function(show)
    if show == true then
        toghud = true
    else
        toghud = false
    end
end)


Citizen.CreateThread(function()

    local isPauseMenu = false

	while true do
		Citizen.Wait(0)

		if IsPauseMenuActive() then -- ESC Key
			if not isPauseMenu then
				isPauseMenu = not isPauseMenu
				toghud = false
			end
		else
			if isPauseMenu then
				isPauseMenu = not isPauseMenu
				toghud = true
			end

			HideHudComponentThisFrame(1)  -- Wanted Stars
			HideHudComponentThisFrame(3)  -- Cash
			HideHudComponentThisFrame(4)  -- MP Cash
			HideHudComponentThisFrame(6)  -- Vehicle Name
			HideHudComponentThisFrame(7)  -- Area Name
			HideHudComponentThisFrame(8)  -- Vehicle Class
			HideHudComponentThisFrame(9)  -- Street Name
			HideHudComponentThisFrame(13) -- Cash Change
			HideHudComponentThisFrame(17) -- Save Game
		end
	end
end)

Citizen.CreateThread(function()
    while true do

        if toghud == true then
            if not IsPedInAnyVehicle(PlayerPedId()) then
                DisplayRadar(0)
            else
                DisplayRadar(1)
            end
        else
            DisplayRadar(0)
        end 
        
        TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
            TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
                local myhunger = hunger.getPercent()
                local mythirst = thirst.getPercent()

                SendNUIMessage({
                    action = "updateStatusHud",
                    show = toghud,
                    hunger = myhunger,
                    thirst = mythirst,
                })
            end)
        end)
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local player = PlayerPedId()
        local health = (GetEntityHealth(player) - 100)
        local armor = GetPedArmour(player)
        local oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 2.5

        SendNUIMessage({
            action = 'updateStatusHud',
            show = toghud,
            health = health,
            armour = armor,
            oxygen = oxy,
        })
        Citizen.Wait(200)
    end
end)








local cruiseIsOn = false
local seatbeltIsOn = false
local seatbeltEjectSpeed = 45               -- Speed threshold to eject player (MPH)
local seatbeltEjectAccel = 100              -- Acceleration threshold to eject player (G's)

RegisterNetEvent('erp-hud:EnteredVehicle')
AddEventHandler('erp-hud:EnteredVehicle', function()
    SendNUIMessage({
        action = 'showcar'
    })

    local player = PlayerPedId()
    local veh = GetVehiclePedIsIn(player)

    local prevHp = GetEntityHealth(veh)

    cruiseIsOn = false
    seatbeltIsOn = false
    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            Citizen.Wait(0)
            -- When player in driver seat, handle cruise control
            if (GetPedInVehicleSeat(veh, -1) == player) then
                -- Check if cruise control button pressed, toggle state and set maximum speed appropriately
                if IsControlJustReleased(0, 137) then
                    if cruiseIsOn then
                        exports['mythic_notify']:SendAlert('inform', 'Cruise Desativado')
                    else
                        exports['mythic_notify']:SendAlert('inform', 'Cruise Ativado')
                    end

                    cruiseIsOn = not cruiseIsOn
                    SendNUIMessage({
                        action = 'toggle-cruise'
                    })
                    cruiseSpeed = GetEntitySpeed(veh)
                end
                local maxSpeed = cruiseIsOn and cruiseSpeed or GetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel")
                SetEntityMaxSpeed(veh, maxSpeed)
            end
        end
    end)

    Citizen.CreateThread(function()
        local currSpeed = 0
        local prevVelocity = { x = 0.0, y = 0.0, z = 0.0 }
        while true do
            Citizen.Wait(0)
            local prevSpeed = currSpeed
            local position = GetEntityCoords(player)
            currSpeed = GetEntitySpeed(veh)
            if not seatbeltIsOn then
                local vehIsMovingFwd = GetEntitySpeedVector(veh, true).y > 1.0
                local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                if (vehIsMovingFwd and (prevSpeed > seatbeltEjectSpeed) and (vehAcc > (seatbeltEjectAccel * 9.81))) then
                    SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                    SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                    Citizen.Wait(1)
                    SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                else
                    prevVelocity = GetEntityVelocity(veh)
                end
            else
                DisableControlAction(0, 75)
            end
        end
    end)

    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            Citizen.Wait(0)
            if IsControlJustReleased(0, 29) then
                local vehClass = GetVehicleClass(veh)
                if vehClass ~= 8 and vehClass ~= 13 and vehClass ~= 14 then
                    if seatbeltIsOn then
                        exports['mythic_notify']:SendAlert('inform', 'Cinto Retirado')
                    else
                        exports['mythic_notify']:SendAlert('inform', 'Cinto Posto')
                    end
                    seatbeltIsOn = not seatbeltIsOn
                    SendNUIMessage({
                        action = 'toggle-seatbelt'
                    })
                end
            end
        end
    end)

    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            Citizen.Wait(1000)
        end
        seatbeltIsOn = false
        cruiseIsOn = false
        SendNUIMessage({
            action = 'hidecar'
        })
    end)
end)

RegisterNetEvent('erp-hud:EnteringVehicle')
AddEventHandler('erp-hud:EnteringVehicle', function(veh)
    seatbeltIsOn = false
    cruiseIsOn = false
    SendNUIMessage({
        action = "set-seatbelt",
        seatbelt = false
    })
    SendNUIMessage({
        action = "set-cruise",
        cruise = false
    })
end)