fx_version 'adamant'
games {'gta5'}

author 'BlackZon'
description 'ERP Personal Menu made with RageUI'
version '1.0'

dependency 'es_extended'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	"dependencies/RMenu.lua",
	"dependencies/menu/RageUI.lua",
	"dependencies/menu/Menu.lua",
	"dependencies/menu/MenuController.lua",

	"dependencies/components/*.lua",

	"dependencies/menu/elements/*.lua",
	"dependencies/menu/items/*.lua"
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua',
	'client/other.lua'
}