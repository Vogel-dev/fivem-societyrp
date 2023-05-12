--TA PACZKA JEST DARMOWA ZNAJDZIESZ JĄ NA MOIM KANALE--
--https://youtube.com/c/aries98--

--#################################################--

---WAZNE GOSTECZKU PRZECZYTAJ TO U GÓRY--
--TA PACZKA JEST DARMOWA ZNAJDZIESZ JĄ NA MOIM KANALE--
--https://youtube.com/c/aries98--

--#################################################--

---WAZNE GOSTECZKU PRZECZYTAJ TO U GÓRY--
--TA PACZKA JEST DARMOWA ZNAJDZIESZ JĄ NA MOIM KANALE--
--https://youtube.com/c/aries98--

--#################################################--

---WAZNE GOSTECZKU PRZECZYTAJ TO U GÓRY--
--TA PACZKA JEST DARMOWA ZNAJDZIESZ JĄ NA MOIM KANALE--
--https://youtube.com/c/aries98--

--#################################################--

---WAZNE GOSTECZKU PRZECZYTAJ TO U GÓRY--



ESX = nil
mandatAmount = nil
TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

RegisterNetEvent('wyspa_jail:SendMessage')
AddEventHandler('wyspa_jail:SendMessage', function(target, mandatAmount, mandatReason)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local identifier = targetXPlayer.getIdentifier()
	local PlayerName = GetPlayerName(target)
	local policjant = GetCharacterName(_source)
	local policee = policjant.." (".. sourceXPlayer.getName() ..")"
	local name = GetCharacterName(target)
	local imie = GetImie(target)
	local nazwisko = GetNazwisko(target)
	local mandat = tonumber(mandatAmount)
	targetXPlayer.removeAccountMoney('bank', mandat)
	sourceXPlayer.addAccountMoney('bank', mandat / 2)
	local message = "Gracz **"..PlayerName.."** otrzymał mandat od **" .. policee .. "** w wysokości ***"..mandat.."***$ za **"..mandatReason.."** "
    BetonoweLogi("Mandat - otrzymanie mandatu",PlayerName,message,targetXPlayer.identifier,0x00ffff)
	local society = 'society_police'
	targetXPlayer.removeAccountMoney('bank', mandat)
	TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
	account.addMoney(mandat/2)
	end)
		--TriggerClientEvent('chatMessage', -1, _U('mandat'), { 147, 196, 109 }, _U('mandat_msg', name, mandat, mandatReason))
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 48, 143, 0.5); border-radius: 7px;"><i class="fas fa-file-invoice-dollar"></i> {0} otrzymał mandat o wartości {1} $ | Powód: {2}</div>',
			args = { name, mandat, mandatReason }
	})
	
	MySQL.Async.execute("INSERT INTO user_kartoteka (identifier,imie,nazwisko,policjant,powod,grzywna,ilosc_lat) VALUES (@identifier,@imie,@nazwisko,@policjant,@powod,@grzywna,@ilosc_lat)",
			{
			 ['@identifier'] = identifier,
			 ['@imie'] = imie,
			 ['@nazwisko'] = nazwisko,
			 ['@policjant'] = policee,
			 ['@grzywna'] = mandatAmount,
			 ['@ilosc_lat'] = "---",	 
			 ['@powod'] = mandatReason	 			 
			})
end)

RegisterNetEvent('wyspa_jail:addKartoteka')
AddEventHandler('wyspa_jail:addKartoteka', function(player, jailTime, jailReason, jailGrzywna)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(player)
	local identifier = targetXPlayer.getIdentifier()
	local policjant = GetCharacterName(_source)
	local policee = policjant.." (".. sourceXPlayer.getName() ..")"
	local imie = GetImie(player)
	local nazwisko = GetNazwisko(player)
	MySQL.Async.execute("INSERT INTO user_kartoteka (identifier,imie,nazwisko,policjant,powod,grzywna,ilosc_lat) VALUES (@identifier,@imie,@nazwisko,@policjant,@powod,@grzywna,@ilosc_lat)",
			{
			 ['@identifier'] = identifier,
			 ['@imie'] = imie,
			 ['@nazwisko'] = nazwisko,
			 ['@policjant'] = policee,
			 ['@grzywna'] = jailGrzywna,
			 ['@ilosc_lat'] = jailTime,	 
			 ['@powod'] = jailReason	 			 
			})
end)

ESX.RegisterServerCallback('wyspa_jail:getKartoteka', function(source, cb)
	local result = MySQL.Sync.fetchAll("SELECT imie,nazwisko,policjant,powod,grzywna,ilosc_lat,data FROM user_kartoteka ORDER BY data desc LIMIT 50")
		if result ~= nil then
			local wynik = {}
			
			for k,v in pairs(result) do
				local data = {}
				data.imie = result[k].imie
				data.policjant = result[k].policjant
				data.powod = result[k].powod
				data.grzywna = result[k].grzywna
				data.ilosc_lat = result[k].ilosc_lat
				data.dataaa = result[k].data
				data.nazwisko = result[k].nazwisko
				local wynikFinal = result[k].imie ..' '.. result[k].nazwisko ..' '.. result[k].policjant ..' '.. result[k].powod ..' '.. result[k].grzywna ..' '.. result[k].ilosc_lat ..' '.. result[k].data
				table.insert(wynik, data)	
            end
			cb(wynik)
        end	
end)


function GetCharacterName(source)
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
function GetImie(source)
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] ~= nil and result[1].firstname ~= nil then
		return result[1].firstname
	else
		return GetPlayerName(source)
	end
end
function GetNazwisko(source)
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] ~= nil and result[1].lastname ~= nil then
		return result[1].lastname
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