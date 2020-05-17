RegisterNetEvent("erp-motels:keyTransfered")
AddEventHandler("erp-motels:keyTransfered", function(keyData)
    table.insert(cachedData["keys"], keyData)

    ESX.ShowNotification("Recebeste uma chave.", "error", 3500)
end)

AddKey = function(keyData)
    if not keyData["id"] then return end
    if not keyData["label"] then keyData["label"] = "Chave - Desconhecido" end

    keyData["uuid"] = UUID()

    ESX.TriggerServerCallback("erp-motels:addKey", function(added)
        if added then
            table.insert(cachedData["keys"], keyData)

            ESX.ShowNotification("Chaves recebidas.", "warning", 3500)
        end
    end, keyData)
end

RemoveKey = function(keyUUID)
    if not keyUUID then return end

    for keyIndex, keyData in ipairs(cachedData["keys"]) do
        if keyData["uuid"] == keyUUID then
            ESX.TriggerServerCallback("erp-motels:removeKey", function(removed)
                if removed then
                    table.remove(cachedData["keys"], keyIndex)

                    ESX.ShowNotification("Chave removida.", "error", 3500)
                end
            end, keyUUID)

            return
        end
    end
end

TransferKey = function(keyData, newPlayer)
    if not keyData["uuid"] then return end

    for keyIndex, currentKeyData in ipairs(cachedData["keys"]) do
        if keyData["uuid"] == currentKeyData["uuid"] then
            ESX.TriggerServerCallback("erp-motels:transferKey", function(removed)
                if removed then
                    table.remove(cachedData["keys"], keyIndex)

                    ESX.ShowNotification("Chave enviada.", "error", 3500)
                end
            end, keyData, GetPlayerServerId(newPlayer))

            return
        end
    end
end

HasKey = function(keyId)
    if not keyId then return end

    for keyIndex, keyData in ipairs(cachedData["keys"]) do
        if keyData["id"] == keyId then
            return true
        end
    end

    return false
end

ShowKeyMenu = function()
    local menuElements = {}

    if #cachedData["keys"] == 0 then return ESX.ShowNotification("Não tens nenhuma chave contigo.", "error", 3000) end

    for keyIndex, keyData in ipairs(cachedData["keys"]) do
        table.insert(menuElements, {
            ["label"] = keyData["label"],
            ["key"] = keyData
        })
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "key_main_menu", {
        ["title"] = "Gerir Chaves",
        ["align"] = Config.AlignMenu,
        ["elements"] = menuElements
    }, function(menuData, menuHandle)
        local currentKey = menuData["current"]["key"]

        if not currentKey then return end

        menuHandle.close()

        ConfirmGiveKey(currentKey, function(confirmed)
            if confirmed then
                TransferKey(currentKey, confirmed)

                DrawBusySpinner("Dar a chave ao dono...")

                Citizen.Wait(1000)

                RemoveLoadingPrompt()
            end

            ShowKeyMenu()
        end)
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end

ConfirmGiveKey = function(keyData, callback)
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()

    if closestPlayer ~= -1 and closestPlayerDistance > 3.0 then
        return ESX.ShowNotification("Não estás perto de um indevíduo.")
    end

    Citizen.CreateThread(function()
        while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "main_accept_key") do
            Citizen.Wait(5)

            local cPlayer, cPlayerDst = ESX.Game.GetClosestPlayer()

            if cPlayer ~= closestPlayer then
                closestPlayer = cPlayer
            end

            local cPlayerPed = GetPlayerPed(closestPlayer)

            if DoesEntityExist(cPlayerPed) then
                DrawScriptMarker({
					["type"] = 2,
					["pos"] = GetEntityCoords(cPlayerPed) + vector3(0.0, 0.0, 1.2),
					["r"] = 0,
					["g"] = 0,
					["b"] = 255,
					["sizeX"] = 0.3,
					["sizeY"] = 0.3,
					["sizeZ"] = 0.3,
                    ["rotate"] = true,
                    ["bob"] = true
				})
            end
        end
    end)

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "main_accept_key", {
        ["title"] = "Queres entregar a chave?",
        ["align"] = Config.AlignMenu,
        ["elements"] = {
            {
                ["label"] = "Sim, dar.",
                ["action"] = "yes"
            },
            {
                ["label"] = "Não, cancelar.",
                ["action"] = "no"
            }
        }
    }, function(menuData, menuHandle)
        local action = menuData["current"]["action"]
        
        menuHandle.close()

        if action == "yes" then
            callback(closestPlayer)
        else
            callback(false)
        end
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end