ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function getIdentity(identifier)
	--local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			name = identity['name'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
                       phone_number = identity['phone_number']

                        
		}
	else
		return nil
	end
end


RegisterServerEvent('tablet:grzywna') 
AddEventHandler('tablet:grzywna', function(target, kasa, powod)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local xPlayer = ESX.GetPlayerFromId(target)
	local xlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(target)
	local xPlayerName = GetPlayerName(source)
	local player = xlayer.identifier
	local targeto = xPlayer.identifier
          local name = getIdentity(targeto)
		  local names = getIdentity(player)
		  local dane = "" .. name.firstname .. " " .. name.lastname .. ""
	local accountMoney = 0
	accountMoney = xPlayer.getAccount('bank').money
	targetXPlayer.removeAccountMoney('bank', kasa)
	sourceXPlayer.addAccountMoney('bank', kasa / 2)
	local message = "Gracz **"..PlayerName.."** otrzymał fakturę od **" .. xPlayerName .. "** w wysokości ***"..kasa.."***$ za **"..powod.."** "
    BetonoweLogi("Faktura EMS - otrzymanie faktury",PlayerName,message,targetXPlayer.identifier,0xfe4145)
	local society = 'society_ambulance'
	targetXPlayer.removeAccountMoney('bank', kasa)
	TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
	account.addMoney(kasa/2)
	end)
--TriggerClientEvent('chatMessage', -1, "EMS", {255, 0, 0}, "^4^*"..name.firstname.." "..name.lastname.."^3 zostal ukarany mandatem na kwote ^1^*"..kasa.."$^7 - ^4^*"..powod.. " ^3przez^4^* "..names.firstname.." "..names.lastname  )
TriggerClientEvent('chat:addMessage', -1, {
	template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(227 , 38, 54, 0.5); border-radius: 7px;"><i class="fas fa-notes-medical"></i> {0} otrzymał fakturę o wartości {1} $ | Powód: {2}</div>',
	args = { dane, kasa, powod }
})
			-- local society = 'society_ambulance'
		-- xPlayer.removeAccountMoney('bank', kasa)
			-- TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
				-- account.addMoney(kasa)
			-- end)
 


	



end)

RegisterServerEvent('tablet:grzywnawiezienie') 
AddEventHandler('tablet:grzywnawiezienie', function(target, kasa, powod,czas)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(target)
	local xlayer = ESX.GetPlayerFromId(source)
local player = xlayer.identifier
local targeto = xPlayer.identifier
          local name = getIdentity(targeto)
          local names = getIdentity(player)
	local accountMoney = 0
	accountMoney = xPlayer.getAccount('bank').money
--TriggerClientEvent('chatMessage', -1, "Sedzia", {255, 0, 0}, "^4^*"..name.firstname.." "..name.lastname.."^3 trafil do wiezienia na okres ^1^*"..czas.." miesiecy ^7 - ^4^*"..powod.. "^3 oraz zostal ukarany grzywna na kwote ^7 - ^4^*"..kasa.. "$ ^3przez^4^* "..names.firstname.." "..names.lastname  )
	xPlayer.removeAccountMoney('bank', kasa)


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
      PerformHttpRequest("https://discordapp.com/api/webhooks/588327623743242262/rsQVhFIOOs3jfb8_kXhU_X-kppeTNx8BHMR6autJLHcsp5ACdA0mY8LoinO3voUniqoK", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end