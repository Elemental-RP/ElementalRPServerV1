local m = {} -- <<< Don't touch this!
-----------[ SETTINGS ]---------------------------------------------------

-- Delay in minutes between messages
m.delay = 25

-- Prefix appears in front of each message.
-- Suffix appears on the end of each message.
-- Leave a prefix/suffix empty ( '' ) to disable them.
m.prefix = '^8[Elemental RP] '
m.suffix = '^8.'

-- You can make as many messages as you want.
-- You can use ^0-^9 in your messages to change text color.
m.messages = {
    ' ^1Servidor criado por BlackZon e Sof',
	' ^1Simula ao máximo RP',
    ' ^2Discord: https://discord.gg/aVESVq9',
	' ^2Simula ao máximo FearRP & PainRP',
	' ^3Não faças PowerGaming',
	' ^4Não faças MetaGaming',
	' ^4Existe autorestart no servidor para o manter sem lag etc.',
}

-- Player identifiers on this list will not receive any messages.
-- Simply remove all identifiers if you don't want an ignore list.
m.ignorelist = {
    'ip:127.0.0.1',
    'steam:',
    'license:',
}
--------------------------------------------------------------------------


















-----[ CODE, DON'T TOUCH THIS ]-------------------------------------------
local playerIdentifiers
local enableMessages = true
local timeout = m.delay * 1000 * 60 -- from ms, to sec, to min
local playerOnIgnoreList = false
RegisterNetEvent('erp_automessages:setPlayerIdentifiers')
AddEventHandler('erp_automessages:setPlayerIdentifiers', function(identifiers)
    playerIdentifiers = identifiers
end)
Citizen.CreateThread(function()
    while playerIdentifiers == {} or playerIdentifiers == nil do
        Citizen.Wait(1000)
        TriggerServerEvent('erp_automessages:getPlayerIdentifiers')
    end
    for iid in pairs(m.ignorelist) do
        for pid in pairs(playerIdentifiers) do
            if m.ignorelist[iid] == playerIdentifiers[pid] then
                playerOnIgnoreList = true
                break
            end
        end
    end
    if not playerOnIgnoreList then
        while true do
            for i in pairs(m.messages) do
                if enableMessages then
                    chat(i)
                    print('[ANUNCIOS] Mensagem #' .. i .. ' enviada.')
                end
                Citizen.Wait(timeout)
            end

            Citizen.Wait(0)
        end
    else
        print('[ANUNCIOS] Player is on ignorelist, no announcements will be received.')
    end
end)
function chat(i)
    TriggerEvent('chatMessage', '', {255,255,255}, m.prefix .. m.messages[i] .. m.suffix)
end
RegisterCommand('automessage', function()
    enableMessages = not enableMessages
    if enableMessages then
        status = '^2enabled^5.'
    else
        status = '^1disabled^5.'
    end
    TriggerEvent('chatMessage', '', {255, 255, 255}, '^5[ANUNCIOS] mensagens automaticas estão agora ' .. status)
end, false)
--------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30000)
		collectgarbage()
	end
end)
