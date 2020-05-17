--[[ Gets the ESX library ]]--
ESX = nil 
TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)

RegisterNetEvent('esx_shops:Cashier')
AddEventHandler('esx_shops:Cashier', function(price, basket, account)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if account == "cash" then
        xPlayer.removeMoney(price)
    else
        xPlayer.removeAccountMoney(account, price)
    end
    
    for i=1, #basket do
        xPlayer.addInventoryItem(basket[i]["value"], basket[i]["amount"])
    end
    
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Compraste ao todo <span style="color: green">' .. price .. ' €</span> em produtos', length = 3000})

end)

ESX.RegisterServerCallback('esx_shops:CheckMoney', function(source, cb, price, account)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money
    if account == "cash" then
        money = xPlayer.getMoney()
    else
        money = xPlayer.getAccount(account)["money"]
    end

    if money >= price then
        cb(true)
    end
    cb(false)
end)