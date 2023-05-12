Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 3.0, y = 3.0, z = 2.0}
Config.MarkerColor  = {r = 222, g = 104, b = 100}
Config.ShowBlips   = true  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopstyton  = 0

Config.TimeToFarm    = 1 * 1000
Config.TimeToProcess = 1 * 1000
Config.TimeToSell    = 1  * 3000

Config.Locale = 'pl'

Config.Zones = {
	tytonField =		{x = 1251.0,	y = -2564.04,	z = 41.72,	name = _U('tyton_field'),		sprite = 51,	color = 60},
	tytonProcessing =	{x = -1141.47,	y = -2006.0,	z = 12.18,	name = _U('tyton_processing'),	sprite = 51,	color = 60},
	tytonDealer =		{x = 203.365,	y = 2775.02,	z = 44.66,	name = _U('tyton_dealer'),		sprite = 51,	color = 60}
}
