--------------------------------
------- Created by Hamza -------
-------------------------------- 

local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Server Event for Buying:
RegisterServerEvent("erp-pawnshop:BuyItem")
AddEventHandler("erp-pawnshop:BuyItem", function(amountToBuy,totalBuyPrice,itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemLabel = ESX.GetItemLabel(itemName)
	if xPlayer.getMoney() >= totalBuyPrice then
		xPlayer.removeMoney(totalBuyPrice)
		xPlayer.addInventoryItem(itemName, amountToBuy)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "Pagaste ~g~"..totalBuyPrice.." €~s~ por "..amountToBuy.."x ~y~"..itemLabel.."~s~", length = 4000})
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "Dinheiro insuficiente", length = 4000})
	end
end)

-- Server Event for Selling:
RegisterServerEvent("erp-pawnshop:SellItem")
AddEventHandler("erp-pawnshop:SellItem", function(amountToSell,totalSellPrice,itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemLabel = ESX.GetItemLabel(itemName)
	if xPlayer.getInventoryItem(itemName).count >= amountToSell then
		xPlayer.addMoney(totalSellPrice)
		xPlayer.removeInventoryItem(itemName, amountToSell)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "Vendeste "..amountToSell.."x ~y~"..itemLabel.."~s~ por ~g~"..totalSellPrice.." €~s~", length = 4000})
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "Items insuficientes", length = 4000})
	end
end)
