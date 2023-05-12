ESX                             = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu',
  {
    title = 'Kajdanki',
    align = 'center',
    elements = {
		{label = 'Skuj / Rozkuj',		value = 'handcuff'},
		{label = 'Przeszukaj',			value = 'body_search'},
    {label = 'Chwyc',			value = 'drag'},
    {label = 'Wloz do bagaznika',    value = 'bagaj1'},
    {label = 'Wyjmij z bagaznika',    value = 'bagaj2'},
		{label = 'Wloz do pojazdu',	value = 'put_in_vehicle'},
    {label = 'Wyjmij z pojazdu',	value = 'out_the_vehicle'}
	}
  }, function(data, menu)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        local action = data2.current.value
        if closestPlayer ~= -1 and closestDistance <= 3.0 then
		    local closestPed = GetPlayerPed(closestPlayer)
            if data.current.value == 'body_search' then
				OpenBodySearchMenu(closestPlayer)
				end
            elseif data.current.value == 'handcuff' then
              local bagModel = "p_cs_cuffs_02_s"
              local peed = PlayerPedId()
              local x,y,z = table.unpack(GetEntityCoords(peed))
         local prop_name = prop_name or 'p_cs_cuffs_02_s'
         RequestModel(GetHashKey(bagModel))
         
         local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
         local bagspawned = CreateObject(GetHashKey(bagModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
         RequestAnimDict("move_weapon@pistol@copa")
         while not HasAnimDictLoaded("move_weapon@pistol@copa") do
             Citizen.Wait(100)
         end
         TaskPlayAnim(peed, "move_weapon@pistol@copa", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
         
         AttachEntityToEntity(bagspawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 57005), 0.15, 10, 10, 0, 370.0, 60.0, true, true, false, true, 1, true)
         TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 30.0, 'kajdanki', 1)
         TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer), 1)        
         
     Citizen.Wait(300)

     Citizen.Wait(1000)
 ClearPedTasksImmediately(PlayerPedId())
 DetachEntity(bagspawned, 1, 1)
 DeleteObject(bagspawned) 
     Citizen.Wait(300)

     Citizen.Wait(1000)
 ClearPedTasksImmediately(PlayerPedId())
 DetachEntity(bagspawned, 1, 1)
 DeleteObject(bagspawned)
            elseif data.current.value == 'drag' then
				TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
        end
      elseif data.current.value == 'bagaj1' then
        local coords = GetEntityCoords(GetPlayerPed(-1))

                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
            print('wkladanie client')
                TriggerServerEvent('dobagaja:smerfik', GetPlayerServerId(closestPlayer), 1)
    end

  elseif data.current.value == 'bagaj2' then
      local coords = GetEntityCoords(GetPlayerPed(-1))

                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
            
            print('wkladanie client')
                TriggerServerEvent('zbagaja:smerfik', GetPlayerServerId(closestPlayer), 1)
  end
            elseif data.current.value == 'put_in_vehicle' then
                TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
            elseif data.current.value == 'out_the_vehicle' then
                TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
            end
        else
            ESX.ShowNotification('Brak graczy w poblizu')
        end
    end, function(data, menu)
		menu.close()
	end)
end

function OpenBodySearchMenu(player)
  ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
    local elements = {}
    local blackMoney = 0
	
	table.insert(elements, {
		label = 'Zabierz ' .. data.cash .. ' gotówki',
		itemType = 'item_cash',
		value = 'cash',
		amount = data.cash
	})

    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    table.insert(elements, {
      label          = 'Zabierz ' .. blackMoney .. ' brudnej gotówki',
      value          = 'black_money',
      itemType       = 'item_account',
      amount         = data.blackMoney
    })

    table.insert(elements, {label = '--- Bronie ---', value = nil})
	for i=1, #data.weapons, 1 do
		table.insert(elements, {
			label    = ('Zabierz ' .. ESX.GetWeaponLabel(data.weapons[i].name) .. data.weapons[i].ammo),
			value    = data.weapons[i].name,
			itemType = 'item_weapon',
			amount   = data.weapons[i].ammo
		})
	end

    table.insert(elements, {label = ('--- Ekwipunek ---'), value = nil})
    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label          = 'Zabierz ' .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
          value          = data.inventory[i].name,
          itemType       = 'item_standard',
          amount         = data.inventory[i].count,
        })
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'body_search',
      {
        title    = 'search',
        align    = 'center',
        elements = elements,
      },
      function(data, menu)

        local itemType = data.current.itemType
        local itemName = data.current.value
        local amount   = data.current.amount
		
        if data.current.value ~= nil then
			TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
			ESX.UI.Menu.CloseAll()
        end
      end,
      function(data, menu)
        menu.close()
      end
    )
  end, GetPlayerServerId(player))
end

RegisterNetEvent('kajdans:onUse')
AddEventHandler('kajdans:onUse', function()
	local playerPed		= GetPlayerPed(-1)
	local coords		= GetEntityCoords(playerPed)
	OpenMenu()
end)
