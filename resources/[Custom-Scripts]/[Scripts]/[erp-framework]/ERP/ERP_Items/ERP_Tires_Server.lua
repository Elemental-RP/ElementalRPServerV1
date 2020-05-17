ERP.TiresReplacement = {}
local ERPTR = ERP.TiresReplacement
ERPTR.ESX = ERP.ESX


RegisterServerEvent('ERPTR:Used')
AddEventHandler('ERPTR:Used', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return; end

	xPlayer.removeInventoryItem('tires', 1)
end)

ESX.RegisterUsableItem('tires', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return; end
	
	TriggerClientEvent('ERPTR:Use', source)
end)
