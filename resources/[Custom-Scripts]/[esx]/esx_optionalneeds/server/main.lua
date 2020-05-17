ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterUsableItem('beer', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_beer'), length = 3000})

end)

ESX.RegisterUsableItem('vodka', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_vodka'), length = 3000})

end)


ESX.RegisterUsableItem('jagerbomb', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jagerbomb', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_jagerbomb'), length = 3000})

end)

ESX.RegisterUsableItem('tequila', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_tequila'), length = 3000})

end)

ESX.RegisterUsableItem('mixapero', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mixapero', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_mixapero'), length = 3000})

end)

ESX.RegisterUsableItem('martini', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('martini', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_martini'), length = 3000})

end)
ESX.RegisterUsableItem('drpepper', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('drpepper', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_drpepper'), length = 3000})

end)
ESX.RegisterUsableItem('energy', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('energy', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_energy'), length = 3000})

end)
ESX.RegisterUsableItem('jager', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jager', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_jager'), length = 3000})

end)
ESX.RegisterUsableItem('limonade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('limonade', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_limonade'), length = 3000})

end)
ESX.RegisterUsableItem('whisky', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_whisky'), length = 3000})

end)
ESX.RegisterUsableItem('rhum', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhum', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 60000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('used_rhum'), length = 3000})

end)
