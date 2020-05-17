ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('baseevents:enteringVehicle')
AddEventHandler('baseevents:enteringVehicle', function(currentVehicle, currentSeat, displayname, netId)
    TriggerClientEvent('erp-hud:EnteringVehicle', source, currentVehicle, currentSeat, displayname, netId)
end)

RegisterServerEvent('baseevents:enteringAborted')
AddEventHandler('baseevents:enteringAborted', function()
    TriggerClientEvent('erp-hud:EnteringVehicleAborted', source)
end)

RegisterServerEvent('baseevents:enteredVehicle')
AddEventHandler('baseevents:enteredVehicle', function(currentVehicle, currentSeat, displayname)
    TriggerClientEvent('erp-hud:EnteredVehicle', source, currentVehicle, currentSeat, displayname)
end)

RegisterServerEvent('baseevents:leftVehicle')
AddEventHandler('baseevents:leftVehicle', function(currentVehicle, currentSeat, displayname)
    TriggerClientEvent('erp-hud:LeftVehicle', source, currentVehicle, currentSeat, displayname)
end)
