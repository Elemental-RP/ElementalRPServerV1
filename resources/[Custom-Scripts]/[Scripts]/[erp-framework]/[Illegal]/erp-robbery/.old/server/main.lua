ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local deadPeds = {}

RegisterServerEvent('erp-robbery:pedDead')
AddEventHandler('erp-robbery:pedDead', function(store)
    if not deadPeds[store] then
        deadPeds[store] = 'deadlol'
        TriggerClientEvent('erp-robbery:onPedDeath', -1, store)
        local second = 1000
        local minute = 60 * second
        local hour = 60 * minute
        local cooldown = Config.Shops[store].cooldown
        local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
        Wait(wait)
        if not Config.Shops[store].robbed then
            for k, v in pairs(deadPeds) do 
                if k == store then 
                    table.remove(deadPeds, k) 
                end 
            end
            TriggerClientEvent('erp-robbery:resetStore', -1, store)
        end
    end
end)

RegisterServerEvent('erp-robbery:handsUp')
AddEventHandler('erp-robbery:handsUp', function(store)
    TriggerClientEvent('erp-robbery:handsUp', -1, store)
end)

RegisterServerEvent('erp-robbery:pickUp')
AddEventHandler('erp-robbery:pickUp', function(store)
    local xPlayer = ESX.GetPlayerFromId(source)
    local randomAmount = math.random(Config.Shops[store].money[1], Config.Shops[store].money[2])
    xPlayer.addMoney(randomAmount)
    TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['cashrecieved'] .. ' ~g~' .. randomAmount .. ' ' .. Translation[Config.Locale]['currency'])
    TriggerClientEvent('erp-robbery:removePickup', -1, store) 
end)

ESX.RegisterServerCallback('erp-robbery:canRob', function(source, cb, store)
    local cops = 0
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            cops = cops + 1
        end
    end
    if cops >= Config.Shops[store].cops then
        if not Config.Shops[store].robbed and not deadPeds[store] then
            cb(true)
        else
            cb(false)
        end
    else
        cb('no_cops')
    end
end)

RegisterServerEvent('erp-robbery:rob')
AddEventHandler('erp-robbery:rob', function(store)
    local src = source
    Config.Shops[store].robbed = true
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            TriggerClientEvent('erp-robbery:msgPolice', xPlayer.source, store, src)
        end
    end
    TriggerClientEvent('erp-robbery:rob', -1, store)
    Wait(30000)
    TriggerClientEvent('erp-robbery:robberyOver', src)

    local second = 1000
    local minute = 60 * second
    local hour = 60 * minute
    local cooldown = Config.Shops[store].cooldown
    local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
    Wait(wait)
    Config.Shops[store].robbed = false
    for k, v in pairs(deadPeds) do if k == store then table.remove(deadPeds, k) end end
    TriggerClientEvent('erp-robbery:resetStore', -1, store)
end)

Citizen.CreateThread(function()
    while true do
        for i = 1, #deadPeds do TriggerClientEvent('erp-robbery:pedDead', -1, i) end -- update dead peds
        Citizen.Wait(500)
    end
end)
