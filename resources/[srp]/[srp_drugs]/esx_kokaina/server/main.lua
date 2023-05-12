ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingkokaina    = {}
local PlayersTransformingkokaina  = {}
local PlayersSellingkokaina       = {}

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
local function Harvestkokaina(source)
	if CopsConnected < Config.RequiredCopskokaina then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopskokaina))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingkokaina[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local kokaina = xPlayer.getInventoryItem('kokaina')

			if kokaina.limit ~= -1 and kokaina.count >= kokaina.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_kokaina'))
			else
				xPlayer.addInventoryItem('kokaina', 1)
				Harvestkokaina(source)
			end
		end
	end)
end

RegisterServerEvent('esx_kokaina:startHarvestkokaina')
AddEventHandler('esx_kokaina:startHarvestkokaina', function()
	local _source = source

	if not PlayersHarvestingkokaina[_source] then
		PlayersHarvestingkokaina[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
		Harvestkokaina(_source)
	else
		print(('esx_kokaina: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_kokaina:stopHarvestkokaina')
AddEventHandler('esx_kokaina:stopHarvestkokaina', function()
	local _source = source

	PlayersHarvestingkokaina[_source] = false
end)

local function Transformkokaina(source)
	if CopsConnected < Config.RequiredCopskokaina then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopskokaina))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingkokaina[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local kokainaQuantity = xPlayer.getInventoryItem('kokaina').count
			local pooch = xPlayer.getInventoryItem('kokaina_pooch')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif kokainaQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_kokaina'))
			else
				xPlayer.removeInventoryItem('kokaina', 5)
				xPlayer.addInventoryItem('kokaina_pooch', 1)

				Transformkokaina(source)
			end
		end
	end)
end

RegisterServerEvent('esx_kokaina:startTransformkokaina')
AddEventHandler('esx_kokaina:startTransformkokaina', function()
	local _source = source

	if not PlayersTransformingkokaina[_source] then
		PlayersTransformingkokaina[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
		Transformkokaina(_source)
	else
		print(('esx_kokaina: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_kokaina:stopTransformkokaina')
AddEventHandler('esx_kokaina:stopTransformkokaina', function()
	local _source = source

	PlayersTransformingkokaina[_source] = false
end)

local function Sellkokaina(source)
	if CopsConnected < Config.RequiredCopskokaina then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopskokaina)) 
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingkokaina[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('kokaina_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('kokaina_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 150)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_kokaina'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 160)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_kokaina'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 170)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_kokaina'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 180)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_kokaina'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 190)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_kokaina'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_kokaina'))
				end

				Sellkokaina(source)
			end
		end
	end)
end

RegisterServerEvent('esx_kokaina:startSellkokaina')
AddEventHandler('esx_kokaina:startSellkokaina', function()
	local _source = source

	if not PlayersSellingkokaina[_source] then
		PlayersSellingkokaina[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sellkokaina(_source)
	else
		print(('esx_kokaina: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_kokaina:stopSellkokaina')
AddEventHandler('esx_kokaina:stopSellkokaina', function()
	local _source = source

	PlayersSellingkokaina[_source] = false
end)

RegisterServerEvent('esx_kokaina:GetUserInventory')
AddEventHandler('esx_kokaina:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_kokaina:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('kokaina').count,
		xPlayer.getInventoryItem('kokaina_pooch').count,
		xPlayer.job.name,
		currentZone
	)
end)

