--TA PACZKA JEST DARMOWA ZNAJDZIESZ JĄ NA MOIM KANALE--
--https://youtube.com/c/aries98--

--#################################################--

---WAZNE GOSTECZKU PRZECZYTAJ TO U GÓRY--
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

-- jail command, obsolete
TriggerEvent('es:addGroupCommand', 'jail', 'admin', function(source, args, user)
	if args[1] and GetPlayerName(args[1]) ~= nil and args[2] and args[3] and args[4] then
		TriggerEvent('esx_jailer:wyslijdopierdla', tonumber(args[1]), tonumber(args[2] * 60), tostring(args[3]), tonumber(args[4]))
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Prawidlowe użycie: /jail ID CZAS POWOD GRZYWNA")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Put a player in jail", params = {{name = "id", help = "target id"}, {name = "time", help = "jail time in minutes"}}})

-- unjail
TriggerEvent('es:addGroupCommand', 'unjail', 'admin', function(source, args, user)
	if args[1] and GetPlayerName(args[1]) ~= nil then
		TriggerEvent('esx_jailer:unjailQuest', tonumber(args[1]))
	else
		TriggerEvent('esx_jailer:unjailQuest', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Unjail people from jail", params = {{name = "id", help = "target id"}}})

-- send to jail and register in database
RegisterServerEvent('esx_jailer:wyslijdopierdla')
AddEventHandler('esx_jailer:wyslijdopierdla', function(source, jailTime, jailReason, jailGrzywna)
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Sync.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		else
			MySQL.Async.execute("INSERT INTO jail (identifier,jail_time) VALUES (@identifier,@jail_time)", {['@identifier'] = identifier, ['@jail_time'] = jailTime})
		end
	end)
	local name = GetCharacterName(source)
	local g = tonumber(jailGrzywna)
	xPlayer.removeAccountMoney('bank', g)
	local message = "Gracz **"..PlayerName.."** został uwięziony na **" .. round(jailTime / 60) .. " lat** za "..jailReason..""
    BetonoweLogi("Więzienie - wsadzenie",PlayerName,message,xPlayer.identifier,0x24b8ff)
	--TriggerClientEvent('chatMessage', -1, _U('judge'), { 147, 196, 109 }, _U('jailed_msg', name, round(jailTime / 60), jailReason, jailGrzywna))
	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255 , 191 , 0, 0.5); border-radius: 7px;"><i class="fas fa-gavel"></i> {0} trafił do więzienia na: {1} lat | Powód: {2} </div>',
		args = { name, round(jailTime / 60), jailReason}
})
	TriggerClientEvent('esx_jailer:zamknij', source, jailTime)
	TriggerClientEvent('esx_policejob:unrestrain', source)
end)

-- should the player be in jail?
RegisterServerEvent('esx_jailer:checkJail')
AddEventHandler('esx_jailer:checkJail', function()
	local player = source -- cannot parse source to client trigger for some weird reason
	local identifier = GetPlayerIdentifiers(player)[1] -- get steam identifier
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			--TriggerClientEvent('chatMessage', -1, _U('judge'), { 147, 196, 109 }, _U('jailed_msg', GetPlayerName(player), round(result[1].jail_time / 60), jailReason))
			TriggerClientEvent('esx_jailer:zamknij', player, tonumber(result[1].jail_time))
		end
	end)
end)

-- unjail via command
RegisterServerEvent('esx_jailer:unjailQuest')
AddEventHandler('esx_jailer:unjailQuest', function(source)
	if source ~= nil then
		unjail(source)
	end
end)

-- unjail after time served
RegisterServerEvent('esx_jailer:unjailTime')
AddEventHandler('esx_jailer:unjailTime', function()
	unjail(source)
end)

-- keep jailtime updated
RegisterServerEvent('esx_jailer:updateRemaining')
AddEventHandler('esx_jailer:updateRemaining', function(jailTime)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(gotInfo)
		if gotInfo[1] ~= nil then
			MySQL.Sync.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		end
	end)
end)

function unjail(target)
	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(gotInfo)
		if gotInfo[1] ~= nil then
			MySQL.Async.execute('DELETE from jail WHERE identifier = @id', {['@id'] = identifier})
			local name = GetCharacterName(target)
			--TriggerClientEvent('chatMessage', -1, _U('judge'), { 147, 196, 109 }, _U('unjailed', name))
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255 , 126 , 0, 0.5); border-radius: 7px;"><i class="fas fa-gavel"></i> {0} wyszedł z więzienia. </div>',
				args = { name }
		})
		end
	end)
	TriggerClientEvent('esx_jailer:unjail', target)
	local message = "Gracz **"..PlayerName.."** został wypuszczony z więzienia"
    BetonoweLogi("Więzienie - wypuszczenie",PlayerName,message,xPlayer.identifier,0x0080c0)
end

function round(x)
	return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

function GetCharacterName(source)
	-- fetch identity in sync
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] ~= nil and result[1].firstname ~= nil and result[1].lastname ~= nil then
		return result[1].firstname .. ' ' .. result[1].lastname
	else
		return GetPlayerName(source)
	end
end

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
      PerformHttpRequest("https://discordapp.com/api/webhooks/588327623743242262/rsQVhFIOOs3jfb8_kXhU_X-kppeTNx8BHMR6autJLHcsp5ACdA0mY8LoinO3voUniqoK", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
