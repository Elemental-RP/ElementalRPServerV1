
local currentTattoos = {}
local cam = -1
local inMenu = false
PlayerData = {}

_menuPool = NativeUI.CreatePool()
_menuPool:RefreshIndex()
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)


Citizen.CreateThread(function()
	addBlips()



	while true do
		Citizen.Wait(0)
		drawMarkers()
		_menuPool:ProcessMenus()
		if(isNearTattoosShop()) then
	--		print(ConfigTat.TextToOpenMenu)

			Info33(ConfigTat.TextToOpenMenu)
			if(IsControlJustPressed(1, ConfigTat.KeyToOpenMenu)) then
				inMenu = not inMenu
				_menuPool:CloseAllMenus()
				if(inMenu) then
					FreezeEntityPosition(GetPlayerPed(-1), true)
					openMenu()
				else
					FreezeEntityPosition(GetPlayerPed(-1), false)
					setPedSkin()
				end
			end
		end


		if(inMenu) then
			if(IsControlJustPressed(1, 177)) then
				_menuPool:CloseAllMenus()
				FreezeEntityPosition(GetPlayerPed(-1), false)
				RenderScriptCams(false, false, 0, 1, 0)
				DestroyCam(cam, false)
				setPedSkin()
				inMenu = false
			end
		elseif(DoesCamExist(cam)) then
			RenderScriptCams(false, false, 0, 1, 0)
			DestroyCam(cam, false)
		end
	end

end)








function openMenu()



	menuTattoo = NativeUI.CreateMenu("","Tatuagens", 5, 100,"shopui_title_tattoos4","shopui_title_tattoos4")
	_menuPool:Add(menuTattoo)
	menu = menuTattoo

	_menuPool:RefreshIndex()
	Citizen.Wait(200)
	menuTattoo:Visible(true)


	local elements = {}

	for _,k in pairs(tattoosCategories) do



		qsm = _menuPool:AddSubMenu(menu, k.name, "",true,true)
		for i,k in pairs(tattoosList[k.value]) do
			sea = NativeUI.CreateItem("Tatto n°"..i,"")
			sea:RightLabel(k.price..ConfigTat.MoneySymbol)
			qsm:AddItem(sea)
		end
		qsm.OnIndexChange = function(_, index)
			drawTattoo(index, k.value)
		end
		qsm.OnItemSelect = function(_, _, index)
			TriggerServerEvent("tattoos:save", currentTattoos, 500, {collection = k.value, texture = index})

		end
		

	
	end

	if(DoesCamExist(cam)) then
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	menu.OnMenuClosed = function(_)
		setPedSkin()
	end
	_menuPool:RefreshIndex()
end





function addBlips()

	for _,k in pairs(tattoosShops) do
		local blip = AddBlipForCoord(k.x, k.y, k.z)
		SetBlipSprite(blip, 75)
		SetBlipColour(blip, 1)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Loja de Tatuagens")
		EndTextCommandSetBlipName(blip)
	end

end


function drawMarkers()
end

function isNearTattoosShop()
	
	for _,k in pairs(tattoosShops) do
		local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), k.x,k.y,k.z, true)

		if(distance < 3) then
			
			return true
		end
	end
	Wait(500)
	return false

end



function setPedSkin()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, _)
        local model = nil

        if skin.sex == 0 then
          model = GetHashKey("mp_m_freemode_01")
        else
          model = GetHashKey("mp_f_freemode_01")
        end

        RequestModel(model)
        while not HasModelLoaded(model) do
          RequestModel(model)
          Citizen.Wait(1)
        end

        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)

        TriggerEvent('skinchanger:loadSkin', skin)
        TriggerEvent('esx:restoreLoadout')
    end)

    Citizen.Wait(1000)

    for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(tattoosList[k.collection][k.texture].nameHash))
	end
end




function drawTattoo(current, collection)


	SetEntityHeading(GetPlayerPed(-1), 297.7296)

	ClearPedDecorations(GetPlayerPed(-1))
	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(tattoosList[k.collection][k.texture].nameHash))
	end

	if(GetEntityModel(GetPlayerPed(-1)) == -1667301416) then  -- GIRL SKIN
		SetPedComponentVariation(GetPlayerPed(-1), 8, 34,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 3, 15,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 11, 101,1, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 4, 16,0, 2)
	else 													  -- BOY SKIN
		SetPedComponentVariation(GetPlayerPed(-1), 8, 15,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 3, 15,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 11, 91,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 4, 14,0, 2)
	end



	ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(collection), GetHashKey(tattoosList[collection][current].nameHash))

	if(not DoesCamExist(cam)) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

		SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
		SetCamRot(cam, 0.0, 0.0, 0.0)
		SetCamActive(cam,  true)
		RenderScriptCams(false, false, 0, 1, 0)

		SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
	end

	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))

	SetCamCoord(cam, x+tattoosList[collection][current].addedX, y+tattoosList[collection][current].addedY, z+tattoosList[collection][current].addedZ)
	SetCamRot(cam, 0.0, 0.0, tattoosList[collection][current].rotZ)
end




function cleanPlayer()
	ClearPedDecorations(GetPlayerPed(-1))
	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(tattoosList[k.collection][k.texture].nameHash))
	end
end


function Info33(text, loop)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, loop, 0, 0)
end






RegisterNetEvent("tattoos:getPlayerTattoos")
AddEventHandler("tattoos:getPlayerTattoos", function(playerTattoosList)
	print(json.encode(playerTattoosList))
	playerTattoosList = json.decode(playerTattoosList)
	for i = 1,#playerTattoosList,1 do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(playerTattoosList[i].collection), GetHashKey(tattoosList[playerTattoosList[i].collection][playerTattoosList[i].texture].nameHash))
	end
	currentTattoos = playerTattoosList
end)



local firstLoad = false
AddEventHandler("skinchanger:loadSkin", function(_)
	if(not firstLoad) then
		Citizen.CreateThread(function()

			while not (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") or GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01")) do
				Citizen.Wait(10)
			end
			Citizen.Wait(750)
			TriggerServerEvent("tattoos:GetPlayerTattoos_s")
		end)
		firstLoad = true
	else
		Citizen.Wait(750)

		for i = 1,#currentTattoos,1 do
			ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(currentTattoos[i].collection), GetHashKey(tattoosList[currentTattoos[i].collection][currentTattoos[i].texture].nameHash))
		end
	end
end)


RegisterNetEvent("tattoo:buySuccess")
AddEventHandler("tattoo:buySuccess", function(value)
	table.insert(currentTattoos, value)
end)