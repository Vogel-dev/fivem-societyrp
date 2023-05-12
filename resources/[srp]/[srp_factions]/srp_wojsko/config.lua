Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.5 }
Config.MarkerColor                = { r = 205, g = 55, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'pl'

Config.wojskoStations = {

  wojsko = {
    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 2000 },
      { name = 'WEAPON_PROXMINE',     price = 20000 },
      { name = 'WEAPON_BZGAS',     price = 2000 },
      { name = 'WEAPON_SMOKEGRENADE',     price = 2000 },
      { name = 'WEAPON_MOLOTOV',     price = 2000 },
      { name = 'WEAPON_HEAVYPISTOL',     price = 20000 },
      { name = 'WEAPON_MG',     price = 2000 },
      { name = 'WEAPON_ASSAULTSHOTGUN',     price = 2000 },
      { name = 'WEAPON_SPECIALCARBINE_MK2',     price = 2000 },
      { name = 'WEAPON_MICROSMG',         price = 20000 },
      { name = 'WEAPON_CARBINERIFLE',     price = 50000 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 15000 },
      { name = 'WEAPON_DBSHOTGUN',      price = 15000 },
      { name = 'WEAPON_STUNGUN',          price = 150 },
      { name = 'WEAPON_FLASHLIGHT',       price = 150 },
      { name = 'WEAPON_FLARE',            price = 100 },
      { name = 'WEAPON_APPISTOL',         price = 50000 },
      { name = 'WEAPON_HEAVYSNIPER',      price = 100000 },
      { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	  { name = 'WEAPON_POOLCUE',          price = 250 },
	  
    },

	  AuthorizedVehicles = {
		  { name = 'asrad',      label = 'auto z rakietnica - 1' },
		  { name = 'hmmwv',   label = 'auto - 1' },
      { name = 'hmvspecial',   label = 'auto z dzialkiem - 1' },
      { name = 'humvee1',   label = 'auto - 2' },
      { name = 'm1116humvee',      label = 'auto z dzialkiem - 2' },
		  { name = 'm1161growler',   label = 'auto z dzialkiem - 3' },
      { name = 'uparmorhmvdes',   label = 'auto z dzialkiem - 4' },
      { name = 'mpatriot',   label = 'auto z przyczepa - 1' },
      { name = 'akaciya',   label = 'czolg - 1' },
      { name = 'alkhalid2',   label = 'czolg - 2' },
      { name = 'bmpt2',   label = 'czolg - 3' },
      { name = 'chal2mtkhaki',   label = 'czolg - 4' },
      { name = 'cougar4',   label = 'auto z dzialkiem - 5' },
      { name = 'crabunarmed',   label = 'auto - 3' },
      { name = 'crabwoodland',   label = 'crabwoodland' },
      { name = 'gri',   label = 'czolg - brazylia' },
      { name = 'kamaz',   label = 'auto transportowe - 1' },
      { name = 'lav',   label = 'czolg - 6' },
      { name = 'matv',   label = 'auto z dzialkiem/transportowe' },
      { name = 'tunguska',   label = 'czolg - 7' },
      { name = 'zfb',   label = 'auto z dzialkiem/transport-2' },
		  },

    Cloakrooms = {
      { x = 106000.91, y = -1301000.49, z = 28.77 },
    },

    Armories = {
      { x = 1070.15, y = -3096.57, z = -40.0 },
    },

    Vehicles = {
      {
        Spawner    = { x = -1783.85, y = 3089.55, z = 31.8 },
        SpawnPoint = { x = -1783.85, y = 3089.55, z = 30.8 },
        Heading    = 240.00,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x= -1877.16, y = 2805.6, z = 31.81 },
        SpawnPoint = { x= -1877.16, y = 2805.6, z = 30.81 },
        Heading    = 322.0,
      }
    },

    VehicleDeleters = {
      { x = -1859.55, y = 2795.47, z = 31.81 },
      { x = -1775.53, y = 3084.57, z = 31.81 },
    },

    BossActions = {
      { x = 1049.05, y = -3100.66, z = -40.0 }
    },

  },

}
