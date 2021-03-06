fx_version 'cerulean'
games { 'gta5' }

version '1.6.6'

description 'https://github.com/thelindat/nui_doorlock'

server_scripts {
	'@es_extended/locale.lua',
	'customdoors.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'customdoors.lua',
	'config.lua',
	'client/main.lua'
}

dependency 'es_extended'

ui_page {
    'html/door.html',
}

files {
	'html/door.html',
	'html/main.js', 
	'html/style.css',

	'html/sounds/*.ogg',
}
