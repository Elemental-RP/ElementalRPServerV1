Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = true -- enable esx service?
Config.MaxInService               = 20

Config.Locale                     = 'br'

Config.PoliceStations = {
	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(461.07, -981.15, 30.69)
		},

		Vehicles = {
			{
				Spawner = vector3(458.7, -1017.1, 28.2),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}
	},

	Sandy = {
		Blip = {
			Coords  = vector3(1849.12, 3695.12, 34.28),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(1849.12, 3695.12, 34.28)
		},

		Armories = {
			vector3(1842.4, 3691.92, 34.28)
		},

		Vehicles = {
			{
				Spawner = vector3(1865.92, 3684.52, 33.8),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(1867.0, 3695.44, 33.64), heading = 90.0, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(1860.2, 3697.84, 34.28),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(1879.08, 3724.52, 32.92), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(1862.4, 3688.76, 34.28)
		}
	},

	Paleto = {
		Blip = {
			Coords  = vector3(-448.28, 6008.36, 31.72),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-448.28, 6008.36, 31.72)
		},

		Armories = {
			vector3(-450.0, 6016.24, 31.72)
		},

		Vehicles = {
			{
				Spawner = vector3(-448.6, 6026.24, 31.48),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(-467.92, 6036.96, 31.36), heading = 90.0, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-457.88, 6017.48, 31.48),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-475.0, 5988.36, 31.32), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-449.72, 6011.08, 31.72)
		}
	}
}

