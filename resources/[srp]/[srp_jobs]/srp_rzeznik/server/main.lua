-------------------------
--Written by Tościk#9715-
-------------------------

local maxZywych = 15   -- ile mozna miec max zywych kurczkaow w EQ
local MaxMartweKurczaki = 30   -- ile mozna miec martwych kurczakow w EQ
local MaxZapakowanychKurczakow = 30    --ile mozna miec w EQ zapakowanych kurczakow
local GotowkaSprzedaz = 21   --ilosc hajsu za 2 paczki kurczaka

-----------------------------
---nizej lepiej nie ruszaj---
-----------------------------
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('tost:wkladajKurczki')
AddEventHandler('tost:wkladajKurczki', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local PlayerName = GetPlayerName(source)
local zywyKurczak = xPlayer.getInventoryItem('alive_chicken').count

if zywyKurczak < maxZywych then
xPlayer.addInventoryItem('alive_chicken', 5)
Wait(1500)
else
TriggerClientEvent('esx:showNotification', source, '~y~Jednorazowo możesz mieć max ~g~'..maxZywych.. '~y~ kurczaków.')
Wait(2500)
end
end)

RegisterServerEvent('tostKurczaki:przerob')
AddEventHandler('tostKurczaki:przerob', function(opcja)
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local PlayerName = GetPlayerName(source)
local zywyKurczak = xPlayer.getInventoryItem('alive_chicken').count
local MartwyKurczak = xPlayer.getInventoryItem('slaughtered_chicken').count
local ZapakowanyKurczak = xPlayer.getInventoryItem('packaged_chicken').count

if opcja == 1 then
	if zywyKurczak > 0 and MartwyKurczak < MaxMartweKurczaki then
	xPlayer.removeInventoryItem('alive_chicken', 1)
	xPlayer.addInventoryItem('slaughtered_chicken', 2)
	Wait(1500)
	else
	TriggerClientEvent('esx:showNotification', source, '~y~Jednorazowo możesz mieć max ~g~'..MaxMartweKurczaki.. '~y~ martwych kurczaków.')
	Wait(2500)
	end
end

if opcja == 2 then
	if MartwyKurczak > 0 and ZapakowanyKurczak < MaxZapakowanychKurczakow then
	xPlayer.removeInventoryItem('slaughtered_chicken', 2)
	xPlayer.addInventoryItem('packaged_chicken', 2)
	Wait(1500)
	else
	TriggerClientEvent('esx:showNotification', source, '~y~Jednorazowo możesz mieć max ~g~'..MaxMartweKurczaki.. '~y~ martwych kurczaków.')
	Wait(2500)
	end
end

if opcja == 3 then
	if ZapakowanyKurczak > 0 then
	xPlayer.removeInventoryItem('packaged_chicken', 2)
	xPlayer.addMoney(GotowkaSprzedaz)
	TriggerClientEvent('esx:showNotification', source, '~g~Otrzymujesz ~y~'..GotowkaSprzedaz.. '$ ~g~za dwa kartony kurczaków.')
	local PlayerName = GetPlayerName(source)
	local message = "Gracz **"..PlayerName.."** sprzedał **dwa kartony kurczaków** za ***"..GotowkaSprzedaz.."***$ "
    BetonoweLogi("Rzeźnik - Sprzedaż kurczaków",PlayerName,message,xPlayer.identifier,0xfbc933)
	Wait(1500)
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
      PerformHttpRequest("https://discordapp.com/api/webhooks/588079796425195530/RfVEGJxwI7PAcIyUtV7fWY92TlaGoUWKjLEZflqgUvAdt3ocL0AOpzTbaD-pan0joYyL", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
