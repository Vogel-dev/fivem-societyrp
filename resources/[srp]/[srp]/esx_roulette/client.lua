ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj 
		end)
		Citizen.Wait(0)
	end
end)
local blipX = 922.19
local blipY = -952.86
local blipZ = 43.38
local pic = 'CHAR_MILSITE'
local game_during = false
local elements = {}

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Kasino VEGAS", colour=75, id=108, x = -1293.03, y = -277.98, z = 37.85},
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.2)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local coords = GetEntityCoords(GetPlayerPed(-1))
		if(GetDistanceBetweenCoords(coords, blipX, blipY, blipZ, true) < 100.0) then
			DrawMarker(1, blipX, blipY, blipZ, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 8.0, 8.0, 8.0, 100, 100, 204, 0, false, true, 2, false, false, false, false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil
        if(GetDistanceBetweenCoords(coords, blipX, blipY, blipZ, true) < 8.4) then
            DisplayHelpText("Nacisnij ~INPUT_CONTEXT~ aby zagrać na ruletce")
		end
        if(GetDistanceBetweenCoords(coords, blipX, blipY, blipZ, true) < 8.4) and IsControlJustReleased(0, 38) then
            isInMarker  = true
            roulette_menu()
		end
    end
end)

function roulette_menu()
	local elements = {
		{label = ('Postaw na kolor'),	value = 'color'},
		--{label = ('Postaw na numer'),	value = 'number'},
	}
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'roulette_menu',
    {
        title    = 'Ruletka',
        align    = 'top-right',
        elements = elements
    }, function(data, menu)    
        local action = data.current.value
        if action == 'number' then
			local elements = {
				{label = ('Wieksze od 20'),	value = 'more_than_20'},
				{label = ('Mniejsze od 20'),	value = 'less_than_20'},
				{label = ('Postaw na dokładny numer'),	value = 'current_number'},
			}
			    ESX.UI.Menu.CloseAll()
			    ESX.UI.Menu.Open(
			    'default', GetCurrentResourceName(), 'number_menu',
			    {
			        title    = 'Ruletka',
			        align    = 'top-right',
			        elements = elements
			    },function(data, menu)
			    	local action = data.current.value
			    		if action == 'more_than_20' then
							local amount = tonumber(data.value)
							if amount == nil then
								ESX.ShowNotification(('more_than_20'))
							else
					            ESX.TriggerServerCallback('esx_roulette:check_money', function(quantity)
					                if quantity >= amount then
									    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twój zakład został przyjęty !", pic, 1)
										TriggerEvent('esx_roulette:start_game', action, amount)
									else
									    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Nie masz tyle pieniędzy aby zagrać !", pic, 1)
					                end
					            end, '')
								ESX.UI.Menu.CloseAll()
					        end
					    elseif action == 'less_than_20' then
							local amount = tonumber(data.value)
							if amount == nil then
								ESX.ShowNotification(('less_than_20'))
							else
					            ESX.TriggerServerCallback('esx_roulette:check_money', function(quantity)
					                if quantity >= amount then
									    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twój zakład został przyjęty !", pic, 1)
										TriggerEvent('esx_roulette:start_game', action, amount)
									else
									    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Nie masz tyle pieniędzy aby zagrać !", pic, 1)
					                end
					            end, '')
								ESX.UI.Menu.CloseAll()
					        end
					    elseif action == 'current_number' then
							local amount = tonumber(data.value)
							if amount == nil then
								ESX.ShowNotification(('current_number'))
							else
					            ESX.TriggerServerCallback('esx_roulette:check_money', function(quantity)
					                if quantity >= amount then
									    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twój zakład został przyjęty !", pic, 1)
										TriggerEvent('esx_roulette:start_game', action, amount)
									else
									    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Nie masz tyle pieniędzy aby zagrać !", pic, 1)
					                end
					            end, '')
								ESX.UI.Menu.CloseAll()
					        end
					     end
					      end, function(data, menu)
							menu.close()
						end
						)
        elseif action == 'color' then
			local elements = {
				{label = ('Postaw na Czarny X1.5'),	value = 'black'},
				{label = ('Postaw na Czerwony X1.5'),	value = 'red'},
				{label = ('Postaw na Zielony X8'),	value = 'green'},
			}
			    ESX.UI.Menu.CloseAll()
			    ESX.UI.Menu.Open(
			    'default', GetCurrentResourceName(), 'color_menu',
			    {
			        title    = 'Ruletka',
			        align    = 'top-right',
			        elements = elements
			    },function(data, menu)
							local action = data.current.value
									print(action)
									if action == 'black' then
										ESX.UI.Menu.Open(
											'dialog', GetCurrentResourceName(), 'black_menu',
												{
													title = ('Wprowadz ilośc')
												},
												function(data, menu)
													local amount = tonumber(data.value)
													if amount == nil then
														ESX.ShowNotification(('Błędna wartość'))
													else
											            ESX.TriggerServerCallback('esx_roulette:check_money', function(quantity)
											                if quantity >= amount then
															    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twój zakład został przyjęty !", pic, 1)
																TriggerEvent('esx_roulette:start_game', action, amount)
															else
															    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Nie masz tyle pieniędzy aby zagrać !", pic, 1)
											                end
											            end, '')
														ESX.UI.Menu.CloseAll()
											        end
											      end,
												function(data, menu)
													menu.close()
												end
												)
									elseif action == 'red' then
										ESX.UI.Menu.Open(
											'dialog', GetCurrentResourceName(), 'red_menu',
												{
													title = ('Wprowadz ilośc')
												},
												function(data, menu)
													local amount = tonumber(data.value)
													if amount == nil then
														ESX.ShowNotification(('Błędna wartość'))
													else
											            ESX.TriggerServerCallback('esx_roulette:check_money', function(quantity)
											                if quantity >= amount then
															    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twój zakład został przyjęty !", pic, 1)
																TriggerEvent('esx_roulette:start_game', action, amount)
															else
															    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Nie masz tyle pieniędzy aby zagrać !", pic, 1)
											                end
											            end, '')
														ESX.UI.Menu.CloseAll()
											        end
											      end,
												function(data, menu)
													menu.close()
												end
												)
									elseif action == 'green' then
										ESX.UI.Menu.Open(
											'dialog', GetCurrentResourceName(), 'green_menu',
												{
													title = ('Wprowadz ilośc')
												},
												function(data, menu)
													local amount = tonumber(data.value)
													if amount == nil then
														ESX.ShowNotification(('Błędna wartość'))
													else
											            ESX.TriggerServerCallback('esx_roulette:check_money', function(quantity)
											                if quantity >= amount then
															    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Twój zakład został przyjęty !", pic, 1)
																TriggerEvent('esx_roulette:start_game', action, amount)
															else
															    ESX.ShowAdvancedNotification('Casino VEGAS', '', '~y~' .. "Nie masz tyle pieniędzy aby zagrać !", pic, 1)
											                end
											            end, '')
														ESX.UI.Menu.CloseAll()
											        end
											      end,
												function(data, menu)
													menu.close()
												end
												)
							        end
					      end, function(data, menu)
							menu.close()
						end
						)
		end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent('esx_roulette:start_game')
