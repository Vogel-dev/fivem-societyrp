ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('vogelcraft:gownosersad1') 
AddEventHandler('vogelcraft:gownosersad1', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gowno = xPlayer.getInventoryItem('gowno').count
    if gowno < 31 then
    if not xPlayer.job.name ~= 'sadownikoff' then


        TriggerClientEvent('vogel:zamrozcraftgowno2', _source)


        TriggerClientEvent('gownozacznijtekst', _source)

        TriggerClientEvent('vogel:craftanimacjagowno', _source)
        TriggerClientEvent('vogel:tekstgowno', _source)
        Citizen.Wait(1000)


        TriggerClientEvent('vogel:craftanimacjagowno', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogel:craftanimacjagowno', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogel:craftanimacjagowno', _source)
        Citizen.Wait(1000)
        TriggerClientEvent('vogel:craftanimacjagowno', _source)

        Citizen.Wait(1000)

       local ilosc = math.random(3,7)
        xPlayer.addInventoryItem('gowno', ilosc)
        TriggerClientEvent('vogel:odmrozcraftgowno', _source)

        TriggerClientEvent('esx:showNotification', _source, 'Zebrałeś ~o~'.. ESX.Math.Round(ilosc) .. ' szamba')


else
    TriggerClientEvent('vogel:stopcraftanimacjagowno', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie jesteś szambiarzem!')
end 
else
    TriggerClientEvent('vogel:zdejmijznaczekgowno', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz miejsca na więcej szambo!')   
end
end)

RegisterServerEvent('vogelgowno:gowno') 
AddEventHandler('vogelgowno:gowno', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gowno = xPlayer.getInventoryItem('gowno').count
    if gowno > 4 then
    if xPlayer.job.name ~= 'sadownikoff' then

        xPlayer.removeInventoryItem('gowno', 5)
        TriggerClientEvent('vogel:zamrozcraftgowno2', _source)


        TriggerClientEvent('gownozacznijtekst', _source)

        TriggerClientEvent('animacjagowno', _source)
        TriggerClientEvent('vogel:tekstgowno', _source)
        Citizen.Wait(1000)



        Citizen.Wait(1000)

        Citizen.Wait(1000)

        Citizen.Wait(1000)



        Citizen.Wait(1000)

       local ilosc = gowno / 5
        xPlayer.addInventoryItem('pgowno', 1)
        TriggerClientEvent('vogel:odmrozcraftgowno', _source)

        TriggerClientEvent('esx:showNotification', _source, '~o~Przelałeś szambo do wiadra...')


else
    TriggerClientEvent('vogel:stopcraftanimacjagowno', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie jesteś szambiarzem!')
end 
else
    TriggerClientEvent('vogel:zdejmijznaczekgowno', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz wystarczająco szamba')   
end
end)

RegisterServerEvent('vogel:pobierzgownosss') 
AddEventHandler('vogel:pobierzgownosss', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        --xPlayer.removeMoney(3000)

end)
RegisterServerEvent('vogel:pobierzgownosss2') 
AddEventHandler('vogel:pobierzgownosss2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
--xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)

end)
RegisterServerEvent('vogelcraft:skupsss') 
AddEventHandler('vogelcraft:skupsss', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local gowno = xPlayer.getInventoryItem('pgowno').count
    if xPlayer.job.name ~= 'sadownikoff' then
    if gowno >= 1 then 
        --TriggerClientEvent('podlacz:propa', _source)
        local cena = 17
        xPlayer.removeInventoryItem('pgowno', ESX.Math.Round(gowno / 4))
        TriggerClientEvent('sprzedawanie:jablekanimsss', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('pgowno', ESX.Math.Round(gowno / 4))
        TriggerClientEvent('sprzedawanie:jablekanimsss', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('pgowno', ESX.Math.Round(gowno / 4))
        TriggerClientEvent('sprzedawanie:jablekanimsss', _source)
        Citizen.Wait(3000)
        local gowno2 = xPlayer.getInventoryItem('pgowno').count
        xPlayer.removeInventoryItem('pgowno', gowno2)
        TriggerClientEvent('sprzedawanie:jablekanimsss', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(gowno * cena)
        --TriggerClientEvent('odlacz:propa', _source)
        TriggerClientEvent('esx:showHelpNotification', _source, 'Oddałeś ~r~' .. ESX.Math.Round(gowno) ..' ~w~wiader z szambem')
        local message = "Gracz **"..PlayerName.."** sprzedał **" .. ESX.Math.Round(gowno) .. "** wiader z szambem za ***"..ESX.Math.Round(gowno * cena).."***$ "
        BetonoweLogi("Szambiarz - skup wiader z szambem",PlayerName,message,xPlayer.identifier,0x834a12)
    else
        TriggerClientEvent('esx:showHelpNotification', _source, '~r~Nie posiadasz wiader z szambem')
    end
else
    TriggerClientEvent('esx:showHelpNotification', source, '~r~Nie jesteś szambiarzem!')
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
