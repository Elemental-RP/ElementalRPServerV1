erp_calls.ESX.Summon(function(ESX)

local calls = {}
local index = 1

erp_calls.NetEvent('esx_addons_gcphone:startCall',
	function(source, number, message, coords)
		local id = index

		index = index + 1
		found = false

		calls[id] = {
			source = source,
			coords = coords,
		}

		for _, src in ipairs(ESX.GetPlayers()) do
			if src ~= source then
				local player = ESX.GetPlayerFromId(src)

				if player and player.job and player.job.name == number then
					TriggerClientEvent('erp_service_request:call', player.source, id)
					found = true
				end
			end
		end

		if not found then
			calls[id] = nil
			TriggerClientEvent('esx:showNotification', source, _U('nobody'))
			return
		end

		TriggerClientEvent('esx:showNotification', source, _U('waiting'))

		Citizen.Wait(Config.AcceptTime)

		if not calls[id] then
			return
		end

		calls[id] = nil

		TriggerClientEvent('erp_service_request:stop', -1, id)
		TriggerClientEvent('esx:showNotification', source, _U('reject'))
	end)

erp_calls.NetEvent('erp_service_request:accept',
	function(source, id)
		local data = calls[id]

		if data then
			calls[id] = nil

			local name = GetPlayerName(data.source)
			TriggerClientEvent('erp_service_request:take', source, data.coords, name)

			TriggerClientEvent('esx:showNotification', data.source, _U('done'))

		else
			TriggerClientEvent('esx:showNotification', source, _U('fail'))
		end
	end)

end)
