ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('vogelhaszyszcraft:haszysz') 
AddEventHandler('vogelhaszyszcraft:haszysz', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('haszysz').count
    if jabka < 400 then
    if not xPlayer.job.name ~= 'sadownikoff' then


        TriggerClientEvent('vogelhaszysz:haszyszzamroz', _source)


        TriggerClientEvent('haszysztekst', _source)

        TriggerClientEvent('vogelhaszysz:haszyszcraftanimacja', _source)
        TriggerClientEvent('vogelhaszysz:haszysztekst', _source)
        Citizen.Wait(1000)


        TriggerClientEvent('vogelhaszysz:haszyszcraftanimacja', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogelhaszysz:haszyszcraftanimacja', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogelhaszysz:haszyszcraftanimacja', _source)
        Citizen.Wait(1000)
        TriggerClientEvent('vogelhaszysz:haszyszcraftanimacja', _source)

        Citizen.Wait(1000)

       local ilosc = math.random(3,10)
        xPlayer.addInventoryItem('haszysz', ilosc)
        TriggerClientEvent('vogelhaszysz:haszyszodmroz', _source)

        TriggerClientEvent('esx:showNotification', _source, 'Zebrałeś ~g~'.. ESX.Math.Round(ilosc) .. ' konopi indyjskiej')


else
    TriggerClientEvent('vogelhaszysz:haszyszstopanimacja', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~BŁĄD #001!')
end 
else
    TriggerClientEvent('vogelhaszysz:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie posiadasz więcej miejsca w torbie na konope indyjską!')   
end
end)

RegisterServerEvent('vogelhaszyszjablka:haszyszsoki') 
AddEventHandler('vogelhaszyszjablka:haszyszsoki', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('haszysz').count
    if jabka > 4 then
    if xPlayer.job.name ~= 'sadownikoff' then

        xPlayer.removeInventoryItem('haszysz', 5)
        TriggerClientEvent('vogelhaszysz:haszyszzamroz', _source)


        TriggerClientEvent('haszysztekst', _source)

        TriggerClientEvent('animacjahaszyszsoki', _source)
        TriggerClientEvent('vogelhaszysz:haszysztekst', _source)
        Citizen.Wait(1000)



        Citizen.Wait(1000)

        Citizen.Wait(1000)

        Citizen.Wait(1000)



        Citizen.Wait(1000)

       local ilosc = jabka / 5
        xPlayer.addInventoryItem('haszysz_pooch', 1)
        TriggerClientEvent('vogelhaszysz:haszyszodmroz', _source)

        TriggerClientEvent('esx:showNotification', _source, '~g~Wyprodukowałeś gram haszyszu')


else
    TriggerClientEvent('vogelhaszysz:haszyszstopanimacja', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~BŁĄD #002!')
end 
else
    TriggerClientEvent('vogelhaszysz:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie posiadasz wystarczająco konopi indyjskiej')   
end
end)

RegisterServerEvent('vogelhaszysz:haszyszpobierz') 
AddEventHandler('vogelhaszysz:haszyszpobierz', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        --xPlayer.removeMoney(3000)

end)
RegisterServerEvent('vogelhaszysz:haszyszpobierz2') 
AddEventHandler('vogelhaszysz:haszyszpobierz2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
--xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)

end)
RegisterServerEvent('vogelhaszyszcraft:haszyszskup') 
AddEventHandler('vogelhaszyszcraft:haszyszskup', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('brak').count
    if xPlayer.job.name ~= 'sadownikoff' then
    if jabka >= 1 then 
        --TriggerClientEvent('podlacz:propa', _source)
        local cena = 180
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:haszyszanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:haszyszanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:haszyszanim', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('brak').count
        xPlayer.removeInventoryItem('brak', jabka2)
        TriggerClientEvent('sprzedawanie:haszyszanim', _source)
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
