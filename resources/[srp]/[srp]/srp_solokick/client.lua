Citizen.CreateThread(function() -- Check solo session every 30 sec
	Wait(140000) -- Delay first spawn.
	while true do
		TriggerServerEvent('sendSession:PlayerNumber', GetNumberOfPlayers())
		-- print("Solo Checking") -- Debug
		Wait(170000)
	end
end)
