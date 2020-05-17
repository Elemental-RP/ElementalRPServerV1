--------------------------------
------- Created by Hamza -------
-------------------------------- 

ESX = nil

local PlayerHackTimer = {}
local PlayerDrugsTimer = {}
local PlayerConvertTimer = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("erp-drugs:startHackTimer")
AddEventHandler("erp-drugs:startHackTimer",function(source)
	table.insert(PlayerHackTimer,{started = GetPlayerIdentifier(source), time = 7200000}) -- cooldown timer for using USB stick
end)

RegisterServerEvent("erp-drugs:startDrugsTimer") 
AddEventHandler("erp-drugs:startDrugsTimer",function(source)
	table.insert(PlayerDrugsTimer,{startedDrugs = GetPlayerIdentifier(source), timeDrugs = 15000}) -- do not touch this
end)

RegisterServerEvent("erp-drugs:startConvertTimer")
AddEventHandler("erp-drugs:startConvertTimer",function(source)
	table.insert(PlayerConvertTimer,{startedConvert = GetPlayerIdentifier(source), timeConvert = 15000}) -- do not touch this
end)

Citizen.CreateThread(function() -- do not touch this thread function!
	while true do
	Citizen.Wait(1000)
		for k,v in pairs(PlayerHackTimer) do
			if v.time <= 0 then
				RemoveStarted(v.started)
			else
				v.time = v.time - 1000
			end
		end
		for k,v in pairs(PlayerDrugsTimer) do
			if v.timeDrugs <= 0 then
				RemoveStartedDrugs(v.startedDrugs)
			else
				v.timeDrugs = v.timeDrugs - 1000
			end
		end
		for k,v in pairs(PlayerConvertTimer) do
			if v.timeConvert <= 0 then
				RemoveStartedConvert(v.startedConvert)
			else
				v.timeConvert = v.timeConvert - 1000
			end
		end
	end
end)

-- // ## DRUGS MISSIONS ## // --

RegisterServerEvent("erp-drugs:reward")
AddEventHandler("erp-drugs:reward",function(amount,typed)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(typed.."brick",math.ceil(amount))
end)

RegisterServerEvent("erp-drugs:syncMissionData")
AddEventHandler("erp-drugs:syncMissionData",function(data)
	TriggerClientEvent("erp-drugs:syncMissionData",-1,data)
end)

ESX.RegisterUsableItem('methburn', function(source)
	if not CheckedStarted(GetPlayerIdentifier(source)) then
		TriggerEvent("erp-drugs:startHackTimer",source)
		TriggerClientEvent("erp-drugs:UsableItem",source)
		Citizen.Wait(8000)
		TriggerClientEvent("erp-drugs:HackingMiniGame",source)
			
		ESX.RegisterServerCallback("erp-drugs:StartMissionNow",function(source,cb)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			cb()
			TriggerClientEvent("erp-drugs:startMission",source,0,"meth")
		end)
		
 	else
		 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Podes hackear a network novamente dentro de: ".. GetTimeForMission(GetPlayerIdentifier(source)) .." minutos", length = 4000})
  	end
end)

ESX.RegisterUsableItem('cokeburn', function(source)
	if not CheckedStarted(GetPlayerIdentifier(source)) then
		TriggerEvent("erp-drugs:startHackTimer",source)
		TriggerClientEvent("erp-drugs:UsableItem",source)
		Citizen.Wait(8000)
		TriggerClientEvent("erp-drugs:HackingMiniGame",source)
		
		ESX.RegisterServerCallback("erp-drugs:StartMissionNow",function(source,cb)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			cb()
			TriggerClientEvent("erp-drugs:startMission",source,0,"coke")
		end)
		
 	else
		 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Podes hackear a network novamente dentro de: ".. GetTimeForMission(GetPlayerIdentifier(source)) .." minutos", length = 4000})
  	end
end)

ESX.RegisterUsableItem('weedburn', function(source)
	if not CheckedStarted(GetPlayerIdentifier(source)) then
		TriggerEvent("erp-drugs:startHackTimer",source)
		TriggerClientEvent("erp-drugs:UsableItem",source)
		Citizen.Wait(8000)
		TriggerClientEvent("erp-drugs:HackingMiniGame",source)
		
		ESX.RegisterServerCallback("erp-drugs:StartMissionNow",function(source,cb)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			cb()
			TriggerClientEvent("erp-drugs:startMission",source,0,"weed")
		end)
	
	else
		 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Podes hackear a network novamente dentro de: ".. GetTimeForMission(GetPlayerIdentifier(source)) .." minutos", length = 4000})
	end
end)

-- // ## DRUGS EFFECT ## // --

