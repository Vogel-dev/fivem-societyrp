RegisterServerEvent('z_send')
AddEventHandler('z_send', function(message)
	local player = source
	TriggerClientEvent('send', -1, player, message, { 179, 0, 134 })
end)
