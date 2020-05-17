--=================================================
--= github.com/davuongthanh   
--=	youtube.com/channel/UC4f6N3gtOGqn2znOo7lxzQA
--= facebook.com/hida1995/
--=================================================
fx_version 'adamant'

game 'gta5'

description 'OD User Profile'

version '1.0.1'

ui_page 'html/index.html'

client_scripts {
    'client.lua',
} 

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'server.lua',
} 

files{
	-- Main
	'html/index.html',
	'html/css/bootstrap.css',
	'html/css/style.css',
	'html/app.js',
	
	-- Images
	'html/img/chieucao.jpg',
	'html/img/congviec.png',
	'html/img/gioitinh.png',
	'html/img/hovaten.png',
	'html/img/nganhang.png',
	'html/img/ngaysinh.png',
	'html/img/profile.png',
	'html/img/sodienthoai.png',
	'html/img/sotienban.png',
	'html/img/sotienmat.png',
	'html/img/thongtin.png',
	
	-- Fonts
	'html/fonts/UVNBaiSau_R.ttf',
}

dependency 'es_extended'

