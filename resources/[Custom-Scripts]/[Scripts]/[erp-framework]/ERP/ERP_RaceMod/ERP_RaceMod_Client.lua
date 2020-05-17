local ERPRM = ERP.RaceMod

function ERPRM:Start()
	if not self then return; end

	while not ESX do Citizen.Wait(100); end
	while not ESX.IsPlayerLoaded() do Citizen.Wait(100); end

	print("ERP_RaceMod:Start() - Succesful")

	self.Started = 1
	self:Update()
end

function ERPRM:Update()
	while true do
		Citizen.Wait(0)
		if self.RaceFinish then
			local plyId = PlayerId()
			local plyPed = GetPlayerPed(plyId)
			local plyPos = GetEntityCoords(plyPed)
			local grounded,groundZ = GetGroundZFor_3dCoord(self.RaceFinish.x, self.RaceFinish.y, self.RaceFinish.z, groundZ, 0)
			if grounded then 
				local raceFin = vector3(self.RaceFinish.x, self.RaceFinish.y, groundZ)
				local dist = ERPUtils:GetVecDist(plyPos, raceFin)

				if dist < self.FinishRaceDist then
					self:FinishRace()
				end

				if dist < self.DrawMarkerDist then
					local pos = raceFin
					DrawMarker(5, pos.x, pos.y, pos.z + self.FlagMarkerOffsetZ, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 20.0, 20.0, 20.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
					DrawMarker(1, pos.x, pos.y, pos.z + self.GroundMarkerOffsetZ, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 20.0, 20.0, 20.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
				end
			end			
		end

		if self.RaceJoinPos then			
			local plyId = PlayerId()
			local plyPed = GetPlayerPed(plyId)
			local plyPos = GetEntityCoords(plyPed)

			if ERPUtils:GetVecDist(plyPos, self.RaceJoinPos) > self.LeaveDist then

				TriggerServerEvent('ERP_RaceMod:LeaveRace', self.RaceID)
				TriggerServerEvent('ERP_RaceMod:SetMoney', self.RaceWager)

				self.RaceID = false
				self.RaceJoinPos = false
				self.RaceFinish = false		
				self.RaceWager = false

				Citizen.CreateThread(function()
					local tick = 1
					while tick < 10 do 
						Citizen.Wait(0)
						tick = tick + 1

						TriggerEvent('ERP_Notify:ShowNotification', "~r~You left the race.")
					end
				end)
			elseif ERPUtils:GetVecDist(plyPos, self.RaceJoinPos) > self.LeaveWarnDist then
				TriggerEvent('ERP_Notify:ShowNotification', "~r~Don't move so far from your start point!")
			end
		end
	end
end

function ERPRM:SetupRace(wager)
	if not self or not self.Started then return; end

	if wager and wager[1] and type(wager[1]) == "string" then wager = tonumber(wager[1])
	else wager = 0; end

	local plyId = PlayerId()
	local plyPed = GetPlayerPed(plyId)	

	if not IsPedInAnyVehicle(plyPed) then
		TriggerEvent('ERP_Notify:ShowNotification', "~r~You need to be in a vehicle first.")
		return
	end

	local plyPos = GetEntityCoords(plyPed)	
	local plyVeh = GetVehiclePedIsIn(plyPed, true)
	local raceID = math.random(999999, 10000000)

	local blip = GetFirstBlipInfoId(8)
	local blipCoord
	if DoesBlipExist(blip) then
		blipCoord = GetBlipInfoIdCoord(blip)		
	else
		TriggerEvent('ERP_Notify:ShowNotification', "You need to set a ~r~waypoint ~s~first.")
		return
	end	

	if wager > 0 then
		local plyData = ESX.GetPlayerData()
		if plyData.money >= wager then 
			TriggerServerEvent('ERP_RaceMod:SetMoney', -wager)
		else 
			TriggerEvent('ERP_Notify:ShowNotification', "You ~r~don't ~s~have enough ~r~money~s~.")
			return
		end
	end

	ERPRM.RaceID = raceID
	ERPRM.RaceWager = wager
	ERPRM.RaceJoinPos = plyPos
	TriggerEvent('ERP_Notifications:Notify', "Streetrace in progress.", 0, blipCoord, "General", "police")

	Citizen.CreateThread(function()	
		local timer = GetGameTimer()
		while (GetGameTimer() - timer) < (self.WaitForPlayersTimer * 1000) and ERPRM.RaceJoinPos do	
			Citizen.Wait(0)	
			TriggerEvent('ERP_Notify:ShowNotification', "You have ~g~started ~s~a ~g~streetrace~s~. Challenging nearby players.")
		end
	end)

	Citizen.CreateThread(function()
		ESX.TriggerServerCallback('ERP_RaceMod:SetupRace', function(playersJoined)
			if not ERPRM.RaceJoinPos then return; end
			if playersJoined > 1 then
				TriggerServerEvent('ERP_RaceMod:StartRace', ERPRM.RaceID)
			else
				TriggerEvent('ERP_Notify:ShowNotification', "~r~Nobody ~s~joined your race.")
				TriggerServerEvent('ERP_RaceMod:SetMoney', wager)
				ERPRM.RaceID = false
				ERPRM.RaceWager = false
				ERPRM.RaceJoinPos = false
				ERPRM.FaceFinish = false
			end
		end, plyPos, blipCoord, ERPRM.RaceID, wager)
	end)
end

RegisterNetEvent('ERP_RaceMod:ChallengeNearbyPlayers')
AddEventHandler('ERP_RaceMod:ChallengeNearbyPlayers', function(racePos, raceID, wager)
	if ERPRM.RaceID then return; end

	local canJoin = true
	if wager and wager > 0 then
		local plyData = ESX.GetPlayerData()
		if plyData.money < wager then canJoin = false; end
	end

	local plyId = PlayerId()
	local plyPed = GetPlayerPed(plyId)	
	local plyVeh = GetVehiclePedIsIn(plyPed)
	local vehPed = GetPedInVehicleSeat(plyVeh, -1)
	if plyPed ~= vehPed then return; end

	local plyPos = GetEntityCoords(plyPed)	
	local dist = ERPUtils:GetVecDist(racePos, plyPos) 

	if dist < ERPRM.JoinDistLimit then
		Citizen.CreateThread(function(...) 
			local timer = GetGameTimer()
			local tick = 0
			local str = ""
			if wager and wager > 0 then str = "Line up your vehicle and press [~g~E~s~] to join the race. Wager: $~g~" .. wager
			else str = "Line up your vehicle and press [~g~E~s~] to join the race."; end
			while (GetGameTimer() - timer) < (ERPRM.JoinTimeout * 1000) and not ERPRM.RaceID do
				Citizen.Wait(0)
				if tick % 100 == 0 then 
					TriggerEvent('ERP_Notify:ShowNotification', str)
				end

				if (IsControlJustPressed(1, ERPUtils.Keys["E"]) or IsDisabledControlJustPressed(1, ERPUtils.Keys["E"])) then
					if canJoin then
						ERPRM.RaceID = raceID
						ERPRM.RaceWager = wager
						ERPRM.RaceJoinPos = plyPos
						TriggerServerEvent('ERP_RaceMod:SetMoney', -ERPRM.RaceWager)
						TriggerServerEvent('ERP_RaceMod:JoinRace', ERPRM.RaceID)
					else timer = 0; end
				end
				tick = tick + 1
			end

			if not ERPRM.RaceID then 
				if wager > 0 and not canJoin then
					TriggerEvent('ERP_Notify:ShowNotification', "You ~r~don't ~s~have enough ~r~money ~s~to join this race.")
				else
					TriggerEvent('ERP_Notify:ShowNotification', "You ~r~didn't ~s~join the race.")
				end
			else 
				TriggerEvent('ERP_Notify:ShowNotification', "You ~g~joined ~s~the race.")
			end
		end)
	end
end)

RegisterNetEvent('ERP_RaceMod:BeginRace')
AddEventHandler('ERP_RaceMod:BeginRace', function(raceID, blipCoord)
	if not ERPRM.RaceID or ERPRM.RaceID ~= raceID then return; end
	Citizen.CreateThread(function() 		
		local timer = GetGameTimer()		
		local plyId = PlayerId()
		local plyPed = GetPlayerPed(plyId)
		local plyPos = GetEntityCoords(plyPed)	
		local plyVeh = GetVehiclePedIsIn(plyPed, true)

		while (GetGameTimer() - timer) < ((ERPRM.StartTimer - 1) * 1000) and ERPRM.RaceJoinPos do
			local counter = math.floor(((math.floor((ERPRM.StartTimer) * 1000)) - (GetGameTimer() - timer)) / 1000)
			local str = "~r~"..counter
			TriggerEvent('ERP_Notify:ShowNotification', "You will be frozen into position in "..str.." seconds~s~. On your marks.")
			Citizen.Wait(10)
		end

		if not ERPRM.RaceJoinPos then return; end

		FreezeEntityPosition(plyVeh, true)
		SetNewWaypoint(blipCoord.x, blipCoord.y)
		ERPRM.RaceJoinPos = false

		local timer = GetGameTimer()
		while (GetGameTimer() - timer) < ((ERPRM.CountdownTimer) * 1000) do
			Citizen.Wait(0)
			local counter = math.floor(((math.floor((ERPRM.CountdownTimer + 1) * 1000)) - (GetGameTimer() - timer)) / 1000)
			local str
			if counter <= 2.0 then str = "~y~"..counter
			else str = "~r~"..counter; end
			TriggerEvent('ERP_Notify:ShowNotification', "Countdown : "..str, 0.1)
		end	
		Citizen.Wait(0)
		TriggerEvent('ERP_Notify:ShowNotification', "~g~Go!", 1)
		FreezeEntityPosition(plyVeh, false)
		SetNewWaypoint(blipCoord.x, blipCoord.y)
		ERPRM.RaceFinish = vector3(blipCoord.x, blipCoord.y, 1000.0)
	end)
end)

function ERPRM:FinishRace()
	local id = self.RaceID

	self.RaceID = false
	self.RaceJoinPos = false
	self.RaceFinish = false		
	self.RaceWager = false

	ESX.TriggerServerCallback('ERP_RaceMod:FinishStreetRace', function(position, wager, players)
		local str = "You finished in position : "
		if position == 1 then
			if wager > 0 then
				local plyData = ESX.GetPlayerData()
				local prize = wager * players
				TriggerServerEvent('ERP_RaceMod:SetMoney', prize)
				str = str .. "[~g~" ..position.. "~s~] : You won : $~g~" ..prize
			else str = str .. "[~g~" ..position.. "~s~]"
			end

			Citizen.CreateThread(function(...)
				local timer = GetGameTimer()
				while (GetGameTimer() - timer) < (self.TimeoutTimer * 1000) do
					Citizen.Wait(0)
				end
				TriggerServerEvent('ERP_RaceMod:RaceTimeout', id)
			end)
		else str = str .. "[~r~" ..position.. "~s~]"
		end

		TriggerEvent('ERP_Notify:ShowNotification', str)
	end, id)
end

RegisterNetEvent('ERP_RaceMod:Timeout')
AddEventHandler('ERP_RaceMod:Timeout', function() 
	if not ERPRM.RaceID then
		TriggerEvent('ERP_Notify:ShowNotification', "~r~You didn't finish the race.")
		ERPRM.RaceID = false
		ERPRM.RaceWager = false
		ERPRM.RaceJoinPos = false
		ERPRM.RaceFinish = false
	end
end)

RegisterCommand('startRace', function(source, args) ERPRM:SetupRace(args); end)
Citizen.CreateThread(function(...) ERPRM:Start(...); end)
