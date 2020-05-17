fx_version 'adamant'
game 'gta5'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/caldinbak.js',
	'html/static/css/app.css',
	'html/static/js/app.js',
	'html/static/js/manifest.js',
	'html/static/js/vendor.js',	
	'html/static/js/kitli.js',	
	'html/static/js/destekcim.js',	
	'html/static/js/0.js',	
	'html/static/js/sevdim.js',	
	
	'html/static/config/config.json',
	'html/static/config/haberler.json',
	
	-- Coque
	'html/static/img/coque/s8.png',
	'html/static/img/coque/iphonex.png',
	'html/static/img/coque/base.png',
	'html/static/img/coque/transparent.png',
	
	-- Background
	'html/static/img/background/NeonMask.jpg',
	'html/static/img/background/snus.jpg',
	'html/static/img/background/trippy.jpg',
	'html/static/img/background/wolf__gif__by_furrirama-d9ek9s4.gif',
	
	'html/static/img/icons_app/call.png',
	'html/static/img/icons_app/contacts.png',
	'html/static/img/icons_app/sms.png',
	'html/static/img/icons_app/settings.png',
	'html/static/img/icons_app/menu.png',
	'html/static/img/icons_app/bourse.png',
	'html/static/img/icons_app/tchat.png',
	'html/static/img/icons_app/photo.png',
	'html/static/img/icons_app/bank.png',
	'html/static/img/icons_app/9gag.png',
	'html/static/img/icons_app/twitter.png',
	'html/static/img/icons_app/market.png',
	'html/static/img/icons_app/reddit.png',
	'html/static/img/yellowpages/logo.png',
	'html/static/img/fatura/logo.png',
	'html/static/img/2048/logo.png',
	'html/static/img/2048/logo2.png',
	'html/static/img/2048/haber.png',
	'html/static/img/2048/snake.png',
	'html/static/img/instagram/instagram.png',
	
	-- trabalhos
	'html/static/img/icons_app/inem.png',
	'html/static/img/icons_app/rsa.png',
	'html/static/img/icons_app/psp.png',
	'html/static/img/icons_app/bombeiros.png',
	'html/static/img/icons_app/brisa.png',
	'html/static/img/icons_app/taxi.png',
	'html/static/img/icons_app/unicorn.png',

	
	'html/static/img/app_bank/logo_mazebank.jpg',
	'html/static/img/app_bank/bankm.png',
	'html/static/img/img/bg.png',
	'html/static/img/img/circle.png',
	'html/static/img/img/curve.png',
	'html/static/img/img/fingerprint.png',
	'html/static/img/img/fingerprint.jpg',
	'html/static/img/img/graph.png',
	'html/static/img/img/logo-big.png',
	'html/static/img/img/logo-top.png',

	'html/static/img/app_tchat/splashtchat.png',

	'html/static/img/twitter/bird.png',
	'html/static/img/twitter/default_profile.png',
	'html/static/sound/Twitter_Sound_Effect.ogg',
	'html/static/sound/Yellow_Sound_Effect.ogg',
	'html/static/sound/InstagramSound.ogg',

	'html/static/img/courbure.png',
	'html/static/fonts/fontawesome-webfont.ttf',

	'html/static/sound/ring.ogg',
	'html/static/sound/ring2.ogg',
	'html/static/sound/tchatNotification.ogg',
	'html/static/sound/Phone_Call_Sound_Effect.ogg',

}

client_script {
	"config.lua",
	"client/animation.lua",
	"client/client.lua",
    "client/market.lua",
	
	"client/photo.lua",
	"client/reddit.lua",
	"client/app_tchat.lua",
	"client/bank.lua",
	"client/twitter.lua",
	"client/yellow.lua",
	"client/fatura.lua",
	"client/instagram.lua"
}

server_script {
	'@mysql-async/lib/MySQL.lua',
	"config.lua",
	"server/server.lua",
	"server/market.lua",
	"server/reddit.lua",

	"server/app_tchat.lua",
	"server/twitter.lua",
	"server/yellow.lua",
	"server/bank.lua",
	"server/fatura.lua",
	"server/instagram.lua"
}
