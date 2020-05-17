local ESX = nil
local robbableItems = {
 [1] = {chance = 10, id = 0, name = 'Dinheiro', quantity = math.random(1, 500)}, -- really common
 [2] = {chance = 7, id = 0, name = 'Dinheiro', quantity = math.random(1, 1500)}, -- really common
 [3] = {chance = 4, id = 0, name = 'Dinheiro', quantity = math.random(1, 3000)}, -- really common
 [4] = {chance = 3, id = 0, name = 'Dinheiro', quantity = math.random(1, 7000)}, -- really common
 [5] = {chance = 3, id = 'coke1g', name = 'Saco de Cocaina', quantity = math.random(1, 6)}, -- rare
 [6] = {chance = 4, id = 'meth1g', name = 'Saco de meth', quantity = math.random(1, 10)}, -- rare
 [7] = {chance = 5, id = 'weed4g', name = 'Saco de Weed', quantity = math.random(1, 18)}, -- rare
 [8] = {chance = 14, id = 'lockpick', name = 'LockPick', quantity = 1}, -- rare
 [9] = {chance = 16, id = 'phone', name = 'Telemovel', quantity = 1}, -- rare
 [10] = {chance = 16, id = 'radio', name = 'Radio', quantity = 1}, -- rare
 [11] = {chance = 8, id = 'hqscale', name = 'Balança', quantity = 1}, -- rare
 [12] = {chance = 9, id = 'drugbags', name = 'Sacos', quantity = math.random(10, 30)}, -- rare
 [13] = {chance = 12, id = 'cigarett', name = 'Cigarro', quantity = 3}, -- rare
 [14] = {chance = 8, id = 'hackerDevice', name = 'PC', quantity = 1}, -- rare
 [15] = {chance = 16, id = 'notepad', name = 'Bloco de Notas', quantity = 1}, -- rare
 [16] = {chance = 6, id = 'drugBUSBC', name = 'USB-C Preta', quantity = 1}, -- rare
 [17] = {chance = 7, id = 'joint2g', name = 'Ganza', quantity = math.random(1, 6)}, -- rare
 [18] = {chance = 11, id = 'lighter', name = 'Isqueiro', quantity = 1}, -- rare
 [19] = {chance = 18, id = 'hamburger', name = 'Hamburger', quantity = math.random(1, 10)}, -- rare
 [20] = {chance = 18, id = 'fanta', name = 'Fanta', quantity = math.random(1, 10)}, -- rare
 [21] = {chance = 14, id = 'rolpaper', name = 'Filtros', quantity = math.random(1, 10)}, -- rare
 [22] = {chance = 5, id = 'gold', name = 'Ouro', quantity = math.random(2, 6)}, -- rare
 [23] = {chance = 3, id = 'diamond', name = 'Diamante', quantity = math.random(2, 3)}, -- rare
 [24] = {chance = 1, id = 'rolex', name = 'Relógio Rolex', quantity = 1}, -- rare
}

--[[chance = 1 is very common, the higher the value the less the chance]]--

TriggerEvent('esx:getSharedObject', function(obj)
 ESX = obj
end)

ESX.RegisterUsableItem('lockpick', function(source) --Hammer high time to unlock but 100% call cops
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 TriggerClientEvent('houseRobberies:attempt', source, xPlayer.getInventoryItem('lockpick').count)
end)

RegisterServerEvent('houseRobberies:removeLockpick')
AddEventHandler('houseRobberies:removeLockpick', function()
	local source = tonumber(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('lockpick', 1)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Essa Lockpick parece estar estragada', length = 1500})
end)

RegisterServerEvent('houseRobberies:giveMoney')
AddEventHandler('houseRobberies:giveMoney', function()
	local source = tonumber(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local cash = math.random(500, 3000)
	xPlayer.addMoney(cash)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Encontraste ' .. cash .. '€', length = 1500})
end)


RegisterServerEvent('houseRobberies:searchItem')
AddEventHandler('houseRobberies:searchItem', function()
 local source = tonumber(source)
 local item = {}
 local xPlayer = ESX.GetPlayerFromId(source)
 local gotID = {}


 for i=1, math.random(1, 2) do
  item = robbableItems[math.random(1, #robbableItems)]
  if math.random(1, 10) >= item.chance then
   if tonumber(item.id) == 0 and not gotID[item.id] then
    gotID[item.id] = true
    xPlayer.addMoney(item.quantity)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Encontraste ' .. item.quantity .. '€', length = 1500})
   elseif item.isWeapon and not gotID[item.id] then
    gotID[item.id] = true
    xPlayer.addWeapon(item.id, 50)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Arma Encontrada', length = 1500})
   elseif not gotID[item.id] then
    gotID[item.id] = true
    xPlayer.addInventoryItem(item.id, item.quantity)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Item Encontrado', length = 1500})
   end
  end
 end
end)
