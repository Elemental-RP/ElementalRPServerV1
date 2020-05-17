--====================================================================================
--  Function APP BANK
--====================================================================================

--[[
      Appeller SendNUIMessage({event = 'updateBankbalance', banking = xxxx})
      à la connection & à chaque changement du compte
--]]

-- ES / ESX Implementation
inMenu                      = true
local bank = 0
local firstname = ''
local lastname = ''

function setBankBalance (value)
      bank = value
      SendNUIMessage({event = 'updateBankbalance', banking = bank})
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
      local accounts = playerData.accounts or {}
      for index, account in ipairs(accounts) do 
            if account.name == 'bank' then
                  setBankBalance(account.money)
                  break
            end
      end
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
      if account.name == 'bank' then
            setBankBalance(account.money)
      end
end)

RegisterNetEvent("es:addedBank")
AddEventHandler("es:addedBank", function(m)
      setBankBalance(bank + m)
end)

RegisterNetEvent("es:removedBank")
AddEventHandler("es:removedBank", function(m)
      setBankBalance(bank - m)
end)

RegisterNetEvent('es:displayBank')
AddEventHandler('es:displayBank', function(bank)
      setBankBalance(bank)
end)



--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('gcPhone:transfer', data.to, data.amountt)
end)

--===============================================
--==             Ad ve Soyad                   ==
--===============================================

RegisterNetEvent("gcPhone:firstname")
AddEventHandler("gcPhone:firstname", function(_firstname)
  firstname = _firstname
  SendNUIMessage({event = 'updateMyFirstname', firstname = firstname})
end)

RegisterNetEvent("gcPhone:lastname")
AddEventHandler("gcPhone:lastname", function(_lastname)
  lastname = _lastname
  SendNUIMessage({event = 'updateMyListname', lastname = lastname})
end)









