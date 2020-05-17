ESX = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local ShopOpen = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)



function OpenBuyLicenseMenu(zone)
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license', {
		title = _U('buy_license'),
		align = 'bottom-right',
		elements = {
			{ label = _U('no'), value = 'no' },
			{ label = _U('yes', ('<span style="color: green;">%s</span>'):format((_U('shop_menu_item', ESX.Math.GroupDigits(Config.LicensePrice))))), value = 'yes' },
		}
	}, function(data, menu)
		if data.current.value == 'yes' then
			ESX.TriggerServerCallback('esx_weaponshop:buyLicense', function(bought)
				if bought then
					menu.close()
					OpenShopMenu(zone)
				end
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end


function OpenShopMenu(zone)
	local elements = {}
	local buyAmmo = {}
	ShopOpen = true
	local playerPed = PlayerPedId()
	PlayerData = ESX.GetPlayerData()

	for k,v in ipairs(Config.Zones[zone].Items) do
		local weaponNum, weapon = ESX.GetWeapon(v.weapon)
		local components, label = {}

		local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

		if v.components then
			for i=1, #v.components do
				if v.components[i] then

					local component = weapon.components[i]
					local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

					if hasComponent then
						label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('gunshop_owned'))
					else
						if v.components[i] > 0 then
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('gunshop_item', ESX.Math.GroupDigits(v.components[i])))
						else
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('gunshop_free'))
						end
					end

					table.insert(components, {
						label = label,
						componentLabel = component.label,
						hash = component.hash,
						name = component.name,
						price = v.components[i],
						hasComponent = hasComponent,
						componentNum = i
					})
				end
			end
			table.insert(components, {
				label = _U('buy_ammo')..'<span style="color:green;">'..ESX.Math.GroupDigits(v.ammoPrice)..' $ </span>',
				type = 'ammo',
				price = v.ammoPrice,
				weapon = weapon.name,
				ammoNumber = v.AmmoToGive
			})
		end

		if hasWeapon and v.components then
			label = ('%s: <span style="color:green;">></span>'):format(weapon.label)
		elseif hasWeapon and not v.components and v.ammoPrice ~= nil then
			label = ('%s: <span style="color:green;">></span>'):format(weapon.label)
		elseif hasWeapon and not v.components and v.ammoPrice  == nil then
			label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('gunshop_owned'))
		else
			if v.price > 0 then
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('gunshop_item', ESX.Math.GroupDigits(v.price)))
			else
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('gunshop_free'))
			end
		end
		
		table.insert(elements, {
			label = label,
			weaponLabel = weapon.label,
			name = weapon.name,
			components = components,
			price = v.price,
			ammoPrice = v.ammoPrice,
			ammoNumber = v.AmmoToGive,
			hasWeapon = hasWeapon
		})
		
	end
	PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gunshop_buy_weapons', {
		title    = _U('gunshop_weapontitle'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.hasWeapon then
			if #data.current.components > 0 then
				OpenWeaponComponentShopMenu(data.current.components, data.current.name, menu, zone)
			elseif data.current.ammoPrice ~= nil then

				table.insert(buyAmmo, {
					label = _U('buy_ammo')..'<span style="color:green;">'..ESX.Math.GroupDigits(data.current.ammoPrice)..' $ </span>',
					price = data.current.ammoPrice,
					weapon = data.current.name,
					ammoToBuy = data.current.ammoNumber
				})
				print(ESX.DumpTable(buyAmmo))
				OpenAmmoShopMenu(buyAmmo,data.current.name,menu,zone)
			end
			
		else
			ESX.TriggerServerCallback('esx_weaponshop:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						DisplayBoughtScaleform('weapon',data.current.name, ESX.Math.GroupDigits(data.current.price))
					end
					PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
					menu.close()
					OpenShopMenu(zone)
					ShopOpen = false
				else
					PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
				end
			end, data.current.name, 1, nil, zone)
		end

	end, function(data, menu)
		PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
		ShopOpen = false
		menu.close()
	end)

end

