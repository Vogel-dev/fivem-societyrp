Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 25.0
Config.ZoneSize     = {x = 2.5, y = 2.5, z = 1.5}
Config.MarkerColor  = {r = 255, g = 255, b = 255}
Config.ShowBlips   = false  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopsmeta  = 0

Config.TimeToFarm    = 1 * 1500
Config.TimeToProcess = 1 * 2000
Config.TimeToSell    = 1  * 2000

Config.Locale = 'pl'

Config.Zones = {
	metaField =		{x = 2432.54,	y = 4971.06,	z = 41.35,	name = _U('meta_field'),		sprite = 51,	color = 60},
	metaProcessing =	{x = -10.63,	y = -1428.61,	z = 30.1,	name = _U('meta_processing'),	sprite = 51,	color = 60},
	metaDealer =		{x = -2079000.0,	y = 2603.04,	z = 1.03,	name = _U('meta_dealer'),		sprite = 500,	color = 75}
}
