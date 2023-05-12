ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('smerfikcraft:zlomiarzzbier') 
AddEventHandler('smerfikcraft:zlomiarzzbier', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('zlom').count
    if jabka < 50 then
    if xPlayer.job.name == 'zlom' then


        TriggerClientEvent('smerfik:zamrozcrft22', _source)


        TriggerClientEvent('zacznijtekst2', _source)

        TriggerClientEvent('smerfik:craftanimacja22', _source)
        TriggerClientEvent('smerfik:tekstjab2', _source)
        Citizen.Wait(1000)


       -- TriggerClientEvent('smerfik:craftanimacja22', _source)
        Citizen.Wait(1000)

       -- TriggerClientEvent('smerfik:craftanimacja22', _source)
        Citizen.Wait(1000)
--
      --  TriggerClientEvent('smerfik:craftanimacja22', _source)
        Citizen.Wait(1000)
      --  TriggerClientEvent('smerfik:craftanimacja22', _source)

        Citizen.Wait(1000)

       local ilosc = math.random(10,50)
        xPlayer.addInventoryItem('zlom', ilosc)
        TriggerClientEvent('smerfik:odmrozcrft22', _source)

        TriggerClientEvent('esx:showNotification', _source, 'Zebrałeś ~y~'.. ilosc .. ' złomu')


else
    TriggerClientEvent('smerfik:stopcraftanimacja2', _source)
    TriggerClientEvent('esx:showNotification', _source, '~y~Nie jestes złomiarzem!')
end 
else
    TriggerClientEvent('smerfik:zdejmijznaczek2', _source)
    TriggerClientEvent('esx:showNotification', _source, '~y~Nie masz miejsca na więcej złomu!')   
end
end)


RegisterServerEvent('smerfik:pobierzzlomek2') 
AddEventHandler('smerfik:pobierzzlomek2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        --xPlayer.removeMoney(3000)

end)
RegisterServerEvent('smerfik:pobierzzlomek22') 
AddEventHandler('smerfik:pobierzzlomek22', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
--xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)

end)
RegisterServerEvent('smerfikcraft:skup2') 
AddEventHandler('smerfikcraft:skup2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local jabka = xPlayer.getInventoryItem('zlom').count
    if xPlayer.job.name == 'zlom' then
    if jabka >= 1 then 

        local cena = 1
        xPlayer.removeInventoryItem('zlom', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim2', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('zlom', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim2', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('zlom', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim2', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('zlom').count
        xPlayer.removeInventoryItem('zlom', jabka2)
        TriggerClientEvent('sprzedawanie:jablekanim2', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(jabka * cena)
        TriggerClientEvent('odlacz:propa', _source)
        TriggerClientEvent('esx:showHelpNotification', _source, 'Sprzedałeś ~y~' .. ESX.Math.Round(jabka) ..' ~w~złomu')
        local message = "Gracz **"..PlayerName.."** sprzedał **" .. ESX.Math.Round(jabka) .. "** złomu za ***"..ESX.Math.Round(jabka * cena).."***$ "
        BetonoweLogi("Złomiarz - Sprzedaż złomu",PlayerName,message,xPlayer.identifier,0x00ffff)
    else
        TriggerClientEvent('esx:showHelpNotification', _source, '~y~Nie posiadasz złomu')
    end
else
    TriggerClientEvent('esx:showHelpNotification', source, '~y~Nie jestes złomiarzem!')
end 
end)

function BetonoweLogi (title,name,message,steamID,color)
    local embeds = {
        {
            ["title"] = title,
            ["type"] = "rich",
            ["description"] = message,
            ["color"] = color,
    --		["timestamp"] = os.time(),
            ["footer"] =  {
                ["icon_url"] = "https://i.imgur.com/6aPjIDn.png",
                ["text"] = steamID,
            },
            ["author"] = {
                ["name"] = name,
                ["url"] = "http://polstarrp.tk",
                ["icon_url"] = "https://cdn.discordapp.com/embed/avatars/0.png",
            }
        }
    }
    
      if message == nil or message == '' then return FALSE end
      PerformHttpRequest("https://discordapp.com/api/webhooks/588079796425195530/RfVEGJxwI7PAcIyUtV7fWY92TlaGoUWKjLEZflqgUvAdt3ocL0AOpzTbaD-pan0joYyL", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end