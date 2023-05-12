ESX						= nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_roulette:removemoney')
AddEventHandler('esx_roulette:removemoney', function(amount)
	local amount = amount
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local PlayerName = GetPlayerName(source)
	xPlayer.removeMoney(amount)
	local message = "Gracz **"..PlayerName.."** gra za **" .. amount .. "**"
    BetonoweLogi("Kasyno (ruletka) - Rozpoczęcie gry",PlayerName,message,xPlayer.identifier,0xf847c2)
	local societyAccount = nil
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kasyno', function(account)
            societyAccount = account
        end)
        if societyAccount ~= nil then
            societyAccount.addMoney(amount/2)
        end
end)

RegisterServerEvent('esx_roulette:givemoney')
AddEventHandler('esx_roulette:givemoney', function(action, amount)
	local aciton = aciton
	local amount = amount
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local PlayerName = GetPlayerName(source)
	if action == 'black' or action == 'red' then
		local win = amount*1.5
		xPlayer.addMoney(win)
		local message = "Gracz **"..PlayerName.."** wygrał **" .. win .. "**"
       	BetonoweLogi("Kasyno (ruletka) - Wygrana",PlayerName,message,xPlayer.identifier,0x85f475)
	elseif action == 'green' then
		local win = amount*8
		xPlayer.addMoney(win)
		local message = "Gracz **"..PlayerName.."** wygrał **" .. win .. "**"
       	BetonoweLogi("Kasyno (ruletka) - Wygrana",PlayerName,message,xPlayer.identifier,0x85f475)
	else
	end
end)

ESX.RegisterServerCallback('esx_roulette:check_money', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local money = xPlayer.getMoney(_source)
	local quantity = money

	cb(quantity)
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