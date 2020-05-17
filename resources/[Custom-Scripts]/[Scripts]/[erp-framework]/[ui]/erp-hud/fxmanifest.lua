fx_version 'adamant'
game 'gta5'

client_script {
	'client.lua'
}

server_scripts {
	'server.lua',
}

ui_page('html/index.html')

files({
	"html/script.js",
	"html/jquery.min.js",
	"html/jquery-ui.min.js",
	"html/styles.css",
	"html/img/*.svg",
	"html/index.html",

	'html/fonts/pricedown.ttf',
	'html/fonts/gta-ui.ttf',

	'html/css/jquery-ui.min.css',
	'html/js/jquery.min.js',
	'html/js/jquery-ui.min.js',

})

dependencies {
	'baseevents'
}
