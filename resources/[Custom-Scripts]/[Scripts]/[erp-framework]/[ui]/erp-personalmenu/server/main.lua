ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getMaximumGrade(jobname)
	local result = MySQL.Sync.fetchAll('SELECT * FROM job_grades WHERE job_name = @jobname ORDER BY `grade` DESC ;', {
		['@jobname'] = jobname
	})

	if result[1] ~= nil then
		return result[1].grade
	end

	return nil
end

function getAdminCommand(name)
	for i = 1, #Config.Admin, 1 do
		if Config.Admin[i].name == name then
			return i
		end
	end

	return false
end

function isAuthorized(index, group)
	for i = 1, #Config.Admin[index].groups, 1 do
		if Config.Admin[index].groups[i] == group then
			return true
		end
	end

	return false
end

ESX.RegisterServerCallback('erp-personalmenu:Admin_getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if plyGroup ~= nil then 
		cb(plyGroup)
	else
		cb('user')
	end
end)

-- Admin Menu --
RegisterServerEvent('erp-personalmenu:Admin_BringS')
AddEventHandler('erp-personalmenu:Admin_BringS', function(plyId, targetId)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('bring'), plyGroup) or isAuthorized(getAdminCommand('goto'), plyGroup) then
		local targetCoords = GetEntityCoords(GetPlayerPed(targetId))
		TriggerClientEvent('erp-personalmenu:Admin_BringC', plyId, targetCoords)
	end
end)

RegisterServerEvent('erp-personalmenu:Admin_giveCash')
AddEventHandler('erp-personalmenu:Admin_giveCash', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('givemoney'), plyGroup) then
		xPlayer.addMoney(money)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Deu ' .. money .. '€')
	end
end)

RegisterServerEvent('erp-personalmenu:Admin_giveBank')
AddEventHandler('erp-personalmenu:Admin_giveBank', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('givebank'), plyGroup) then
		xPlayer.addAccountMoney('bank', money)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Deu ' .. money .. '€ no banco')
	end
end)

RegisterServerEvent('erp-personalmenu:Admin_giveDirtyMoney')
AddEventHandler('erp-personalmenu:Admin_giveDirtyMoney', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('givedirtymoney'), plyGroup) then
		xPlayer.addAccountMoney('black_money', money)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Deu ' .. money .. '€ de dinheiro sujo')
	end
end)