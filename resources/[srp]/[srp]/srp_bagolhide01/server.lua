ESX                     = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('dobagaja:smerfik')
AddEventHandler('dobagaja:smerfik', function(target, C)
  
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(source)
    
             
print('server baga')
TriggerClientEvent('smerfik:wlozbagaj', target)

end)

RegisterServerEvent('zbagaja:smerfik')
AddEventHandler('zbagaja:smerfik', function(target, C)
  
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(source)
    
             
print('server baga')
TriggerClientEvent('wyjmijbagaj', target)

end)