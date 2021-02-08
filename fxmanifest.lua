fx_version 'adamant'
games {'gta5'}

description 'Keys'
client_script {
'@threads/threads.lua',
'@arrival/arrival.lua',
'keys.lua'
}

dependencies {
	'threads',
    'arrival',
    'scaleforms'
}