local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

ESX                           = nil
local PlayerData                = {}
local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local hasAlreadyEnteredMarkerr 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false
local isInJoblistingMarkerr 		 = false
local bet = 0
local wtrakcie = false
local bagModel = "prop_apple_box_01"
local bagspawned = nil
local tekst = 0
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)

end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(5)
		local coords = GetEntityCoords(GetPlayerPed(-1))

			if(GetDistanceBetweenCoords(coords, 1011.25, -180.55, 41.74, true) < 10.0) or (GetDistanceBetweenCoords(coords, 1059.23, -261.89, 50.96, true) < 10.0) or (GetDistanceBetweenCoords(coords, 1062.5, -264.0, 50.96, true) < 10.0) or (GetDistanceBetweenCoords(coords, 1065.92, -266.18, 50.96, true) < 10.0) then
				if ESX.GetPlayerData().job.name ~= 'sadownikoff' then
					ESX.Game.Utils.DrawText3D({ x = 1059.23, y = -261.89, z = 50.96 }, '~o~[E] ~w~Zbieranie ~o~szamba', 1)		
					ESX.Game.Utils.DrawText3D({ x = 1062.5, y = -264.0, z = 50.96 }, '~o~[E] ~w~Zbieranie ~o~szamba', 1)	
					ESX.Game.Utils.DrawText3D({ x = 1065.92, y = -266.18, z = 50.96 }, '~o~[E] ~w~Zbieranie ~o~szamba', 1)		
					ESX.Game.Utils.DrawText3D({ x = 1011.25, y = -180.55, z = 41.74 }, '~o~[E] ~w~Przelewanie ~o~szamba do wiader', 1)			
		end
	end
	end
