ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingheroina    = {}
local PlayersTransformingheroina  = {}
local PlayersSellingheroina       = {}

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
local function Harvestheroina(source)
	if CopsConnected < Config.RequiredCopsheroina then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsheroina))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingheroina[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local heroina = xPlayer.getInventoryItem('heroina')

			if heroina.limit ~= -1 and heroina.count >= heroina.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_heroina'))
			else
				xPlayer.addInventoryItem('heroina', 1)
				Harvestheroina(source)
			end
		end
	end)
end

RegisterServerEvent('esx_heroina:startHarvestheroina')
AddEventHandler('esx_heroina:startHarvestheroina', function()
	local _source = source

	if not PlayersHarvestingheroina[_source] then
		PlayersHarvestingheroina[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
		Harvestheroina(_source)
	else
		print(('esx_heroina: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_heroina:stopHarvestheroina')
AddEventHandler('esx_heroina:stopHarvestheroina', function()
	local _source = source

	PlayersHarvestingheroina[_source] = false
end)

local function Transformheroina(source)
	if CopsConnected < Config.RequiredCopsheroina then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsheroina))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingheroina[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local heroinaQuantity = xPlayer.getInventoryItem('heroina').count
			local pooch = xPlayer.getInventoryItem('heroina_pooch')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif heroinaQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_heroina'))
			else
				xPlayer.removeInventoryItem('heroina', 5)
				xPlayer.addInventoryItem('heroina_pooch', 1)

				Transformheroina(source)
			end
		end
	end)
end

RegisterServerEvent('esx_heroina:startTransformheroina')
AddEventHandler('esx_heroina:startTransformheroina', function()
	local _source = source

	if not PlayersTransformingheroina[_source] then
		PlayersTransformingheroina[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
		Transformheroina(_source)
	else
		print(('esx_heroina: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_heroina:stopTransformheroina')
AddEventHandler('esx_heroina:stopTransformheroina', function()
	local _source = source

	PlayersTransformingheroina[_source] = false
end)

local function Sellheroina(source)
	if CopsConnected < Config.RequiredCopsheroina then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsheroina)) 
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingheroina[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('heroina_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('heroina_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_heroina'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_heroina'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 400)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_heroina'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_heroina'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_heroina'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 550)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_heroina'))
				end

				Sellheroina(source)
			end
		end
	end)
end

RegisterServerEvent('esx_heroina:startSellheroina')
AddEventHandler('esx_heroina:startSellheroina', function()
	local _source = source

	if not PlayersSellingheroina[_source] then
		PlayersSellingheroina[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sellheroina(_source)
	else
		print(('esx_heroina: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_heroina:stopSellheroina')
AddEventHandler('esx_heroina:stopSellheroina', function()
	local _source = source

	PlayersSellingheroina[_source] = false
end)

RegisterServerEvent('esx_heroina:GetUserInventory')
AddEventHandler('esx_heroina:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_heroina:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('heroina').count,
		xPlayer.getInventoryItem('heroina_pooch').count,
		xPlayer.job.name,
		currentZone
	)
end)

