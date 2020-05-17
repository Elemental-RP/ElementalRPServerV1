ESX = nil
local savedNotes = {
  
}

TriggerEvent('server:LoadsNote')
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('notepad', function(source)
  local _source  = source
  local xPlayer   = ESX.GetPlayerFromId(_source)
  TriggerClientEvent('erp-notepad:note', _source)
  TriggerClientEvent('erp-notepad:OpenNotepadGui', _source)
end)


TriggerEvent('es:addCommand', 'blocodenotas', function(source, args, user)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local item    = xPlayer.getInventoryItem('notepad').count
if item > 0 then
    TriggerClientEvent('erp-notepad:note', _source)
    TriggerClientEvent('erp-notepad:OpenNotepadGui', _source)
    TriggerEvent('server:LoadsNote')
else
     TriggerClientEvent('esx:showNotification', _source, 'Não tens um Bloco de Notas.')
end
    
end, {help = "Open notepad if you have it!"})


RegisterNetEvent("server:LoadsNote")
AddEventHandler("server:LoadsNote", function()
   TriggerClientEvent('erp-notepad:updateNotes', -1, savedNotes)
end)

RegisterNetEvent("server:newNote")
AddEventHandler("server:newNote", function(text, x, y, z)
      local import = {
        ["text"] = ""..text.."",
        ["x"] = x,
        ["y"] = y,
        ["z"] = z,
      }
      table.insert(savedNotes, import)
      TriggerEvent("server:LoadsNote")
end)

RegisterNetEvent("server:updateNote")
AddEventHandler("server:updateNote", function(noteID, text)
  savedNotes[noteID]["text"]=text
  TriggerEvent("server:LoadsNote")
end)

RegisterNetEvent("server:destroyNote")
AddEventHandler("server:destroyNote", function(noteID)
  table.remove(savedNotes, noteID)
  TriggerEvent("server:LoadsNote")
end)

