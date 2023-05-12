 local zapis = 28 --co ile cykli ma zapisywać stan przebiegu (mniej to częściej ale obciąża serwer)
 local przebieg = 0
 local plate = 'F'
 local show = true
 
 RegisterNetEvent('TMM_licznik:hide')
AddEventHandler('TMM_licznik:hide', function()
 SendNUIMessage({
      type = "ui",
	display = false
    })
end)
 
 RegisterNetEvent('TMM_licznik:distance')
AddEventHandler('TMM_licznik:distance', function(dist)
przebieg = dist
SendNUIMessage({
      type = "val",
	val = math.floor(dist / 1000)
    })

 SendNUIMessage({
      type = "ui",
	display = true
    })

end)
 
 RegisterCommand('przebieg', function(source, args, rawCommand)
	show = not show
	 SendNUIMessage({
      type = "ui",
	display = show
    })
	
 end)
 
 
 Citizen.CreateThread(function()
 Citizen.Trace('TMM_licznik: Init')
 SendNUIMessage({
      type = "ui",
	display = false
    })
	local count = 0
 while true do

	local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped, true) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped,false), -1) == ped then
		plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped,false), -1)
		TriggerServerEvent("TMM_licznik:Getdistance", GetVehicleNumberPlateText(GetVehiclePedIsIn(ped,false)))
		if show == true then
		SendNUIMessage({
      type = "ui",
	display = true
    })
	else
	SendNUIMessage({
      type = "ui",
	display = false
    })
	end
Citizen.Wait(1000)
while IsPedInAnyVehicle(ped, true) do
		count = count + 1
			if  GetVehicleNumberPlateText(GetVehiclePedIsIn(ped,false), -1) ~= plate then break end
			local coord = GetEntityCoords(ped, true)
		Citizen.Wait(2000)
			local now = GetEntityCoords(ped, true)
			przebieg = przebieg + math.floor(GetDistanceBetweenCoords(coord, now.x, now.y, now.z))
			if show == true then
			SendNUIMessage({
      type = "val",
	val = math.floor(przebieg / 1000)
    })
			end
			if count > zapis and przebieg > 0 then
			count = 0
			TriggerServerEvent("TMM_licznik:Setdistance", GetVehicleNumberPlateText(GetVehiclePedIsIn(ped,true), -1), przebieg)
			end
			Citizen.Wait(1)
		end
		if przebieg > 0 then
		TriggerServerEvent("TMM_licznik:Setdistance", GetVehicleNumberPlateText(GetVehiclePedIsIn(ped,true), -1), przebieg)
		end
		przebieg = 0
		plate = 'F'
		
	
	end
	SendNUIMessage({
      type = "ui",
	display = false
    })
 Citizen.Wait(2000)
 end
 
 
 end)