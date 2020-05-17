-- Use GetPlayerServerId to trigger server events with an explicit source.

erp_calls.ESX = {}
erp_calls.ESX.Instance = nil

function erp_calls.ESX.Summon(callback)
    Citizen.CreateThread(
        function()
            while not erp_calls.ESX.Instance do
                TriggerEvent('esx:getSharedObject',
                    function(esx)
                        erp_calls.ESX.Instance = esx
                    end)

                Citizen.Wait(10)
            end

            callback(erp_calls.ESX.Instance)
        end)
end
