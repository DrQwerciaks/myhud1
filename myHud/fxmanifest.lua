fx_version 'bodacious'
game 'gta5'

ui_page "html/index.html"

files {
	"html/index.html",
	"html/script.js",
	"html/style.css",
}

client_scripts {
    'config.lua',
    'client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server.lua',
}

