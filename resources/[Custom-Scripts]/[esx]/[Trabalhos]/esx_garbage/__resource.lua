resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Garbage v1.0'

version '1.0.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'config.lua',
	'client/main.lua'
}
