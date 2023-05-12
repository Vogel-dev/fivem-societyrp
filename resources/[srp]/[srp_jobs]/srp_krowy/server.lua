ESX 						   = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('wezmleko') 
AddEventHandler('wezmleko', function(ziemniak)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('mleko')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
		TriggerClientEvent('esx:showNotification', source, ('~r~Masz juz limit'))
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)
RegisterServerEvent('sprzedajmleko') 
AddEventHandler('sprzedajmleko', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local jabka = xPlayer.getInventoryItem('mleko').count
    if jabka >= 1 then 

        local cena = 15
        TriggerClientEvent('freezeplayer12', _source)
        xPlayer.removeInventoryItem('mleko', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:mleka', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('mleko', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:mleka', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('mleko', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:mleka', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('mleko').count
        xPlayer.removeInventoryItem('mleko', jabka2)
        TriggerClientEvent('sprzedawanie:mleka', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(jabka * cena)
        TriggerClientEvent('freezeplayer13', _source)
        TriggerClientEvent('esx:showNotification', _source, 'Zarobiłeś~g~ '..ESX.Math.Round(jabka * cena)..'$~w~ za sprzedanie '.. ESX.Math.Round(jabka) ..' sztuk ~y~mleka')
        local message = "Gracz **"..PlayerName.."** sprzedał **" .. ESX.Math.Round(jabka) .. "** mleka za ***"..ESX.Math.Round(jabka * cena).."***$ "
        BetonoweLogi("Mleczarz - Sprzedaż mleka",PlayerName,message,xPlayer.identifier,8311585)
    else
        TriggerClientEvent('esx:showNotification', _source, '~y~Nie posiadasz mleka')
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