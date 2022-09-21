-- Resource Metadata
fx_version 'cerulean'
games {'gta5'}

author 'Hakdog Utilities Developers'
description 'A simple safezone using polyzone'
version '1.0.0'
lua54 'yes'

dependency 'ox_lib'

shared_scripts{
    '@ox_lib/init.lua'
}

client_scripts{
    'config.lua',
    'shared/client_config.lua',
    'client/main.lua'
}