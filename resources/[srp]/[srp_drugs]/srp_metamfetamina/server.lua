ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('vogelmetacraft:meta') 
AddEventHandler('vogelmetacraft:meta', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('meta').count
    if jabka < 300 then
    if not xPlayer.job.name ~= 'sadownikoff' then


        TriggerClientEvent('vogelmeta:metazamroz', _source)


        TriggerClientEvent('metatekst', _source)

        TriggerClientEvent('vogelmeta:metacraftanimacja', _source)
        TriggerClientEvent('vogelmeta:metatekst', _source)
        Citizen.Wait(1000)


        TriggerClientEvent('vogelmeta:metacraftanimacja', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogelmeta:metacraftanimacja', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogelmeta:metacraftanimacja', _source)
        Citizen.Wait(1000)
        TriggerClientEvent('vogelmeta:metacraftanimacja', _source)

        Citizen.Wait(1000)

       local ilosc = math.random(1,7)
        xPlayer.addInventoryItem('meta', ilosc)
        TriggerClientEvent('vogelmeta:metaodmroz', _source)

        TriggerClientEvent('esx:showNotification', _source, 'Zebrałeś ~b~'.. ESX.Math.Round(ilosc) .. ' metyloaminy')


else
    TriggerClientEvent('vogelmeta:metastopanimacja', _source)
    TriggerClientEvent('esx:showNotification', _source, '~b~BŁĄD #001!')
end 
else
    TriggerClientEvent('vogelmeta:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~b~Nie posiadasz więcej miejsca w torbie na metyloamine!')   
end
end)

RegisterServerEvent('vogelmetajablka:metasoki') 
AddEventHandler('vogelmetajablka:metasoki', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('meta').count
    if jabka > 4 then
    if xPlayer.job.name ~= 'sadownikoff' then

        xPlayer.removeInventoryItem('meta', 5)
        TriggerClientEvent('vogelmeta:metazamroz', _source)


        TriggerClientEvent('metatekst', _source)

        TriggerClientEvent('animacjametasoki', _source)
        TriggerClientEvent('vogelmeta:metatekst', _source)
        Citizen.Wait(1000)



        Citizen.Wait(1000)

        Citizen.Wait(1000)

        Citizen.Wait(1000)



        Citizen.Wait(1000)

       local ilosc = jabka / 5
        xPlayer.addInventoryItem('meta_pooch', 1)
        TriggerClientEvent('vogelmeta:metaodmroz', _source)

        TriggerClientEvent('esx:showNotification', _source, '~b~Wyprodukowałeś gram metamfetaminy')


else
    TriggerClientEvent('vogelmeta:metastopanimacja', _source)
    TriggerClientEvent('esx:showNotification', _source, '~b~BŁĄD #002!')
end 
else
    TriggerClientEvent('vogelmeta:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~b~Nie posiadasz wystarczająco metyloaminy')   
end
end)

RegisterServerEvent('vogelmeta:metapobierz') 
AddEventHandler('vogelmeta:metapobierz', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        --xPlayer.removeMoney(3000)

end)
RegisterServerEvent('vogelmeta:metapobierz2') 
AddEventHandler('vogelmeta:metapobierz2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
--xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)

end)
RegisterServerEvent('vogelmetacraft:metaskup') 
AddEventHandler('vogelmetacraft:metaskup', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('brak').count
    if xPlayer.job.name ~= 'sadownikoff' then
    if jabka >= 1 then 
        --TriggerClientEvent('podlacz:propa', _source)
        local cena = 180
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:metaanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:metaanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:metaanim', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('brak').count
        xPlayer.removeInventoryItem('brak', jabka2)
        TriggerClientEvent('sprzedawanie:metaanim', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(jabka * cena)
        --TriggerClientEvent('odlacz:propa', _source)
        TriggerClientEvent('esx:showHelpNotification', _source, 'Sprzedałeś ~b~' .. ESX.Math.Round(jabka) ..' ~w~soków')
    else
        TriggerClientEvent('esx:showHelpNotification', _source, '~b~Nie posiadasz soków')
    end
else
    TriggerClientEvent('esx:showHelpNotification', source, '~b~Nie jestes zbieraczem jabłek!')
end 
end)
