OpenStorage = function(storageId)
    local cachedStorage = cachedData["storages"][storageId]

    if not cachedStorage then
        cachedData["storages"][storageId] = {}
        cachedData["storages"][storageId]["items"] = {}
    end

    local menuElements = {
        {
            ["label"] = "Mete alguma coisa aqui.",
            ["action"] = "put_item"
        }
    }

    for itemIndex, itemData in ipairs(cachedData["storages"][storageId]["items"]) do
        if itemData["type"] and itemData["type"] == "weapon" then
            if not itemData["uniqueId"] then
                itemData["uniqueId"] = NetworkGetRandomInt()
            end
        end

        table.insert(menuElements, {
            ["label"] = itemData["label"] .. " - x" .. itemData["count"],
            ["action"] = itemData
        })
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "main_storage_menu_" .. tostring(storageId), {
        ["title"] = "Armário",
        ["align"] = Config.AlignMenu,
        ["elements"] = menuElements
    }, function(menuData, menuHandle)
        local action = menuData["current"]["action"]

        if action == "put_item" then
            ChooseItemMenu(function(itemPut)
                AddItemToStorage(storageId, itemPut)
            end)
        elseif type(action) == "table" then
            if action["type"] == "weapon" then
                TakeItemFromStorage(storageId, action)
            else
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "main_storage_count", {
                    ["title"] = "Quanto?"
                }, function(menuData, dialogHandle)
                    local newCount = tonumber(menuData["value"])

                    if not newCount then
                        return ESX.ShowNotification("Porfavor insere apenas numeros.")
                    elseif newCount > action["count"] then
                        newCount = action["count"]
                    elseif newCount < 1 then
                        newCount = 1
                    end

                    action["count"] = newCount

                    dialogHandle.close()
        
                    TakeItemFromStorage(storageId, action)
                end, function(menuData, dialogHandle)
                    dialogHandle.close()
                end)
            end
        end
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end

ChooseItemMenu = function(callback)
    local playerInventory = ESX.GetPlayerData()["inventory"]

    local menuElements = {}

    if Config.DirtyMoney then
        local playerAccounts = ESX.GetPlayerData()["accounts"]

        for accountIndex, accountData in pairs(playerAccounts) do
            if accountData["name"] == "black_money" then
                accountData["count"] = accountData["money"]
                accountData["type"] = "black_money"

                table.insert(menuElements, {
                    ["label"] = accountData["label"] .. " - €" .. accountData["count"],
                    ["action"] = accountData
                })
            end
        end
    end
    
    if Config.Weapons then
        local weaponLoadout = ESX.GetPlayerData()["loadout"]

        for loadoutIndex, loadoutData in ipairs(weaponLoadout) do
            loadoutData["count"] = loadoutData["ammo"]
            loadoutData["type"] = "weapon"
            
            table.insert(menuElements, {
                ["label"] = loadoutData["label"] .. " - x" .. loadoutData["count"],
                ["action"] = loadoutData
            })
        end
    end

    for itemIndex, itemData in ipairs(playerInventory) do
        if itemData["count"] > 0 then
            itemData["type"] = "item"

            table.insert(menuElements, {
                ["label"] = itemData["label"] .. " - x" .. itemData["count"],
                ["action"] = itemData
            })
        end
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "main_storage_inventory_menu", {
        ["title"] = "Escolhe.",
        ["align"] = Config.AlignMenu,
        ["elements"] = menuElements
    }, function(menuData, menuHandle)
        local action = menuData["current"]["action"]

        if type(action) == "table" then
            if action["type"] == "weapon" then
                callback(action)

                menuHandle.close()
            else
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "main_storage_inventory_count", {
                    ["title"] = "Quanto?"
                }, function(menuData, dialogHandle)
                    local newCount = tonumber(menuData["value"])
    
                    if not newCount then
                        return ESX.ShowNotification("Porfavor insere um numero.")
                    elseif newCount > action["count"] then
                        newCount = action["count"]
                    elseif newCount < 1 then
                        newCount = 1
                    end
    
                    action["count"] = newCount
    
                    dialogHandle.close()
                    menuHandle.close()
        
                    callback(action)
                end, function(menuData, dialogHandle)
                    dialogHandle.close()
                end)
            end
        end
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end

AddItemToStorage = function(storageId, newItem)
    local cachedStorage = cachedData["storages"][storageId]

    if not cachedStorage then
        cachedData["storages"][storageId] = {}
        cachedData["storages"][storageId]["items"] = {}
    end

    local itemFound = false

    if newItem["type"] == "weapon" then
        newItem["uniqueId"] = NetworkGetRandomInt()
    else
        for itemIndex, itemData in ipairs(cachedStorage["items"]) do
            if itemData["name"] == newItem["name"] then
                cachedData["storages"][storageId]["items"][itemIndex]["count"] = cachedStorage["items"][itemIndex]["count"] + newItem["count"]
    
                itemFound = true
    
                break
            end
        end
    end

    if not itemFound then
        table.insert(cachedData["storages"][storageId]["items"], newItem)
    end

    ESX.TriggerServerCallback("erp-motels:addItemToStorage", function(updated)
        if updated then
            ESX.ShowNotification("Guardaste x" .. newItem["count"] .. " - " .. newItem["label"])
        end
    end, cachedData["storages"][storageId], newItem, storageId)
end

TakeItemFromStorage = function(storageId, newItem)
    local cachedStorage = cachedData["storages"][storageId]

    if not cachedStorage then
        return
    end

    local itemFound = false

    for itemIndex, itemData in ipairs(cachedStorage["items"]) do
        if newItem["type"] == "weapon" then
            if itemData["uniqueId"] == newItem["uniqueId"] then
                itemFound = true

                table.remove(cachedData["storages"][storageId]["items"], itemIndex)

                break
            end
        else
            if itemData["name"] == newItem["name"] then
                itemFound = true

                if cachedStorage["items"][itemIndex]["count"] - newItem["count"] <= 0 then
                    newItem["count"] = cachedStorage["items"][itemIndex]["count"]

                    table.remove(cachedData["storages"][storageId]["items"], itemIndex)
                else
                    cachedData["storages"][storageId]["items"][itemIndex]["count"] = cachedData["storages"][storageId]["items"][itemIndex]["count"] - newItem["count"]
                end

                break
            end
        end
    end

    if not itemFound then
        return
    end

    ESX.TriggerServerCallback("erp-motels:takeItemFromStorage", function(updated)
        if updated then
            ESX.ShowNotification("Retiraste x" .. newItem["count"] .. " - " .. newItem["label"])
        end
    end, cachedData["storages"][storageId], newItem, storageId)
end