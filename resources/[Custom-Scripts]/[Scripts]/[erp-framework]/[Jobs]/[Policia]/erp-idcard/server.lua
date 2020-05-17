local ESX = nil

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Open ID card
RegisterServerEvent('erp-idcard:open')
AddEventHandler('erp-idcard:open', function(ID, targetID)

	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source = ESX.GetPlayerFromId(targetID).source

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (result)
		if (result[1] ~= nil) then
		  playerData = {firstname = result[1].firstname, lastname = result[1].lastname, dateofbirth = result[1].dateofbirth, sex = result[1].sex, height = result[1].height}
		  TriggerClientEvent('erp-idcard:open', _source, playerData)
		end
	end)
end)