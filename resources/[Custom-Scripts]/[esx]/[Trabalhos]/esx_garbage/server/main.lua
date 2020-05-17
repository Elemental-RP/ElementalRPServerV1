ESX = nil
passanger1 = nil
passanger2 = nil
passanger3 = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_garbage:pay')
AddEventHandler('esx_garbage:pay', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local payamount = math.ceil(amount)
	xPlayer.addMoney(tonumber(payamount))
	TriggerClientEvent('esx:showNotification', source, '~s~Recebido~g~ '..payamount..' ~s~pelo seu trabalho~s~!')
end)

RegisterServerEvent('esx_garbage:binselect')
AddEventHandler('esx_garbage:binselect', function(binpos, platenumber, bagnumb)
	TriggerClientEvent('esx_garbage:setbin', -1, binpos, platenumber,  bagnumb)
end)

RegisterServerEvent('esx_garbage:requestpay')
AddEventHandler('esx_garbage:requestpay', function(platenumber, amount)
	print('pedido recebido para começar a pagar: '..platenumber.." para "..amount)
	TriggerClientEvent('esx_garbage:startpayrequest', -1, platenumber, amount)
end)

RegisterServerEvent('esx_garbage:bagremoval')
AddEventHandler('esx_garbage:bagremoval', function(platenumber)
	TriggerClientEvent('esx_garbage:removedbag', -1, platenumber)

end)

RegisterServerEvent('esx_garbage:endcollection')
AddEventHandler('esx_garbage:endcollection', function(platenumber)
	TriggerClientEvent('esx_garbage:clearjob', -1, platenumber)
end)

RegisterServerEvent('esx_garbage:reportbags')
AddEventHandler('esx_garbage:reportbags', function(platenumber)
	TriggerClientEvent('esx_garbage:countbagtotal', -1, platenumber)
end)

RegisterServerEvent('esx_garbage:bagsdone')
AddEventHandler('esx_garbage:bagsdone', function(platenumber, bagstopay)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_garbage:addbags', -1, platenumber, bagstopay, xPlayer )
end)
