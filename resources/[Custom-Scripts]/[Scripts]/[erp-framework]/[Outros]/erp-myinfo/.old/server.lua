ESX = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end
	
TriggerEvent('es:addCommand', 'minhainfo', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label
    local wallet 		= getMoneyFromUser(_source)
    local bank 			= getBankFromUser(_source)
    local black_money 	= getBlackMoneyFromUser(_source)
	
    if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)
		
		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end

		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Estás a trabalhar como: ' .. job .. ' - ' .. jobgrade, length = 4000})
		Citizen.Wait(750)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. wallet .. ' € na tua carteira', length = 4000})
		Citizen.Wait(750)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. bank .. ' € no teu banco', length = 4000})
		Citizen.Wait(750)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. black_money .. ' € dinheiro sujo na tua carteira', length = 4000})
		Citizen.Wait(750)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. money .. ' € na tua sociedade', length = 4000})											
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Estás a trabalhar como: ' .. job .. ' - ' .. jobgrade, length = 4000})
		Citizen.Wait(750)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. wallet .. ' € na tua carteira', length = 4000})
		Citizen.Wait(750)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. bank .. ' € no teu banco', length = 4000})
		Citizen.Wait(750)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. black_money .. ' € dinheiro sujo na tua carteira', length = 4000})
		Citizen.Wait(750)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Acesso negado, não podes ver o dinheiro da sociedade!', length = 4000})										
	end
end, {help = "Mostra a informação sobre o teu trabalho, dinheiro, etc"})

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
