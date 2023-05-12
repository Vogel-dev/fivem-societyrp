RegisterServerEvent("TMM_licznik:Getdistance")
AddEventHandler("TMM_licznik:Getdistance", function(plate)
local _source = source
   print("Event Triggered")
  MySQL.Async.fetchAll('SELECT przebieg FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
   if result[1] ~= nil then
		print('przebieg ' .. result[1].przebieg .. ' dla ' .. plate)
		TriggerClientEvent('TMM_licznik:distance', _source, result[1].przebieg)
		else
			TriggerClientEvent('TMM_licznik:hide', _source)
		end
   end)
	
		
	
	
	
	

end)

RegisterServerEvent("TMM_licznik:Setdistance")
AddEventHandler("TMM_licznik:Setdistance", function(plate, dist)
print('zapisano D: ' .. dist .. ' dla ' .. plate)
	MySQL.Async.execute('UPDATE owned_vehicles SET `przebieg` = @dist WHERE plate = @plate', {
			['@dist'] = dist,
			['@plate'] = plate,
		}, function (rowsChanged)
		
		end)

end)