local ERPG = ERP.Garage

function ERPG:GetPlayerVehicles(identifier)  
  local playerVehicles = {}
  local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = identifier}) 
  for key,val in pairs(data) do
    if (not val.job or val.job == nil) and (val.type and val.type == "car") then
      local playerVehicle = json.decode(val.vehicle)
      table.insert(playerVehicles, {owner = val.owner, veh = val.vehicle, vehicle = playerVehicle, plate = val.plate, stored = val.stored})
    end
  end
  return playerVehicles
end

ESX.RegisterServerCallback('ERPG:StoreVehicle', function(source, cb, vehicleProps)
  local isFound = false
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do
    xPlayer = ESX.GetPlayerFromId(source)
    Citizen.Wait(0)
  end

  local playerVehicles = ERPG:GetPlayerVehicles(xPlayer.getIdentifier())
  local plate = vehicleProps.plate

  for key,val in pairs(playerVehicles) do
    if(plate == val.plate) then
      local vehProps = json.encode(vehicleProps)
      MySQL.Sync.execute("UPDATE owned_vehicles SET vehicle=@vehProps WHERE plate=@plate",{['@vehProps'] = vehProps, ['@plate'] = val.plate})
      isFound = true
      break
    end
  end
  cb(isFound)
end)

ESX.RegisterServerCallback('ERPG:GetVehicles', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do
    xPlayer = ESX.GetPlayerFromId(source)
    Citizen.Wait(0)
  end
  local vehicles = ERPG:GetPlayerVehicles(xPlayer.getIdentifier())
  cb(vehicles)
end)


RegisterNetEvent('ERPG:FinePlayer')
AddEventHandler('ERPG:FinePlayer', function(amount)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do
    xPlayer = ESX.GetPlayerFromId(source)
    Citizen.Wait(0)
  end

  xPlayer.removeMoney(amount)
end)

RegisterNetEvent('ERPG:ChangeState')
AddEventHandler('ERPG:ChangeState', function(plate, stored)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do
    xPlayer = ESX.GetPlayerFromId(source)
    Citizen.Wait(0)
  end

  local vehicles = ERPG:GetPlayerVehicles(xPlayer.getIdentifier())
  for key,val in pairs(vehicles) do
    if(plate == val.plate) then
      MySQL.Sync.execute("UPDATE owned_vehicles SET stored=@stored WHERE plate=@plate",{['@stored'] = stored , ['@plate'] = plate})
      break
    end   
  end
end)

function ERPG.Startup()
  while not ERP.SQLReady do 
    Citizen.Wait(0)
  end

  local dbconvar = GetConvar('mysql_connection_string', 'Empty')
  if dbconvar == "Empty" then print("ERPG.Startup(): Error: local dbconvar is empty."); return; end

  local strStart,strEnd = string.find(dbconvar, "database=")
  local dbStart,dbEnd = string.find(dbconvar,";",strEnd)
  local dbName = string.sub(dbconvar, strEnd + 1, dbEnd - 1)  

    local dbconfig  =
    {
      ["@dbname@"]  = dbName,
      ["@dbtable@"] = "owned_vehicles",
      ["@dbfield@"] = "stored",
      ["@dbfieldconf@"] = "int(11) NOT NULL DEFAULT 0",
    }

    local query1 = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA ='@dbname@' and COLUMN_NAME='@dbfield@' and TABLE_NAME='@dbtable@';"
    local query2 = "ALTER TABLE `@dbtable@` ADD COLUMN `@dbfield@` @dbfieldconf@;"

    local curquery1 = ERPG.Replace(dbconfig,query1)
    local curquery2 = ERPG.Replace(dbconfig,query2)

    local data = MySQL.Sync.fetchAll( curquery1 )
    if #data == 0 then MySQL.Sync.fetchAll( curquery2 );  end;
end

function ERPG.Replace(c,q)
    for repThis,repWith in pairs(type(c) == "table" and c or {}) do q = tostring(q):gsub(repThis,repWith); end;
    return q
end

AddEventHandler('onMySQLReady', function() MySQL.Async.execute("UPDATE owned_vehicles SET `stored`=1 WHERE `stored`=0", {}) end)
AddEventHandler('onMySQLReady', function() MySQL.Async.execute("UPDATE owned_vehicles_jobs SET `stored`=true WHERE `stored`=false", {}) end)

RegisterNetEvent('ERPG:Startup')
AddEventHandler('ERPG:Startup', ERPG.Startup)
