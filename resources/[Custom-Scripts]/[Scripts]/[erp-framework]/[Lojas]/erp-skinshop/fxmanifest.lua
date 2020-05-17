fx_version 'adamant'

game 'gta5'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/br.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'config.lua',
	'client/main.lua',
	'client/menu.lua'
}

ui_page "nui/ui.html"

files {
	"nui/ui.html",
	"nui/ui.js",
	"nui/ui.css",
	'nui/img/*.png',
	'nui/img/*.jpg',
}

dependencies {
	'es_extended',
	'esx_skin'
}