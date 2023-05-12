ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingmeta    = {}
local PlayersTransformingmeta  = {}
local PlayersSellingmeta       = {}

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
local function Harvestmeta(source)
	if CopsConnected < Config.RequiredCopsmeta then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsmeta))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingmeta[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local meta = xPlayer.getInventoryItem('meta')

			if meta.limit ~= -1 and meta.count >= meta.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meta'))
			else
				xPlayer.addInventoryItem('meta', 1)
				Harvestmeta(source)
			end
		end
	end)
end

RegisterServerEvent('esx_meta:startHarvestmeta')
AddEventHandler('esx_meta:startHarvestmeta', function()
	local _source = source

	if not PlayersHarvestingmeta[_source] then
		PlayersHarvestingmeta[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
		Harvestmeta(_source)
	else
		print(('esx_meta: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_meta:stopHarvestmeta')
AddEventHandler('esx_meta:stopHarvestmeta', function()
	local _source = source

	PlayersHarvestingmeta[_source] = false
end)

local function Transformmeta(source)
	if CopsConnected < Config.RequiredCopsmeta then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsmeta))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingmeta[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local metaQuantity = xPlayer.getInventoryItem('meta').count
			local pooch = xPlayer.getInventoryItem('meta_pooch')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif metaQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meta'))
			else
				xPlayer.removeInventoryItem('meta', 5)
				xPlayer.addInventoryItem('meta_pooch', 1)

				Transformmeta(source)
			end
		end
	end)
end

RegisterServerEvent('esx_meta:startTransformmeta')
AddEventHandler('esx_meta:startTransformmeta', function()
	local _source = source

	if not PlayersTransformingmeta[_source] then
		PlayersTransformingmeta[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
		Transformmeta(_source)
	else
		print(('esx_meta: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_meta:stopTransformmeta')
AddEventHandler('esx_meta:stopTransformmeta', function()
	local _source = source

	PlayersTransformingmeta[_source] = false
end)

local function Sellmeta(source)
	if CopsConnected < Config.RequiredCopsmeta then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsmeta)) 
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingmeta[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('meta_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('meta_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meta'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meta'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 550)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meta'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 600)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meta'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 650)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meta'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 700)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meta'))
				end

				Sellmeta(source)
			end
		end
	end)
end

RegisterServerEvent('esx_meta:startSellmeta')
AddEventHandler('esx_meta:startSellmeta', function()
	local _source = source

	if not PlayersSellingmeta[_source] then
		PlayersSellingmeta[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sellmeta(_source)
	else
		print(('esx_meta: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_meta:stopSellmeta')
AddEventHandler('esx_meta:stopSellmeta', function()
	local _source = source

	PlayersSellingmeta[_source] = false
end)

RegisterServerEvent('esx_meta:GetUserInventory')
AddEventHandler('esx_meta:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_meta:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('meta').count,
		xPlayer.getInventoryItem('meta_pooch').count,
		xPlayer.job.name,
		currentZone
	)
end)

