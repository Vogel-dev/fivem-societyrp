ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('vogelheroinacraft:heroina') 
AddEventHandler('vogelheroinacraft:heroina', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('heroina').count
    if jabka < 300 then
    if not xPlayer.job.name ~= 'sadownikoff' then


        TriggerClientEvent('vogelheroina:heroinazamroz', _source)


        TriggerClientEvent('heroinatekst', _source)

        TriggerClientEvent('vogelheroina:heroinacraftanimacja', _source)
        TriggerClientEvent('vogelheroina:heroinatekst', _source)
        Citizen.Wait(1000)


        TriggerClientEvent('vogelheroina:heroinacraftanimacja', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogelheroina:heroinacraftanimacja', _source)
        Citizen.Wait(1000)

        TriggerClientEvent('vogelheroina:heroinacraftanimacja', _source)
        Citizen.Wait(1000)
        TriggerClientEvent('vogelheroina:heroinacraftanimacja', _source)

        Citizen.Wait(1000)

       local ilosc = math.random(5,13)
        xPlayer.addInventoryItem('heroina', ilosc)
        TriggerClientEvent('vogelheroina:heroinaodmroz', _source)

        TriggerClientEvent('esx:showNotification', _source, 'Zebrałeś ~r~'.. ESX.Math.Round(ilosc) .. ' opiatów')


else
    TriggerClientEvent('vogelheroina:heroinastopanimacja', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~BŁĄD #001!')
end 
else
    TriggerClientEvent('vogelheroina:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie posiadasz więcej miejsca w torbie na opiaty!')   
end
end)

RegisterServerEvent('vogelheroinajablka:heroinasoki') 
AddEventHandler('vogelheroinajablka:heroinasoki', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('heroina').count
    if jabka > 4 then
    if xPlayer.job.name ~= 'sadownikoff' then

        xPlayer.removeInventoryItem('heroina', 5)
        TriggerClientEvent('vogelheroina:heroinazamroz', _source)


        TriggerClientEvent('heroinatekst', _source)

        TriggerClientEvent('animacjaheroinasoki', _source)
        TriggerClientEvent('vogelheroina:heroinatekst', _source)
        Citizen.Wait(1000)



        Citizen.Wait(1000)

        Citizen.Wait(1000)

        Citizen.Wait(1000)



        Citizen.Wait(1000)

       local ilosc = jabka / 5
        xPlayer.addInventoryItem('heroina_pooch', 1)
        TriggerClientEvent('vogelheroina:heroinaodmroz', _source)

        TriggerClientEvent('esx:showNotification', _source, '~r~Wyprodukowałeś gram heroiny')


else
    TriggerClientEvent('vogelheroina:heroinastopanimacja', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~BŁĄD #002!')
end 
else
    TriggerClientEvent('vogelheroina:zdejmijznaczeksss', _source)
    TriggerClientEvent('esx:showNotification', _source, '~r~Nie posiadasz wystarczająco opiatów')   
end
end)

RegisterServerEvent('vogelheroina:heroinapobierz') 
AddEventHandler('vogelheroina:heroinapobierz', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        --xPlayer.removeMoney(3000)

end)
RegisterServerEvent('vogelheroina:heroinapobierz2') 
AddEventHandler('vogelheroina:heroinapobierz2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
--xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)

end)
RegisterServerEvent('vogelheroinacraft:heroinaskup') 
AddEventHandler('vogelheroinacraft:heroinaskup', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('brak').count
    if xPlayer.job.name ~= 'sadownikoff' then
    if jabka >= 1 then 
        --TriggerClientEvent('podlacz:propa', _source)
        local cena = 180
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:heroinaanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:heroinaanim', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('brak', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:heroinaanim', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('brak').count
        xPlayer.removeInventoryItem('brak', jabka2)
        TriggerClientEvent('sprzedawanie:heroinaanim', _source)
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
