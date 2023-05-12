local logs = "https://discordapp.com/api/webhooks/569717695906578471/QXWhiChv_18Pf6ARNMfOgyjrp8xW-fEbTzFHmuwhecC_BOaaa9n2WhxuSPvhVMbLE4ZK"
local communityname = "EpokaRP_Connects"
local communtiylogo = "https://i.imgur.com/xzhHenO.png" --Must end with .png

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "56108",
            ["title"] = "Gracz dołączył do serwera",
            ["description"] = "Nick: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "EpokaRP - Połączenia", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz został rozłączony z serwerem",
            ["description"] = "Nick: **"..name.."** \nPowód: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "EpokaRP - Połączenia", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
