DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/567400675990831114/9-H8nKmGP0VRJizSaYJ_vWyQ4kKmjEhvTDRcSOOdqKcThX6peo__5_FTpe-hExSTclOL'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/567400792181702667/QERMW6vIgsPXrIBny_EtZ6C-dWD04fgrBNYyGWO9kFKLx7Q9rr-oaJKkTC0JVGylXSBK'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/567400838423773225/lelXPbmzg9zHUmCPoDYr247H4VUII5oQEQW63N0VHpSf9-kOH2wljTyVDcCREUC5o-F1'

SystemAvatar = 'https://i.imgur.com/xzhHenO.png'

UserAvatar = 'https://i.imgur.com/KIcqSYs.png'

SystemName = 'ERP_LOGS'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '*[OOC]:*'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				   {'/twt', '***[TWEET]***:'},
				   {'/dw', '**[DW]**:'},
				   {'/ad', '**[AD]**:'},
				   {'/print', '**[AD]**:'},
				   --{'/me', '**[ME]**:'},
				   --{'/do', '*[DO]*:'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					  -- '/giveitem',
					   --'/giveweapon',
					  -- '/setmoney',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   --'/dw',
			   '/Whatever2',
			  }

