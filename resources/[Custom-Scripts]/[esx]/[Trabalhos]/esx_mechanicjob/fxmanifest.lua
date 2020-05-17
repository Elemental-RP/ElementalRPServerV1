fx_version 'adamant'
game 'gta5'

description 'ESX Mechanic Job'
version '1.1.0'

ui_page "html/menu.html"

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/br.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/nl.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/br.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/nl.lua',
	'config.lua',
	'server/main.lua'
}

files {
	"html/menu.html",
	"html/raphael.min.js",
	"html/wheelnav.min.js",
	"html/logout.png",
	"html/faturas.png",
	"html/anim.png",
	"html/limp.png",
	"html/del.png",
	"html/rebocar.png",
	"html/repair.png",
	"html/logout.png",
	"html/spawn.png",
	"html/cone.png",
	"html/macaco.png",
	"html/exhaust.png",
	"html/ferramentas.png"
}


dependencies {
	'es_extended',
	'esx_society',
	'esx_billing'
}
