resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX City Clerk Job'

version '1.0.1'

server_scripts {
    'config.lua',
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua'
}
