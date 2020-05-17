ESX              = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('erp-myinfo:obterinfo', function (source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = GetPlayerIdentifiers(source)[1]
	
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier ', {
		['identifier'] = xPlayer.identifier
	}, function(result)
		local thongtin = {}
		if (result[1] ~= nil) then
			for i=1, #result, 1 do
				table.insert(thongtin, {
					steamid			= tonumber(identifier:gsub("steam:",""), 16),
					playerid		= _source,
					name       		= result[i].lastname .. ' ' .. result[i].firstname,
					sex      		= result[i].sex,
					height			= result[i].height,
					dateofbirth 	= result[i].dateofbirth,
					job				= xPlayer.job.label .. " - " .. xPlayer.job.grade_label,
					phone_number	= result[i].phone_number,
					money 			= xPlayer.getMoney(),
					bank 			= xPlayer.getAccount('bank').money,
					black_money		= xPlayer.getAccount('black_money').money,
				})
			end
			cb(thongtin)
		end
	end)
end)


TriggerEvent('es:addCommand', 'dsociedade', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local jobgrade = xPlayer.job.grade_name

    if jobgrade == 'boss' or jobgrade == 'diretornacional' or jobgrade == 'comissario' or jobgrade == 'subc' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end

		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. money .. ' € na tua sociedade', length = 4000})											
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Acesso negado, não podes ver o dinheiro da sociedade!', length = 4000})										
	end
end, {help = "Mostra o dinheiro da sociedade"})


function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end