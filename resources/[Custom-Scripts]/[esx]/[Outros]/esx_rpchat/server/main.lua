AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		--if Config.EnableESXIdentity then name = GetCharacterName(source) end
		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', name), message }, color = { 128, 128, 128 } })
	end
end)

-- RegisterCommand('twt', function(source, args, rawCommand)
-- 	if source == 0 then
-- 		print('esx_rpchat: you can\'t use this command from rcon!')
-- 		return
-- 	end

-- 	args = table.concat(args, ' ')
-- 	local name = GetPlayerName(source)
-- 	if Config.EnableESXIdentity then name = GetCharacterNameESX(source) end

-- 	TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', name), args }, color = { 0, 153, 2048 } })
-- end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', name), args }, color = { 128, 128, 128 } })
end, false)






function GetCharacterNameESX(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