Config.AuthorizedWeapons = {
	cadete = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 }

	},

	agente = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 }
	},

	agentep = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 }
	},

	agentec = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 }
	},

	chefe = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 }
	},

	chefep = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components =  { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 }
	},

	chefec = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components =  { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 }
	},

	subc = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	comissario = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	subint = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	inten = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	superin = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	superinchefe = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	diretoradjunto = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	diretornacional = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		cadete = {
			{ model = 'police', price = 50 }
		},

		agente = {
			{ model = 'police', price = 50 },
			{ model = 'police2', price = 100 }
		},

		agentep = {
			{ model = 'police', price = 50 },
			{ model = 'pspp_530d', price = 500 },
			{ model = 'police2', price = 100 }
		},

		agentec = {
			{ model = 'police', price = 50 },
			{ model = 'pspp_530d', price = 500 },
			{ model = 'police2', price = 100 },
			{ model = 'palablue', price = 100 },
			{ model = '1200RT', price = 100 }
		},

		chefe = {
			{ model = 'police', price = 50 },
			{ model = 'pspp_530d', price = 500 },
			{ model = 'police2', price = 100 },
			{ model = 'palablue', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = '1200RT', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 }
		},

		chefep = {
			{ model = 'police', price = 50 },
			{ model = 'pspp_530d', price = 500 },
			{ model = 'police2', price = 100 },
			{ model = 'palablue', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = '1200RT', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'policet', price = 100 }
		},

		chefec = {
			{ model = 'police', price = 50 },
			{ model = 'pspp_530d', price = 500 },
			{ model = 'police2', price = 100 },
			{ model = 'palablue', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = '1200RT', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'policet', price = 100 },
			{ model = 'psp_msprinter', price = 100 }
		},

		subc = {
			{ model = 'police', price = 50 },
			{ model = 'pspp_530d', price = 500 },
			{ model = 'police2', price = 100 },
			{ model = 'palablue', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = '1200RT', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = 'sv4', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'sv4bt', price = 100 },
			{ model = 'psp_ar8', price = 100 },
			{ model = 'sheriff', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'policet', price = 100 },
			{ model = 'psp_msprinter', price = 100 }
		},

		comissario = {
			{ model = 'police', price = 50 },
			{ model = 'pspp_530d', price = 500 },
			{ model = 'police2', price = 100 },
			{ model = 'palablue', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = '1200RT', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = 'sv4', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'sv4bt', price = 100 },
			{ model = 'psp_ar8', price = 100 },
			{ model = 'sheriff', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'policet', price = 100 },
			{ model = 'psp_msprinter', price = 100 }
		},

		subint = {
			{ model = 'police', price = 50 },
			{ model = 'palablue', price = 100 },
			{ model = 'police2', price = 100 },
			{ model = 'police3', price = 500 },
			{ model = '17zr2bb', price = 500 },
			{ model = 'policefelon', price = 500 },
			{ model = 'polschafter3', price = 500 },
			{ model = '16explorer', price = 500 },
			{ model = 'sv4', price = 500 },
			{ model = 'pspp_530d', price = 500 },
			{ model = '1200RT', price = 100 },
			{ model = 'psp_bmwgs', price = 500 },
			{ model = 'dgrsp_vwcrafter', price = 1000 },
			{ model = 'riot', price = 1000 }
		},

		intensuperin = {
			{ model = 'police', price = 50 },
			{ model = 'palablue', price = 100 },
			{ model = 'police2', price = 100 },
			{ model = 'police3', price = 500 },
			{ model = '17zr2bb', price = 500 },
			{ model = 'policefelon', price = 500 },
			{ model = 'polschafter3', price = 500 },
			{ model = '16explorer', price = 500 },
			{ model = 'sv4', price = 500 },
			{ model = 'pspp_530d', price = 500 },
			{ model = '1200RT', price = 100 },
			{ model = 'psp_bmwgs', price = 500 },
			{ model = 'dgrsp_vwcrafter', price = 1000 },
			{ model = 'riot', price = 1000 }
		},

		superin = {
			{ model = 'police', price = 50 },
			{ model = 'palablue', price = 100 },
			{ model = 'police2', price = 100 },
			{ model = 'police3', price = 500 },
			{ model = '17zr2bb', price = 500 },
			{ model = 'policefelon', price = 500 },
			{ model = 'polschafter3', price = 500 },
			{ model = '16explorer', price = 500 },
			{ model = 'sv4', price = 500 },
			{ model = 'pspp_530d', price = 500 },
			{ model = '1200RT', price = 100 },
			{ model = 'psp_bmwgs', price = 500 },
			{ model = 'dgrsp_vwcrafter', price = 1000 },
			{ model = 'riot', price = 1000 }
		},

		superinchefe = {
			{ model = 'police', price = 50 },
			{ model = 'palablue', price = 100 },
			{ model = 'police2', price = 100 },
			{ model = 'police3', price = 500 },
			{ model = '17zr2bb', price = 500 },
			{ model = 'policefelon', price = 500 },
			{ model = 'polschafter3', price = 500 },
			{ model = '16explorer', price = 500 },
			{ model = 'sv4', price = 500 },
			{ model = 'pspp_530d', price = 500 },
			{ model = '1200RT', price = 100 },
			{ model = 'psp_bmwgs', price = 500 },
			{ model = 'dgrsp_vwcrafter', price = 1000 },
			{ model = 'riot', price = 1000 }
		},

		diretoradjunto = {
			{ model = 'police', price = 50 },
			{ model = 'palablue', price = 100 },
			{ model = 'police2', price = 100 },
			{ model = 'police3', price = 500 },
			{ model = '17zr2bb', price = 500 },
			{ model = 'policefelon', price = 500 },
			{ model = 'polschafter3', price = 500 },
			{ model = '16explorer', price = 500 },
			{ model = 'sv4', price = 500 },
			{ model = 'pspp_530d', price = 500 },
			{ model = '1200RT', price = 100 },
			{ model = 'psp_bmwgs', price = 500 },
			{ model = 'dgrsp_vwcrafter', price = 1000 },
			{ model = 'riot', price = 1000 }
		},

		diretornacional = {
			{ model = 'police', price = 50 },
			{ model = 'palablue', price = 100 },
			{ model = 'police2', price = 100 },
			{ model = 'police3', price = 500 },
			{ model = '17zr2bb', price = 500 },
			{ model = 'policefelon', price = 500 },
			{ model = '16explorer', price = 500 },
			{ model = 'pspp_530d', price = 500 },
			{ model = '1200RT', price = 100 },
			{ model = 'psp_bmwgs', price = 500 },
			{ model = 'dgrsp_vwcrafter', price = 1000 },
			{ model = 'riot', price = 1000 }
		}
	},

	helicopter = {
		cadete = {},

		agente = {},

		agentep = {},

		agentec = {},

		chefe = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		chefep = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		chefec = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		subc = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		comissario = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		subint = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		inten = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		superin = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		superinchefe = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		diretoradjunto = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		diretornacional = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'police3 Ped', maleModel = 's_m_y_police3_01', femaleModel = 's_f_y_police3_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	cadete = {},
	agente = {},
	agentep = {},
	agentec = {},
	chefe = {},
	comissario = {},

	chefec = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	cadete = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	agente = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	agentep = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	agentec = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	chefe = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	chefep = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	chefec = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	subc = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	comissario = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	subint = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	inten = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	superin = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	superinchefe = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	diretoradjunto = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	diretornacional = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 1,
			torso_1 = 149,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 6,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcadete = {
		male = {
			tshirt_1 = 55,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagente = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentemangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fagentep = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fagentec = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 2,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 2,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fchefe = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefemangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fchefep = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fchefec = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fsubc = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 6,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubcmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 6,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fcomissario = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 7,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariomangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 7,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 8,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 7,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoleteorioficial = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletaberto1 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletaberto2 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoleteorioficialmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletaberto1mangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletaberto2mangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepricoleteoficial = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 3
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepricasacooficial = {
		male = {
			tshirt_1 = 71,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fassaltocurto = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 125,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 12,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fassaltocomprida = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 125,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 12,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},


	coleter1_wear = {
		male = {
			bproof_1 = 10,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
	coleter2_wear = {
		male = {
			bproof_1 = 10,  bproof_2 = 1
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
	colete_wear = {
		male = {
			bproof_1 = 12,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
	ttt_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	ttt2_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	ttt3_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	ttt4_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	unmarked_wear = {
		male = {
			tshirt_1 = 42,  tshirt_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	}
}
