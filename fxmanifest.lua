--[[ 
  qb-trashsearch
  Um sistema de vasculhamento de lixeiras para QBCore
  
  Desenvolvido por: Guilherme Riguitti
  GitHub: https://github.com/GuilhermeRiguitti
  
  Copyright (c) 2025 Guilherme Riguitti
]]--

fx_version 'cerulean'
game 'gta5'

author 'Guilherme Riguitti'
description 'Sistema de vasculhamento de lixeiras para QBCore'
version '1.0.0'

repository 'https://github.com/GuilhermeRiguitti'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua'
}

lua54 'yes'
