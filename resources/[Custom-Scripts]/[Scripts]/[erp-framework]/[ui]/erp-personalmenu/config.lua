local Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57, 
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177, 
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70, 
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
	['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118
}

Config = {}

-- LANGUAGE --
Config.Locale = 'br'

-- GENERAL --
Config.MenuTitle = 'Elemental RP' -- change it to you're server name
Config.NoclipSpeed = 1.0 -- change it to change the speed in noclip

-- CONTROLS --
Config.Controls = {
	OpenMenu = {keyboard = Keys['K']},
	HandsUP = {keyboard = Keys['X']},
	Pointing = {keyboard = Keys['B']},
	Crouch = {keyboard = Keys['LEFTCTRL']},
	TPMarker = {keyboard1 = Keys['LEFTALT'], keyboard2 = Keys['E']}
}

-- GPS --
Config.GPS = {
	{label = 'Remover Destino do GPS', coords = nil},
	{label = 'Esquadra', coords = vector2(425.13, -979.55)},
	{label = 'Garage Central', coords = vector2(215.06, -791.56)},
	{label = 'Hospital', coords = vector2(-449.67, -340.83)},
	{label = 'Concessionária', coords = vector2(-33.88, -1102.37)},
	{label = 'Benny\'s Custom', coords = vector2(-212.13, -1325.27)},
	{label = 'Centro de Emprego', coords = vector2(-264.83, -964.54)},
	{label = 'Escola de Condução', coords = vector2(-829.22, -696.99)},
	{label = 'Téquila-la', coords = vector2(-565.09, 273.45)},
	{label = 'Bahama Mamas', coords = vector2(-1391.06, -590.34)}
}

