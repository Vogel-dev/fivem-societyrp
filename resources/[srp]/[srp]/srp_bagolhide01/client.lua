ESX                     = nil
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

		local player = PlayerPedId()
		local inside = false
		local wrzucony = false
	Citizen.CreateThread(function()
	  	while true do
		    Citizen.Wait(5)

		    	player = PlayerPedId()
			local plyCoords = GetEntityCoords(player, false)
			local vehicle = VehicleInFront()

		    if IsDisabledControlPressed(0, 21) and IsDisabledControlJustReleased(1, 47) and GetVehiclePedIsIn(player, false) == 0 and DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
			 	SetVehicleDoorOpen(vehicle, 5, false, false)    	
		    	if not inside then
		        	AttachEntityToEntity(player, vehicle, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)		       		
		       		RaiseConvertibleRoof(vehicle, false)
		       		if IsEntityAttached(player) then
						SetTextComponentFormat("STRING")
						AddTextComponentString('~s~~INPUT_SPRINT~+~INPUT_DETONATE~ żeby wyjść z bagażnika')
						DisplayHelpTextFromStringLabel(0, 1, 1, -1)	
						ClearPedTasksImmediately(player)
						Citizen.Wait(100)	       			
						TaskPlayAnim(player, 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 1, 0, 0, 0, 0)	
		            	if not (IsEntityPlayingAnim(player, 'timetable@floyd@cryingonbed@base', 'base', 3) == 1) then
		          			Streaming('timetable@floyd@cryingonbed@base', function()
					  		TaskPlayAnim(playerPed, 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 49, 0, 0, 0, 0)
		               	end)
		            end    
		           	
		    		inside = true 						         		
		    		else
		    		inside = false
		    		end   			
		    	elseif inside and IsDisabledControlPressed(0, 21) and IsDisabledControlJustReleased(1, 47) and wrzucony == false then
		    		DetachEntity(player, true, true)
		    		SetEntityVisible(player, true, true)
		   			ClearPedTasks(player)   
		    		inside = false
					ClearAllHelpMessages()		    	

		    	end
		    	Citizen.Wait(2000)
		    	SetVehicleDoorShut(vehicle, 5, false)    	
		    end
	    	if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) and not inside and GetVehiclePedIsIn(player, false) == 0 then
			Citizen.Wait(0)
			elseif DoesEntityExist(vehicle) and inside then
		    		car = GetEntityAttachedTo(player)
		    		carxyz = GetEntityCoords(car, 0)
		   			local visible = true
		   			DisableAllControlActions(0)
		   			DisableAllControlActions(1)
		   			DisableAllControlActions(2)
		   			EnableControlAction(0, 0, true) --- V - camera
		   			EnableControlAction(0, 249, true) --- N - push to talk	
		   			EnableControlAction(2, 1, true) --- camera moving
		   			EnableControlAction(2, 2, true) --- camera moving	
		   			EnableControlAction(0, 177, true) --- BACKSPACE
		   			EnableControlAction(0, 200, true) --- ESC										
			elseif not DoesEntityExist(vehicle) and inside then
		    		DetachEntity(player, true, true)
		    		SetEntityVisible(player, true, true)
		   			ClearPedTasks(player)  	  
		    		inside = false		
		   			ClearAllHelpMessages()	 		    			
			end  	
	  	end
	end)

function Streaming(animDict, cb)
	if not HasAnimDictLoaded(animDict) then
		RequestAnimDict(animDict)

		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(1)
		end
	end

	if cb ~= nil then
		cb()
	end
end	
function VehicleInFront()
    local pos = GetEntityCoords(player)
    local entityWorld = GetOffsetFromEntityInWorldCoords(player, 2.0, 10.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, player, 0)
    local _, _, _, _, result = GetRaycastResult(rayHandle)
    return result
end

--[[
RegisterCommand("bagaznik", function()
    local coords = GetEntityCoords(GetPlayerPed(-1))

	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

print('wkladanie client')
	TriggerServerEvent('dobagaja:smerfik', GetPlayerServerId(closestPlayer), 1)

	print('xd111')
end, false)

RegisterCommand("bagaznikkk", function()
    local coords = GetEntityCoords(GetPlayerPed(-1))

	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()


print('wkladanie client')
	TriggerServerEvent('zbagaja:smerfik', GetPlayerServerId(closestPlayer), 1)

	print('xd111')
end, false)]]
 RegisterNetEvent('smerfik:wlozbagaj')
 AddEventHandler('smerfik:wlozbagaj', function()
	player = PlayerPedId()
	local plyCoords = GetEntityCoords(player, false)
	local vehicle = GetClosestVehicle(plyCoords.x, plyCoords.y, plyCoords.z, 5.0, 0, 70)

	print('WLADAnie 1')
	if GetVehiclePedIsIn(player, false) == 0 and DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
		 SetVehicleDoorOpen(vehicle, 5, false, false)    
		 print('WLADAnie 2')	
		if not inside then
			print('WLADAnie 3')
			AttachEntityToEntity(player, vehicle, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)		       		
			   RaiseConvertibleRoof(vehicle, false)
			   if IsEntityAttached(player) then
				SetTextComponentFormat("STRING")

				DisplayHelpTextFromStringLabel(0, 1, 1, -1)	
				ClearPedTasksImmediately(player)
				Citizen.Wait(100)	
				wrzucony = true       			
				TaskPlayAnim(player, 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 1, 0, 0, 0, 0)	
				if not (IsEntityPlayingAnim(player, 'timetable@floyd@cryingonbed@base', 'base', 3) == 1) then
					  Streaming('timetable@floyd@cryingonbed@base', function()
					  TaskPlayAnim(playerPed, 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 49, 0, 0, 0, 0)
				   end)
			end    
			   
			inside = true 						         		
			else
		
			end   			
	    	

		end
		Citizen.Wait(2000)
		SetVehicleDoorShut(vehicle, 5, false)    	
	end
	if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) and not inside and GetVehiclePedIsIn(player, false) == 0 then
	Citizen.Wait(0)
	elseif DoesEntityExist(vehicle) and inside then
			car = GetEntityAttachedTo(player)
			carxyz = GetEntityCoords(car, 0)
			   local visible = true
			   DisableAllControlActions(0)
			   DisableAllControlActions(1)
			   DisableAllControlActions(2)
			   EnableControlAction(0, 0, true) --- V - camera
			   EnableControlAction(0, 249, true) --- N - push to talk	
			   EnableControlAction(2, 1, true) --- camera moving
			   EnableControlAction(2, 2, true) --- camera moving	
			   EnableControlAction(0, 177, true) --- BACKSPACE
			   EnableControlAction(0, 200, true) --- ESC										
	elseif not DoesEntityExist(vehicle) and inside then
			DetachEntity(player, true, true)
			SetEntityVisible(player, true, true)
			   ClearPedTasks(player)  	  
			inside = false		
			   ClearAllHelpMessages()	 		    			
	end  	
 end)

 RegisterNetEvent('wyjmijbagaj')
 AddEventHandler('wyjmijbagaj', function()
 if inside then
	DetachEntity(player, true, true)
	wrzucony = false
	local kordynaty = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.5)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	local najblizsze = GetEntityCoords(GetPlayerPed(closestPlayer))
	ESX.Game.Teleport(PlayerPedId(), najblizsze)
	SetEntityVisible(player, true, true)
	   ClearPedTasks(player)   
	inside = false
	ClearAllHelpMessages()	
	EnableAllControlActions(0)
	EnableAllControlActions(1)
	EnableAllControlActions(2)
 end
end)