end)
function HelpText(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end


Citizen.CreateThread(function()
	while true do

		Wait(15)
		local coords      = GetEntityCoords(GetPlayerPed(-1))


if (GetDistanceBetweenCoords(coords, 1059.23, -261.89, 50.96, true) < 2.0) or (GetDistanceBetweenCoords(coords, 1062.5, -264.0, 50.96, true) < 2.0) or (GetDistanceBetweenCoords(coords, 1065.92, -266.18, 50.96, true) < 2.0) then


			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
      local zaplata = 0


					if ESX.GetPlayerData().job.name ~= 'sadownikoff' then
								if IsControlJustReleased(0, Keys['E']) then
									if wtrakcie == false then
                                      zbieranie()
									end
								end
						end
					elseif (GetDistanceBetweenCoords(coords, 1011.25, -180.55, 41.74, true) < 2.0) then
						if IsControlJustReleased(0, Keys['E']) then
							if wtrakcie == false then
						gowno()-- od getdistance
							end
						end
				end
		end -- od while
end)

function zbieranie()
TriggerServerEvent('vogelcraft:gownosersad1')
wtrakcie = true
end
function gowno()
TriggerServerEvent('vogelgowno:gowno')
wtrakcie = true
end


RegisterNetEvent('vogel:zamrozcraftgowno2')
AddEventHandler('vogel:zamrozcraftgowno2', function()
	playerPed = PlayerPedId()	
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(playerPed, true)
end)
RegisterNetEvent('vogel:odmrozcraftgowno')
AddEventHandler('vogel:odmrozcraftgowno', function()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(PlayerPedId())
	TriggerEvent('skinchanger:getSkin', function(skin)
	


		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)

Citizen.Wait(1000)
	wtrakcie = false


end)


RegisterNetEvent('vogel:craftanimacjagowno')
AddEventHandler('vogel:craftanimacjagowno', function()
	local lib, anim = 'amb@prop_human_bum_bin@idle_b', 'idle_d'
ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
Citizen.Wait(2000)
end)
RegisterNetEvent('vogel:stopcraftanimacjagowno2sss')
AddEventHandler('vogel:stopcraftanimacjagowno2sss', function()

end)
RegisterNetEvent('animacjagowno')
AddEventHandler('animacjagowno', function()
	local pid = PlayerPedId()
	ESX.Streaming.RequestAnimDict("amb@prop_human_bum_bin@idle_b", function()

	TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
	end)
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end
Citizen.CreateThread(function()
  
    RequestModel(GetHashKey("a_m_m_hillbilly_01"))
    while not HasModelLoaded(GetHashKey("a_m_m_hillbilly_01")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("a_m_m_hillbilly_01"), -104000.06, 5328.25, 43.37, 349.404, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)

Citizen.CreateThread(function()
	while true do

		Wait(5)
		local coords  = GetEntityCoords(GetPlayerPed(-1))


if(GetDistanceBetweenCoords(coords, 42000.170, 6481.150, 27.90, true) < 20.0) or (GetDistanceBetweenCoords(coords, 1073.36, -260.21, 59.08, true) < 5.0) then
	if ESX.GetPlayerData().job.name ~= 'sadownikoff' then
	ESX.Game.Utils.DrawText3D({ x = 42200.26, y = 6468.800, z = 29.40 }, '~o~[E] ~w~Weź auto', 1)	
	ESX.Game.Utils.DrawText3D({ x = 42600.46, y = 6476.800, z = 29.40 }, '~o~[E] ~w~Oddaj auto', 1)	
	ESX.Game.Utils.DrawText3D({ x = 41900.5, y = 6483.800, z = 29.40 }, '~o~[E] ~w~Szatnia', 1)	
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
                        local zaplata = 0

						if(GetDistanceBetweenCoords(coords, 1073.36, -260.21, 59.08, true) < 3.0) then
							ESX.ShowAdvancedNotification('Skup wiader z szambem', '~y~Rafał Gówniarek', '~o~[E] ~w~Sprzedaj', 'CHAR_FILMNOIR', 3)
								if IsControlJustReleased(0, Keys['E']) then
                            		  skupsss()
								end

							end
							if(GetDistanceBetweenCoords(coords, 42200.260,6468.800, 29.900, true) < 5.0) then
							
									if IsControlJustReleased(0, Keys['E']) then
										local veh = "kalahari"
										local x,y,z = GetEntityCoords(PlayerPedId())
										vehiclehash = GetHashKey(veh)
										RequestModel(vehiclehash)
										local spawned = CreateVehicle(vehiclehash, 42200.37, 6468.51, 28.81, GetEntityHeading(PlayerPedId())+90, 1, 0)
										SetPedIntoVehicle(PlayerPedId(), spawned, -1)
										--SetVehicleNumberPlateText(spawned,'FarmaJab')
										ESX.ShowHelpNotification('~o~Pobrano auto z garażu')
										TriggerServerEvent('vogel:pobierzgownosss')
								
									end
	
								end		
								if(GetDistanceBetweenCoords(coords, 42600.26,6476.800, 29.90, true) < 5.0) then
							
									if IsControlJustReleased(0, Keys['E']) then
										
										local veh = GetVehiclePedIsIn(PlayerPedId(), false)
										local plate = GetVehicleNumberPlateText(veh)
										print(plate)
										if plate ~= 'FARMAJAB' then
										TriggerServerEvent('vogel:pobierzgownosss2')
										ESX.ShowHelpNotification('~r~Oddano auto do garażu')
									end
								end
	
								end	
								
								if(GetDistanceBetweenCoords(coords, 41900.56,6483.850, 29.90, true) < 5.0) then
							
									if IsControlJustReleased(0, Keys['E']) then
										
									ubrania()
								end
	
								end	
						end
		end
		end

end)
function ubrania()

	TriggerEvent('skinchanger:getSkin', function(skin)
	
		if skin.tshirt_1 == 15 and skin.torso_1 == 43 then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)
			else
				local clothesSkin = {
					['tshirt_1'] = 15, ['tshirt_2'] = 0,
					['torso_1'] = 43, ['torso_2'] = 0,
					['arms'] = 37, ['arms_2'] = 0,
					['pants_1'] = 27, ['pants_2'] = 3,
					['shoes_1'] = 12, ['shoes_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				
		end
	end)
end
RegisterNetEvent('podlacz:propa')
AddEventHandler('podlacz:propa', function()
	local ad = "anim@heists@box_carry@"
	loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	bagspawned = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.08, 0.355, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
end)
RegisterNetEvent('sprzedawanie:jablekanimsss')
AddEventHandler('sprzedawanie:jablekanimsss', function()

	local playerPed = PlayerPedId()
	local lib, anim = 'gestures@m@standing@casual', 'gesture_easy_now'
	FreezeEntityPosition(playerPed, true)
	ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
end)
function skupsss()

	TriggerServerEvent('vogelcraft:skupsss')
	ClearPedSecondaryTask(PlayerPedId())
	TriggerEvent('skinchanger:getSkin', function(skin)

Citizen.Wait(3500)
		local clothesSkin = {
		['bags_1'] = 0, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
	Citizen.Wait(13000)
	FreezeEntityPosition(PlayerPedId(), false)
	DetachEntity(bagspawned, 1, 1)
	DeleteObject(bagspawned)
	ClearPedSecondaryTask(PlayerPedId())
	wtrakcie = false
end
	
RegisterNetEvent('odlacz:propa')
AddEventHandler('odlacz:propa', function()
	DetachEntity(bagspawned, 1, 1)
	DeleteObject(bagspawned)
	maitem = false
	ClearPedSecondaryTask(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
end)

local blips = {

	{title="Szambiarnia", colour=10, id=409, x = 1060.57, y = -272.5, z = 50.63},

}      
Citizen.CreateThread(function()

   for _, info in pairs(blips) do
	 info.blip = AddBlipForCoord(info.x, info.y, info.z)
	 SetBlipSprite(info.blip, info.id)
	 SetBlipDisplay(info.blip, 4)
	 SetBlipScale(info.blip, 1.0)
	 SetBlipColour(info.blip, info.colour)
	 SetBlipAsShortRange(info.blip, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString(info.title)
	 EndTextCommandSetBlipName(info.blip)
   end

end)

local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}
RegisterNetEvent('vogel:tekstgowno')
AddEventHandler('vogel:tekstgowno', function()
while true do
	Citizen.Wait(1)
	if wtrakcie == true then

	drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~o~[~w~".. tekst .. "%~o~]...", 255, 255, 255, 255)

end
end
end)
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
RegisterNetEvent('vogel:zdejmijznaczekgowno')
AddEventHandler('vogel:zdejmijznaczekgowno', function()
wtrakcie = false
end)
RegisterNetEvent('gownozacznijtekst')
AddEventHandler('gownozacznijtekst', function()
	Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1

Citizen.Wait(1500)
tekst = 0
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

