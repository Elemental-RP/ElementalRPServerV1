ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.EnableESXService then
	TriggerEvent('esx_service:activateService', 'aztecas', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'aztecas', _U('alert_aztecas'), true, true)
TriggerEvent('esx_society:registerSociety', 'aztecas', 'aztecas', 'society_aztecas', 'society_aztecas', 'society_aztecas', {type = 'public'})

--jobs garage stuff---------------------------------
RegisterNetEvent('erp-aztecas:setJobVehicleState')
AddEventHandler('erp-aztecas:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles_jobs SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_vehicleshop_aztecas: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)
ESX.RegisterServerCallback('erp-aztecas:retrieveJobVehicles', function(source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_jobs WHERE owner = @owner AND type = @type AND job = @job', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type,
		['@job'] = xPlayer.job.name
	}, function(result)
		cb(result)
	end)
end)
--jobs garage stuff-----------------------------------

RegisterNetEvent('erp-aztecas:confiscatePlayerItem')
AddEventHandler('erp-aztecas:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.name ~= 'aztecas' then
		print(('erp-aztecas: %s attempted to confiscate!'):format(xPlayer.identifier))
		return
	end

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then

			-- can the player carry the said amount of x item?
			if sourceXPlayer.canCarryItem(itemName, sourceItem.count) then
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem   (itemName, amount)
				TriggerClientEvent('mythic_notify:client:SendAlert', sourceXPlayer, { type = 'success', text = _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name), length = 2000})
				TriggerClientEvent('mythic_notify:client:SendAlert', targetXPlayer, { type = 'inform', text = _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name), length = 2000})
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', sourceXPlayer, { type = 'inform', text = _U('quantity_invalid'), length = 2000})

			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', sourceXPlayer, { type = 'error', text = _U('quantity_invalid'), length = 2000})
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney   (itemName, amount)
		TriggerClientEvent('mythic_notify:client:SendAlert', sourceXPlayer, { type = 'success', text = _U('you_confiscated_account', amount, itemName, targetXPlayer.name), length = 2000})
		TriggerClientEvent('mythic_notify:client:SendAlert', targetXPlayer, { type = 'inform', text = _U('got_confiscated_account', amount, itemName, sourceXPlayer.name), length = 2000})
	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon   (itemName, amount)
		TriggerClientEvent('mythic_notify:client:SendAlert', sourceXPlayer, { type = 'success', text = _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount), length = 2000})
		TriggerClientEvent('mythic_notify:client:SendAlert', targetXPlayer, { type = 'inform', text = _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name), length = 2000})
	end
end)

RegisterNetEvent('erp-aztecas:handcuff')
AddEventHandler('erp-aztecas:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'aztecas' then
		TriggerClientEvent('erp-aztecas:handcuff', target)
	else
		print(('erp-aztecas: %s attempted to handcuff a player (not aztecas)!'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('erp-aztecas:drag')
AddEventHandler('erp-aztecas:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'aztecas' then
		TriggerClientEvent('erp-aztecas:drag', target, source)
	else
		print(('erp-aztecas: %s attempted to drag (not aztecas)!'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('erp-aztecas:putInVehicle')
AddEventHandler('erp-aztecas:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'aztecas' then
		TriggerClientEvent('erp-aztecas:putInVehicle', target)
	else
		print(('erp-aztecas: %s attempted to put in vehicle (not aztecas)!'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('erp-aztecas:OutVehicle')
AddEventHandler('erp-aztecas:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'aztecas' then
		TriggerClientEvent('erp-aztecas:OutVehicle', target)
	else
		print(('erp-aztecas: %s attempted to drag out from vehicle (not aztecas)!'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('erp-aztecas:getStockItem')
AddEventHandler('erp-aztecas:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_aztecas', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, { type = 'success', text = _U('have_withdrawn', count, inventoryItem.label), length = 2000})
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, { type = 'error', text = _U('quantity_invalid'), length = 2000})
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, { type = 'error', text = _U('quantity_invalid'), length = 2000})
		end
	end)
end)

RegisterNetEvent('erp-aztecas:putStockItems')
AddEventHandler('erp-aztecas:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_aztecas', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, { type = 'success', text = _U('have_deposited', count, inventoryItem.label), length = 2000})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, { type = 'error', text = _U('quantity_invalid'), length = 2000})
		end
	end)
end)

ESX.RegisterServerCallback('erp-aztecas:getOtherPlayerData', function(source, cb, target, notify)
	local xPlayer = ESX.GetPlayerFromId(target)

	if notify then
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, { type = 'inform', text = _U('being_searched'), length = 2000})
	end

	if xPlayer then
		local data = {
			name = xPlayer.getName(),
			job = xPlayer.job.label,
			grade = xPlayer.job.grade_label,
			inventory = xPlayer.getInventory(),
			accounts = xPlayer.getAccounts(),
			weapons = xPlayer.getLoadout()
		}

		if Config.EnableESXIdentity then
			data.dob = xPlayer.get('dateofbirth')
			data.height = xPlayer.get('height')

			if xPlayer.get('sex') == 'm' then data.sex = 'male' else data.sex = 'female' end
		end

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status then
				data.drunk = ESX.Math.Round(status.percent)
			end

			if Config.EnableLicenses then
				TriggerEvent('esx_license:getLicenses', target, function(licenses)
					data.licenses = licenses
					cb(data)
				end)
			else
				cb(data)
			end
		end)
	end
end)

ESX.RegisterServerCallback('erp-aztecas:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('erp-aztecas:getVehicleInfos', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		local retrivedInfo = {plate = plate}

		if result[1] then
			local xPlayer = ESX.GetPlayerFromIdentifier(result[1].owner)

			-- is the owner online?
			if xPlayer then
				retrivedInfo.owner = xPlayer.getName()
				cb(retrivedInfo)
			else
				MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
					['@identifier'] = result[1].owner
				}, function(result2)
					if result2[1] then
						if Config.EnableESXIdentity then
							retrivedInfo.owner = ('%s %s'):format(result2[1].firstname, result2[1].lastname)
						else
							retrivedInfo.owner = result2[1].name
						end

						cb(retrivedInfo)
					else
						cb(retrivedInfo)
					end
				end)
			end
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('erp-aztecas:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					cb(('%s %s'):format(result2[1].firstname, result2[1].lastname), true)
				else
					cb(result2[1].name, true)
				end

			end)
		else
			cb(_U('unknown'), false)
		end
	end)
end)

