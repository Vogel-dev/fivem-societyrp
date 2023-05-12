-- Casino VEGAS By milutus 
-- Supported by znajak
-- All rights reserved ©2019

local gra_start = false
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		if(GetDistanceBetweenCoords(coords, 936.54, -951.79, 43.38, true) < 100.0) then
			DrawMarker(27, 936.54, -951.79, 43.38, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 100, 100, 204, 0, false, true, 2, false, false, false, false)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil
        if(GetDistanceBetweenCoords(coords, 936.54, -951.79, 43.38, true) < 7.4) then
			DisplayHelpText("Nacisnij ~INPUT_CONTEXT~ aby zagrać na maszynie")
		end
		if(GetDistanceBetweenCoords(coords, 936.54, -951.79, 43.38, true) < 7.4) and IsControlJustReleased(0, 38) then
			if gra_start == false then
				isInMarker = true
				menu_kasyno()
			else
				ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
			end

		end
	end
end)



function menu_kasyno()
	local elements = {
		{label = 'Zagraj za 100$',value = '100'},
		{label = 'Zagraj za 200$',value = '200'},
		{label = 'Zagraj za 300$',value = '300'},
		{label = 'Zagraj za 1000$',value = '1000'},
	}

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'kasyno_menu',
	{
		title    = 'Wybór kwoty zakładu',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)    
		local action = data.current.value
		if action == '100' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '200' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '300' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '1000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '2000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '5000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '10000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '15000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '20000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '25000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '50000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '75000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '100000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		elseif action == '200000' then
			TriggerServerEvent("esx_kasyno:start_gra",action)
		end
	ESX.UI.Menu.CloseAll()
	end, function(data, menu)
		menu.close()
	end)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
RegisterNetEvent('esx_kasyno:brak_kasy')
AddEventHandler('esx_kasyno:brak_kasy', function()
	local pic = 'CHAR_MILSITE'
    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Nie masz tyle pieniędzy aby zagrać na maszynie !", pic, 1)
end)

RegisterNetEvent('esx_kasyno:start_wygrana_jackpot')
AddEventHandler('esx_kasyno:start_wygrana_jackpot', function(wygrana)
	if gra_start == false then
		gra_start = true
		print(wygrana)
		local pic = 'CHAR_MILSITE'
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_jackpot'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trafiłeś ~r~JACKPOT \n~g~Wygrałeś ~r~"..wygrana.."$", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)

RegisterNetEvent('esx_kasyno:start_wygrana_777')
AddEventHandler('esx_kasyno:start_wygrana_777', function(wygrana)
	if gra_start == false then
		gra_start = true
		print(wygrana)
		local pic = 'CHAR_MILSITE'
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_777'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trafiłeś ~r~777 \n~g~Wygrałeś ~r~"..wygrana.."$", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)

RegisterNetEvent('esx_kasyno:start_wygrana_bar')
AddEventHandler('esx_kasyno:start_wygrana_bar', function(wygrana)
	if gra_start == false then
		gra_start = true
		print(wygrana)
		local pic = 'CHAR_MILSITE'
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_bar'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trafiłeś ~r~BAR \n~g~Wygrałeś ~r~"..wygrana.."$", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)

RegisterNetEvent('esx_kasyno:start_wygrana_water_melon')
AddEventHandler('esx_kasyno:start_wygrana_water_melon', function(wygrana)
	if gra_start == false then
		gra_start = true
		print(wygrana)
		local pic = 'CHAR_MILSITE'
      	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_water_melon'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trafiłeś ~r~Arbuzy \n~g~Wygrałeś ~r~"..wygrana.."$", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)

RegisterNetEvent('esx_kasyno:start_wygrana_bananas')
AddEventHandler('esx_kasyno:start_wygrana_bananas', function(wygrana)
	if gra_start == false then
		gra_start = true
		print(wygrana)
		local pic = 'CHAR_MILSITE'
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_bananas'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trafiłeś ~r~Banany \n~g~Wygrałeś ~r~"..wygrana.."$", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)

RegisterNetEvent('esx_kasyno:start_wygrana_cherry')
AddEventHandler('esx_kasyno:start_wygrana_cherry', function(wygrana)
	if gra_start == false then
		gra_start = true
		print(wygrana)
		local pic = 'CHAR_MILSITE'
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_cherry'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trafiłeś ~r~Wiśnie \n~g~Wygrałeś ~r~"..wygrana.."$", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)

RegisterNetEvent('esx_kasyno:start_przegrana_1')
AddEventHandler('esx_kasyno:start_przegrana_1', function()
	if gra_start == false then
		gra_start = true
		local pic = 'CHAR_MILSITE'
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_przegrana_1'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "~r~Przegrałeś~", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)
RegisterNetEvent('esx_kasyno:start_przegrana_2')
AddEventHandler('esx_kasyno:start_przegrana_2', function()
	if gra_start == false then
		gra_start = true
		local pic = 'CHAR_MILSITE'
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_przegrana_2'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "~r~Przegrałeś~", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)
RegisterNetEvent('esx_kasyno:start_przegrana_3')
AddEventHandler('esx_kasyno:start_przegrana_3', function()
	if gra_start == false then
		gra_start = true
		local pic = 'CHAR_MILSITE'
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_przegrana_3'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "~r~Przegrałeś~", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)
RegisterNetEvent('esx_kasyno:start_przegrana_4')
AddEventHandler('esx_kasyno:start_przegrana_4', function()
	if gra_start == false then
		gra_start = true
		local pic = 'CHAR_MILSITE'
      ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_przegrana_4'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "~r~Przegrałeś~", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)
RegisterNetEvent('esx_kasyno:start_przegrana_5')
AddEventHandler('esx_kasyno:start_przegrana_5', function()
	if gra_start == false then
		gra_start = true
		local pic = 'CHAR_MILSITE'
	    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Trwa losowanie !", pic, 1)
	    SetNuiFocus(false,false)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
		SendNUIMessage({type = 'otworz_przegrana_5'})
		Citizen.Wait(5900)
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "~r~Przegrałeś~", pic, 1)
		SendNUIMessage({type = 'zamknij_kasyno'})
		gra_start = false
		ClearPedTasksImmediately(GetPlayerPed(-1))
	else
    	ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twoja maszyna dalej losuje wygraną !", pic, 1)
	end
end)