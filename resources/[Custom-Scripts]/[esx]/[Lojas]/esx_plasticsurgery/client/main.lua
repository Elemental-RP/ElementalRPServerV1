ESX                           = nil
local GUI                     = {}
GUI.Time                      = 0
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasPayed                = false

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

function OpenShopMenu()

	HasPayed = false

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)

		menu.close()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'shop_confirm',
			{
				title = _U('valid_purchase'),
				align = 'bottom-right',
				elements = {
					{label = _U('yes'), value = 'yes'},
					{label = _U('no'), value = 'no'},
				}
			},
			function(data, menu)

				menu.close()

				if data.current.value == 'yes' then

					ESX.TriggerServerCallback('esx_plasticsurgery:checkMoney', function(hasEnoughMoney)

						if hasEnoughMoney then

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)

							TriggerServerEvent('esx_plasticsurgery:pay')

							HasPayed = true
						else

							TriggerEvent('esx_skin:getLastSkin', function(skin)
								TriggerEvent('skinchanger:loadSkin', skin)
							end)

							ESX.ShowNotification(_U('not_enough_money'))
						
						end

					end)

				end

				if data.current.value == 'no' then

					TriggerEvent('esx_skin:getLastSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)

				end

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = _U('press_access')
				CurrentActionData = {}

			end,
			function(data, menu)

				menu.close()

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = _U('press_access')
				CurrentActionData = {}

			end
		)

	end, function(data, menu)

			menu.close()

			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_access')
			CurrentActionData = {}

	end, {
		'sex',
		'face',
		'age_1',
		'age_2',
		'beard_1',
		'beard_2',
		'beard_3',
		'beard_4',
		'hair_1',
		'hair_2',
		'eye_color',
		'hair_color_1',
		'hair_color_2',
		'eyebrows_1',
		'eyebrows_2',
		'eyebrows_3',
		'eyebrows_4',
		'ears_1',
		'ears_2',
	})

end

AddEventHandler('esx_plasticsurgery:hasEnteredMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('press_access')
	CurrentActionData = {}
end)

AddEventHandler('esx_plasticsurgery:hasExitedMarker', function(zone)
	
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil

	if not HasPayed then

		TriggerEvent('esx_skin:getLastSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)

	end

end)

Citizen.CreateThread(function()

	for i=1, #Config.Shops, 1 do

		local blip = AddBlipForCoord(Config.Shops[i].x, Config.Shops[i].y, Config.Shops[i].z)

		SetBlipSprite (blip, 365)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 81)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('Cirugiao'))
		EndTextCommandSetBlipName(blip)
	end

end)

Citizen.CreateThread(function()
	while true do
		
		Wait(0)
		
		local coords = GetEntityCoords(GetPlayerPed(-1))
		
		for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end

	end
end)

Citizen.CreateThread(function()
	while true do
		
		Wait(0)
		
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('esx_plasticsurgery:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_plasticsurgery:hasExitedMarker', LastZone)
		end

	end
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  38) and (GetGameTimer() - GUI.Time) > 300 then
				
				if CurrentAction == 'shop_menu' then
					OpenShopMenu()
				end

				CurrentAction = nil
				GUI.Time      = GetGameTimer()
				
			end

		end

	end
end)

local blips = {
	{x = -449.08,  y = -340.17,  z = 34.5,  heading= 77.08,  scale=1.0},
}

Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_doctor_01"))
    while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
        Wait(1)
    end

    for _, item in pairs(blips) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
        SetBlipSprite(item.blip, item.id)
        SetBlipColour(item.blip, item.color)
        SetBlipAsShortRange(item.blip, true)
        SetBlipScale(item.blip, item.scale)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.name)
        EndTextCommandSetBlipName(item.blip)

        CreatePed(4, 0xd47303ac, item.x, item.y, item.z, item.heading, false, true)
        SetEntityHeading(item.blip, item.heading)
        FreezeEntityPosition(item.blip, true)
        SetEntityInvincible(item.blip, true)
        SetBlockingOfNonTemporaryEvents(item.blip, true)
    end
end)
