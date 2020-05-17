Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(500)
	end
end)

  Citizen.CreateThread(function()
	  if true then
		  Citizen.Wait(2000)
		  ESX.TriggerServerCallback('steamidentifier:id', function(id)
				  steam = id
				  steam = steam:sub(Config.Long)
			  while true do
				  Citizen.Wait(0)
				  SimpleText(Config.X, Config.Y, Config.SCALE, " " .. steam .. "  |  [ " .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. " ]", Config.Color.R, Config.Color.G, Config.Color.B, 255)
			  end
		  end)
	  end
  end)


  function SimpleText(X, Y, SCALE, TEXT, R, G, B, A)
	  SetTextFont(4)
	  SetTextProportional(0)
	  SetTextScale(SCALE, SCALE)
	  SetTextColour(R, G, B, A)
	  SetTextDropShadow(0, 0, 0, 0,255)
	  SetTextEdge(1, 0, 0, 0, 255)
	  SetTextDropShadow()
	  SetTextOutline()
	  SetTextEntry("STRING")
	  AddTextComponentString(TEXT)
	  DrawText(X, Y)
  end

local voice = {default = 7.001, shout = 14.001, whisper = 3.001, current = 0, level = nil}

-- function drawLevel(r, g, b, a)
-- 	SetTextFont(4)
-- 	SetTextProportional(1)
-- 	SetTextScale(0.35, 0.35)
-- 	SetTextColour(r, g, b, a)
-- 	SetTextDropShadow(0, 0, 0, 0, 255)
-- 	SetTextEdge(1, 0, 0, 0, 255)
-- 	SetTextDropShadow()
-- 	SetTextOutline()
--
-- 	BeginTextCommandDisplayText("STRING")
-- 	AddTextComponentSubstringPlayerName(_U('voice', voice.level))
-- 	EndTextCommandDisplayText(0.015, 0.945)
--
-- end

function setVoice()
      voice.current = (voice.current + 1) % 3
      if voice.current == 0 then
        NetworkSetTalkerProximity(voice.default)
        -- voice.level = "Normal"
      elseif voice.current == 1 then
        NetworkSetTalkerProximity(voice.shout)
        -- voice.level = "Shout"
      elseif voice.current == 2 then
        NetworkSetTalkerProximity(voice.whisper)
        -- voice.level = "Whisper"
      end
end

AddEventHandler('onClientMapStart', function()
	if voice.current == 0 then
		NetworkSetTalkerProximity(voice.default)
	elseif voice.current == 1 then
		NetworkSetTalkerProximity(voice.shout)
	elseif voice.current == 2 then
		NetworkSetTalkerProximity(voice.whisper)
	end
end)

Citizen.CreateThread(function()
  NetworkSetTalkerProximity(voice.default)
	while true do
		Citizen.Wait(1)

		if IsControlJustPressed(1, 74) and IsControlPressed(1, 21) then
			voice.current = (voice.current + 1) % 3
			if voice.current == 0 then
				NetworkSetTalkerProximity(voice.default)
				-- voice.level = _U('normal')
			elseif voice.current == 1 then
				NetworkSetTalkerProximity(voice.shout)
				-- voice.level = _U('shout')
			elseif voice.current == 2 then
				NetworkSetTalkerProximity(voice.whisper)
				-- voice.level = _U('whisper')
			end
		end

		-- if voice.current == 0 then
			-- voice.level = _U('normal')
		-- elseif voice.current == 1 then
			-- voice.level = _U('shout')
		-- elseif voice.current == 2 then
			-- voice.level = _U('whisper')
		-- end

		-- if NetworkIsPlayerTalking(PlayerId()) then
		-- 	drawLevel(163, 163, 163,255)
		-- elseif not NetworkIsPlayerTalking(PlayerId()) then
		-- 	drawLevel(255, 255, 255, 255)
		-- end
	end
end)
