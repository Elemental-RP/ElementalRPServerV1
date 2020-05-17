ERP.Commands = {}
local ERPCMD = ERP.Commands
ERPCMD.ESX = ERP.ESX

function ERPCMD:Start()
	if not self then return; end
	while not ESX do Citizen.Wait(100); end
	self.ESX = ESX
	while not ESX.IsPlayerLoaded() do Citizen.Wait(100); end
	print("ERP_Commands:Start() - Successful")
	self.Started = 1
end

--------------------------------------------------- Comando 1 >> Veículos Extras
function ToggleVehicleExtra(vehicle, extraId, extraState) SetVehicleExtra(vehicle, extraId, extraState) end
function GetExtraLabel(state) if state then return '<span style="color:green;">ON</span>' elseif not state then return '<span style="color:darkred;">OFF</span>' end end
function ERPCMD:VHExtras()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local availableExtras = {}

    if not DoesEntityExist(vehicle) then return end

    for i=0, 12 do
        if DoesExtraExist(vehicle, i) then
            local state = IsVehicleExtraTurnedOn(vehicle, i) == 1

            table.insert(availableExtras, {
                label = ('Extra <span style="color:darkgoldenrod;">%s</span>: %s'):format(i, GetExtraLabel(state)),
                state = state,
                extraId = i
            })
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_extras', {
        title    = 'Veículos - Extras',
        align    = 'left',
        elements = availableExtras
    }, function(data, menu)
        ToggleVehicleExtra(vehicle, data.current.extraId, data.current.state)
		menu.close()
        ERPCMD:VHExtras()
    end, function(data, menu)
        menu.close()
    end)
end
--------------------------------------------------- Comando 2 >> Veículos Neons
local isOn	=	false
function ERPCMD:ToggleNeon()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if isOn then
            SetVehicleNeonLightEnabled(veh, 0, false)
            SetVehicleNeonLightEnabled(veh, 1, false)
            SetVehicleNeonLightEnabled(veh, 2, false)
            SetVehicleNeonLightEnabled(veh, 3, false)
			isOn = false
        else
            SetVehicleNeonLightEnabled(veh, 0, true)
            SetVehicleNeonLightEnabled(veh, 1, true)
            SetVehicleNeonLightEnabled(veh, 2, true)
            SetVehicleNeonLightEnabled(veh, 3, true)
			isOn = true
        end
    end
end

RegisterCommand('vextras', function(source, args) ERPCMD:VHExtras(args); end)
RegisterCommand('neon', function() ERPCMD:ToggleNeon(); end)
Citizen.CreateThread(function() TriggerEvent('chat:addSuggestion', "/neon", "Liga e Desliga os neons do carro") end)
Citizen.CreateThread(function(...) ERPCMD:Start(...); end)