AddEventHandler('esx_roulette:start_game', function(action, amount)
	local amount = amount
	if game_during == false then
		TriggerServerEvent('esx_roulette:removemoney', amount)
		game_during = true
		local randomNumber = math.floor(math.random() * 36)
		--local randomNumber = 0
		SetNuiFocus(false, false)
		SendNUIMessage({
			type = "show_roulette",
			hwButton = randomNumber
		})
		Citizen.Wait(10000)
		local red = {32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3};
		local black = {15,4,2,17,6,13,8,8,10,24,33,20,31,22,29,28,35,26};
		local function has_value (tab, val)
			for index, value in ipairs(tab) do
				if value == val then
					return true
				end
			end
			return false
		end
		if action == 'black' then
			if has_value(black, randomNumber) then
				local win = amount * 1.5
				ESX.ShowAdvancedNotification('Casino VEGAS', '', '~g~' .. "Wygrałeś ! \nOtrzymałeś ~r~"..win.."$", pic, 1)
				TriggerServerEvent('esx_roulette:givemoney', action, amount)
			else
				ESX.ShowAdvancedNotification('Casino VEGAS', '', '~r~' .. "Niestety przegrałeś ...", pic, 1)
			end
		elseif action == 'red' then
			local win = amount * 1.5
			if has_value(red, randomNumber) then
				ESX.ShowAdvancedNotification('Casino VEGAS', '', '~g~' .. "Wygrałeś ! \nOtrzymałeś ~r~"..win.."$", pic, 1)
				TriggerServerEvent('esx_roulette:givemoney', action, amount)
			else
				ESX.ShowAdvancedNotification('Casino VEGAS', '', '~r~' .. "Niestety przegrałeś ...", pic, 1)
			end
		elseif action == 'green' then
			local win = amount * 8
			if randomNumber == 0 then
				ESX.ShowAdvancedNotification('Casino VEGAS', '', '~g~' .. "Wygrałeś ! \nOtrzymałeś ~r~"..win.."$", pic, 1)
				TriggerServerEvent('esx_roulette:givemoney', action, amount)
			else
				ESX.ShowAdvancedNotification('Casino VEGAS', '', '~r~' .. "Niestety przegrałeś ...", pic, 1)
			end
		end
		--TriggerServerEvent('roulette:givemoney', randomNumber)
		SendNUIMessage({type = 'hide_roulette'})
		--ESX.ShowNotification('Gra end!')
		game_during = false
	else
		ESX.ShowAdvancedNotification('Casino VEGAS', '', '~r~' .. "Aktualnie trwa losowanie !", pic, 1)
	end
end)