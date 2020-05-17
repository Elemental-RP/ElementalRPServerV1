function SetData()
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~r~Elemental ~o~RP -> ~p~ID: ~p~' .. id .. ' -> ~g~Nome: ~g~' .. name)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		SetData()
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

		if IsHudComponentActive(6) then
			HideHudComponentThisFrame(6)
		end

		if IsHudComponentActive(7) then
			HideHudComponentThisFrame(7)
		end

		if IsHudComponentActive(8) then
			HideHudComponentThisFrame(8)
		end

		if IsHudComponentActive(9) then
			HideHudComponentThisFrame(9)
		end



    end
end)

--[[
Full List of HUD Components Below.
HUD = 0;
HUD_WANTED_STARS = 1;
HUD_WEAPON_ICON = 2;
HUD_CASH = 3;
HUD_MP_CASH = 4;
HUD_MP_MESSAGE = 5;
HUD_VEHICLE_NAME = 6;
HUD_AREA_NAME = 7;
HUD_VEHICLE_CLASS = 8;
HUD_STREET_NAME = 9;
HUD_HELP_TEXT = 10;
HUD_FLOATING_HELP_TEXT_1 = 11;
HUD_FLOATING_HELP_TEXT_2 = 12;
HUD_CASH_CHANGE = 13;
HUD_RETICLE = 14;
HUD_SUBTITLE_TEXT = 15;
HUD_RADIO_STATIONS = 16;
HUD_SAVING_GAME = 17;
HUD_GAME_STREAM = 18;
HUD_WEAPON_WHEEL = 19;
HUD_WEAPON_WHEEL_STATS = 20;
MAX_HUD_COMPONENTS = 21;
MAX_HUD_WEAPONS = 22;
MAX_SCRIPTED_HUD_COMPONENTS = 141;
--]]
