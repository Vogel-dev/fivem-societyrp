resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

ui_page 'client/html/index.html'

client_script 'client/client.lua'
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/server.lua'
	}

files {
	'client/html/listener.js',
	'client/html/index.html'	
	
}