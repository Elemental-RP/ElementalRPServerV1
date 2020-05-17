fx_version 'adamant'
game 'gta5'

description 'ESX Ambulance Job'

version '1.2.0'

ui_page "html/menu.html"

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/cs.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/cs.lua',
	'config.lua',
	'client/main.lua',
	'client/job.lua',
	'client/vehicle.lua',
}

files {
	"html/menu.html",
	"html/raphael.min.js",
	"html/wheelnav.min.js",
	"html/logout.png",
	"html/InemSubMenu1.png",
	"html/reanimar.png",
	"html/curarferidaspequenas.png",
	"html/tratarferidasgraves.png",
	"html/colocarnoveiculo.png",
}

dependencies {
	'es_extended',
	'esx_skin',
	'esx_vehicleshop'
}