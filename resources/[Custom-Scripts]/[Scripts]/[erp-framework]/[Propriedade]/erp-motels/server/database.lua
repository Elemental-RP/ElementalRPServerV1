if Config.CreateTableInDatabase then
    MySQL.ready(function()
        local sqlTasks = {}

        table.insert(sqlTasks, function(callback)        
            MySQL.Async.execute([[
                CREATE TABLE IF NOT EXISTS `erpm_motels` (
                    `userIdentifier` varchar(50) NOT NULL,
                    `motelData` longtext NOT NULL,
                    `motelCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
                  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
            ]], {
                callback(true)
            }, function(rowsChanged)
                ESX.Trace("Refreshed motels in database.")
            end)
        end)

        table.insert(sqlTasks, function(callback)     
            MySQL.Async.execute([[
                CREATE TABLE IF NOT EXISTS `erpm_storages` (
                `storageId` varchar(255) NOT NULL,
                `storageData` longtext NOT NULL,
                PRIMARY KEY (`storageId`)
                ) ENGINE=InnoDB DEFAULT CHARSET=latin1; 
            ]], {
                callback(true)
            }, function(rowsChanged)
                ESX.Trace("Refreshed storages in database.")
            end)
        end)
        
        table.insert(sqlTasks, function(callback)     
            MySQL.Async.execute([[
                CREATE TABLE IF NOT EXISTS `erpm_furnishings` (
                    `motelId` bigint(20) NOT NULL DEFAULT '0',
                    `furnishingData` longtext,
                    `ownedFurnishingData` longtext,
                    PRIMARY KEY (`motelId`)
                  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
            ]], {
                callback(true)
            }, function(rowsChanged)
                ESX.Trace("Refreshed furnishings in database.")
            end)
        end)

        table.insert(sqlTasks, function(callback)     
            MySQL.Async.execute([[
                CREATE TABLE IF NOT EXISTS `erpm_keys` (
                    `uuid` bigint(20) NOT NULL DEFAULT '0',
                    `owner` varchar(50) NOT NULL,
                    `keyData` longtext NOT NULL,
                    PRIMARY KEY (`uuid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
            ]], {
                callback(true)
            }, function(rowsChanged)
                ESX.Trace("Refreshed keys in database.")
            end)
        end)

        Async.parallel(sqlTasks, function(responses)
            
        end)
    end)
end