ESX = nil
local doorState = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_celldoors:updateState')
AddEventHandler('esx_celldoors:updateState', function(doorIndex, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer and type(doorIndex) == 'number' and type(state) == 'boolean' and Config.DoorList[doorIndex] and isAuthorized(xPlayer.job.name, Config.DoorList[doorIndex]) then
		doorState[doorIndex] = state
		TriggerClientEvent('esx_celldoors:setDoorState', -1, doorIndex, state)
	end
end)

ESX.RegisterServerCallback('esx_celldoors:getDoorState', function(source, cb)
	cb(doorState)
end)

function isAuthorized(jobName, doorObject)
	for k,job in pairs(doorObject.authorizedJobs) do
		if job == jobName then
			return true
		end
	end

	return false
end
