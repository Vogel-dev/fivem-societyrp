ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('smerfikcraft:jabkoserwin') 
AddEventHandler('smerfikcraft:jabkoserwin', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('winogrono').count
    if jabka < 201 then
    if xPlayer.job.name == 'vigne' then


        TriggerClientEvent('smerfik:zamrozcrft2', _source)


        TriggerClientEvent('zacznijtekst', _source)

        TriggerClientEvent('smerfik:craftanimacja2', _source)
        TriggerClientEvent('smerfik:tekstjabwin', _source)
        Citizen.Wait(1000)


        TriggerClientEvent('smerfik:craftanimacja2', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('smerfik:craftanimacja2', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('smerfik:craftanimacja2', _source)
        Citizen.Wait(1000)
        TriggerClientEvent('smerfik:craftanimacja2', _source)

        Citizen.Wait(1000)

       local ilosc = math.random(3,10)
        xPlayer.addInventoryItem('winogrono', ilosc)
        TriggerClientEvent('smerfik:odmrozcrft2', _source)

        TriggerClientEvent('esx:showNotification', _source, 'Zebrałeś ~p~'.. ESX.Math.Round(ilosc) .. ' winogrona.')


else
    TriggerClientEvent('smerfik:stopcraftanimacja', _source)
    --TriggerClientEvent('esx:showNotification', _source, '~r~Nie jestes zbieraczem winogron!')
end 
else
    TriggerClientEvent('smerfik:zdejmijznaczek', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz miejsca na więcej winogron!')   
end
end)

RegisterServerEvent('smerfikjablka:vine') 
AddEventHandler('smerfikjablka:vine', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('winogrono').count
    if jabka > 5 then
    if xPlayer.job.name == 'vigne' then

        xPlayer.removeInventoryItem('winogrono', 5)
        TriggerClientEvent('smerfik:zamrozcrft2', _source)


        TriggerClientEvent('zacznijtekst', _source)

        TriggerClientEvent('animacjavine', _source)
        TriggerClientEvent('smerfik:tekstjabwin', _source)
        Citizen.Wait(1000)



        Citizen.Wait(1000)

        Citizen.Wait(1000)

        Citizen.Wait(1000)



        Citizen.Wait(1000)

       local ilosc = jabka / 5
        xPlayer.addInventoryItem('vine', 1)
        TriggerClientEvent('smerfik:odmrozcrft2', _source)

        TriggerClientEvent('esx:showNotification', _source, '~y~Wytworzyłeś wino...')


else
    TriggerClientEvent('smerfik:stopcraftanimacja', _source)
    --TriggerClientEvent('esx:showNotification', _source, '~r~Nie jestes zbieraczem winogrona!')
end 
else
    TriggerClientEvent('smerfik:zdejmijznaczek', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz wystarczajaco winogrona.')   
end
end)

RegisterServerEvent('smerfik:pobierzwinogrono') 
AddEventHandler('smerfik:pobierzwinogrono', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        --xPlayer.removeMoney(3000)

end)
RegisterServerEvent('smerfik:pobierzwinogrono2') 
AddEventHandler('smerfik:pobierzwinogrono2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
--xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)

end)
RegisterServerEvent('smerfikcraft:skupwino') 
AddEventHandler('smerfikcraft:skupwino', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local jabka = xPlayer.getInventoryItem('vine').count
    if xPlayer.job.name == 'vigne' then
    if jabka >= 1 then 
        TriggerClientEvent('podlacz:propa', _source)
        local cena = 12
        xPlayer.removeInventoryItem('vine', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('vine', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('vine', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('vine').count
        xPlayer.removeInventoryItem('vine', jabka2)
        TriggerClientEvent('sprzedawanie:jablekanim', _source)
        Citizen.Wait(3000)
        TriggerClientEvent('odlacz:propa', _source)
        --xPlayer.addMoney(jabka * cena)
        --local money = math.random(45,60)
        local societyAccount = nil
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
            societyAccount = account
        end)
        if societyAccount ~= nil then
            societyAccount.addMoney(jabka * cena)
        end
        TriggerClientEvent('esx:showHelpNotification', _source, 'Sprzedałeś ~p~' .. ESX.Math.Round(jabka) ..' ~w~win')
        local message = "Gracz **"..PlayerName.."** sprzedał **" .. ESX.Math.Round(jabka) .. "** win za ***"..ESX.Math.Round(jabka * cena).."***$ "
        BetonoweLogi("Winiarnia - Sprzedaż win",PlayerName,message,xPlayer.identifier,0x972fff)
    else
        TriggerClientEvent('esx:showHelpNotification', _source, '~r~Nie posiadasz wina')
    end
else
    TriggerClientEvent('esx:showHelpNotification', source, '~r~Nie jestes zbieraczem winogrona!')
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
