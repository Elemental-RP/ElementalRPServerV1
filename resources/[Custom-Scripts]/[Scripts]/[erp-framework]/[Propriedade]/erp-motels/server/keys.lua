ESX.RegisterServerCallback("erp-motels:addKey", function(source, callback, keyData)
    local player = ESX.GetPlayerFromId(source)

    if not player then return callback(false) end

    local sqlQuery = [[
        INSERT
            INTO
        erpm_keys
            (uuid, owner, keyData)
        VALUES
            (@uuid, @owner, @data)
        ON DUPLICATE KEY UPDATE
            keyData = @data
    ]]

    MySQL.Async.execute(sqlQuery, {
        ["@uuid"] = keyData["uuid"],
        ["@owner"] = player["identifier"],
        ["@data"] = json.encode(keyData)
    }, function(rowsChanged)
        if rowsChanged > 0 then
            callback(true)
        else
            callback(false)
        end
    end)
end)

ESX.RegisterServerCallback("erp-motels:removeKey", function(source, callback, keyUUID)
    local player = ESX.GetPlayerFromId(source)

    if not player then return callback(false) end

    local sqlQuery = [[
        DELETE
            FROM
        erpm_keys
            WHERE
        uuid = @uuid
    ]]

    MySQL.Async.execute(sqlQuery, {
        ["@uuid"] = keyUUID
    }, function(rowsChanged)
        if rowsChanged > 0 then
            callback(true)
        else
            callback(false)
        end
    end)
end)

ESX.RegisterServerCallback("erp-motels:transferKey", function(source, callback, keyData, receivePlayer)
    local player = ESX.GetPlayerFromId(source)
    local receivePlayer = ESX.GetPlayerFromId(receivePlayer)

    if not player then return callback(false) end

    local sqlQuery = [[
        UPDATE
            erpm_keys
        SET
            owner = @newOwner
        WHERE
            uuid = @uuid
    ]]

    MySQL.Async.execute(sqlQuery, {
        ["@uuid"] = keyData["uuid"],
        ["@newOwner"] = receivePlayer["identifier"]
    }, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent("erp-motels:keyTransfered", receivePlayer["source"], keyData)

            callback(true)
        else
            callback(false)
        end
    end)
end)