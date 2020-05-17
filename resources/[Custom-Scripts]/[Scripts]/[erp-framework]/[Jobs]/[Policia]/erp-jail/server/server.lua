ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("jail", function(src, args, raw)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" then

		local jailPlayer = args[1]
		local jailTime = tonumber(args[2])
		local jailReason = args[3]

		if GetPlayerName(jailPlayer) ~= nil then

			if jailTime ~= nil then
				JailPlayer(jailPlayer, jailTime)

				TriggerClientEvent("esx:showNotification", src, GetPlayerName(jailPlayer) .. " Preso por " .. jailTime .. " anos!")

				if args[3] ~= nil then
					GetRPName(jailPlayer, function(Firstname, Lastname)
						TriggerClientEvent('chat:addMessage', -1, { args = { "JUIZ",  Firstname .. " " .. Lastname .. " Está agora na prisão por: " .. args[3] }, color = { 249, 166, 0 } })
					end)
				end
			else
				TriggerClientEvent("esx:showNotification", src, "Este tempo é inválido!")
			end
		else
			TriggerClientEvent("esx:showNotification", src, "Este ID não está online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "Não és um oficial!")
	end
end)

RegisterCommand("unjail", function(src, args)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" then

		local jailPlayer = args[1]

		if GetPlayerName(jailPlayer) ~= nil then
			UnJail(jailPlayer)
		else
			TriggerClientEvent("esx:showNotification", src, "Este ID não está online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "Não és um oficial!")
	end
end)

RegisterServerEvent("erp-jail:jailPlayer")
AddEventHandler("erp-jail:jailPlayer", function(targetSrc, jailTime, jailReason)
	local src = source
	local targetSrc = tonumber(targetSrc)

	JailPlayer(targetSrc, jailTime)

	GetRPName(targetSrc, function(Firstname, Lastname)
		TriggerClientEvent('chat:addMessage', -1, { args = { "JUIZ",  Firstname .. " " .. Lastname .. " Está agora na prisão por: " .. jailReason }, color = { 249, 166, 0 } })
	end)

	TriggerClientEvent("esx:showNotification", src, GetPlayerName(targetSrc) .. " Preso por " .. jailTime .. " anos!")
end)

RegisterServerEvent("erp-jail:unJailPlayer")
AddEventHandler("erp-jail:unJailPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnJail(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
	end

	TriggerClientEvent("esx:showNotification", src, xPlayer.name .. " Libertado!")
end)

RegisterServerEvent("erp-jail:updateJailTime")
AddEventHandler("erp-jail:updateJailTime", function(newJailTime)
	local src = source

	EditJailTime(src, newJailTime)
end)

RegisterServerEvent("erp-jail:prisonWorkReward")
AddEventHandler("erp-jail:prisonWorkReward", function()
	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local money = math.random(13, 21)
	
	xPlayer.addMoney(money)

	TriggerClientEvent("esx:showNotification", src, "Ganhaste ~g~ €" ..money)
end)

function JailPlayer(jailPlayer, jailTime)
	TriggerClientEvent("erp-jail:jailPlayer", jailPlayer, jailTime)

	EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
	TriggerClientEvent("erp-jail:unJailPlayer", jailPlayer)

	EditJailTime(jailPlayer, 0)
end

function EditJailTime(source, jailTime)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

ESX.RegisterServerCallback("erp-jail:retrieveJailedPlayers", function(source, cb)

	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].jail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("erp-jail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then

			cb(true, JailTime)
		else
			cb(false, 0)
		end

	end)
end)
