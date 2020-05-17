erp_calls.ESX.Summon(function(ESX)

local current

local coords
local blip

erp_calls.NetEvent('erp_service_request:call',
    function(id)
        while current do
            Citizen.Wait(100)
        end

        current = id

        while current do
            ESX.ShowHelpNotification(_U('accept', Config.ControlName))

            if IsControlJustPressed(0, Config.ControlCode) then
                current = nil
                TriggerServerEvent('erp_service_request:accept', id)
                break
            end

            Citizen.Wait(1)
        end
    end)

erp_calls.NetEvent('erp_service_request:take',
    function(pos, name)
        if blip then
            RemoveBlip(blip)
            blip = nil
        end

        coords = vector3(pos.x, pos.y, pos.z)

        blip = AddBlipForCoord(coords)

        SetBlipDisplay(blip, 2)
        SetBlipSprite(blip, 58)
        SetBlipColour(blip, 24)
        SetBlipFlashes(blip, true)
        SetBlipRoute(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Chamada de ' .. name)
		EndTextCommandSetBlipName(blip)

        ESX.ShowNotification(_U('take'))
    end)

erp_calls.NetEvent('erp_service_request:stop',
    function(id)
        if current == id then
            current = nil
        end
    end)

erp_calls.Loop(500,
    function()
        if blip then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            if GetDistanceBetweenCoords(pos, coords, true) <= Config.BlipRadius then
                ESX.ShowNotification('Chegaste ao teu destino.')
                RemoveBlip(blip)
                blip = nil
            end
        else
            Citizen.Wait(1500)
        end
    end)

end)
