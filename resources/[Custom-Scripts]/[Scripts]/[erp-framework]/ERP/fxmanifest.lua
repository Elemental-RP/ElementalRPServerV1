fx_version 'adamant'
game 'gta5'

client_scripts {
	-- Base
	'ERP_Main.lua',
	'ERP_Client.lua',
	'ERP_Utilities.lua',

	-- Garage
	'ERP_Garage/ERP_Garage_Config.lua',
	'ERP_Garage/ERP_Garage_Client.lua',	

	-- Commands
	'ERP_Commands/ERP_Commands.lua',

	-- Race Mod
	'ERP_RaceMod/ERP_RaceMod_Config.lua',
	'ERP_RaceMod/ERP_RaceMod_Client.lua',

	-- Items
	'ERP_Items/ERP_NightVision_Client.lua',
	'ERP_Items/ERP_Tires_Client.lua',

	-- Notify
	'ERP_Notify/ERP_Notify_Client.lua',
	
	-- DeathCam
	'ERP_DeathCam/ERP_DeathCam_Client.lua',
}

server_scripts {	
	-- Base
	'ERP_Main.lua',
	'ERP_Server.lua',
	'ERP_Utilities.lua',

	-- MySQL
	'@mysql-async/lib/MySQL.lua',

	-- Garage
	'ERP_Garage/ERP_Garage_Config.lua',
	'ERP_Garage/ERP_Garage_Server.lua',	
	
	-- Items
	'ERP_Items/ERP_Tires_Server.lua',

	-- Race Mod
	'ERP_RaceMod/ERP_RaceMod_Config.lua',
	'ERP_RaceMod/ERP_RaceMod_Server.lua',
}
