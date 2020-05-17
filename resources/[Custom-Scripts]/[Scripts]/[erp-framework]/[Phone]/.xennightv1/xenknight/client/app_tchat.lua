RegisterNetEvent("xenknight:tchat_receive")
AddEventHandler("xenknight:tchat_receive", function(message)
  SendNUIMessage({event = 'tchat_receive', message = message})
end)

RegisterNetEvent("xenknight:tchat_channel")
AddEventHandler("xenknight:tchat_channel", function(channel, messages)
  SendNUIMessage({event = 'tchat_channel', messages = messages})
end)

RegisterNUICallback('tchat_addMessage', function(data, cb)
  TriggerServerEvent('xenknight:tchat_addMessage', data.channel, data.message)
end)

RegisterNUICallback('tchat_getChannel', function(data, cb)
  TriggerServerEvent('xenknight:tchat_channel', data.channel)
end)
