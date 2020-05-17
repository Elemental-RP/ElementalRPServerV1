RegisterServerEvent('erp_3dme:shareDisplay')
AddEventHandler('erp_3dme:shareDisplay', function(text)
	TriggerClientEvent('erp_3dme:triggerDisplay', -1, text, source)
end)