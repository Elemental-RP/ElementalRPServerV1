ESX                     = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand('livery', function(source, args)
	local plyData = ESX.GetPlayerData()

	if plyData and plyData.job and plyData.job.name == "police" or plyData.job.name == "ambulance" then
		local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
		local liveryID = tonumber(args[1])

		SetVehicleLivery(Veh, liveryID)
	end
end, false)
