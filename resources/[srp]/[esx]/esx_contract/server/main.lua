ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_clothes:sellVehicle')
AddEventHandler('esx_clothes:sellVehicle', function(target, plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local _target = target
	local tPlayer = ESX.GetPlayerFromId(_target)
	local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @identifier AND plate = @plate', {
			['@identifier'] = xPlayer.identifier,
			['@plate'] = plate
		})
	if result[1] ~= nil then
		MySQL.Async.execute('UPDATE owned_vehicles SET owner = @target WHERE owner = @owner AND plate = @plate', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = plate,
			['@target'] = tPlayer.identifier
		}, function (rowsChanged)
			if rowsChanged ~= 0 then
				TriggerClientEvent('esx_contract:showAnim', _source)
				Wait(22000)
				TriggerClientEvent('esx_contract:showAnim', _target)
				Wait(22000)
				TriggerClientEvent('esx:showNotification', _source, _U('soldvehicle', plate))
				TriggerClientEvent('esx:showNotification', _target, _U('boughtvehicle', plate))
				xPlayer.removeInventoryItem('contract', 1)
				
				local PlayerName = GetPlayerName(_source)
				local TargetName = GetPlayerName(_target)
				local message = "Gracz **" .. PlayerName .. "** przekazuje dokumentem graczowi ***" .. TargetName .. "[" .. tPlayer.identifier .. "]*** pojazd o rejestracji [" .. plate .. "]"
				BetonoweLogi("Przekazanie Pojazdu",PlayerName,message,xPlayer.identifier,16761856)
				
			end
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('notyourcar'))
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
  PerformHttpRequest("https://discordapp.com/api/webhooks/585878875830222850/IVSZUaJEMBL4tokAz6SilrOlPqwBKbnXc2dTRa8iK64CT8yOKt2npNzSSSQIKE2RRlWi", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

ESX.RegisterUsableItem('contract', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_contract:getVehicle', _source)
end)