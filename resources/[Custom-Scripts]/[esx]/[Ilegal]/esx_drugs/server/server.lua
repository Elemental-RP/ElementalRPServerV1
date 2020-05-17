ESX								= nil
local CopsConnected				= 0
local PlayersHarvesting			= {}
local PlayersTransforming		= {}
local PlayersSelling			= {}
local Drug						= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()
	local xPlayers = ESX.GetPlayers()
	CopsConnected = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end
	SetTimeout(120 * 1000, CountCops)
end

CountCops()

local function Harvest(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToFarm * 1000, function()
		if PlayersHarvesting[source] == true and Drug[source] == drug then
			local xPlayer  = ESX.GetPlayerFromId(source)
			local item = xPlayer.getInventoryItem(v.Item)
			local qtd = math.random(1,4)
			if xPlayer.canCarryItem(v.Item, qtd) then
				xPlayer.addInventoryItem(v.Item, qtd)
				Harvest(source, drug)
			else
				TriggerClientEvent('esx_drugs:hasExitedMarker')
				TriggerClientEvent('esx:showNotification', source, _U('inv_full'))
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvest')
AddEventHandler('esx_drugs:startHarvest', function(drug)
	local _source = source
	PlayersHarvesting[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	Harvest(_source, drug)
end)

RegisterServerEvent('esx_drugs:stopHarvest')
AddEventHandler('esx_drugs:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
	Drug[source] = false
end)

local function Transform(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToProcess * 1000, function()
		if PlayersTransforming[source] == true and Drug[source] == drug then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			local itemQuantity = xPlayer.getInventoryItem(v.Item).count
			local transformQuantity = xPlayer.getInventoryItem(v.ItemTransform).count
			if transformQuantity > 100 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif itemQuantity < 10 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough', drug))
			else
				xPlayer.removeInventoryItem(v.Item, 10)
				xPlayer.addInventoryItem(v.ItemTransform, 1)
				Transform(source, drug)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransform')
AddEventHandler('esx_drugs:startTransform', function(drug)
	local _source = source
	PlayersTransforming[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	Transform(_source, drug)
end)

RegisterServerEvent('esx_drugs:stopTransform')
AddEventHandler('esx_drugs:stopTransform', function()
	local _source = source
	PlayersTransforming[_source] = false
	Drug[source] = false
end)

local function Sell(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToSell * 1000, function()
		if PlayersSelling[source] == true and Drug[source] == drug then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local item = xPlayer.getInventoryItem(v.ItemTransform).count

			if item == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough', drug))
			else
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				if CopsConnected <= 1 then
					xPlayer.addAccountMoney('black_money', math.random(v.Zones.Dealer.sellMin, v.Zones.Dealer.sellMax))
				else
					xPlayer.addAccountMoney('black_money', math.random( v.Zones.Dealer.sellMin * CopsConnected, v.Zones.Dealer.sellMax * CopsConnected))
				end
				TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				Sell(source, drug)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSell')
AddEventHandler('esx_drugs:startSell', function(drug)
	local _source = source
	PlayersSelling[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	Sell(_source, drug)
end)

RegisterServerEvent('esx_drugs:stopSell')
AddEventHandler('esx_drugs:stopSell', function()
	local _source = source
	PlayersSelling[_source] = false
	Drug[source] = false
end)

ESX.RegisterServerCallback('esx_drugs:getInventoryItem', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local oItem = xPlayer.getInventoryItem(item)
	cb(oItem)
end)

for k,v in pairs(Config.Drugs) do
	if v.Usable then
		ESX.RegisterUsableItem(v.Item, function(source)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			xPlayer.removeInventoryItem(v.Item, 5)
			if v.UseEffect then
				TriggerClientEvent('esx_drugs:onUse', _source, v.Item)
			end
			TriggerClientEvent('esx:showNotification', _source, _U('used_one', k))
		end)
	end
end
