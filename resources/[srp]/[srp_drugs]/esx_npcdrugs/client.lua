ESX                 = nil
local myJob     = nil
local selling       = false
local has       = false
local copsc     = false
local PlayerData              = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

GetPlayerName()
RegisterNetEvent('outlawNotifye')
AddEventHandler('outlawNotifye', function(id ,msg)
		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
   local pid = GetPlayerFromServerId(id)
  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(pid))

  ESX.ShowAdvancedNotification('Zgłoszenie', 'Sprzedaż narkotyków', msg, mugshotStr, 1)

  UnregisterPedheadshot(mugshot)
        end
end)
RegisterNetEvent('narkoBlip')
AddEventHandler('narkoBlip', function(gx, gy, gz)
		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then

			local transG = 250
			local narkoBlip = AddBlipForCoord(gx, gy, gz)
			SetBlipSprite(narkoBlip,  1)
			SetBlipColour(narkoBlip,  1)
			SetBlipAlpha(narkoBlip,  transG)
			SetBlipAsShortRange(narkoBlip,  1)
			while transG ~= 0 do
				Wait(10 * 4)
				transG = transG - 1
				SetBlipAlpha(narkotBlip,  transG)
				if transG == 0 then
					SetBlipSprite(narkoBlip,  2)
					return
                                    end
				end
			end

end)


function Notifye(id, msg)
   local pid = GetPlayerFromServerId(id)
  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(pid))

  ESX.ShowAdvancedNotification('Zgłoszenie', 'Sprzedaż narkotyków', msg, mugshotStr, 1)

  UnregisterPedheadshot(mugshot)
end

currentped = nil
Citizen.CreateThread(function()

while true do
  Wait(0)
  local player = GetPlayerPed(-1)
  local playerloc = GetEntityCoords(player, 0)
  local handle, ped = FindFirstPed()
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
       local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
		local szansa = math.random (1,100)

  repeat
    success, ped = FindNextPed(handle)
    local pos = GetEntityCoords(ped)
    local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
			local distanceFromCity = GetDistanceBetweenCoords(Config.Center.x, Config.Center.y, Config.Center.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
    if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
      if DoesEntityExist(ped)then
        if IsPedDeadOrDying(ped) == false then
          if IsPedInAnyVehicle(ped) == false then
            local pedType = GetPedType(ped)
            if pedType ~= 28 and IsPedAPlayer(ped) == false then
              currentped = pos
			  								if distanceFromCity < Config.Dist then
              if distance <= 2 and ped  ~= GetPlayerPed(-1) and ped ~= oldped then
                TriggerServerEvent('checkD')
                if has == true then
                  drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Wciśnij ~o~E~w~, aby zaoferować osobie narkotyki.", 255, 255, 255, 255)
                  if IsControlJustPressed(1, 86) then
                      oldped = ped
                      SetEntityAsMissionEntity(ped)
                      TaskStandStill(ped, 9.0)
                      pos1 = GetEntityCoords(ped)
                      TriggerServerEvent('drugs:trigger')
                      Citizen.Wait(2850)
                      TriggerEvent('sell')
                      SetPedAsNoLongerNeeded(oldped)
if szansa < Config.Percent then
			TriggerServerEvent('sprzedaz', street1, street2)
					TriggerServerEvent('narkoPos', plyPos.x, plyPos.y, plyPos.z)
else

                    end
                  end
                end
              end
            end
          end
		  end
        end
      end
    end
  until not success
  EndFindPed(handle)
end
end)

RegisterNetEvent('sprzedaz1')
AddEventHandler('sprzedaz1', function()
       local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
       local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
			TriggerServerEvent('sprzedaz', street1, street2)
end

end)

RegisterNetEvent('sell')
AddEventHandler('sell', function()
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)
    local distance = GetDistanceBetweenCoords(pos1.x, pos1.y, pos1.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= 2 then
      TriggerServerEvent('drugs:sell')
    elseif distance > 2 then
      TriggerServerEvent('sell_dis')
    end
end)


RegisterNetEvent('checkR')
AddEventHandler('checkR', function(test)
  has = test
end)

--Calls the cops
RegisterNetEvent('notifyc')
AddEventHandler('notifyc', function()

    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
    local streetName, crossing = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local streetName, crossing = GetStreetNameAtCoord(x, y, z)
    streetName = GetStreetNameFromHashKey(streetName)
  TriggerServerEvent('fetchjob')
		TriggerServerEvent('esx_phone: send', 'police', 'message', true, {x, y, z})
  if myJob == 'police' then
    if crossing ~= nil then
      crossing = GetStreetNameFromHashKey(crossing)
      TriggerEvent('chatMessage', "^4911", {0, 153, 204}, "^7Une personne veut me vendre de la drogue ^1" .. streetName .. " ^7svp ^1" .. crossing .. " ^7vite venez")
    else
      TriggerEvent('chatMessage', "^4911", {0, 153, 204}, "^7Une personne veut me vendre de la drogue ^1" .. streetName .. " ^7vite venez")
    end
  end
end)


RegisterNetEvent('animation')
AddEventHandler('animation', function()
  local pid = PlayerPedId()
  RequestAnimDict("amb@prop_human_bum_bin@idle_b")
  while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do Citizen.Wait(0) end
    TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
    Wait(750)
    StopAnimTask(pid, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
      SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end