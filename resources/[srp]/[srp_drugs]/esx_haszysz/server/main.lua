ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestinghaszysz    = {}
local PlayersTransforminghaszysz  = {}
local PlayersSellinghaszysz       = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--amfetamina
local function Harvesthaszysz(source)
	if CopsConnected < Config.RequiredCopshaszysz then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopshaszysz))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestinghaszysz[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local haszysz = xPlayer.getInventoryItem('haszysz')

			if haszysz.limit ~= -1 and haszysz.count >= haszysz.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_haszysz'))
			else
				xPlayer.addInventoryItem('haszysz', 1)
				Harvesthaszysz(source)
			end
		end
	end)
end

RegisterServerEvent('esx_haszysz:startHarvesthaszysz')
AddEventHandler('esx_haszysz:startHarvesthaszysz', function()
	local _source = source

	if not PlayersHarvestinghaszysz[_source] then
		PlayersHarvestinghaszysz[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
		Harvesthaszysz(_source)
	else
		print(('esx_haszysz: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_haszysz:stopHarvesthaszysz')
AddEventHandler('esx_haszysz:stopHarvesthaszysz', function()
	local _source = source

	PlayersHarvestinghaszysz[_source] = false
end)

local function Transformhaszysz(source)
	if CopsConnected < Config.RequiredCopshaszysz then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopshaszysz))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransforminghaszysz[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local haszyszQuantity = xPlayer.getInventoryItem('haszysz').count
			local pooch = xPlayer.getInventoryItem('haszysz_pooch')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif haszyszQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_haszysz'))
			else
				xPlayer.removeInventoryItem('haszysz', 5)
				xPlayer.addInventoryItem('haszysz_pooch', 1)

				Transformhaszysz(source)
			end
		end
	end)
end

RegisterServerEvent('esx_haszysz:startTransformhaszysz')
AddEventHandler('esx_haszysz:startTransformhaszysz', function()
	local _source = source

	if not PlayersTransforminghaszysz[_source] then
		PlayersTransforminghaszysz[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
		Transformhaszysz(_source)
	else
		print(('esx_haszysz: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_haszysz:stopTransformhaszysz')
AddEventHandler('esx_haszysz:stopTransformhaszysz', function()
	local _source = source

	PlayersTransforminghaszysz[_source] = false
end)

local function Sellhaszysz(source)
	if CopsConnected < Config.RequiredCopshaszysz then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopshaszysz)) 
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellinghaszysz[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('haszysz_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('haszysz_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 180)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_haszysz'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_haszysz'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 225)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_haszysz'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 255)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_haszysz'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 285)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_haszysz'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 325)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_haszysz'))
				end

				Sellhaszysz(source)
			end
		end
	end)
end

RegisterServerEvent('esx_haszysz:startSellhaszysz')
AddEventHandler('esx_haszysz:startSellhaszysz', function()
	local _source = source

	if not PlayersSellinghaszysz[_source] then
		PlayersSellinghaszysz[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sellhaszysz(_source)
	else
		print(('esx_haszysz: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_haszysz:stopSellhaszysz')
AddEventHandler('esx_haszysz:stopSellhaszysz', function()
	local _source = source

	PlayersSellinghaszysz[_source] = false
end)

RegisterServerEvent('esx_haszysz:GetUserInventory')
AddEventHandler('esx_haszysz:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_haszysz:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('haszysz').count,
		xPlayer.getInventoryItem('haszysz_pooch').count,
		xPlayer.job.name,
		currentZone
	)
end)

