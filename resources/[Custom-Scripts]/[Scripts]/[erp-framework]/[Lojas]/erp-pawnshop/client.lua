--------------------------------
------- Created by Hamza -------
-------------------------------- 

ESX = nil
local insideMarker = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

-- Core Thread Function:
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.PawnZones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.ShopMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.975, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.ShopMarkerScale.x, Config.ShopMarkerScale.y, Config.ShopMarkerScale.z, Config.ShopMarkerColor.r,Config.ShopMarkerColor.g,Config.ShopMarkerColor.b,Config.ShopMarkerColor.a, false, true, 2, true, false, false, false)						
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.ShopDraw3DText)
					if IsControlJustPressed(0, Config.KeyToOpenShop) then
						PawnShopMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
	end
end)

-- Function for Pawn Shop Main Menu:
PawnShopMenu = function()
	local player = PlayerPedId()
	FreezeEntityPosition(player,true)
	
	local elements = {
		{ label = "Comprar", action = "PawnShop_Buy_Menu" },
		{ label = "Vender", action = "PawnShop_Sell_Menu" },
	}
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "erp_pawnshop_main_menu",
		{
			title    = "Penhores",
			align    = "right",
			elements = elements
		},
	function(data, menu)
		local action = data.current.action

		if action == "PawnShop_Buy_Menu" then
			PawnShopBuyMenu()
		elseif action == "PawnShop_Sell_Menu" then
			PawnShopSellMenu()
		end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		FreezeEntityPosition(player,false)
	end, function(data, menu)
	end)
end

-- Function for Pawn Shop Buy Menu:
function PawnShopBuyMenu()
	local player = PlayerPedId()
	FreezeEntityPosition(player,true)
	local elements = {}
			
	for k,v in pairs(Config.ItemsInPawnShop) do
		if v.BuyInPawnShop == true then
			table.insert(elements,{label = v.label .. " | "..('<span style="color:green;">%s</span>'):format("$"..v.BuyPrice..""), itemName = v.itemName, BuyInPawnShop = v.BuyInPawnShop, BuyPrice = v.BuyPrice})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "erp_pawnshop_buy_menu",
		{
			title    = "O que queres comprar?",
			align    = "right",
			elements = elements
		},
	function(data, menu)
			if data.current.itemName == data.current.itemName then
				OpenBuyDialogMenu(data.current.itemName,data.current.BuyPrice)
			end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		FreezeEntityPosition(player,false)
	end, function(data, menu)
	end)
end

-- Function for Pawn Shop Buy Dialog
function OpenBuyDialogMenu(itemName, BuyPrice)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'erp_pawnshop_amount_to_buy_dialog', {
		title = "Quantidade?"
	}, function(data, menu)
		menu.close()
		amountToBuy = tonumber(data.value)
		totalBuyPrice = (BuyPrice * amountToBuy)
		TriggerServerEvent("erp-pawnshop:BuyItem",amountToBuy,totalBuyPrice,itemName)
	end,
	function(data, menu)
		menu.close()	
	end)
end

-- Function for Pawn Shop Sell Menu:
function PawnShopSellMenu()
	local player = PlayerPedId()
	FreezeEntityPosition(player,true)
	local elements = {}
			
	for k,v in pairs(Config.ItemsInPawnShop) do
		if v.SellInPawnShop == true then
			table.insert(elements,{label = v.label .. " | "..('<span style="color:green;">%s</span>'):format("$"..v.SellPrice..""), itemName = v.itemName, SellInPawnShop = v.SellInPawnShop, SellPrice = v.SellPrice})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "erp_pawnshop_sell_menu",
		{
			title    = "O que queres vender?",
			align    = "right",
			elements = elements
		},
	function(data, menu)
			if data.current.itemName == data.current.itemName then
				OpenSellDialogMenu(data.current.itemName,data.current.SellPrice)
			end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		FreezeEntityPosition(player,false)
	end, function(data, menu)
	end)
end

-- Function for Pawn Shop Sell Dialog
function OpenSellDialogMenu(itemName, SellPrice)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'erp_pawnshop_amount_to_sell_dialog', {
		title = "Quantidade?"
	}, function(data, menu)
		menu.close()
		amountToSell = tonumber(data.value)
		totalSellPrice = (SellPrice * amountToSell)
		TriggerServerEvent("erp-pawnshop:SellItem",amountToSell,totalSellPrice,itemName)
	end,
	function(data, menu)
		menu.close()	
	end)
end

-- Blip on Map for Pawn Shops:
Citizen.CreateThread(function()
	if Config.EnablePawnShopBlip == true then	
		for k,v in pairs(Config.PawnZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.BlipSprite)
				SetBlipDisplay(blip, Config.BlipDisplay)
				SetBlipScale  (blip, Config.BlipScale)
				SetBlipColour (blip, Config.BlipColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.BlipName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end	
end)

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end
