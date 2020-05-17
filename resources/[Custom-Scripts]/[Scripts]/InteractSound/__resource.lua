
------
-- InteractSound by Scott
-- Verstion: v0.0.1
------

-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files({
    'client/html/index.html',
	'client/html/sounds/stupid.ogg',
	'client/html/sounds/stupid2.ogg',
	'client/html/sounds/stupid1.ogg',
	'client/html/sounds/lock.ogg',
	'client/html/sounds/unlock.ogg',
    'client/html/sounds/on.ogg',
    'client/html/sounds/off.ogg'
})
