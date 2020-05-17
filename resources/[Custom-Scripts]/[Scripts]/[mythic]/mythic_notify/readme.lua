-- client
exports['mythic_notify']:SendAlert('error', 'Quantia inválida')

-- server
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Compraste o carro com a matrícula ', length = 4000})
