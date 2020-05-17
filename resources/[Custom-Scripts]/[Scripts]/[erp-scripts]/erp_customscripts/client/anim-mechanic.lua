local playerCurrentlyAnimated = false
local playerCurrentlyHasProp = false
local playerCurrentlyHasWalkstyle = false
local LastAD
local mp_pointing = false
local firstAnim = true
local surrendered = false
local keyboarding = false
local playerPropList = {}

Citizen.CreateThread( function()
	while true do
		Citizen.Wait(25)
		if mp_pointing then
			local ped = PlayerPedId()
			local camPitch = GetGameplayCamRelativePitch()
			if camPitch < -70.0 then
				camPitch = -70.0
			elseif camPitch > 42.0 then
				camPitch = 42.0
			end
			camPitch = (camPitch + 70.0) / 112.0

			local camHeading = GetGameplayCamRelativeHeading()
			local cosCamHeading = Cos(camHeading)
			local sinCamHeading = Sin(camHeading)
			if camHeading < -180.0 then
				camHeading = -180.0
			elseif camHeading > 180.0 then
				camHeading = 180.0
			end
			camHeading = (camHeading + 180.0) / 360.0

			local blocked = 0
			local nn = 0

			local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
			local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
			nn,blocked,coords,coords = GetRaycastResult(ray)
			SetTaskPropertyFloat(ped, "Pitch", camPitch)
			SetTaskPropertyFloat(ped, "Heading", camHeading * -1.0 + 1.0)
			SetTaskPropertyBool(ped, "isBlocked", blocked)
			SetTaskPropertyBool(ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
		end
	end
end)

RegisterNetEvent('erp_customscripts:KillProps')
AddEventHandler('erp_customscripts:KillProps', function()
	for _,v in pairs(playerPropList) do
		DeleteEntity(v)
	end

	playerCurrentlyHasProp = false
end)

RegisterNetEvent('erp_customscripts:AttachProp')
AddEventHandler('erp_customscripts:AttachProp', function(prop_one, boneone, x1, y1, z1, r1, r2, r3)
	local player = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(player))

	if not HasModelLoaded(prop_one) then
		loadPropDict(prop_one)
	end

	prop = CreateObject(GetHashKey(prop_one), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, player, GetPedBoneIndex(player, boneone), x1, y1, z1, r1, r2, r3, true, true, false, true, 1, true)
	SetModelAsNoLongerNeeded(prop_one)
	table.insert(playerPropList, prop)
	playerCurrentlyHasProp = true
end)

RegisterNetEvent('erp_customscripts:Animation')
AddEventHandler('erp_customscripts:Animation', function(ad, anim, body)
	local player = PlayerPedId()
	if playerCurrentlyAnimated then -- Cancel Old Animation

		loadAnimDict(ad)
		TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, body, 0, 0, 0, 0 )
		Wait(750)
		ClearPedSecondaryTask(player)
		RemoveAnimDict(LastAD)
		RemoveAnimDict(ad)
		LastAD = ad
		playerCurrentlyAnimated = false
		TriggerEvent('erp_customscripts:KillProps')
		return
	end

	if firstAnim then
		LastAD = ad
		firstAnim = false
	end

	loadAnimDict(ad)
	TaskPlayAnim(player, ad, anim, 4.0, 1.0, -1, body, 0, 0, 0, 0 )  --- We actually play the animation here
	RemoveAnimDict(ad)
	playerCurrentlyAnimated = true

end)

RegisterNetEvent('erp_customscripts:StopAnimations')
AddEventHandler('erp_customscripts:StopAnimations', function()

	local player = PlayerPedId()
	if vehiclecheck() then
		if IsPedUsingAnyScenario(player) then
			--ClearPedSecondaryTask(player)
			ClearPedTasks(player)
			return
		end

		if playerCurrentlyHasWalkstyle then
			ResetPedMovementClipset(player, 0.0)
			playerCurrentlyHasWalkstyle = false
		end

		if playerCurrentlyAnimated then
			if LastAD then
				RemoveAnimDict(LastAD)
			end

			if playerCurrentlyHasProp then
				TriggerEvent('erp_customscripts:KillProps')
				playerCurrentlyHasProp = false
			end

			if surrendered then
				surrendered = false
			end

			--ClearPedSecondaryTask(player)
			ClearPedTasks(player)
			playerCurrentlyAnimated = false
		end
	end
end)

RegisterNetEvent('erp_customscripts:Scenario')
AddEventHandler('erp_customscripts:Scenario', function(ad)
	local player = PlayerPedId()
	TaskStartScenarioInPlace(player, ad, 0, 1)
end)

RegisterNetEvent('erp_customscripts:Walking')
AddEventHandler('erp_customscripts:Walking', function(ad)
	local player = PlayerPedId()
	ResetPedMovementClipset(player, 0.0)
	RequestWalking(ad)
	SetPedMovementClipset(player, ad, 0.25)
	RemoveAnimSet(ad)
end)

