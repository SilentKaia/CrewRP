-- add scripts
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

client_script 'playernames_api.lua'
server_script 'playernames_api.lua'

client_script 'playernames_cl.lua'
server_script 'playernames_sv.lua'

-- make exports
local exportList = {
    'setComponentColor',
    'setComponentAlpha',
    'setComponentVisibility',
    'setWantedLevel',
    'setHealthBarColor',
    'setNameTemplate'
}

exports(exportList)
server_exports(exportList)

-- add files
files {
    'template/template.lua'
}
