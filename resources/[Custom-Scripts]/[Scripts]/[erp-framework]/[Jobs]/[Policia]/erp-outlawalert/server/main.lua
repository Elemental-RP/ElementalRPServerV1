ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('erp-outlawalert:carJackInProgress')
AddEventHandler('erp-outlawalert:carJackInProgress', function(targetCoords, streetName, vehicleLabel, playerGender)
    mytype = 'police'
    data = {["code"] = 'C-11', ["name"] = 'Roubo de carro', ["loc"] = vehicleLabel, streetName}
    length = 3500
    TriggerClientEvent('erp-outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('erp-outlawalert:combatInProgress', -1, targetCoords)
    TriggerClientEvent('erp-outlawalert:carJackInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('erp-outlawalert:combatInProgress')
AddEventHandler('erp-outlawalert:combatInProgress', function(targetCoords, streetName, playerGender)
	mytype = 'police'
    data = {["code"] = '10-10', ["name"] = 'Luta em Progresso', ["loc"] = streetName}
    length = 3500
    TriggerClientEvent('erp-outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('erp-outlawalert:combatInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('erp-outlawalert:gunshotInProgress')
AddEventHandler('erp-outlawalert:gunshotInProgress', function(targetCoords, streetName, playerGender)
	mytype = 'police'
    data = {["code"] = 'C-20', ["name"] = 'Tiros Disparados', ["loc"] = streetName}
    length = 5500
    TriggerClientEvent('erp-outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('erp-outlawalert:gunshotInProgress', -1, targetCoords)
end, false)

ESX.RegisterServerCallback('erp-outlawalert:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)
