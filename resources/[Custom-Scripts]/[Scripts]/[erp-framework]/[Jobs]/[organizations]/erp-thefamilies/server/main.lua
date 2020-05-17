ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.EnableESXService then
	TriggerEvent('esx_service:activateService', 'thefamilies', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'thefamilies', _U('alert_thefamilies'), true, true)
TriggerEvent('esx_society:registerSociety', 'thefamilies', 'thefamilies', 'society_thefamilies', 'society_thefamilies', 'society_thefamilies', {type = 'public'})

--jobs garage stuff---------------------------------
RegisterNetEvent('erp-thefamilies:setJobVehicleState')
AddEventHandler('erp-thefamilies:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles_jobs SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_vehicleshop_thefamilies: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)
ESX.RegisterServerCallback('erp-thefamilies:retrieveJobVehicles', function(source, cb, type)
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

RegisterNetEvent('erp-thefamilies:confiscatePlayerItem')
AddEventHandler('erp-thefamilies:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.name ~= 'thefamilies' then
		print(('erp-thefamilies: %s attempted to confiscate!'):format(xPlayer.identifier))
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

RegisterNetEvent('erp-thefamilies:handcuff')
AddEventHandler('erp-thefamilies:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'thefamilies' then
		TriggerClientEvent('erp-thefamilies:handcuff', target)
	else
		print(('erp-thefamilies: %s attempted to handcuff a player (not the families)!'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('erp-thefamilies:drag')
AddEventHandler('erp-thefamilies:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'thefamilies' then
		TriggerClientEvent('erp-thefamilies:drag', target, source)
	else
		print(('erp-thefamilies: %s attempted to drag (not the families)!'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('erp-thefamilies:putInVehicle')
AddEventHandler('erp-thefamilies:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'thefamilies' then
		TriggerClientEvent('erp-thefamilies:putInVehicle', target)
	else
		print(('erp-thefamilies: %s attempted to put in vehicle (not the families)!'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('erp-thefamilies:OutVehicle')
AddEventHandler('erp-thefamilies:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'thefamilies' then
		TriggerClientEvent('erp-thefamilies:OutVehicle', target)
	else
		print(('erp-thefamilies: %s attempted to drag out from vehicle (not the families)!'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('erp-thefamilies:getStockItem')
AddEventHandler('erp-thefamilies:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_thefamilies', function(inventory)
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

RegisterNetEvent('erp-thefamilies:putStockItems')
AddEventHandler('erp-thefamilies:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_thefamilies', function(inventory)
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

ESX.RegisterServerCallback('erp-thefamilies:getOtherPlayerData', function(source, cb, target, notify)
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

ESX.RegisterServerCallback('erp-thefamilies:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('erp-thefamilies:getVehicleInfos', function(source, cb, plate)
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

ESX.RegisterServerCallback('erp-thefamilies:getVehicleFromPlate', function(source, cb, plate)
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

ESX.RegisterServerCallback('erp-thefamilies:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_thefamilies', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('erp-thefamilies:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_thefamilies', function(store)
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

ESX.RegisterServerCallback('erp-thefamilies:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_thefamilies', function(store)
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

ESX.RegisterServerCallback('erp-thefamilies:buyWeapon', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = Config.AuthorizedWeapons[xPlayer.job.grade_name]

	for k,v in ipairs(authorizedWeapons) do
		if v.weapon == weaponName then
			selectedWeapon = v
			break
		end
	end

	if not selectedWeapon then
		print(('erp-thefamilies: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
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
				print(('erp-thefamilies: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)

ESX.RegisterServerCallback('erp-thefamilies:buyJobVehicle', function(source, cb, vehicleProps, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

	-- vehicle model not found
	if price == 0 then
		print(('erp-thefamilies: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
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

ESX.RegisterServerCallback('erp-thefamilies:storeNearbyVehicle', function(source, cb, nearbyVehicles)
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
				print(('erp-thefamilies: %s has exploited the garage!'):format(xPlayer.identifier))
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

ESX.RegisterServerCallback('erp-thefamilies:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_thefamilies', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('erp-thefamilies:getPlayerInventory', function(source, cb)
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
		if xPlayer and xPlayer.job.name == 'thefamilies' then
			Citizen.Wait(5000)
			TriggerClientEvent('erp-thefamilies:updateBlip', -1)
		end
	end
end)

RegisterNetEvent('erp-thefamilies:spawned')
AddEventHandler('erp-thefamilies:spawned', function()
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer and xPlayer.job.name == 'thefamilies' then
		Citizen.Wait(5000)
		TriggerClientEvent('erp-thefamilies:updateBlip', -1)
	end
end)

RegisterNetEvent('erp-thefamilies:forceBlip')
AddEventHandler('erp-thefamilies:forceBlip', function()
	TriggerClientEvent('erp-thefamilies:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('erp-thefamilies:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'thefamilies')
	end
end)

RegisterServerEvent('erp-thefamilies:requestarrest')
AddEventHandler('erp-thefamilies:requestarrest', function(targetid, playerheading, playerCoords,  playerlocation)
    _source = source
    TriggerClientEvent('erp-thefamilies:getarrested', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('erp-thefamilies:doarrested', _source)
end)

RegisterServerEvent('erp-thefamilies:requestrelease')
AddEventHandler('erp-thefamilies:requestrelease', function(targetid, playerheading, playerCoords,  playerlocation)
    _source = source
    TriggerClientEvent('erp-thefamilies:getuncuffed', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('erp-thefamilies:douncuffing', _source)
end)