ESX.RegisterServerCallback('erp-aztecas:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_aztecas', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('erp-aztecas:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_aztecas', function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('erp-aztecas:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_aztecas', function(store)
		local weapons = store.get('weapons') or {}

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('erp-aztecas:buyWeapon', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = Config.AuthorizedWeapons[xPlayer.job.grade_name]

	for k,v in ipairs(authorizedWeapons) do
		if v.weapon == weaponName then
			selectedWeapon = v
			break
		end
	end

	if not selectedWeapon then
		print(('erp-aztecas: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
		cb(false)
	else
		-- Weapon
		if type == 1 then
			if xPlayer.getMoney() >= selectedWeapon.price then
				xPlayer.removeMoney(selectedWeapon.price)
				xPlayer.addWeapon(weaponName, 100)

				cb(true)
			else
				cb(false)
			end

		-- Weapon Component
		elseif type == 2 then
			local price = selectedWeapon.components[componentNum]
			local weaponNum, weapon = ESX.GetWeapon(weaponName)
			local component = weapon.components[componentNum]

			if component then
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeaponComponent(weaponName, component.name)

					cb(true)
				else
					cb(false)
				end
			else
				print(('erp-aztecas: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)

ESX.RegisterServerCallback('erp-aztecas:buyJobVehicle', function(source, cb, vehicleProps, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

	-- vehicle model not found
	if price == 0 then
		print(('erp-aztecas: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
		cb(false)
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			MySQL.Async.execute('INSERT INTO owned_vehicles_jobs (owner, vehicle, plate, type, job, `stored`) VALUES (@owner, @vehicle, @plate, @type, @job, @stored)', {
				['@owner'] = xPlayer.identifier,
				['@vehicle'] = json.encode(vehicleProps),
				['@plate'] = vehicleProps.plate,
				['@type'] = type,
				['@job'] = xPlayer.job.name,
				['@stored'] = true
			}, function (rowsChanged)
				cb(true)
			end)
		else
			cb(false)
		end
	end
end)

ESX.RegisterServerCallback('erp-aztecas:storeNearbyVehicle', function(source, cb, nearbyVehicles)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundPlate, foundNum

	for k,v in ipairs(nearbyVehicles) do
		local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles_jobs WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = v.plate,
			['@job'] = xPlayer.job.name
		})

		if result[1] then
			foundPlate, foundNum = result[1].plate, k
			break
		end
	end

	if not foundPlate then
		cb(false)
	else
		MySQL.Async.execute('UPDATE owned_vehicles_jobs SET `stored` = true WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = foundPlate,
			['@job'] = xPlayer.job.name
		}, function (rowsChanged)
			if rowsChanged == 0 then
				print(('erp-aztecas: %s has exploited the garage!'):format(xPlayer.identifier))
				cb(false)
			else
				cb(true, foundNum)
			end
		end)
	end
end)

function getPriceFromHash(vehicleHash, jobGrade, type)
	local vehicles = Config.AuthorizedVehicles[type][jobGrade]

	for k,v in ipairs(vehicles) do
		if GetHashKey(v.model) == vehicleHash then
			return v.price
		end
	end

	return 0
end

ESX.RegisterServerCallback('erp-aztecas:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_aztecas', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('erp-aztecas:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

AddEventHandler('playerDropped', function()
	-- Save the source in case we lose it (which happens a lot)
	local playerId = source

	-- Did the player ever join?
	if playerId then
		local xPlayer = ESX.GetPlayerFromId(playerId)

		-- Is it worth telling all clients to refresh?
		if xPlayer and xPlayer.job.name == 'aztecas' then
			Citizen.Wait(5000)
			TriggerClientEvent('erp-aztecas:updateBlip', -1)
		end
	end
end)

RegisterNetEvent('erp-aztecas:spawned')
AddEventHandler('erp-aztecas:spawned', function()
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer and xPlayer.job.name == 'aztecas' then
		Citizen.Wait(5000)
		TriggerClientEvent('erp-aztecas:updateBlip', -1)
	end
end)

RegisterNetEvent('erp-aztecas:forceBlip')
AddEventHandler('erp-aztecas:forceBlip', function()
	TriggerClientEvent('erp-aztecas:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('erp-aztecas:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'aztecas')
	end
end)

RegisterServerEvent('erp-aztecas:requestarrest')
AddEventHandler('erp-aztecas:requestarrest', function(targetid, playerheading, playerCoords,  playerlocation)
    _source = source
    TriggerClientEvent('erp-aztecas:getarrested', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('erp-aztecas:doarrested', _source)
end)

RegisterServerEvent('erp-aztecas:requestrelease')
AddEventHandler('erp-aztecas:requestrelease', function(targetid, playerheading, playerCoords,  playerlocation)
    _source = source
    TriggerClientEvent('erp-aztecas:getuncuffed', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('erp-aztecas:douncuffing', _source)
end)
