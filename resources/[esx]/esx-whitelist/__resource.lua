resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Whitelist'

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    'server/main.lua',
}

dependency 'essentialmode'