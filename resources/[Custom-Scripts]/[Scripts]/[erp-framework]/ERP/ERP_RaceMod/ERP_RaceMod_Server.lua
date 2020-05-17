local ERPRM = ERP.RaceMod

ESX.RegisterServerCallback('ERP_RaceMod:SetupRace', function(source, cb, racePos, blipCoord, raceID, wager) 
	ERPRM.Races = ERPRM.Races or {}
	ERPRM.Races.raceID = { 
		start = racePos,
		finish = blipCoord,
		wager = wager,
		players = { source, },
		finished = {},
	}	

	TriggerClientEvent('ERP_RaceMod:ChallengeNearbyPlayers', -1, racePos, raceID, wager)

	local timer = GetGameTimer()
	while (GetGameTimer() - timer) < (ERPRM.WaitForPlayersTimer * 1000) do Citizen.Wait(0); end
	if ERPRM.Races.raceID and ERPRM.Races.raceID.players then cbData = #ERPRM.Races.raceID.players else cbData = 0; end
	cb(cbData)
end)

RegisterNetEvent('ERP_RaceMod:JoinRace')
AddEventHandler('ERP_RaceMod:JoinRace', function(raceID) 
	if ERPRM.Races and ERPRM.Races.raceID and ERPRM.Races.raceID.players then
		local plys = ERPRM.Races.raceID.players
		local isAdded = false
		for k,v in pairs(plys) do
			if v == source then isAdded = true; end
		end
		if not isAdded then 
			table.insert(ERPRM.Races.raceID.players, source)
			TriggerEvent('ERP_RaceMod:SetMoney', -ERPRM.Races.raceID.wager) 
		end
	end
end)

RegisterNetEvent('ERP_RaceMod:StartRace')
AddEventHandler('ERP_RaceMod:StartRace', function(raceID) 
	if ERPRM.Races and ERPRM.Races.raceID and ERPRM.Races.raceID.players then
		local race = ERPRM.Races.raceID
		for k,v in pairs(race.players) do
			TriggerClientEvent('ERP_RaceMod:BeginRace', v, raceID, race.finish)
		end
	end
end)

RegisterNetEvent('ERP_RaceMod:SetMoney')
AddEventHandler('ERP_RaceMod:SetMoney', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); xPlayer = ESX.GetPlayerFromId(source); end
	local playerMoney = xPlayer.getMoney()
	xPlayer.setMoney(playerMoney + amount)
end)

RegisterNetEvent('ERP_RaceMod:LeaveRace')
AddEventHandler('ERP_RaceMod:LeaveRace', function(raceID)
	if ERPRM.Races and ERPRM.Races.raceID then
		for k,v in pairs(ERPRM.Races.raceID.players) do
			if v == source then
				table.remove(ERPRM.Races.raceID.players, k)
				return
			end
		end
	end
end)

ESX.RegisterServerCallback('ERP_RaceMod:FinishStreetRace', function(source, cb, raceID)	
	print(ERPRM.Races.raceID, ERPRM.Races.raceID.finished)
	table.insert(ERPRM.Races.raceID.finished, source)
	cb(#ERPRM.Races.raceID.finished, ERPRM.Races.raceID.wager, #ERPRM.Races.raceID.players)
end)

RegisterNetEvent('ERP_RaceMod:RaceTimeout')
AddEventHandler('ERP_RaceMod:RaceTimeout', function(raceID)
	for k,v in pairs(ERPRM.Races.raceID.players) do
		local doSend = true
		for key,val in pairs(ERPRM.Races.raceID.finished) do
			if v == val then doSend = false; end
		end
		if doSend then TriggerClientEvent('ERP_RaceMod:Timeout', v); end
	end
	ERPRM.Races.raceID = {}
end)

--[[local ERPRM = ERP.RaceMod

ESX.RegisterServerCallback('ERP_RaceMod:SetupStreetRace', function(source, cb, startPos, finPos, wager, raceID) 
	ERPRM.Races = ERPRM.Races or {}
	ERPRM.Races.raceID = {
		start = startPos,
		fin = finPos,
		wager = wager,
		players = { source, },
		finished = {}
	}	

	TriggerClientEvent('ERP_RaceMod:InitializeStreetRace', -1, startPos, finPos, wager, raceID)

	local timer = GetGameTimer()
	while (GetGameTimer() - timer) < (10 * 1000) do
		Citizen.Wait(0)
	end
	
	cb(#ERPRM.Races.raceID.players)
end)

RegisterNetEvent('ERP_RaceMod:JoinStreetRace')
AddEventHandler('ERP_RaceMod:JoinStreetRace', function(raceID)
	table.insert(ERPRM.Races.raceID.players, source)
end)

RegisterNetEvent('ERP_RaceMod:StartStreetRace')
AddEventHandler('ERP_RaceMod:StartStreetRace', function(raceID)
	for k,v in pairs(ERPRM.Races.raceID.players) do
		TriggerClientEvent('ERP_RaceMod:BeginStreetRace', v, raceID)
	end
end)

ESX.RegisterServerCallback('ERP_RaceMod:FinishStreetRace', function(source, cb, raceID)	
	table.insert(ERPRM.Races.raceID.finished, source)
	cb(#ERPRM.Races.raceID.finished, ERPRM.Races.raceID.wager, #ERPRM.Races.raceID.players)
end)



RegisterNetEvent('ERP_RaceMod:RaceTimeout')
AddEventHandler('ERP_RaceMod:RaceTimeout', function(raceID)
	for k,v in pairs(ERPRM.Races.raceID.players) do
		local doSend = true
		for key,val in pairs(ERPRM.Races.raceID.finished) do
			if v == val then doSend = false; end
		end
		if doSend then TriggerClientEvent('ERP_RaceMod:Timeout', v); end
	end
	ERPRM.Races.raceID = {}
end)

AddEventHandler('playerDropped', function(reason)
	if not ERPRM.Races then return; end
	for k,v in pairs(ERPRM.Races) do
		for key,val in pairs(v.players) do
			if val == source then
				print(key,val)
				table.remove(ERPRM.Races.raceID.players, key)
				local xPlayer = ESX.GetPlayerFromId(source)
				while not xPlayer do Citizen.Wait(0); xPlayer = ESX.GetPlayerFromId(source); end
				local playerMoney = xPlayer.getMoney()
				xPlayer.setMoney(playerMoney + v.wager)
			end
		end		
	end
end)

RegisterNetEvent('ERP_RaceMod:SetMoney')
AddEventHandler('ERP_RaceMod:SetMoney', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); xPlayer = ESX.GetPlayerFromId(source); end
	local playerMoney = xPlayer.getMoney()
	xPlayer.setMoney(playerMoney + amount)
end)

RegisterNetEvent('ERP_RaceMod:DoStuff')
AddEventHandler('ERP_RaceMod:DoStuff', function()
	TriggerClientEvent('ERP_RaceMod:DoingStuff', -1)
end)--]]