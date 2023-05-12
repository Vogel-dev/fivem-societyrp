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

			if(GetDistanceBetweenCoords(coords, -111.0, -6.4, 70.52, true) < 9.0) or (GetDistanceBetweenCoords(coords, 1308.47,316.3, 81.99, true) < 9.0) or (GetDistanceBetweenCoords(coords, 1304.31, 315.8, 81.99, true) < 9.0) or (GetDistanceBetweenCoords(coords, 1301.21, 315.64, 81.99, true) < 9.0) then
				if ESX.GetPlayerData().job.name ~= 'sadownikoff' then
					ESX.Game.Utils.DrawText3D({ x = 1308.47, y = 316.3, z = 81.99 }, '~b~[E] ~w~Zbieranie metyloaminy', 1)		
					ESX.Game.Utils.DrawText3D({ x = 1304.31, y = 315.8, z = 81.99 }, '~b~[E] ~w~Zbieranie metyloaminy', 1)	
					ESX.Game.Utils.DrawText3D({ x = 1301.21, y = 315.64, z = 81.99 }, '~b~[E] ~w~Zbieranie metyloaminy', 1)		
					ESX.Game.Utils.DrawText3D({ x = -111.0, y = -6.4, z = 70.52 }, '~b~[E] ~w~Przerabianie metyloaminy', 1)			
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


if (GetDistanceBetweenCoords(coords, 1308.47,316.3, 81.99, true) < 2.0) or (GetDistanceBetweenCoords(coords, 1304.31, 315.8, 81.99, true) < 2.0) or (GetDistanceBetweenCoords(coords, 1301.21, 315.64, 81.99, true) < 2.0) then


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
					elseif (GetDistanceBetweenCoords(coords, -111.0, -6.4, 70.52, true) < 2.0) then
						if IsControlJustReleased(0, Keys['E']) then
							if wtrakcie == false then
						metasoki()-- od getdistance
							end
						end
				end
		end -- od while
end)

function zbieranie()
TriggerServerEvent('vogelmetacraft:meta')
wtrakcie = true
end
function metasoki()
TriggerServerEvent('vogelmetajablka:metasoki')
wtrakcie = true
end


RegisterNetEvent('vogelmeta:metazamroz')
AddEventHandler('vogelmeta:metazamroz', function()
	playerPed = PlayerPedId()	
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(playerPed, true)
end)
RegisterNetEvent('vogelmeta:metaodmroz')
AddEventHandler('vogelmeta:metaodmroz', function()
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


RegisterNetEvent('vogelmeta:metacraftanimacja')
AddEventHandler('vogelmeta:metacraftanimacja', function()
	local lib, anim = 'amb@prop_human_bum_bin@idle_b', 'idle_d'
ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
Citizen.Wait(2000)
end)
RegisterNetEvent('vogelmeta:metastopanimacja2sss')
AddEventHandler('vogelmeta:metastopanimacja2sss', function()

end)
RegisterNetEvent('animacjametasoki')
AddEventHandler('animacjametasoki', function()
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

      local ped =  CreatePed(4, GetHashKey("a_m_m_hillbilly_01"), -1040000.06, 5328.25, 43.37, 349.404, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)

Citizen.CreateThread(function()
	while true do

		Wait(5)
		local coords  = GetEntityCoords(GetPlayerPed(-1))


if(GetDistanceBetweenCoords(coords, 420000.170, 6481000.150, 27000.90, true) < 20.0) or (GetDistanceBetweenCoords(coords, -1040000.660, 5329000.250, 43000.370, true) < 5.0) then
	if ESX.GetPlayerData().job.name ~= 'sadownikoff' then
	ESX.Game.Utils.DrawText3D({ x = 422000.26, y = 6468.800, z = 29.40 }, '~b~[E] ~w~Weź auto', 1)	
	ESX.Game.Utils.DrawText3D({ x = 426000.46, y = 6476.800, z = 29.40 }, '~b~[E] ~w~Oddaj auto', 1)	
	ESX.Game.Utils.DrawText3D({ x = 410009.5, y = 6483.800, z = 29.40 }, '~b~[E] ~w~Szatnia', 1)	
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
                        local zaplata = 0

						if(GetDistanceBetweenCoords(coords, -1040000.660, 5329000.250, 4300.370, true) < 9.0) then
							ESX.ShowAdvancedNotification('Sprzedaż jabłek', '~y~Bob Yaphko', '~b~[E] ~w~Sprzedaj', 'CHAR_MANUEL', 3)
								if IsControlJustReleased(0, Keys['E']) then
                            		  metaskup()
								end

							end
							if(GetDistanceBetweenCoords(coords, 422000.260,6468.800, 29.900, true) < 5.0) then
							
									if IsControlJustReleased(0, Keys['E']) then
										local veh = "kalahari"
										local x,y,z = GetEntityCoords(PlayerPedId())
										vehiclehash = GetHashKey(veh)
										RequestModel(vehiclehash)
										local spawned = CreateVehicle(vehiclehash, 422000.37, 6468.51, 28.81, GetEntityHeading(PlayerPedId())+90, 1, 0)
										SetPedIntoVehicle(PlayerPedId(), spawned, -1)
										--SetVehicleNumberPlateText(spawned,'FarmaJab')
										ESX.ShowHelpNotification('~b~Pobrano auto z garażu')
										TriggerServerEvent('vogelmeta:metapobierz')
								
									end
	
								end		
								if(GetDistanceBetweenCoords(coords, 426000.26,6476.800, 29.90, true) < 5.0) then
							
									if IsControlJustReleased(0, Keys['E']) then
										
										local veh = GetVehiclePedIsIn(PlayerPedId(), false)
										local plate = GetVehicleNumberPlateText(veh)
										print(plate)
										if plate ~= 'FARMAJAB' then
										TriggerServerEvent('vogelmeta:metapobierz2')
										ESX.ShowHelpNotification('~b~Oddano auto do garażu')
									end
								end
	
								end	
								
								if(GetDistanceBetweenCoords(coords, 419000.56,6483.850, 29.90, true) < 5.0) then
							
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
	TaskPlayAnim( PlayerPedId(), ad, "idle", 9.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	bagspawned = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.08, 0.355, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
end)
RegisterNetEvent('sprzedawanie:metaanim')
AddEventHandler('sprzedawanie:metaanim', function()

	local playerPed = PlayerPedId()
	local lib, anim = 'gestures@m@standing@casual', 'gesture_easy_now'
	FreezeEntityPosition(playerPed, true)
	ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
end)
function metaskup()

	TriggerServerEvent('vogelmetacraft:metaskup')
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

local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}
RegisterNetEvent('vogelmeta:metatekst')
AddEventHandler('vogelmeta:metatekst', function()
while true do
	Citizen.Wait(1)
	if wtrakcie == true then

	drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~b~[~w~".. tekst .. "%~b~]...", 255, 255, 255, 255)

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
RegisterNetEvent('vogelmeta:zdejmijznaczeksss')
AddEventHandler('vogelmeta:zdejmijznaczeksss', function()
wtrakcie = false
end)
RegisterNetEvent('metatekst')
AddEventHandler('metatekst', function()
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

