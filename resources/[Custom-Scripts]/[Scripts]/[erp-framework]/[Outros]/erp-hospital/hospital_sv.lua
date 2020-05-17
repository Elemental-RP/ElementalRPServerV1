ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('erp-hospital:price')
AddEventHandler('erp-hospital:price', function()
  	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	local price = 1500

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Montante Paga: ' .. price  ..'€', length = 4000})
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não tens dinheiro suficiente, lmao', length = 4000})
	end
end)