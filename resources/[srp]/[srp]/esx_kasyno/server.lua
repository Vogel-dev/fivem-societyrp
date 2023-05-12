-- Kasyno By milutus 
-- Supported by znajak
-- All rights reserved ©2019

ESX	= nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

local jackpot = 5.0
local seven = 2.0
local bar = 1.8
local water_melon = 1.5
local bananas = 1.4
local cherry = 1.3
local pic = 'CHAR_MILSITE'


RegisterServerEvent('esx_kasyno:start_gra')
AddEventHandler('esx_kasyno:start_gra', function(action)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local PlayerName = GetPlayerName(source)
	local gotowka_gracza = xPlayer.getMoney()
	local kwota = tonumber(action)
	if gotowka_gracza < kwota then
		TriggerClientEvent("esx_kasyno:brak_kasy", source)
	else
		xPlayer.removeMoney(kwota)
		local message = "Gracz **"..PlayerName.."** gra za **" .. kwota .. "**"
        BetonoweLogi("Kasyno (maszyny) - Rozpoczęcie gry",PlayerName,message,xPlayer.identifier,0xf858d0)
		local czy_wygral = math.random(0,100)
		local societyAccount = nil
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kasyno', function(account)
            societyAccount = account
        end)
        if societyAccount ~= nil then
            societyAccount.addMoney(kwota/2)
        end
		if czy_wygral > 50 then
			local co_wygral = math.random(0,100)
			if co_wygral < 5 then -- jackpot
				local wygarna = kwota * jackpot
				local wygarna = math.floor(wygarna)
				TriggerClientEvent("esx_kasyno:start_wygrana_jackpot", source ,wygarna)
				SetTimeout(6500, function()
					xPlayer.addMoney(wygarna)
					local message = "Gracz **"..PlayerName.."** wygrał **" .. wygarna .. "**"
       				BetonoweLogi("Kasyno (maszyny) - Wygrana",PlayerName,message,xPlayer.identifier,0x74f59b)
				end)
			elseif co_wygral >= 5 and co_wygral < 15 then -- 777
				local wygarna = kwota * seven
				local wygarna = math.floor(wygarna)
				TriggerClientEvent("esx_kasyno:start_wygrana_777", source ,wygarna)
				SetTimeout(6500, function()
					xPlayer.addMoney(wygarna)
					local message = "Gracz **"..PlayerName.."** wygrał **" .. wygarna .. "**"
       				BetonoweLogi("Kasyno (maszyny) - Wygrana",PlayerName,message,xPlayer.identifier,0x74f59b)
				end)
			elseif co_wygral >= 15 and co_wygral < 30 then -- bar
				local wygarna = kwota * bar
				local wygarna = math.floor(wygarna)
				TriggerClientEvent("esx_kasyno:start_wygrana_bar", source ,wygarna)
				SetTimeout(6500, function()
					xPlayer.addMoney(wygarna)
					local message = "Gracz **"..PlayerName.."** wygrał **" .. wygarna .. "**"
       				BetonoweLogi("Kasyno (maszyny) - Wygrana",PlayerName,message,xPlayer.identifier,0x74f59b)
				end)
			elseif co_wygral >= 30 and co_wygral < 50 then -- water_melon
				local wygarna = kwota * water_melon
				local wygarna = math.floor(wygarna)
				TriggerClientEvent("esx_kasyno:start_wygrana_water_melon", source ,wygarna)
				SetTimeout(6500, function()
					xPlayer.addMoney(wygarna)
					local message = "Gracz **"..PlayerName.."** wygrał **" .. wygarna .. "**"
       				BetonoweLogi("Kasyno (maszyny) - Wygrana",PlayerName,message,xPlayer.identifier,0x74f59b)
				end)
			elseif co_wygral >= 50 and co_wygral < 70 then -- bananas
				local wygarna = kwota * bananas
				local wygarna = math.floor(wygarna)
				TriggerClientEvent("esx_kasyno:start_wygrana_bananas", source ,wygarna)
				SetTimeout(6500, function()
					xPlayer.addMoney(wygarna)
					local message = "Gracz **"..PlayerName.."** wygrał **" .. wygarna .. "**"
       				BetonoweLogi("Kasyno (maszyny) - Wygrana",PlayerName,message,xPlayer.identifier,0x74f59b)
				end)
			elseif co_wygral >= 70 and co_wygral <= 100 then -- cherry
				local wygarna = kwota * cherry
				local wygarna = math.floor(wygarna)
				TriggerClientEvent("esx_kasyno:start_wygrana_cherry", source ,wygarna)
				SetTimeout(6500, function()
					xPlayer.addMoney(wygarna)
					local message = "Gracz **"..PlayerName.."** wygrał **" .. wygarna .. "**"
       				BetonoweLogi("Kasyno (maszyny) - Wygrana",PlayerName,message,xPlayer.identifier,0x74f59b)
				end)
			else -- zabezpieczenie
				local wygarna = kwota * cherry
				local wygarna = math.floor(wygarna)
				TriggerClientEvent("esx_kasyno:start_wygrana_cherry", source ,wygarna)
				SetTimeout(6500, function()
					xPlayer.addMoney(wygarna)
					local message = "Gracz **"..PlayerName.."** wygrał **" .. wygarna .. "**"
       				BetonoweLogi("Kasyno (maszyny) - Wygrana",PlayerName,message,xPlayer.identifier,0x74f59b)
				end)
			end
		else
			local losuj_animacje = math.random(0,5)
			if losuj_animacje == 1 then
				TriggerClientEvent("esx_kasyno:start_przegrana_1", source)
			elseif losuj_animacje == 2 then
				TriggerClientEvent("esx_kasyno:start_przegrana_2", source)
			elseif losuj_animacje == 3 then
				TriggerClientEvent("esx_kasyno:start_przegrana_3", source)
			elseif losuj_animacje == 4 then
				TriggerClientEvent("esx_kasyno:start_przegrana_4", source)
			elseif losuj_animacje == 5 then
				TriggerClientEvent("esx_kasyno:start_przegrana_5", source)
			else
				TriggerClientEvent("esx_kasyno:start_przegrana_1", source)
			end
		end
	end
end)

function BetonoweLogi (title,name,message,steamID,color)
    local embeds = {
        {
            ["title"] = title,
            ["type"] = "rich",
            ["description"] = message,
            ["color"] = color,
    --		["timestamp"] = os.time(),
            ["footer"] =  {
                ["icon_url"] = "https://i.imgur.com/6aPjIDn.png",
                ["text"] = steamID,
            },
            ["author"] = {
                ["name"] = name,
                ["url"] = "http://polstarrp.tk",
                ["icon_url"] = "https://cdn.discordapp.com/embed/avatars/0.png",
            }
        }
    }
    
      if message == nil or message == '' then return FALSE end
      PerformHttpRequest("https://discordapp.com/api/webhooks/588140837292998656/_RXt8sAgM39Ep39gxPm3jpP5Hh2_PpSeiOS7H-tz8zFbKRNYjjqQRbguKAc20nt-zlBb", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
