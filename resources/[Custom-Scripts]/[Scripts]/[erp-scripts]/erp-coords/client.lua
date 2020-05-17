ESX                           = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('erp-coords')
AddEventHandler('erp-coords', function()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local codeA = "{x = "..round(x,2)..",  y = "..round(y,2)..",  z = "..round(z,2).."},"
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'codemenu',
        {
          title = "Nome"
        },
        function(data, menu)
            local name = data.value
            TriggerServerEvent('erp-coords:print', name.." : "..codeA)
            menu.close()
        end,
      function(data, menu)
        menu.close()
      end)
    
end)

RegisterNetEvent('erp-coords1')
AddEventHandler('erp-coords1', function()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local codeA = round(x,2)..", "..round(y,2)..", "..round(z,2)
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'codemenu',
        {
          title = "Nome"
        },
        function(data, menu)
            local name = data.value
            TriggerServerEvent('erp-coords:print', name.." : "..codeA)
            menu.close()
        end,
      function(data, menu)
        menu.close()
      end)
end)

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

-------------------------------------------------------------------------------------------------------------------------------
local coordsVisible = false

function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(7)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.40, 0.00)
end

Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
		
		if coordsVisible then
			sleepThread = 5

			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)

			DrawGenericText(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
		end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end

ToggleCoords = function()
	coordsVisible = not coordsVisible
end

RegisterCommand("coordenadas", function()
    ToggleCoords()
end)