-- ADMIN --
Config.Admin = {
	{
		name = 'goto',
		label = _U('admin_goto_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			local plyId = KeyboardInput('KORIOZ_BOX_ID', _U('dialogbox_playerid'), '', 8)

			if plyId ~= nil then
				plyId = tonumber(plyId)
				
				if type(plyId) == 'number' then
					TriggerServerEvent('KorioZ-PersonalMenu:Admin_BringS', GetPlayerServerId(PlayerId()), plyId)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'bring',
		label = _U('admin_bring_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			local plyId = KeyboardInput('KORIOZ_BOX_ID', _U('dialogbox_playerid'), '', 8)

			if plyId ~= nil then
				plyId = tonumber(plyId)
				
				if type(plyId) == 'number' then
					TriggerServerEvent('KorioZ-PersonalMenu:Admin_BringS', GetPlayerServerId(PlayerId()), plyId)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'tpxyz',
		label = _U('admin_tpxyz_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local pos = KeyboardInput('KORIOZ_BOX_XYZ', _U('dialogbox_xyz'), '', 50)

			if pos ~= nil and pos ~= '' then
				local _, _, x, y, z = string.find(pos, '([%d%.]+) ([%d%.]+) ([%d%.]+)')
						
				if x ~= nil and y ~= nil and z ~= nil then
					SetEntityCoords(plyPed, x + .0, y + .0, z + .0)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'noclip',
		label = _U('admin_noclip_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			Player.noclip = not Player.noclip

			if Player.noclip then
				FreezeEntityPosition(plyPed, true)
				SetEntityInvincible(plyPed, true)
				SetEntityCollision(plyPed, false, false)

				SetEntityVisible(plyPed, false, false)

				SetEveryoneIgnorePlayer(PlayerId(), true)
				SetPoliceIgnorePlayer(PlayerId(), true)
				ESX.ShowNotification(_U('admin_noclipon'))
			else
				FreezeEntityPosition(plyPed, false)
				SetEntityInvincible(plyPed, false)
				SetEntityCollision(plyPed, true, true)

				SetEntityVisible(plyPed, true, false)

				SetEveryoneIgnorePlayer(PlayerId(), false)
				SetPoliceIgnorePlayer(PlayerId(), false)
				ESX.ShowNotification(_U('admin_noclipoff'))
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'godmode',
		label = _U('admin_godmode_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			Player.godmode = not Player.godmode

			if Player.godmode then
				SetEntityInvincible(plyPed, true)
				ESX.ShowNotification(_U('admin_godmodeon'))
			else
				SetEntityInvincible(plyPed, false)
				ESX.ShowNotification(_U('admin_godmodeoff'))
			end
		end
	},
	{
		name = 'ghostmode',
		label = _U('admin_ghostmode_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			Player.ghostmode = not Player.ghostmode

			if Player.ghostmode then
				SetEntityVisible(plyPed, false, false)
				ESX.ShowNotification(_U('admin_ghoston'))
			else
				SetEntityVisible(plyPed, true, false)
				ESX.ShowNotification(_U('admin_ghostoff'))
			end
		end
	},
	{
		name = 'spawnveh',
		label = _U('admin_spawnveh_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			local modelName = KeyboardInput('KORIOZ_BOX_VEHICLE_NAME', _U('dialogbox_vehiclespawner'), '', 50)

			if modelName ~= nil then
				modelName = tostring(modelName)

				if type(modelName) == 'string' then
					ESX.Game.SpawnVehicle(modelName, GetEntityCoords(plyPed), GetEntityHeading(plyPed), function(vehicle)
						TaskWarpPedIntoVehicle(plyPed, vehicle, -1)
					end)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'repairveh',
		label = _U('admin_repairveh_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local plyVeh = GetVehiclePedIsIn(plyPed, false)
			SetVehicleFixed(plyVeh)
			SetVehicleDirtLevel(plyVeh, 0.0)
		end
	},
	{
		name = 'flipveh',
		label = _U('admin_flipveh_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local plyCoords = GetEntityCoords(plyPed)
			local newCoords = plyCoords + vector3(0.0, 2.0, 0.0)
			local closestVeh = GetClosestVehicle(plyCoords, 10.0, 0, 70)

			SetEntityCoords(closestVeh, newCoords)
			ESX.ShowNotification(_U('admin_vehicleflip'))
		end
	},
	{
		name = 'givemoney',
		label = _U('admin_givemoney_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			local amount = KeyboardInput('KORIOZ_BOX_AMOUNT', _U('dialogbox_amount'), '', 8)

			if amount ~= nil then
				amount = tonumber(amount)

				if type(amount) == 'number' then
					TriggerServerEvent('KorioZ-PersonalMenu:Admin_giveCash', amount)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'givebank',
		label = _U('admin_givebank_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			local amount = KeyboardInput('KORIOZ_BOX_AMOUNT', _U('dialogbox_amount'), '', 8)

			if amount ~= nil then
				amount = tonumber(amount)

				if type(amount) == 'number' then
					TriggerServerEvent('KorioZ-PersonalMenu:Admin_giveBank', amount)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'givedirtymoney',
		label = _U('admin_givedirtymoney_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			local amount = KeyboardInput('KORIOZ_BOX_AMOUNT', _U('dialogbox_amount'), '', 8)

			if amount ~= nil then
				amount = tonumber(amount)

				if type(amount) == 'number' then
					TriggerServerEvent('KorioZ-PersonalMenu:Admin_giveDirtyMoney', amount)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'showxyz',
		label = _U('admin_showxyz_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			Player.showCoords = not Player.showCoords
		end
	},
	{
		name = 'showname',
		label = _U('admin_showname_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			Player.showName = not Player.showName

			if not showname then
				for k, v in pairs(Player.gamerTags) do
					RemoveMpGamerTag(v)
					Player.gamerTags[k] = nil
				end
			end
		end
	},
	{
		name = 'tpmarker',
		label = _U('admin_tpmarker_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local waypointHandle = GetFirstBlipInfoId(8)

			if DoesBlipExist(waypointHandle) then
				Citizen.CreateThread(function()
					local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
					local foundGround, zCoords, zPos = false, -500.0, 0.0

					while not foundGround do
						zCoords = zCoords + 10.0
						RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
						Citizen.Wait(0)
						foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

						if not foundGround and zCoords >= 2000.0 then
							foundGround = true
						end
					end

					SetPedCoordsKeepVehicle(plyPed, waypointCoords.x, waypointCoords.y, zPos)
					ESX.ShowNotification(_U('admin_tpmarker'))
				end)
			else
				ESX.ShowNotification(_U('admin_nomarker'))
			end
		end
	},
	{
		name = 'revive',
		label = _U('admin_revive_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local plyId = KeyboardInput('KORIOZ_BOX_ID', _U('dialogbox_playerid'), '', 8)

			if plyId ~= nil then
				plyId = tonumber(plyId)
				
				if type(plyId) == 'number' then
					TriggerServerEvent('esx_ambulancejob:revive', plyId)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'changeskin',
		label = _U('admin_changeskin_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			RageUI.CloseAll()
			Citizen.Wait(100)
			TriggerEvent('esx_skin:openSaveableMenu')
		end
	},
	{
		name = 'saveskin',
		label = _U('admin_saveskin_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			TriggerEvent('esx_skin:requestSaveSkin')
		end
	}
}