ESX.RegisterUsableItem('meth1g', function(source)
	if not CheckedStartedDrugs(GetPlayerIdentifier(source)) then
	TriggerEvent("erp-drugs:startDrugsTimer",source)
	TriggerClientEvent("esx_drugs:activate_meth",source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem("meth1g",1)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Podes consumir outra droga dentro de: ".. GetTimeForDrugs(GetPlayerIdentifier(source)) .." segundos", length = 4000})
	end
end)

ESX.RegisterUsableItem('coke1g', function(source)
	if not CheckedStartedDrugs(GetPlayerIdentifier(source)) then
	TriggerEvent("erp-drugs:startDrugsTimer",source)
	TriggerClientEvent("esx_drugs:activate_coke",source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem("coke1g",1)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Podes consumir outra droga dentro de: ".. GetTimeForDrugs(GetPlayerIdentifier(source)) .." segundos", length = 4000})
	end
end)

ESX.RegisterUsableItem('joint2g', function(source)
	if not CheckedStartedDrugs(GetPlayerIdentifier(source)) then
	TriggerEvent("erp-drugs:startDrugsTimer",source)
	TriggerClientEvent("esx_drugs:activate_weed",source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem("joint2g",1)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Podes consumir outra droga dentro de: ".. GetTimeForDrugs(GetPlayerIdentifier(source)) .." segundos", length = 4000})
	end
end)

-- // ## DRUGS CONVERSION ## // --

-- COKE BRICK >> COKE (10G)
ESX.RegisterUsableItem('cokebrick', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local brick = xPlayer.getInventoryItem("cokebrick").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not brick then
		if not bags then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens sacos suficientes", length = 4000})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens Blocos de Cocaina suficientes", length = 4000})
		end
		return
	end
	
	local maxCokeOutput = 10
		
	if not scale then
		maxCokeOutput = 6
	end

	if xPlayer.getInventoryItem("coke10g").count <= 40 or (not scale and xPlayer.getInventoryItem("coke10g").count <= 44) then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("erp-drugs:startConvertTimer",source)
					
			xPlayer.removeInventoryItem("cokebrick",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("BrickToCoke10g",source)
			Citizen.Wait(15000)
		
			xPlayer.addInventoryItem("coke10g",maxCokeOutput)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu já estás ocupado num processo!",GetTimeForConvert(GetPlayerIdentifier(source)), length = 4000})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens espaço vazio suficiente para mais Cocaina (10G)", length = 4000})
	end
end)

-- METH BRICK >> METH (10G)
ESX.RegisterUsableItem('methbrick', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local brick = xPlayer.getInventoryItem("methbrick").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not brick then
		if not bags then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens sacos suficientes", length = 4000})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens Blocos de Meth suficientes", length = 4000})
		end
		return
	end
	
	local maxMethOutput = 10
		
	if not scale then
		maxMethOutput = 6
	end
	
	if xPlayer.getInventoryItem("meth10g").count <= 40 or (not scale and xPlayer.getInventoryItem("meth10g").count <= 44) then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("erp-drugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("methbrick",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("BrickToMeth10g",source)
			Citizen.Wait(15000)
		
			xPlayer.addInventoryItem("meth10g",maxMethOutput)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu já estás ocupado num processo!",GetTimeForConvert(GetPlayerIdentifier(source)), length = 4000})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens espaço vazio suficiente para mais Meth (10G)", length = 4000})
	end
end)

-- WEED BRICK >> WEED (20G)
ESX.RegisterUsableItem('weedbrick', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local brick = xPlayer.getInventoryItem("weedbrick").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not brick then
		if not bags then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens sacos suficientes", length = 4000})

		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens Blocos de Weed suficientes", length = 4000})

		end
		return
	end
	
	local maxWeedOutput = 10
		
	if not scale then
		maxWeedOutput = 8
	end
	
	if xPlayer.getInventoryItem("weed20g").count <= 90 or (not scale and xPlayer.getInventoryItem("weed20g").count <= 92) then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("erp-drugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("weedbrick",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("BrickToWeed20g",source)
			Citizen.Wait(15000)
		
			xPlayer.addInventoryItem("weed20g",maxWeedOutput)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu já estás ocupado num processo!",GetTimeForConvert(GetPlayerIdentifier(source)), length = 4000})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens espaço vazio suficiente para mais Weed (20G)", length = 4000})
	end
end)

