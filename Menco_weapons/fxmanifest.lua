fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'Menco'

client_scripts {
    "@utility_lib/client/native.lua",
    'client/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
}

files {
    'html/logo.png',
}

dependencies {
    "utility_lib"    
}