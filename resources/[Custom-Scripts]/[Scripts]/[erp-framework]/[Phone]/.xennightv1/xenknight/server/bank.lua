TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('xenknight:transfer')
AddEventHandler('xenknight:transfer', function(to, amountt)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(to)
    local balance = 0
    if zPlayer ~= nil then
        balance = xPlayer.getAccount('bank').money
        zbalance = zPlayer.getAccount('bank').money
        if tonumber(_source) == tonumber(to) then
            -- advanced notification with Banco icon
            TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank',
                               'Transferência de Dinheiro',
                               'Não podes transferir para ti mesmo!',
                               'CHAR_BANK_MAZE', 9)
        else
            if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <=
                0 then
                -- advanced notification with bank icon
                TriggerClientEvent('esx:showAdvancedNotification', _source,
                                   'Banco', 'Transferência de Dinheiro',
                                   'Não tens dinheiro suficiente!',
                                   'CHAR_BANK_MAZE', 9)
            else
                xPlayer.removeAccountMoney('bank', tonumber(amountt))
                zPlayer.addAccountMoney('bank', tonumber(amountt))
                -- advanced notification with bank icon
                TriggerClientEvent('esx:showAdvancedNotification', _source,
                                   'Banco', 'Transferência de Dinheiro',
                                   'Transferiste ~r~$' .. amountt ..
                                       '~s~ para ~r~' .. to .. ' .',
                                   'CHAR_BANK_MAZE', 9)
                TriggerClientEvent('esx:showAdvancedNotification', to, 'Banco',
                                   'Transferência de Dinheiro', 'Recebeste ~r~$' ..
                                       amountt .. '~s~ de ~r~' .. _source ..
                                       ' .', 'CHAR_BANK_MAZE', 9)
            end

        end
    end

end)


function myfirstname(phone_number, firstname, cb)
  MySQL.Async.fetchAll("SELECT firstname, phone_number FROM users WHERE users.firstname = @firstname AND users.phone_number = @phone_number", {
    ['@phone_number'] = phone_number,
	['@firstname'] = firstname
  }, function (data)
    cb(data[1])
  end)
end
