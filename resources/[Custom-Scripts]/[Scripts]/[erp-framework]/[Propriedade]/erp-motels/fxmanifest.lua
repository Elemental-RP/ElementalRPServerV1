fx_version 'adamant'
game 'gta5'

description "ERP Motel"

client_scripts {
	"client/furnishing.lua",
	"client/furnishingFunctions.lua",
	"client/functions.lua",
	"client/keys.lua",
	"client/decors.lua",
	"client/instance.lua",
	"client/storage.lua",
	"client/main.lua"
}

server_scripts {
	"@async/async.lua",
	"@mysql-async/lib/MySQL.lua",
	"server/main.lua",
	"server/keys.lua",
	"server/functions.lua",
	"server/database.lua"
}

shared_scripts {
	"config.lua",
	"configFurnishing.lua"
}

exports {
	"AddKey",
	"RemoveKey",
	"HasKey",
	"OpenStorage",
	"EnterInstance",
	"ExitInstance"
}