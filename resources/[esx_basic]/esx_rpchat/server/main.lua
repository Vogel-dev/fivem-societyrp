ESX              = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
    TriggerClientEvent('chat:addMessage', source, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(115, 116, 119, 0.5); border-radius: 7px; margin-left: 0; margin-right: 0;"<i class="fas fa-exclamation-triangle"></i> ^3^* Nieznana komenda.^7 </div>',
        args = { }
    })
end, false)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message,1,string.len("/"))=="/" then
	else
		TriggerClientEvent("sendProximityMessage", -1, source, name, " " .. message)
		
		local xPlayer = ESX.GetPlayerFromId(source)
		local PlayerName = GetPlayerName(source)
		BetonoweLogi("LocalOOC",PlayerName,PlayerName .. " : " .. message,xPlayer.identifier,16777215,"https://discordapp.com/api/webhooks/585879073578942503/lLasZ0d8a4_m78Bb1Y1XCxV-BcUZmHdkMlQ6pxE3uL7KN6dUVGWBh8Xqw9VAXpIS7HS-")
	end
	CancelEvent()
end)

 RegisterCommand('twt', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 255, 0.5); border-radius: 7px; margin-left: 0; margin-right: 0;"><i class="fab fa-twitter-square"></i> ^*@{0}:^r {1}</div>',
        args = { fal, msg }
    })
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	BetonoweLogi("Twitter",PlayerName,fal .. " : " .. msg,xPlayer.identifier,4886754,"https://discordapp.com/api/webhooks/585878995795443735/oWHlDZyWSnlVTMm6r8HxKYgx2Yw6g5Yh67YdOt-sfUtaDBRU6pIvj2Dyvo_9V2Z0ctNR")
end, false)


 RegisterCommand('dw', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(102, 0, 204, 0.5); border-radius: 7px; margin-left: 0; margin-right: 0;"><i class="fas fa-laptop"></i> ^*DarkWEB:^r {1}</div>',
        args = { fal, msg }
    })
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	BetonoweLogi("Dark Web",PlayerName,fal .. " : " .. msg,xPlayer.identifier,12390624,"https://discordapp.com/api/webhooks/585879030109044740/LPwYg-BWGFTO98Sak3a6xhkKttRpMH1WvPiFR1b-N7dX9NElbUmdcCq1YcBWiV_mz1Dx")
end, false)

 RegisterCommand('ad', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(16, 255, 0, 0.5); border-radius: 7px; margin-left: 0; margin-right: 0;"><i class="fas fa-bullhorn"></i> ^*{0} :<br> ^r{1} <br></div>',
        args = { fal, msg }
    })
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	BetonoweLogi("Advertisement",PlayerName,fal .. " : " .. msg,xPlayer.identifier,8311585,"https://discordapp.com/api/webhooks/585878995795443735/oWHlDZyWSnlVTMm6r8HxKYgx2Yw6g5Yh67YdOt-sfUtaDBRU6pIvj2Dyvo_9V2Z0ctNR")
end, false)

 RegisterCommand('ooc', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.5); border-radius: 7px; margin-left: 0; margin-right: 0;">{0}<i class="fas fa-globe-europe"></i> ^*{1}:^r {2}</div>',
        args = { ''..source..' | ', playerName, msg }
    })
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	BetonoweLogi("Global OOC",PlayerName,PlayerName .. " : " .. rawCommand:sub(5),xPlayer.identifier,8355711,"https://discordapp.com/api/webhooks/585879073578942503/lLasZ0d8a4_m78Bb1Y1XCxV-BcUZmHdkMlQ6pxE3uL7KN6dUVGWBh8Xqw9VAXpIS7HS-")
end, false)

 RegisterCommand('med', function(source, args, rawCommand)
    local name = getIdentity(source)
    local realName = name.firstname .. " " .. name.lastname
    TriggerClientEvent("sendProximityMessageMed", -1, source, realName, table.concat(args, " "))
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	BetonoweLogi("Chat Medyczny",PlayerName,realName .. " : " .. table.concat(args, " "),xPlayer.identifier,13632027,"https://discordapp.com/api/webhooks/585878965399453709/L_1ZQIS5qhiz5ViOf9nQgbj6LsmRcHtMYFOuXjGiP0gI4N-kc3iNj5ppDzuEYa4gFmrj")
end, false)

RegisterCommand('me', function(source, args, rawCommand)
    local name = getIdentity(source)
    local realName = name.firstname .. " " .. name.lastname
    TriggerClientEvent("sendProximityMessageMedd", -1, source, realName, table.concat(args, " "))
    
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	BetonoweLogi("Chat [/me]",PlayerName,realName .. " : " .. table.concat(args, " "),xPlayer.identifier,15141866,"https://discordapp.com/api/webhooks/585878965399453709/L_1ZQIS5qhiz5ViOf9nQgbj6LsmRcHtMYFOuXjGiP0gI4N-kc3iNj5ppDzuEYa4gFmrj")
end, false)

RegisterCommand('do', function(source, args, rawCommand)
    local name = getIdentity(source)
    local realName = name.firstname .. " " .. name.lastname
    TriggerClientEvent("sendProximityMessageMeddd", -1, source, realName, table.concat(args, " "))
	
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	BetonoweLogi("Chat [/do]",PlayerName,realName .. " : " .. table.concat(args, " "),xPlayer.identifier,1,"https://discordapp.com/api/webhooks/585878965399453709/L_1ZQIS5qhiz5ViOf9nQgbj6LsmRcHtMYFOuXjGiP0gI4N-kc3iNj5ppDzuEYa4gFmrj")
end, false)

function BetonoweLogi (title,name,message,steamID,color,webhook)
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
  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
    
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
