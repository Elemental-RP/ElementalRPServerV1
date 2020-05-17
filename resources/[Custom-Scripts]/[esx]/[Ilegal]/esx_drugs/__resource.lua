resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Illegal Drugs refactored by Diorges Rocha'

version '1.0.3'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/br.lua',
	'config.lua',
	'server/server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/br.lua',
	'config.lua',
	'client/client.lua'
}
