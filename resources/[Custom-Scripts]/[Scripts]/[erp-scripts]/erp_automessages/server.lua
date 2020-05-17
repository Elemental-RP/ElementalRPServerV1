-----[ CODE, DON'T TOUCH THIS ]-------------------------------------------
RegisterServerEvent('erp_automessages:getPlayerIdentifiers')
AddEventHandler('erp_automessages:getPlayerIdentifiers', function()
    if GetPlayerIdentifiers(source) ~= nil then
        TriggerClientEvent('erp_automessages:setPlayerIdentifiers', source, GetPlayerIdentifiers(source))
    end
end)
--------------------------------------------------------------------------