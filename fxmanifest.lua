--[[ ===================================================== ]]--
--[[                 MH Cooldown by MaDHouSe               ]]--
--[[ ===================================================== ]]--

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'MaDHouSe79'
description 'MH Cooldown - Use this in other scripts to cooldown any actions or triggers'
version '1.0.0'

server_only 'yes'

server_scripts {
    '@ox_lib/init.lua',
    'locales/locale.lua',
    'locales/en.lua', -- change this to your own lang file.
    'config.lua',
    'server/main.lua',
    'server/update.lua',
}

dependencies {'ox_lib'}