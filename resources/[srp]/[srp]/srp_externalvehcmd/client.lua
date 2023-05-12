----------------------------------------------
-- External Vehicle Commands, Made by FAXES --
----------------------------------------------

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

RegisterCommand("bagaznik", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 5

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("POJAZD> ~g~Bagażnik zamknięty.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("POJAZD> ~g~Bagażnik otwarty.")
        end
    else
        if distanceToVeh < 6 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("POJAZD> ~g~Bagażnik zamknięty.")
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("POJAZD> ~g~Bagażnik otwarty.")
            end
        else
            ShowInfo("POJAZD> ~y~Jesteś zbyt daleko od pojazdu.")
        end
    end
end)

RegisterCommand("maska", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("POJAZD> ~g~Maska zamknięta.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("POJAZD> ~g~Maska otwarta.")
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("POJAZD> ~g~Maska zamknięta.")
            else	
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("POJAZD> ~g~Maska otwarta.")
            end
        else
            ShowInfo("POJAZD> ~y~Jesteś zbyt daleko od pojazdu.")
        end
    end
end)

RegisterCommand("drzwi", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    
    if args[1] == "1" then -- Przednie Lewe Door
        door = 0
    elseif args[1] == "2" then -- Przednie Prawe Door
        door = 1
    elseif args[1] == "3" then -- Tylne Lewe Door
        door = 2
    elseif args[1] == "4" then -- Tylne Prawe Door
        door = 3
    else
        door = nil
        ShowInfo("Usage: ~n~~b~/drzwi [drzwi]")
        ShowInfo("~y~Możliwe drzwi:")
        ShowInfo("1(Przednie Lewe drzwi), 2(Przednie Prawe drzwi)")
        ShowInfo("3(Tylne Lewe drzwi), 4(Tylne Prawe drzwi)")
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
                TriggerEvent("^*POJAZD> ~g~Drzwi zamknięte.")
            else	
                SetVehicleDoorOpen(veh, door, false, false)
                TriggerEvent("^*POJAZD> ~g~Drzwi otwarte.")
            end
        else
            if distanceToVeh < 4 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                    TriggerEvent("POJAZD> ~g~Drzwi zamknięte.")
                else	
                    SetVehicleDoorOpen(vehLast, door, false, false)
                    TriggerEvent("POJAZD> ~g~Drzwi otwarte.")
                end
            else
                TriggerEvent("POJAZD> ~y~Jesteś zbyt daleko od pojazdu.")
            end
        end
    end
end)