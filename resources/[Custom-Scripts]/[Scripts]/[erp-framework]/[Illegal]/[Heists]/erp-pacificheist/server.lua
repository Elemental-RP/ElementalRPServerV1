ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local mincash = 5000 -- minimum amount of cash a pile holds
local maxcash = 10000 -- maximum amount of cash a pile can hold
local black = true -- enable this if you want blackmoney as a reward
local mincops = 5 -- minimum required cops to start mission
local enablesound = true -- enables bank alarm sound
local lastrobbed = 0 -- don't change this
local cooldown = 1800 -- amount of time to do the heist again in seconds (30min)
local info = {stage = 0, style = nil, locked = false}
local totalcash = 0
local PoliceDoors = {
    {loc = vector3(257.10, 220.30, 106.28), txtloc = vector3(257.10, 220.30, 106.28), model = "hei_v_ilev_bk_gate_pris", model2 = "hei_v_ilev_bk_gate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(236.91, 227.50, 106.29), txtloc = vector3(236.91, 227.50, 106.29), model = "v_ilev_bk_door", model2 = "v_ilev_bk_door", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(262.35, 223.00, 107.05), txtloc = vector3(262.35, 223.00, 107.05), model = "hei_v_ilev_bk_gate2_pris", model2 = "hei_v_ilev_bk_gate2_pris", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(252.72, 220.95, 101.68), txtloc = vector3(252.72, 220.95, 101.68), model = "hei_v_ilev_bk_safegate_pris", model2 = "hei_v_ilev_bk_safegate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(261.01, 215.01, 101.68), txtloc = vector3(261.01, 215.01, 101.68), model = "hei_v_ilev_bk_safegate_pris", model2 = "hei_v_ilev_bk_safegate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(253.92, 224.56, 101.88), txtloc = vector3(253.92, 224.56, 101.88), model = "v_ilev_bk_vaultdoor", model2 = "v_ilev_bk_vaultdoor", obj = nil, obj2 = nil, locked = true}
}
ESX.RegisterServerCallback("erp-pacificheist:GetData", function(source, cb)
    cb(info)
end)
ESX.RegisterServerCallback("erp-pacificheist:GetDoors", function(source, cb)
    cb(PoliceDoors)
end)
ESX.RegisterServerCallback("erp-pacificheist:startevent", function(source, cb, method)
    local xPlayers = ESX.GetPlayers()
    local copcount = 0
    local yPlayer = ESX.GetPlayerFromId(source)

    if not info.locked then
        if (os.time() - cooldown) > lastrobbed then
            for i = 1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

                if xPlayer then
                    if xPlayer.job.name == "police" then
                        copcount = copcount + 1
                    end
                end
            end
            if copcount >= mincops then
                if method == 1 then
                    local item = yPlayer.getInventoryItem("thermal_charge")["count"]

                    if item >= 1 then
                        yPlayer.removeInventoryItem("thermal_charge", 1)
                        cb(true)
                        info.stage = 1
                        info.style = 1
                        info.locked = true
                    else
                        cb("Não tens nenhuma carga térmica.")
                    end
                elseif method == 2 then
                    local item = yPlayer.getInventoryItem("lockpick")["count"]

                    if item >= 1 then
                        yPlayer.removeInventoryItem("lockpick", 1)
                        info.stage = 1
                        info.style = 2
                        info.locked = true
                        cb(true)
                    else
                        cb("Não tens nenhuma lockpick.")
                    end
                end
            else
                cb("Tem de ter no mínimo "..mincops.." polícias na cidade.")
            end
        else
            cb(math.floor((cooldown - (os.time() - lastrobbed)) / 60)..":"..math.fmod((cooldown - (os.time() - lastrobbed)), 60).." até ao próximo roubo.")
        end
    else
        cb("Banco está a ser assaltado.")
    end
end)
ESX.RegisterServerCallback("erp-pacificheist:checkItem", function(source, cb, itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname)["count"]

    if item >= 1 then
        cb(true)
    else
        cb(false)
    end
end)
ESX.RegisterServerCallback("erp-pacificheist:gettotalcash", function(source, cb)
    cb(totalcash)
end)
RegisterServerEvent("erp-pacificheist:removeitem")
AddEventHandler("erp-pacificheist:removeitem", function(itemname)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(itemname, 1)
end)
RegisterServerEvent("erp-pacificheist:updatecheck")
AddEventHandler("erp-pacificheist:updatecheck", function(var, status)
    TriggerClientEvent("erp-pacificheist:updatecheck_c", -1, var, status)
end)
RegisterServerEvent("erp-pacificheist:policeDoor")
AddEventHandler("erp-pacificheist:policeDoor", function(doornum, status)
    PoliceDoors[doornum].locked = status
    TriggerClientEvent("erp-pacificheist:policeDoor_c", -1, doornum, status)
end)
RegisterServerEvent("erp-pacificheist:moltgate")
AddEventHandler("erp-pacificheist:moltgate", function(x, y, z, oldmodel, newmodel, method)
    TriggerClientEvent("erp-pacificheist:moltgate_c", -1, x, y, z, oldmodel, newmodel, method)
end)
RegisterServerEvent("erp-pacificheist:fixdoor")
AddEventHandler("erp-pacificheist:fixdoor", function(hash, coords, heading)
    TriggerClientEvent("erp-pacificheist:fixdoor_c", -1, hash, coords, heading)
end)
RegisterServerEvent("erp-pacificheist:openvault")
AddEventHandler("erp-pacificheist:openvault", function(method)
    TriggerClientEvent("erp-pacificheist:openvault_c", -1, method)
end)
RegisterServerEvent("erp-pacificheist:startloot")
AddEventHandler("erp-pacificheist:startloot", function()
    TriggerClientEvent("erp-pacificheist:startloot_c", -1)
end)
RegisterServerEvent("erp-pacificheist:rewardCash")
AddEventHandler("erp-pacificheist:rewardCash", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local reward = math.random(mincash, maxcash)

    if black then
        xPlayer.addAccountMoney("black_money", reward)
        totalcash = totalcash + reward
    else
        xPlayer.addMoney(reward)
        totalcash = totalcash + reward
    end
end)
RegisterServerEvent("erp-pacificheist:rewardGold")
AddEventHandler("erp-pacificheist:rewardGold", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("gold_bar", 1)
end)
RegisterServerEvent("erp-pacificheist:rewardDia")
AddEventHandler("erp-pacificheist:rewardDia", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("dia_box", 1)
end)
RegisterServerEvent("erp-pacificheist:giveidcard")
AddEventHandler("erp-pacificheist:giveidcard", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addInventoryItem("bankidcard", 1)
end)
RegisterServerEvent("erp-pacificheist:ostimer")
AddEventHandler("erp-pacificheist:ostimer", function()
    lastrobbed = os.time()
    info.stage, info.style, info.locked = 0, nil, false
    Citizen.Wait(300000)
    for i = 1, #PoliceDoors, 1 do
        PoliceDoors[i].locked = true
        TriggerClientEvent("erp-pacificheist:policeDoor_c", -1, i, true)
    end
    totalcash = 0
    TriggerClientEvent("erp-pacificheist:reset", -1)
end)
RegisterServerEvent("erp-pacificheist:gas")
AddEventHandler("erp-pacificheist:gas", function()
    TriggerClientEvent("erp-pacificheist:gas_c", -1)
end)
RegisterServerEvent("erp-pacificheist:ptfx")
AddEventHandler("erp-pacificheist:ptfx", function(method)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do -- This don't work as I expected :/ But works anyway...
        if xPlayers[i] ~= source then
            TriggerClientEvent("erp-pacificheist:ptfx_c", xPlayers[i], method)
        end
    end
end)
RegisterServerEvent("erp-pacificheist:alarm_s")
AddEventHandler("erp-pacificheist:alarm_s", function(toggle)
    if enablesound then
        TriggerClientEvent("erp-pacificheist:alarm", -1, toggle)
    end
    TriggerClientEvent("erp-pacificheist:policenotify", -1, toggle)
end)