-- COKE (10G) >> COKE (1G)
ESX.RegisterUsableItem('coke10g', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local coke = xPlayer.getInventoryItem("coke10g").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not coke then
		if not bags then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens sacos suficientes", length = 4000})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens Cocaina (10g) suficiente", length = 4000})
		end
		return
	end
	
	local maxCoke1gOutput = 10
		
	if not scale then
		maxCoke1gOutput = 6
	end
	
	if xPlayer.getInventoryItem("coke1g").count <= 40 or (not scale and xPlayer.getInventoryItem("coke1g").count <= 44) then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("erp-drugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("coke10g",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("Coke10gToCoke1g",source)
			Citizen.Wait(15000)
		
			xPlayer.addInventoryItem("coke1g",maxCoke1gOutput)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu já estás ocupado num processo!",GetTimeForConvert(GetPlayerIdentifier(source)), length = 4000})

		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens espaço vazio suficiente para mais Cocaina (1G)", length = 4000})
	end
end)

-- METH (10G) >> METH (1G)
ESX.RegisterUsableItem('meth10g', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem("meth10g").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not meth then
		if not bags then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens sacos suficientes", length = 4000})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens Meth (10g) suficiente", length = 4000})
		end
		return
	end
	
	local maxMeth1gOutput = 10
		
	if not scale then
		maxMeth1gOutput = 6
	end
	
	if xPlayer.getInventoryItem("meth1g").count <= 40 or (not scale and xPlayer.getInventoryItem("meth1g").count <= 44) then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("erp-drugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("meth10g",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("Meth10gToMeth1g",source)
			Citizen.Wait(15000)
		
			xPlayer.addInventoryItem("meth1g",maxMeth1gOutput)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu já estás ocupado num processo!",GetTimeForConvert(GetPlayerIdentifier(source)), length = 4000})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens espaço vazio suficiente para mais Meth (1G)", length = 4000})
	end
end)

-- WEED (20G) >> WEED (4G)
ESX.RegisterUsableItem('weed20g', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local weedBag = xPlayer.getInventoryItem("weed20g").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 5
	
	if not bags or not weedBag then
		if not bags then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens sacos suficientes", length = 4000})

		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens Weed (20g) suficiente", length = 4000})
		end
		return
	end
	
	local maxWeedBagOutput = 5
		
	if not scale then
		maxWeedBagOutput = 4
	end
	
	if xPlayer.getInventoryItem("weed4g").count <= 195 or (not scale and xPlayer.getInventoryItem("weed4g").count <= 196) then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("erp-drugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("weed20g",1)
			xPlayer.removeInventoryItem("drugbags",5)
		
			TriggerClientEvent("Weed20gToWeed4g",source)
			Citizen.Wait(15000)
		
			xPlayer.addInventoryItem("weed4g",maxWeedBagOutput)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu já estás ocupado num processo!",GetTimeForConvert(GetPlayerIdentifier(source)), length = 4000})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens espaço vazio suficiente para mais Weed (4G)", length = 4000})
	end
end)

-- WEED (4G) >> JOINT (2G)
ESX.RegisterUsableItem('weed4g', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local weed = xPlayer.getInventoryItem("weed4g").count >= 1
	local paper = xPlayer.getInventoryItem("rolpaper").count >= 2
	
	if not paper or not weed then
		if not paper then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens filtros suficientes", length = 4000})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens Weed (4g) suficiente", length = 4000})
		end
		return
	end
	
	if xPlayer.getInventoryItem("joint2g").count <= 48 then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("erp-drugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("weed4g",1)
			xPlayer.removeInventoryItem("rolpaper",2)
		
			TriggerClientEvent("Weed4gToJoint2g",source)
			Citizen.Wait(15000)
		
			xPlayer.addInventoryItem("joint2g",2)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu já estás ocupado num processo!",GetTimeForConvert(GetPlayerIdentifier(source)), length = 4000})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Tu não tens espaço vazio suficiente para mais Ganza (2G)", length = 4000})
	end
end)

-- // ## TIMERS ## // --

-- DO NOT TOUCH!!
function RemoveStarted(source)
	for k,v in pairs(PlayerHackTimer) do
		if v.started == source then
			table.remove(PlayerHackTimer,k)
		end
	end
end
-- DO NOT TOUCH!!
function GetTimeForMission(source)
	for k,v in pairs(PlayerHackTimer) do
		if v.started == source then
			return math.ceil(v.time/60000)
		end
	end
end
-- DO NOT TOUCH!!
function CheckedStarted(source)
	for k,v in pairs(PlayerHackTimer) do
		if v.started == source then
			return true
		end
	end
	return false
end

-- USABLE DRUGS EFFECTS TIMER
-- DO NOT TOUCH!!
function RemoveStartedDrugs(source)
	for k,v in pairs(PlayerDrugsTimer) do
		if v.startedDrugs == source then
			table.remove(PlayerDrugsTimer,k)
		end
	end
end
-- DO NOT TOUCH!!
function GetTimeForDrugs(source)
	for k,v in pairs(PlayerDrugsTimer) do
		if v.startedDrugs == source then
			return math.ceil(v.timeDrugs/1000)
		end
	end
