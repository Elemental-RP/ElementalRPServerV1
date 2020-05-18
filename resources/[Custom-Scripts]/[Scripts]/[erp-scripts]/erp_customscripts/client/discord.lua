Citizen.CreateThread(function()
	while true do
			local appID = 571889264913154059
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(appID)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('logo_name')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('This is a lage icon with text')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('logo_name')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('This is a lsmall icon with text')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)
