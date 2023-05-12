ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('smerfikcraft:jabkosersad1') 
AddEventHandler('smerfikcraft:jabkosersad1', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('jablko').count
    if jabka < 201 then
    if not xPlayer.job.name ~= 'sadownikoff' then


        TriggerClientEvent('smerfik:zamrozcrft2sss', _source)


        TriggerClientEvent('zacznijtekstsss', _source)

        TriggerClientEvent('smerfik:craftanimacja2sss', _source)
        TriggerClientEvent('smerfik:tekstjabsss', _source)
        Citizen.Wait(1000)


        TriggerClientEvent('smerfik:craftanimacja2sss', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('smerfik:craftanimacja2sss', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('smerfik:craftanimacja2sss', _source)
        Citizen.Wait(1000)
        TriggerClientEvent('smerfik:craftanimacja2sss', _source)

        Citizen.Wait(1000)

       local ilosc = math.random(3,10)
        xPlayer.addInventoryItem('jablko', ilosc)
        TriggerClientEvent('smerfik:odmrozcrft2sss', _source)

        TriggerClientEvent('esx:showNotification', _source, 'Zebrałeś ~r~'.. ESX.Math.Round(ilosc) .. ' jabłka')


else
    TriggerClientEvent('smerfik:stopcraftanimacjasss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie jestes zbieraczem jabłek!')
end 
else
    TriggerClientEvent('smerfik:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz miejsca na więcej jabłek!')   
end
end)

RegisterServerEvent('smerfikjablka:sokisss') 
AddEventHandler('smerfikjablka:sokisss', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('jablko').count
    if jabka > 5 then
    if xPlayer.job.name ~= 'sadownikoff' then

        xPlayer.removeInventoryItem('jablko', 5)
        TriggerClientEvent('smerfik:zamrozcrft2sss', _source)


        TriggerClientEvent('zacznijtekstsss', _source)

        TriggerClientEvent('animacjasokisss', _source)
        TriggerClientEvent('smerfik:tekstjabsss', _source)
        Citizen.Wait(1000)



        Citizen.Wait(1000)

        Citizen.Wait(1000)

        Citizen.Wait(1000)



        Citizen.Wait(1000)

       local ilosc = jabka / 5
        xPlayer.addInventoryItem('soki', 1)
        TriggerClientEvent('smerfik:odmrozcrft2sss', _source)

        TriggerClientEvent('esx:showNotification', _source, '~y~Zrobiłeś sok')


else
    TriggerClientEvent('smerfik:stopcraftanimacjasss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie jestes zbieraczem jabłek!')
end 
else
    TriggerClientEvent('smerfik:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz wystarczajaco jablek')   
end
end)

RegisterServerEvent('smerfik:pobierzjablkasss') 
AddEventHandler('smerfik:pobierzjablkasss', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        --xPlayer.removeMoney(3000)

end)
RegisterServerEvent('smerfik:pobierzjablkasss2') 
AddEventHandler('smerfik:pobierzjablkasss2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
--xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)

end)
RegisterServerEvent('smerfikcraft:skupsss') 
AddEventHandler('smerfikcraft:skupsss', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local jabka = xPlayer.getInventoryItem('soki').count
    if xPlayer.job.name ~= 'sadownikoff' then
    if jabka >= 1 then 
        --TriggerClientEvent('podlacz:propa', _source)
        local cena = 7
        xPlayer.removeInventoryItem('soki', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanimsss', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('soki', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanimsss', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('soki', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanimsss', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('soki').count
        xPlayer.removeInventoryItem('soki', jabka2)
        TriggerClientEvent('sprzedawanie:jablekanimsss', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(jabka * cena)
        --TriggerClientEvent('odlacz:propa', _source)
        TriggerClientEvent('esx:showHelpNotification', _source, 'Sprzedałeś ~r~' .. ESX.Math.Round(jabka) ..' ~w~soków')
        local message = "Gracz **"..PlayerName.."** sprzedał **" .. ESX.Math.Round(jabka) .. "** soków za ***"..ESX.Math.Round(jabka * cena).."***$ "
        BetonoweLogi("Sadownik - Sprzedaż soku",PlayerName,message,xPlayer.identifier,0xff8080)
    else
        TriggerClientEvent('esx:showHelpNotification', _source, '~r~Nie posiadasz soków')
    end
else
    TriggerClientEvent('esx:showHelpNotification', source, '~r~Nie jestes zbieraczem jabłek!')
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
