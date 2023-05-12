ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('vogelcraft:kokaina') 
AddEventHandler('vogelcraft:kokaina', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('kokaina').count
    if jabka < 500 then
    if not xPlayer.job.name ~= 'sadownikoff' then


        TriggerClientEvent('vogel:kokainazamroz', _source)


        TriggerClientEvent('kokainatekst', _source)

        TriggerClientEvent('vogel:kokainacraftanimacja', _source)
        TriggerClientEvent('vogel:kokainatekst', _source)
        Citizen.Wait(1000)


        TriggerClientEvent('vogel:kokainacraftanimacja', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogel:kokainacraftanimacja', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogel:kokainacraftanimacja', _source)
        Citizen.Wait(1000)
        TriggerClientEvent('vogel:kokainacraftanimacja', _source)

        Citizen.Wait(1000)

       local ilosc = math.random(9,16)
        xPlayer.addInventoryItem('kokaina', ilosc)
        TriggerClientEvent('vogel:kokainaodmroz', _source)

        TriggerClientEvent('esx:showNotification', _source, 'Zebrałeś ~g~'.. ESX.Math.Round(ilosc) .. ' liści kokainy')


else
    TriggerClientEvent('vogel:kokainastopanimacja', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~BŁĄD #001!')
end 
else
    TriggerClientEvent('vogel:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie posiadasz więcej miejsca w torbie na liście kokainy!')   
end
end)

RegisterServerEvent('vogeljablka:kokainasoki') 
AddEventHandler('vogeljablka:kokainasoki', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('kokaina').count
    if jabka > 4 then
    if xPlayer.job.name ~= 'sadownikoff' then

        xPlayer.removeInventoryItem('kokaina', 5)
        TriggerClientEvent('vogel:kokainazamroz', _source)


        TriggerClientEvent('kokainatekst', _source)

        TriggerClientEvent('animacjakokainasoki', _source)
        TriggerClientEvent('vogel:kokainatekst', _source)
        Citizen.Wait(1000)



        Citizen.Wait(1000)

        Citizen.Wait(1000)

        Citizen.Wait(1000)



        Citizen.Wait(1000)

       local ilosc = jabka / 5
        xPlayer.addInventoryItem('kokaina_pooch', 1)
        TriggerClientEvent('vogel:kokainaodmroz', _source)

        TriggerClientEvent('esx:showNotification', _source, '~b~Wyprodukowałeś gram kokainy')


else
    TriggerClientEvent('vogel:kokainastopanimacja', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~BŁĄD #002!')
end 
else
    TriggerClientEvent('vogel:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie posiadasz wystarczająco liści kokainy')   
end
end)

RegisterServerEvent('vogel:kokainapobierz') 
AddEventHandler('vogel:kokainapobierz', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        --xPlayer.removeMoney(3000)

end)
RegisterServerEvent('vogel:kokainapobierz2') 
AddEventHandler('vogel:kokainapobierz2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
--xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)

end)
RegisterServerEvent('vogelcraft:kokainaskup') 
AddEventHandler('vogelcraft:kokainaskup', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('brak').count
    if xPlayer.job.name ~= 'sadownikoff' then
    if jabka >= 1 then 
        --TriggerClientEvent('podlacz:propa', _source)
        local cena = 180
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:kokainaanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:kokainaanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:kokainaanim', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('brak').count
        xPlayer.removeInventoryItem('brak', jabka2)
        TriggerClientEvent('sprzedawanie:kokainaanim', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(jabka * cena)
        --TriggerClientEvent('odlacz:propa', _source)
        TriggerClientEvent('esx:showHelpNotification', _source, 'Sprzedałeś ~r~' .. ESX.Math.Round(jabka) ..' ~w~soków')
    else
        TriggerClientEvent('esx:showHelpNotification', _source, '~r~Nie posiadasz soków')
    end
else
    TriggerClientEvent('esx:showHelpNotification', source, '~r~Nie jestes zbieraczem jabłek!')
end 
end)
