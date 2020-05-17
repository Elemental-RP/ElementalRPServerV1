local voice = {default = 5.0, shout = 12.0, whisper = 1.0, current = 0, level = nil}

AddEventHandler('onClientMapStart', function()
	if voice.current == 0 then
		NetworkSetTalkerProximity(voice.default)
		SendNUIMessage({
			level = 52
		});
	elseif voice.current == 1 then
		NetworkSetTalkerProximity(voice.shout)
		SendNUIMessage({
     		level = 100
		});
	elseif voice.current == 2 then
		NetworkSetTalkerProximity(voice.whisper)
		SendNUIMessage({
     		level = 25
     	});
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		local coords = GetEntityCoords(PlayerPedId())

		if IsControlJustPressed(1, 74) and IsControlPressed(1, 21) then
			voice.current = (voice.current + 1) % 3
			if voice.current == 0 then
				NetworkSetTalkerProximity(voice.default)
				voiceCoords = voice.default
				SendNUIMessage({
					level = 52
				});
			elseif voice.current == 1 then
				NetworkSetTalkerProximity(voice.shout)
				voiceCoords = voice.shout
				SendNUIMessage({
					level = 100
				});
			elseif voice.current == 2 then
				NetworkSetTalkerProximity(voice.whisper)
				voiceCoords = voice.whisper
				SendNUIMessage({
					level = 25
				});
			end
		end

		if voice.current == 0 then
			SendNUIMessage({
				level = 52
			});
		elseif voice.current == 1 then
			SendNUIMessage({
				level = 100
			});
		elseif voice.current == 2 then
			SendNUIMessage({
				level = 25
			});
		end

		if NetworkIsPlayerTalking(PlayerId()) then
			SendNUIMessage({talking = true})
		elseif not NetworkIsPlayerTalking(PlayerId()) then
			SendNUIMessage({talking = false})
		end
		
		SendNUIMessage({
            show = IsPauseMenuActive()
        })
	end
end)
