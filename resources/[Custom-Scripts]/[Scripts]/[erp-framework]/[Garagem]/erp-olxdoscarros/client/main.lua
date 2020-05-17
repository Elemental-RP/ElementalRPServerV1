ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("erp-olxdoscarros:Dar")
AddEventHandler("erp-olxdoscarros:Dar", function()
	venderCarro()
end)

function venderCarro()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local vehicle
	if IsPedInAnyVehicle(playerPed,  false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
	end
	
	local plate = GetVehicleNumberPlateText(vehicle)
	local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
	
	ESX.TriggerServerCallback('erp-olxdoscarros:requestPlayerCars', function(isOwnedVehicle)
		if isOwnedVehicle then
			ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'valor_carro',{
					title = "Introduza o preço a que quer vender o carro:"
				  },
				  function(data2, menu2)
					local amount = tonumber(data2.value)
					if amount == nil or amount < 0 then
						exports['mythic_notify']:SendAlert('error', 'Quantia inválida')
					else
						menu2.close()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							exports['mythic_notify']:SendAlert('inform', 'Sem Jogadores por perto!')
						else
							TriggerServerEvent("erp-olxdoscarros:proposta",GetPlayerServerId(closestPlayer),vehicleProps.plate,amount)
						end
					end
				end,
				function(data2, menu2)
					menu2.close()
			end)
		else
			exports['mythic_notify']:SendAlert('inform', 'Este veículo não te pertence!')
		end
	end, vehicleProps.plate)
end

RegisterNetEvent("erp-olxdoscarros:aceitarproposta")
AddEventHandler("erp-olxdoscarros:aceitarproposta", function(vendedor,plate,preco)
	local elements = {}
	table.insert(elements, {label= "Aceitar Proposta", value = "sim"})
	table.insert(elements, {label= "Recusar Proposta", value = "nao"})
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'propsta', {
		title    = "Proposta de Compra do Veículo com a matrícula " .. plate .. " por " .. preco .. "€ ?",
		align    = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == "sim" then
			TriggerServerEvent("erp-olxdoscarros:respostas",vendedor,true,preco,plate)
		end
		if data.current.value == "nao" then
			TriggerServerEvent("erp-olxdoscarros:respostas",vendedor,false,preco,plate)
		end
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end)
