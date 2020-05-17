ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('erp-minerjob:doymineral')
AddEventHandler('erp-minerjob:doymineral', function(mineral)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

		xPlayer.addInventoryItem(mineral, 1)
end)

RegisterServerEvent('erp-minerjob:recibodata')
AddEventHandler('erp-minerjob:recibodata',function(data)
	rocas = data
	TriggerClientEvent('erp-minerjob:recibodatacliente',-1,data)
end)

RegisterServerEvent('erp-minerjob:getJob')
AddEventHandler('erp-minerjob:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('erp-minerjob:setJob',xPlayers[i],xPlayer.job.name)
		end
	end
end)

-------------------
--UNIVERSIDAD------
-------------------
function calculateLevel(skills)
	local level = 0
	for i,v in pairs(skills) do
		if v == "copper" or v == "iron" or v == "gold" then
			level = level + 1
		end
	end
	return level
end

RegisterServerEvent('pop_university:setMineLevel')
AddEventHandler('pop_university:setMineLevel',function(skills)
	level = calculateLevel(skills)
	TriggerClientEvent('pop_university:setMineLevel',source,level)
end)


RegisterServerEvent('erp-minerjob:quitomin')
AddEventHandler('erp-minerjob:quitomin',function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	for i = 1, #xPlayer.inventory,1 do
		if xPlayer.inventory[i].name == "gold" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(12,20))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',5*count,source)
			end
		elseif xPlayer.inventory[i].name == "iron" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(7,16))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',3*count,source)
			end
		elseif xPlayer.inventory[i].name == "copper" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(4,10))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',3*count,source)
			end
		end
	end
end)


function recarocas()
	for i=1, #rocas, 1 do
		if rocas[i].vida < rocas[i].max then
			rocas[i].vida = rocas[i].vida + 1
		end
	end
	--Sincroniar
	TriggerClientEvent('erp-minerjob:recibodatacliente',-1,rocas)
end

function loop()
Citizen.CreateThread(function()
	while true do
		recarocas()
		Citizen.Wait(30000)
	Citizen.Wait(0)
	end
end)
end

loop()
