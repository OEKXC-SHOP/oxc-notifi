fx_version 'cerulean'
game 'gta5'

name 'oxc-notify'
description 'Modern ve özelleştirilebilir bildirim sistemi'
author 'oekxc'
version '2.0.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/img/*.svg',
    'html/img/*.png',
    'html/sounds/*.mp3'
}

lua54 'yes' 