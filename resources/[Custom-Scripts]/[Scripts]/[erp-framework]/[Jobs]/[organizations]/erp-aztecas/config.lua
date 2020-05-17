Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = -1

Config.Locale                     = 'br'

Config.AztecasStations = {
	AztecasBase = {

		Blip = {
			Coords  = vector3(1275.64, -1710.6, 54.76),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(1269.36, -1710.16, 54.76)
		},

		Armories = {
			vector3(1272.08, -1712.08, 54.76)
		},

		Vehicles = {
			{
				Spawner = vector3(1284.08, -1720.48, 54.64),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(1287.16, -1730.4, 53.08), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(1275.64, -1710.6, 54.76)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 }
	},

	member = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 }
	},

	intercircle = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 }
	},

	boss = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'cavalcade', price = 3000 }
		},

		member = {
			{ model = 'cavalcade', price = 3000 }
		},

		intercircle = {
			{ model = 'cavalcade', price = 3000 }
		},

		boss = {
			{ model = 'cavalcade', price = 3000 }
		}
	}
}

Config.CustomPeds = {
	shared = {},

	recruit = {},
	member = {},
	intercircle = {},
	boss = {}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {},
		female = {}
	},
	member = {
		male = {},
		female = {}
	},
	intercircle = {
		male = {},
		female = {}
	},
	boss = {
		male = {},
		female = {}
	}
}
