-- FiveM Heli Cam by mraes
-- Version 1.3 2017-06-12

RegisterServerEvent('erp_rapel:spotlight')
AddEventHandler('erp_rapel:spotlight', function(state)
	local serverID = source
	TriggerClientEvent('erp_rapel:spotlight', -1, serverID, state)
end)