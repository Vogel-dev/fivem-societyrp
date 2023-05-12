Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(566019543860772884)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('societyrp_logo')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('👪 SocietyRP - Zapraszamy na wyspę!')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('societyrp_logo')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('discord.gg/VStRDr4')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)