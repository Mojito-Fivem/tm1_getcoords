local Webhook = 'https://discordapp.com/api/webhooks/748228769248051310/oxTGac9zAuyE_V7n8VKxi-awZrTe4l_qY1Pvu68Bk_SfWw9hVDLLz6PM5MB3GW3PV9v3'

RegisterCommand("gc", function(source, args, rawCommand)
    local source = source
    TriggerClientEvent('tm1_getcoords', source)
end, true)

RegisterCommand("gc1", function(source, args, rawCommand)
    local source = source
	TriggerClientEvent('tm1_getcoords1', source)
end, true)

RegisterServerEvent('tm1_getcoords:print')
AddEventHandler('tm1_getcoords:print', function(msg)
    sendToDiscord(16753920,"Coords",msg,"Mojito's Easy Coords")
end)

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function sendToDiscord(color, name, message, footer)
	local embed = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
				  ["text"] = footer,
			  },
		  }
	  }
  
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end
