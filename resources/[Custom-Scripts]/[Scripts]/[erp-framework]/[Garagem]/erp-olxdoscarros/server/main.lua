ESX               = nil
local cars 		  = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('erp-olxdoscarros:requestPlayerCars', function(source, cb, plate)
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

function setVehicleOwner(source,plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('UPDATE owned_vehicles SET owner=@owner WHERE plate=@plate',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = plate
	},
	function (rowsChanged)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Compraste o carro com a matrícula ~g~' ..plate..'!', length = 4000})
	end) 
end

RegisterCommand('vendercarro', function(source, args, raw)
    TriggerClientEvent('erp-olxdoscarros:Dar', source)
end)

RegisterServerEvent('erp-olxdoscarros:proposta')
AddEventHandler('erp-olxdoscarros:proposta', function (player,plate,preco)
	TriggerClientEvent("erp-olxdoscarros:aceitarproposta",player,source,plate,preco)
end)
RegisterServerEvent('erp-olxdoscarros:respostas')
AddEventHandler('erp-olxdoscarros:respostas', function (vendedor,resposta,preco,plate)
	if resposta then
		local xPlayer = ESX.GetPlayerFromId(source)
		local xPlayerVendedor = ESX.GetPlayerFromId(vendedor)
		if xPlayer.getMoney() >= preco then
			setVehicleOwner(source,plate)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~g~Aceite!', length = 4000})
			xPlayer.removeMoney(preco)
			xPlayerVendedor.addMoney(preco)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não tens dinheiro suficiente!', length = 2000})
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~r~Recusada!', length = 4000})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~r~Recusada!', length = 4000})
	end
end)