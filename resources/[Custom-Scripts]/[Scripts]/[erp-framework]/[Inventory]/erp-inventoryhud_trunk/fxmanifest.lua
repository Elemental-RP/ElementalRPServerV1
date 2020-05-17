fx_version 'adamant'
games {'gta5'}

description "ESX trunk inventory"
version "1.0.0"

server_scripts {
  "@async/async.lua",
  "@mysql-async/lib/MySQL.lua",
  "@es_extended/locale.lua",
  "locales/en.lua",
  "config.lua",
  "server/classes/c_trunk.lua",
  "server/trunk.lua",
  "server/esx_trunk-sv.lua"
}

client_scripts {
  "@es_extended/locale.lua",
  "locales/en.lua",
  "config.lua",
  "client/esx_trunk-cl.lua"
}
