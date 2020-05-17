ERP = {}

TriggerEvent('esx:getSharedObject', function(obj) ERP.ESX = obj; ESX = obj; end)
AddEventHandler('onMySQLReady', function(...) ERP.SQLReady = true; end)

ERP.Testing = true

Citizen.CreateThread(function(...)
	while not ESX or not ERP.ESX do 
		Citizen.Wait(100)
		TriggerEvent('esx:getSharedObject', function(obj) ERP.ESX = obj; ESX = obj; end)
	end

	if ERP.Testing then 
		Citizen.Wait(3000)
		if not ERP.SQLReady then ERP.SQLReady = true; end
	end
end)