end
-- DO NOT TOUCH!!
function CheckedStartedDrugs(source)
	for k,v in pairs(PlayerDrugsTimer) do
		if v.startedDrugs == source then
			return true
		end
	end
	return false
end
-- DO NOT TOUCH!!
function RemoveStartedConvert(source)
	for k,v in pairs(PlayerConvertTimer) do
		if v.startedConvert == source then
			table.remove(PlayerConvertTimer,k)
		end
	end
end
-- DO NOT TOUCH!!
function GetTimeForConvert(source)
	for k,v in pairs(PlayerConvertTimer) do
		if v.startedConvert == source then
			return math.ceil(v.timeConvert/1000)
		end
	end
end
-- DO NOT TOUCH!!
function CheckedStartedConvert(source)
	for k,v in pairs(PlayerConvertTimer) do
		if v.startedConvert == source then
			return true
		end
	end
	return false
end

-- // ## DRUG SALE ## // --

local soldAmount = {}

RegisterServerEvent("erp-drugs:sellDrugs")
AddEventHandler("erp-drugs:sellDrugs", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weed = xPlayer.getInventoryItem('weed4g').count
	local meth = xPlayer.getInventoryItem('meth1g').count
	local coke = xPlayer.getInventoryItem('coke1g').count
	local drugamount = 0
	local price = 0
	local drugType = nil
	
	if weed > 0 then
		drugType = 'weed4g'
		if weed == 1 then
			drugamount = 1
		elseif weed == 2 then
			drugamount = math.random(1,2)
		elseif weed == 3 then	
			drugamount = math.random(1,3)
		elseif weed >= 4 then	
			drugamount = math.random(1,4)
		end
		
	elseif meth > 0 then
		drugType = 'meth1g'
		if meth == 1 then
			drugamount = 1
		elseif meth == 2 then
			drugamount = math.random(1,2)
		elseif meth >= 3 then	
			drugamount = math.random(1,3)
		end
		
	elseif coke > 0 then
		drugType = 'coke1g'
		if coke == 1 then
			drugamount = 1
		elseif coke == 2 then
			drugamount = math.random(1,2)
		elseif coke >= 3 then
			drugamount = math.random(1,3)
		end
	
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Estás com falta de drogas",length = 4000})
		return
	end
	
	if drugType=='weed4g' then
		price = math.random(12,24) * 10 * drugamount
	elseif drugType=='meth1g' then
		price = math.random(24,36) * 10 * drugamount
	elseif drugType=='coke1g' then
		price = math.random(36,48) * 10 * drugamount
	end
	
	if drugType ~= nil then
		xPlayer.removeInventoryItem(drugType, drugamount)
	end
	
	AddToSoldAmount(xPlayer.getIdentifier(),drugamount)
	xPlayer.addMoney(price)
	if drugType=='weed4g' then
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Vendeste "..drugamount.."x Weed (4G) por " ..price.."€", length = 4000})
	elseif drugType=='meth1g' then
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Vendeste "..drugamount.."x Meth (1G) por " ..price.."€", length = 4000})
	elseif drugType=='coke1g' then
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Vendeste "..drugamount.."x Cocaine (1G) por " ..price.."€", length = 4000})
	end
end)

RegisterServerEvent("erp-drugs:canSellDrugs")
AddEventHandler("erp-drugs:canSellDrugs", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local soldAmount = (xPlayer.getInventoryItem("coke1g").count > 0 or xPlayer.getInventoryItem("meth1g").count > 0 or xPlayer.getInventoryItem("weed4g").count > 0) and CheckSoldAmount(xPlayer.getIdentifier()) < Config.maxCap
		TriggerClientEvent("erp-drugs:canSellDrugs",source,soldAmount)
	end
end)

RegisterServerEvent("esx_drugSale:canSellDrugs")
AddEventHandler("esx_drugSale:canSellDrugs", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local sell = (xPlayer.getInventoryItem("coke1g").count > 0 or xPlayer.getInventoryItem("meth1g").count > 0 or xPlayer.getInventoryItem("weed4g").count > 0) and CheckSellAmount(xPlayer.getIdentifier()) < 150
		TriggerClientEvent("esx_drugSale:canSellDrugs",source,sell)
	end
end)

function AddToSoldAmount(source,amount)
	for k,v in pairs(soldAmount) do
		if v.id == source then
			v.amount = v.amount + amount
			return
		end
	end
end

function CheckSoldAmount(source)
	for k,v in pairs(soldAmount) do
		if v.id == source then
			return v.amount
			
		end
	end
	table.insert(soldAmount,{id = source, amount = 0})
	return CheckSoldAmount(source)
end