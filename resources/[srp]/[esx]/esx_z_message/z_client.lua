local notes = 20

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if not IsPauseMenuActive() then
			local ped = GetPlayerPed(-1)
			if DoesEntityExist(ped) then
				if IsControlJustPressed(1, notes) then
					--TriggerServerEvent('z_send', " ^2Obywatel [" .. GetPlayerServerId(PlayerId()) .. "] ^3przegląda listę obywateli.")
					TriggerEvent('DiscordBot:ToDiscord', 'chat', 'NAME', 'MESSAGE', 'IMAGE_URL', true)
					if not IsPedInAnyVehicle(ped) and not IsEntityDead(ped) and not IsPedFalling(ped) and not IsPedCuffed(ped) and not IsPedDiving(ped) and not IsPedInCover(ped, false) and not IsPedInParachuteFreeFall(ped) and (GetPedParachuteState(ped) == 0 or GetPedParachuteState(ped) == -1) then
						TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, false)
					end
				end

				if IsControlPressed(1, notes) then
				end

				if IsControlJustReleased(1, notes) and GetLastInputMethod(2) and not IsPedCuffed(ped) then
					ClearPedTasks(ped)
				end
			end
		end
	end
end)

RegisterNetEvent('send')
AddEventHandler('send', function(id, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(id)

	if target == source then
		TriggerEvent('chat:addMessage', { args = { message }, color = color })
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(source)), GetEntityCoords(GetPlayerPed(target)), true) < 50 then
		TriggerEvent('chat:addMessage', { args = { message }, color = color })
	end
end)