function OpenWeaponComponentShopMenu(components, weaponName, parentShop,zone)
	ShopOpen = true
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gunshop_buy_weapons_components', {
		title    = _U('gunshop_componenttitle'),
		align    = 'bottom-right',
		elements = components
	}, function(data, menu)

		if data.current.hasComponent and data.current.type ~= 'ammo'then
			ESX.ShowNotification(_U('gunshop_hascomponent'))
		elseif data.current.type ~= 'ammo' then

			ESX.TriggerServerCallback('esx_weaponshop:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						DisplayBoughtScaleform('component',data.current.componentLabel, ESX.Math.GroupDigits(data.current.price))
					end
					ShopOpen = false
					menu.close()
					parentShop.close()
					PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
					OpenShopMenu(zone)
				else
					PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
				end
			end, weaponName, 2, data.current.componentNum, zone)
		elseif data.current.type == 'ammo' then
			local ReachedMax = ReachedMaxAmmo(weaponName)
			ESX.TriggerServerCallback('esx_weaponshop:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('gunshop_bought',_U('ammo'),ESX.Math.GroupDigits(data.current.price)))
						AddAmmoToPed(PlayerPedId(), weaponName, data.current.ammoNumber)
					end
					parentShop.close()
				else
					if ReachedMax then
						ESX.ShowNotification(_U('gunshop_maxammo'))
					end
					PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
				end
			end, weaponName, 3, nil, zone, ReachedMax)
		end

	end, function(data, menu)
		PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
		ShopOpen = false
		menu.close()
	end)
end

function OpenAmmoShopMenu(buyAmmo,weaponName, parentShop,zone)
	ShopOpen = true
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gunshop_buy_weapons_components', {
		title    = _U('gunshop_componenttitle'),
		align    = 'bottom-right',
		elements = buyAmmo
	}, function(data, menu)
		local ReachedMax = ReachedMaxAmmo(weaponName)
		ESX.TriggerServerCallback('esx_weaponshop:buyWeapon', function(bought)
			if bought then
				if data.current.price > 0 then
					ESX.ShowNotification(_U('gunshop_bought',_U('ammo'),ESX.Math.GroupDigits(data.current.price)))
					AddAmmoToPed(PlayerPedId(), weaponName, data.current.ammoToBuy)
				end
				parentShop.close()
			else
				if ReachedMax then
					ESX.ShowNotification(_U('gunshop_maxammo'))
				end
				PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
			end
		end, weaponName, 3, nil, zone, ReachedMax)

	end, function(data, menu)
		menu.close()
	end)
end

function DisplayBoughtScaleform(type, item, price)
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = 4

	if type == 'component' then
		text = _U('gunshop_bought', item, ESX.Math.GroupDigits(price))
		text2 = nil
		text3 = nil
	elseif type == 'weapon' then
		text2 = ESX.GetWeaponLabel(item)
		text = _U('gunshop_bought', text2, ESX.Math.GroupDigits(price))
		text3 = GetHashKey(item)
	end


	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString(text)
	if text2 then
		PushScaleformMovieMethodParameterString(text2)
	end
	if text3 then
		PushScaleformMovieMethodParameterInt(text3)
	end
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

AddEventHandler('esx_weaponshop:hasEnteredMarker', function(zone)
	if zone == 'GunShop' or zone == 'BlackWeashop' then
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
	end
end)

AddEventHandler('esx_weaponshop:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if ShopOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Zones) do
		if v.Legal then
			for i = 1, #v.Locations, 1 do
				local blip = AddBlipForCoord(v.Locations[i])

				SetBlipSprite (blip, 110)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 1.0)
				SetBlipColour (blip, 81)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName(_U('map_blip'))
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local coords = GetEntityCoords(PlayerPedId())

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Locations, 1 do
				if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Locations[i], true) < Config.DrawDistance) then
					DrawMarker(Config.Type, v.Locations[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker, currentZone = false, nil

		for k,v in pairs(Config.Zones) do
			for i=1, #v.Locations, 1 do
				if GetDistanceBetweenCoords(coords, v.Locations[i], true) < Config.Size.x then
					isInMarker, ShopItems, currentZone, LastZone = true, v.Items, k, k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_weaponshop:hasEnteredMarker', currentZone)
		end
		
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_weaponshop:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then

				if CurrentAction == 'shop_menu' then
					if Config.LicenseEnable and Config.Zones[CurrentActionData.zone].Legal then
						ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
							if hasWeaponLicense then
								OpenShopMenu(CurrentActionData.zone)
							else
								OpenBuyLicenseMenu(CurrentActionData.zone)
							end
						end, GetPlayerServerId(PlayerId()), 'weapon')
					else
						OpenShopMenu(CurrentActionData.zone)
					end
				end

				CurrentAction = nil
			end
		end
	end
end)


function ReachedMaxAmmo(weaponName)

	local ammo = GetAmmoInPedWeapon(PlayerPedId(), weaponName)
	local _,maxAmmo = GetMaxAmmo(PlayerPedId(), weaponName)

	if ammo ~= maxAmmo then
		return false
	else
		return true
	end

end