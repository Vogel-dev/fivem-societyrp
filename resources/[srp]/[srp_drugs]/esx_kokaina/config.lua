Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 2.5, y = 2.5, z = 1.5}
Config.MarkerColor  = {r = 0, g = 0, b = 0}
Config.ShowBlips   = false  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopskokaina  = 1

Config.TimeToFarm    = 1 * 1000
Config.TimeToProcess = 1 * 2000
Config.TimeToSell    = 1  * 2000

Config.Locale = 'pl'

Config.Zones = {
	kokainaField =		{x = 1536.82,	y = 3593.12,	z = 37.77,	name = _U('kokaina_field'),		sprite = 51,	color = 60},
	kokainaProcessing =	{x = 1095.46, y = -3196.65, z = -40.0,	name = _U('kokaina_processing'),	sprite = 51,	color = 60},
	kokainaDealer =		{x = -2079.0,	y = 2603.04,	z = 1.03,	name = _U('kokaina_dealer'),		sprite = 500,	color = 75}
}
