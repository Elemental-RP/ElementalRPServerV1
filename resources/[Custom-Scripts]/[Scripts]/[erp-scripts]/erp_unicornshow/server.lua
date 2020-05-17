TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local places ={}

function joueurs(ped)

	local players = GetPlayers()
	for k,v in pairs(players) do
		--print (v)
		TriggerClientEvent('erp_unicornshow:StopDance',v,ped)
	end
end
RegisterServerEvent('erp_unicornshow:RegisterShow')
AddEventHandler('erp_unicornshow:RegisterShow',function(param)
	--print (param.label)
	table.insert(places,{
		label = param.label,
		ped   = param.ped
		})
end)


RegisterServerEvent('erp_unicornshow:DeleteShow')
AddEventHandler('erp_unicornshow:DeleteShow',function(label)
	for i=1,#places do
		if places[i].label == label then
			ped = places[i].ped
			joueurs(ped)
			table.remove(places,i)
		end
	end
end)
