ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('binoculars', function(source)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('binoculars:Activate', _source)
end)