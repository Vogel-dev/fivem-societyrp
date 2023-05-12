key_to_teleport = 38

positions = {
    -- {{-451.11, 6269.87, 29.04, 354.13}, {1138.05, -3198.65, -40.68, 2.27}, "Wciśnij ~b~E ~w~aby przejść."}, -- pralnia
--{{-672.43, -895.33, 23.5, 354.13}, {-1569.38, -3017.52, -75.41, 2.27}, "Wciśnij ~b~E ~w~aby przejść."}, -- galaxy
--{{-1413.22, -635.64, 27.67, 0.0}, {997.68, -3158.03, -39.91, 90.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- mefedron 
--{{-1125.09, -551.66, 31.48, 0.0}, {1065.81, -3183.43, -40.16, 0.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- ziolo
--{{-91.63, 6514.76, 31.1, 0.0}, {1110.01, -3166.1, -38.52, 0.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- ziolo 2 stare
-- {{-1361.56, -758.6, 21.5, 0.0}, {997.44, -3200.58, -37.39, 0.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- heroina
--{{-806.54, 791.31, 201.19, 0.0}, {1087.98, -3099.38, -40.0, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
-- {{557.31, -2716.56, 6.11, 0.0}, {1088.67, -3187.94, -39.99, 0.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- kokaina
--{{298.01, -584.46, 42.26, 0.0}, {1088.67, -3187.94, -39.99, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},

{{294.7, -1448.1, 29.0, 0.0}, {272.8, -1358.8, 23.5, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
--{{275.3, -1361, 23.5, 0.0}, {295.8, -1446.5, 28.9, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
{{247.3, -1371.5, 23.5, 0.0}, {333.1, -1434.9, 45.5, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
{{335.5, -1432.0, 45.50, 0.0}, {249.1, -1369.6, 23.5, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
{{234.5, -1373.7, 20.9, 0.0}, {320.9, -1478.6, 28.8, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
{{317.9, -1476.1, 28.9, 0.0}, {238.6, -1368.4, 23.5, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
{{237.4, -1373.8, 26.0, 0.0}, {251.9, -1363.3, 38.5, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
{{256.5, -1357.7, 36.0, 0.0}, {235.4, -1372.8, 26.3, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
{{1181.22, -3113.73, 5.03, 0.0}, {993.01, -3097.9, -40.0, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},

--spital pillbox
{{298.48, -584.57, 42.26, 0.0}, {300.36, -585.25, 42.29, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
{{325.49, -598.73, 42.29, 0.0}, {338.72, -583.88, 73.17, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},
-- {{-1902.19, -572.57, 18.1, 0.0}, {-1913.6, -574.1, 10.11, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},--psycholog
-- {{138.95, -763.17, 44.75, 0.0}, {136.12, -761.61, 241.15, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},--fib1
-- {{136.32, -761.6, 44.75, 0.0}, {144.14, -689.05, 32.13, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},--fibgaraz
-- {{-2679.6, 1342.2, 151.01, 0.0}, {-2680.17, 1344.41, 155.93, 0.0}, "Wciśnij ~b~E ~w~aby przejść."},--lertivodach
--{{1394.63, 1152.6, 113.41, 0.0}, {1396.9, 1141.7, 113.33, 0.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- lertivo villa
--{{1450.78, 1146.25, 113.33, 0.0}, {135.19, -2203.52, 6.31, 0.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- lertivo torture room
-- {{1048.05, -3097.11, -40.0, 0.0}, {-2360.0, 3249.72, 31.81, 0.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- wojsko
-- {{-1291.78, -280.06, 37.69, 0.0}, {906.99, -942.86, 43.42, 0.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- kasyno--
{{-2286.0, 3379.0, 30.26, 232.0}, {-2314.96, 3391.56, 29.88, 48.0}, "Wciśnij ~b~E ~w~aby przejść."}, -- wojsko -- wojsko brama
    --[[
    {{x, y, z, Heading}, {x, y, z, Heading}, "Text to show when in the area."},
    ]]
}

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for i,location in ipairs(positions) do
            teleport_text = location[3]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 253, 1, 247   , 50, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001,253, 1, 247   , 50, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end