RegisterNetEvent('erp_customscripts:Keyboard')
AddEventHandler('erp_customscripts:Keyboard', function()
	local ad = "missbigscore2aswitch"
	local player = PlayerPedId()

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, "switch_mic_car_fra_laptop_hacker", 3 ) ) then
			keyboarding = false
			TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
			RemoveAnimDict(ad)
			Wait (100)
		else
			TaskPlayAnim( player, ad, "switch_mic_car_fra_laptop_hacker", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
			RemoveAnimDict(ad)
			Wait (2500)
			keyboarding = true
			repeat
				TaskPlayAnim( player, ad, "switch_mic_car_fra_laptop_hacker", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
				Wait (2500)
			until not keyboarding
			TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('erp_customscripts:StopAnimations')
	end
end)

RegisterCommand("e2", function(source, args)

	local player = PlayerPedId()
	local argh = tostring(args[1])

	if argh == 'help' then -- List help commands
		TriggerEvent('chat:addMessage', { args = { '[^1Animations^0]: /e2 emotes, dances, walkstyles' } })
	elseif argh == 'emotes' then -- list emotes
		TriggerEvent('chat:addMessage', { args = { '[^1Animations^0]: /e2 {animation}, salute, finger, finger2, phonecall, surrender, facepalm, notes, brief, brief2, foldarms, foldarms2, damn, fail, gang1, gang2, no, pickbutt, grabcrotch, peace, cigar, cigar2, joint, cig, holdcigar, holdcig, holdjoint, dead, holster, aim, aim2, slowclap, box, cheer, bum, leanwall, copcrowd, copcrowd2, copidle, smoking, mechanic, mechanic2, shotbar, drunkbaridle, airplane, shock, lean, leanwall2, leanwall3, sitfloor, sitfloor2, bum2, layback, layback2, layfront, nervous, slowclap2, cheer2, cheer3, cheer4, drinkshot, falloverdrunk, drunkbaridle, waitatbar, fjump1, fjump2, slowclap3, leanback, jumpingjack, jumpingjack2, jumpingjack3, outofbreath, makeitrain' } })
	elseif argh == 'walkstyles' then -- list walkstyles
		TriggerEvent('chat:addMessage', { args = { '[^1Animations^0]: /e2 walk1-45' } })
	elseif argh == 'dances' then -- list dances
		TriggerEvent('chat:addMessage', { args = { '[^1Animations^0]: /e2 djidle1-60, djdance1-7, mdance1-54, fdance1-54' } })
	elseif argh == 'delprop' then -- Deletes Clients Props Command
		TriggerEvent('erp_customscripts:KillProps')
	elseif argh == 'surrender' then -- I'll figure out a better way to do animations with this much depth later.
		TriggerEvent('erp_customscripts:Surrender')
	elseif argh == 'stop' then -- Cancel Animations
		TriggerEvent('erp_customscripts:StopAnimations')
	elseif argh == 'keyboard' then
		TriggerEvent('erp_customscripts:Keyboard')
	else
		for i = 1, #Config.Anims, 1 do
			local name = Config.Anims[i].name
			if argh == name then
				local prop_one = Config.Anims[i].data.prop
				local boneone = Config.Anims[i].data.boneone
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then

					if Config.Anims[i].data.type == 'prop' then
						if playerCurrentlyHasProp then --- Delete Old Prop

							TriggerEvent('erp_customscripts:KillProps')
						end

						TriggerEvent('erp_customscripts:AttachProp', prop_one, boneone, Config.Anims[i].data.x, Config.Anims[i].data.y, Config.Anims[i].data.z, Config.Anims[i].data.xa, Config.Anims[i].data.yb, Config.Anims[i].data.zc)

					elseif Config.Anims[i].data.type == 'brief' then

						if name == 'brief' then
							GiveWeaponToPed(player, 0x88C78EB7, 1, false, true)
						else
							GiveWeaponToPed(player, 0x01B79F17, 1, false, true)
						end
						return
					elseif Config.Anims[i].data.type == 'scenario' then
						local ad = Config.Anims[i].data.ad

						if vehiclecheck() then
							if IsPedActiveInScenario(player) then
								ClearPedTasks(player)
							else
								TriggerEvent('erp_customscripts:Scenario', ad)
							end
						end
					elseif Config.Anims[i].data.type == 'walkstyle' then
						local ad = Config.Anims[i].data.ad
						if vehiclecheck() then
							TriggerEvent('erp_customscripts:Walking', ad)
							if not playerCurrentlyHasWalkstyle then
								playerCurrentlyHasWalkstyle = true
							end
						end
					else

						if vehiclecheck() then
							local ad = Config.Anims[i].data.ad
							local anim = Config.Anims[i].data.anim
							local body = Config.Anims[i].data.body

							TriggerEvent('erp_customscripts:Animation', ad, anim, body) -- Load/Start animation

							if prop_one ~= 0 then
								local prop_two = Config.Anims[i].data.proptwo
								local bonetwo = nil

								loadPropDict(prop_one)
								TriggerEvent('erp_customscripts:AttachProp', prop_one, boneone, Config.Anims[i].data.x, Config.Anims[i].data.y, Config.Anims[i].data.z, Config.Anims[i].data.xa, Config.Anims[i].data.yb, Config.Anims[i].data.zc)
								if prop_two ~= 0 then
									bonetwo = Config.Anims[i].data.bonetwo
									prop_two = Config.Anims[i].data.proptwo
									loadPropDict(prop_two)
									TriggerEvent('erp_customscripts:AttachProp', prop_two, bonetwo, Config.Anims[i].data.twox, Config.Anims[i].data.twoy, Config.Anims[i].data.twoz, Config.Anims[i].data.twoxa, Config.Anims[i].data.twoyb, Config.Anims[i].data.twozc)
								end
							end
						end
					end
				end
			end
		end
	end
end)

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(500)
	end
end

function loadPropDict(model)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(500)
	end
end

function RequestWalking(ad)
	RequestAnimSet( ad )
	while ( not HasAnimSetLoaded( ad ) ) do
		Citizen.Wait( 500 )
	end
end


function vehiclecheck()
	local player = PlayerPedId()
	if IsPedInAnyVehicle(player, false) then
		return false
	end
	return true
end
