fx_version 'adamant'
games {'gta5'}

description "ERP Inventory HUD"

version "1.0"

ui_page "html/ui.html"

client_scripts {
  "@es_extended/locale.lua",
  "client/main.lua",
  "client/trunk.lua",
  "client/property.lua",
  "client/player.lua",
  "locales/en.lua",
  "config.lua"
}

server_scripts {
  "@es_extended/locale.lua",
  "server/main.lua",
  "locales/en.lua",
  "config.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  -- JS LOCALES
  "html/locales/en.js",
  -- IMAGES
  "html/img/bullet.png",
  -- ICONS
  "html/img/items/*.png"
}