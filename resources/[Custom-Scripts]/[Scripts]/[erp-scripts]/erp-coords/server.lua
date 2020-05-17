local Webhook = 'https://discordapp.com/api/webhooks/676178130896945175/i5g16sLarbU0fxcaD_O71izaBxMz7v2lOs1xVqtqfHvq5DSiMvzXmh9excyp4bgFijgT'

local SystemName = 'Coordenadas > BOT'

RegisterCommand("gc", function(source, args, rawCommand)
    local source = source
    TriggerClientEvent('erp-coords', source)
end, true)

RegisterCommand("gc1", function(source, args, rawCommand)
    local source = source
	TriggerClientEvent('erp-coords1', source)
end, true)

RegisterServerEvent('erp-coords:print')
AddEventHandler('erp-coords:print', function(msg)
    ToDiscord(SystemName, '```css\n '..msg..'\n```')
end)

function ToDiscord(Name, Message, Image)
	if Message == nil or Message == '' then
		return false
	end
	
	if Image then
		PerformHttpRequest(Webhook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image}), { ['Content-Type'] = 'application/json' })
	else
		PerformHttpRequest(Webhook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message}), { ['Content-Type'] = 'application/json' })
	end
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end
