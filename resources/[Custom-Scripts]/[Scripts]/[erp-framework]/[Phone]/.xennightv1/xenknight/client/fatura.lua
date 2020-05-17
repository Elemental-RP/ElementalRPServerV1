RegisterNetEvent("xenknight:fatura_getBilling")
AddEventHandler("xenknight:fatura_getBilling", function(billingg)
  SendNUIMessage({event = 'fatura_billingg', billingg = billingg})
end)

RegisterNUICallback('fatura_getBilling', function(data, cb)
  TriggerServerEvent('xenknight:fatura_getBilling', data.label, data.amount, data.sender)
end)

RegisterNUICallback('faturapayBill', function(data)
  TriggerServerEvent('xenknight:faturapayBill', data.id, data.sender, data.amount, data.target)
end)
