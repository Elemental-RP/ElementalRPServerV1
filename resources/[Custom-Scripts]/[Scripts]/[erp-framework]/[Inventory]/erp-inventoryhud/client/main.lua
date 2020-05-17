isInInventory = false
ESX = nil

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if IsControlJustReleased(0, Config.OpenControl) and IsInputDisabled(0) then
                openInventory()
            end
        end
    end
)

RegisterNetEvent('general:openinv')
AddEventHandler('general:openinv', function()
    openInventory()
end)

function openInventory()
    loadPlayerInventory()
    isInInventory = true
    SendNUIMessage(
        {
            action = "display",
            type = "normal"
        }
    )
    SetNuiFocus(true, true)
end

RegisterNetEvent("erp-inventoryhud:doClose")
AddEventHandler("erp-inventoryhud:doClose", function()
    closeInventory()
end)

RegisterCommand('closeinv', function(source, args, raw)
    closeInventory()
end)

function closeInventory()
    isInInventory = false
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    SetNuiFocus(false, false)
end

RegisterNUICallback(
    "NUIFocusOff",
    function()
        closeInventory()
    end
)

RegisterNUICallback(
    "GetNearPlayers",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayers = false
        local elements = {}

        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                foundPlayers = true

                table.insert(
                    elements,
                    {
                        label = GetPlayerName(players[i]),
                        player = GetPlayerServerId(players[i])
                    }
                )
            end
        end

        if not foundPlayers then
            exports.pNotify:SendNotification(
                {
                    text = _U("players_nearby"),
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "inventoryhud"
                }
            )
        else
            SendNUIMessage(
                {
                    action = "nearPlayers",
                    foundAny = foundPlayers,
                    players = elements,
                    item = data.item
                }
            )
        end

        cb("ok")
    end
)

RegisterNUICallback(
    "UseItem",
    function(data, cb)
        TriggerServerEvent("esx:useItem", data.item.name)

        if shouldCloseInventory(data.item.name) then
            closeInventory()
        else
            Citizen.Wait(250)
            loadPlayerInventory()
        end

        cb("ok")
    end
)

RegisterNUICallback(
    "DropItem",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
        end

        Wait(250)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "GiveItem",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayer = false
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                if GetPlayerServerId(players[i]) == data.player then
                    foundPlayer = true
                end
            end
        end

        if foundPlayer then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            exports['mythic_progbar']:Progress({
              name = "giveitemPROGBAR",
              duration = 250,
              label = 'A dar item',
              useWhileDead = false,
              canCancel = false,
              controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
              },
              animation = {
                animDict = "mp_common",
                anim = "givetake1_a",
                flags = 49,
              }
            }, function(cancelled)
              if not cancelled then
                TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
                Wait(250)
                loadPlayerInventory()
              end
            end)
        else
            exports.pNotify:SendNotification(
                {
                    text = _U("player_nearby"),
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "inventoryhud"
                }
            )
        end
        cb("ok")
    end
)

function shouldCloseInventory(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

function shouldSkipAccount(accountName)
    for index, value in ipairs(Config.ExcludeAccountsList) do
        if value == accountName then
            return true
        end
    end

    return false
end

function loadPlayerInventory()
    ESX.TriggerServerCallback(
        "erp-inventoryhud:getPlayerInventory",
        function(data)
            items = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons

            if Config.IncludeCash and money ~= nil and money > 0 then
                moneyData = {
                    label = _U("cash"),
                    name = "cash",
                    type = "item_money",
                    count = money,
                    usable = false,
                    rare = false,
                    weight = -1,
                    canRemove = true
                }

                table.insert(items, moneyData)
            end

            if Config.IncludeAccounts and accounts ~= nil then
                for key, value in pairs(accounts) do
                    if not shouldSkipAccount(accounts[key].name) then
                        local canDrop = accounts[key].name ~= "bank"

                        if accounts[key].money > 0 then
                            accountData = {
                                label = accounts[key].label,
                                count = accounts[key].money,
                                type = "item_account",
                                name = accounts[key].name,
                                usable = false,
                                rare = false,
                                weight = -1,
                                canRemove = canDrop
                            }
                            table.insert(items, accountData)
                        end
                    end
                end
            end

            if inventory ~= nil then
                for key, value in pairs(inventory) do
                    if inventory[key].count <= 0 then
                        inventory[key] = nil
                    else
                        inventory[key].type = "item_standard"
                        table.insert(items, inventory[key])
                    end
                end
            end

            if Config.IncludeWeapons and weapons ~= nil then
                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if weapons[key].name ~= "WEAPON_UNARMED" then
                        local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                        table.insert(
                            items,
                            {
                                label = weapons[key].label,
                                count = ammo,
                                weight = -1,
                                type = "item_weapon",
                                name = weapons[key].name,
                                usable = false,
                                rare = false,
                                canRemove = true
                            }
                        )
                    end
                end
            end

            SendNUIMessage(
                {
                    action = "setItems",
                    itemList = items
                }
            )
        end,
        GetPlayerServerId(PlayerId())
    )
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            if isInInventory then
                local playerPed = PlayerPedId()
                DisableControlAction(0, 1, true) -- Disable pan
                DisableControlAction(0, 2, true) -- Disable tilt
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 263, true) -- Melee Attack 1
                DisableControlAction(0, 32, true) -- W
                DisableControlAction(0, 34, true) -- A
                DisableControlAction(0, 31, true) -- S (fault in Keys table!)
                DisableControlAction(0, 30, true) -- D (fault in Keys table!)

                DisableControlAction(0, 45, true) -- Reload
                DisableControlAction(0, 22, true) -- Jump
                DisableControlAction(0, 44, true) -- Cover
                DisableControlAction(0, 37, true) -- Select Weapon
                DisableControlAction(0, 23, true) -- Also 'enter'?

                DisableControlAction(0, 288, true) -- Disable phone
                DisableControlAction(0, 289, true) -- Inventory
                DisableControlAction(0, 170, true) -- Animations
                DisableControlAction(0, 167, true) -- Job

                DisableControlAction(0, 0, true) -- Disable changing view
                DisableControlAction(0, 26, true) -- Disable looking behind
                DisableControlAction(0, 73, true) -- Disable clearing animation
                DisableControlAction(2, 199, true) -- Disable pause screen

                DisableControlAction(0, 59, true) -- Disable steering in vehicle
                DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
                DisableControlAction(0, 72, true) -- Disable reversing in vehicle

                DisableControlAction(2, 36, true) -- Disable going stealth

                DisableControlAction(0, 47, true) -- Disable weapon
                DisableControlAction(0, 264, true) -- Disable melee
                DisableControlAction(0, 257, true) -- Disable melee
                DisableControlAction(0, 140, true) -- Disable melee
                DisableControlAction(0, 141, true) -- Disable melee
                DisableControlAction(0, 142, true) -- Disable melee
                DisableControlAction(0, 143, true) -- Disable melee
                DisableControlAction(0, 75, true) -- Disable exit vehicle
                DisableControlAction(27, 75, true) -- Disable exit vehicle
            end
        end
    end
)
