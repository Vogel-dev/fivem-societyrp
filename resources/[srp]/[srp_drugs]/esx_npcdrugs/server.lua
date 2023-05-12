ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local selling = false
	local success = false
	local copscalled = false
	local notintrested = false

RegisterNetEvent('drugs:trigger')
AddEventHandler('drugs:trigger', function()
	selling = true
	    if selling == true then
			TriggerEvent('pass_or_fail')
  			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 1)
  			TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Próbujesz przekonać osobę do zakupu narkotyków...",
            type = "error",
            queue = "lmao",
            timeout = 2500,
            layout = "bottomLeft"
        	})
 	end
end)

RegisterServerEvent('sprzedaz')
AddEventHandler('sprzedaz', function(street1, street2)
	local _source = source
TriggerClientEvent("outlawNotifye", -1, _source, "~o~Zauważono sprzedaż narkotyków na: "..street1)

end)


AddEventHandler('fetchjob', function()
    local xPlayer  = ESX.GetPlayerFromId(source)
    TriggerClientEvent('getjob', source, xPlayer.job.name)
end)


  RegisterNetEvent('drugs:sell')
  AddEventHandler('drugs:sell', function()
	  local xPlayer = ESX.GetPlayerFromId(source)
	  local PlayerName = GetPlayerName(source)
	local xPlayers = ESX.GetPlayers()
	local meta = xPlayer.getInventoryItem('meta_pooch').count
	local haszysz = xPlayer.getInventoryItem('haszysz_pooch').count
	local heroina = xPlayer.getInventoryItem('heroina_pooch').count
	local kokaina = xPlayer.getInventoryItem('kokaina_pooch').count
	local paymentc = math.random (Config.haszyszPriceA,Config.haszyszPriceB)
	local paymentw = math.random (Config.heroinaPriceA,Config.heroinaPriceB)
	local paymentm = math.random (Config.metaPriceA ,Config.metaPriceB)
	local paymento = math.random (Config.KokainaPriceA,Config.KokainaPriceB)
	
		
	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops >= Config.PoliceCount then
		if haszysz >= 1 and success == true then
			 	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedałeś pięć paczek haszyszu za $ " .. paymentc ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "bottomLeft"
			})
			TriggerClientEvent("animation", source)
			--TriggerClientEvent("sprzedaz1, source")
			xPlayer.removeInventoryItem('haszysz_pooch', 5)
			  xPlayer.addAccountMoney('black_money', paymentc)
			  local message = "Gracz **"..PlayerName.."** sprzedał **5 paczek haszyszu** za ***"..paymentc.."***$ "
        BetonoweLogi("Haszysz - Sprzedaż haszyszu",PlayerName,message,xPlayer.identifier,0x00a429)
  			selling = false
  		elseif heroina >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedałeś pięć gramów heroiny za $ " .. paymentw ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "bottomLeft"
			})
			TriggerClientEvent("animation", source)
			TriggerClientEvent("test", source)
  			xPlayer.removeInventoryItem('heroina_pooch', 5)
			  xPlayer.addAccountMoney('black_money', paymentw)
			  local message = "Gracz **"..PlayerName.."** sprzedał **5 paczek heroiny** za ***"..paymentw.."***$ "
        BetonoweLogi("Heroina - Sprzedaż heroiny",PlayerName,message,xPlayer.identifier,0xdf0000)
  			selling = false
  		  elseif meta >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedałeś pięć gramów metamfetaminy za $ " .. paymentm ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "bottomLeft"
			})
			TriggerClientEvent("animation", source)
  			xPlayer.removeInventoryItem('meta_pooch', 5)
			  xPlayer.addAccountMoney('black_money', paymentm)
			  local message = "Gracz **"..PlayerName.."** sprzedał **5 paczek metamfetaminy** za ***"..paymentm.."***$ "
        BetonoweLogi("Metamfetamina - Sprzedaż metamfetaminy",PlayerName,message,xPlayer.identifier,0x80ffff)
  			selling = false
  			elseif kokaina >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedałeś pięć gramów kokainy za $ " .. paymento ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "bottomLeft"
			})
			TriggerClientEvent("animation", source)
			xPlayer.removeInventoryItem('kokaina_pooch', 5)
			  xPlayer.addAccountMoney('black_money', paymento)
			  local message = "Gracz **"..PlayerName.."** sprzedał **5 paczek kokainy** za ***"..paymento.."***$ "
        BetonoweLogi("Kokaina - Sprzedaż kokainy",PlayerName,message,xPlayer.identifier,0xf2a368)
  			selling = false
			elseif selling == true and success == false and notintrested == true then
				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Osoba nie jest zainteresowana twoim towarem...",
					type = "error",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "bottomLeft"
			})
  			selling = false
  			elseif meta < 5 and haszysz < 5 and heroina < 5 and kokaina < 5 then
				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Nie posiadasz narkotyków...",
				type = "error",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "bottomLeft"
			})
			elseif copscalled == true and success == false then
  			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Osoba zadzwoniła na policje...",
					type = "error",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "bottomLeft"
			})
  			selling = false

				end
  		end
end)

RegisterNetEvent('pass_or_fail')
AddEventHandler('pass_or_fail', function()

  		local percent = math.random(1, 11)

  		if percent == 7 or percent == 8 or percent == 9 then
  			success = false
  			notintrested = true
  		elseif percent ~= 8 and percent ~= 9 and percent ~= 10 and percent ~= 7 then
  			success = true
  			notintrested = false
  		else
  			notintrested = false
  			success = false
  			copscalled = true
  		end
end)

RegisterServerEvent('narkoPos')
AddEventHandler('narkoPos', function(gx, gy, gz)
	TriggerClientEvent('narkoBlip', -1, gx, gy, gz)
end)

RegisterNetEvent('sell_dis')
AddEventHandler('sell_dis', function()
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
		text = "Odszedłeś zbyt daleko...",
		type = "error",
		progressBar = false,
		queue = "lmao",
		timeout = 2000,
		layout = "bottomLeft"
	})
end)

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local meta = xPlayer.getInventoryItem('meta_pooch').count
	local haszysz 	  = xPlayer.getInventoryItem('haszysz_pooch').count
	local heroina = xPlayer.getInventoryItem('heroina_pooch').count
	local kokaina = xPlayer.getInventoryItem('kokaina_pooch').count

	if meta >= 1 or haszysz >= 1 or heroina >= 1 or kokaina >= 1 then
		TriggerClientEvent("checkR", source, true)
	else
		TriggerClientEvent("checkR", source, false)
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
      PerformHttpRequest("https://discordapp.com/api/webhooks/588087944565489683/Pk9Gc41MfVSI-jg6hOynYS9_Wncw_4gzlTIHUNMCFTe8YONCn-bo3lnn1PjpyboPvTMf", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end

