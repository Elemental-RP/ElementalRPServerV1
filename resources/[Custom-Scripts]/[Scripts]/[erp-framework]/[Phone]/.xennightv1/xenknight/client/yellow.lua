RegisterNetEvent("xenknight:yellow_getPagess")
AddEventHandler("xenknight:yellow_getPagess", function(pagess)
  SendNUIMessage({event = 'yellow_pagess', pagess = pagess})
end)

RegisterNetEvent("xenknight:yellow_newPagess")
AddEventHandler("xenknight:yellow_newPagess", function(pages)
  SendNUIMessage({event = 'yellow_newPages', pages = pages})
end)

RegisterNetEvent("xenknight:yellow_showError")
AddEventHandler("xenknight:yellow_showError", function(title, message)
  SendNUIMessage({event = 'yellow_showError', message = message, title = title})
end)

RegisterNetEvent("xenknight:yellow_showSuccess")
AddEventHandler("xenknight:yellow_showSuccess", function(title, message)
  SendNUIMessage({event = 'yellow_showSuccess', message = message, title = title})
end)

RegisterNUICallback('yellow_getPagess', function(data, cb)
  TriggerServerEvent('xenknight:yellow_getPagess', data.firstname, data.phone_number)
end)

RegisterNUICallback('yellow_postPages', function(data, cb)
  TriggerServerEvent('xenknight:yellow_postPagess', data.firstname or '', data.phone_number or '', data.lastname or '', data.message)
end)

RegisterNUICallback('deleteYellow', function(data)
  TriggerServerEvent('xenknight:deleteYellow', data.id)
end)
