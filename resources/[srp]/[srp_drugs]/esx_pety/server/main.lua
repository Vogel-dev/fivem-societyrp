ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingtyton    = {}
local PlayersTransformingtyton  = {}
local PlayersSellingtyton       = {}

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
local function Harvesttyton(source)
	if CopsConnected < Config.RequiredCopstyton then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopstyton))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingtyton[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local tyton = xPlayer.getInventoryItem('tyton')

			if tyton.limit ~= -1 and tyton.count >= tyton.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_tyton'))
			else
				xPlayer.addInventoryItem('tyton', 1)
				Harvesttyton(source)
			end
		end
	end)
end

RegisterServerEvent('esx_tyton:startHarvesttyton')
AddEventHandler('esx_tyton:startHarvesttyton', function()
	local _source = source

	if not PlayersHarvestingtyton[_source] then
		PlayersHarvestingtyton[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
		Harvesttyton(_source)
	else
		print(('esx_tyton: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_tyton:stopHarvesttyton')
AddEventHandler('esx_tyton:stopHarvesttyton', function()
	local _source = source

	PlayersHarvestingtyton[_source] = false
end)

local function Transformtyton(source)
	if CopsConnected < Config.RequiredCopstyton then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopstyton))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingtyton[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local tytonQuantity = xPlayer.getInventoryItem('tyton').count
			local pooch = xPlayer.getInventoryItem('tyton_pooch')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif tytonQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_tyton'))
			else
				xPlayer.removeInventoryItem('tyton', 5)
				xPlayer.addInventoryItem('tyton_pooch', 1)

				Transformtyton(source)
			end
		end
	end)
end

RegisterServerEvent('esx_tyton:startTransformtyton')
AddEventHandler('esx_tyton:startTransformtyton', function()
	local _source = source

	if not PlayersTransformingtyton[_source] then
		PlayersTransformingtyton[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
		Transformtyton(_source)
	else
		print(('esx_tyton: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_tyton:stopTransformtyton')
AddEventHandler('esx_tyton:stopTransformtyton', function()
	local _source = source

	PlayersTransformingtyton[_source] = false
end)

local function Selltyton(source)
	if CopsConnected < Config.RequiredCopstyton then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopstyton)) 
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingtyton[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('tyton_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('tyton_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 16)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_tyton'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 17)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_tyton'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 18)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_tyton'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 19)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_tyton'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 20)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_tyton'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 21)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_tyton'))
				end

				Selltyton(source)
			end
		end
	end)
end

RegisterServerEvent('esx_tyton:startSelltyton')
AddEventHandler('esx_tyton:startSelltyton', function()
	local _source = source

	if not PlayersSellingtyton[_source] then
		PlayersSellingtyton[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Selltyton(_source)
	else
		print(('esx_tyton: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_tyton:stopSelltyton')
AddEventHandler('esx_tyton:stopSelltyton', function()
	local _source = source

	PlayersSellingtyton[_source] = false
end)

RegisterServerEvent('esx_tyton:GetUserInventory')
AddEventHandler('esx_tyton:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_tyton:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('tyton').count,
		xPlayer.getInventoryItem('tyton_pooch').count,
		xPlayer.job.name,
		currentZone
	)
end)
--[[
ESX.RegisterUsableItem('tyton', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('tyton', 1)

	TriggerClientEvent('esx_tyton:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_tyton'))
end)
--]]
