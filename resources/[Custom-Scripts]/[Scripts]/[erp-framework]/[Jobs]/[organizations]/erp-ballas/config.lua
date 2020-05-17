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

Config.BallasStations = {
	BallasBase = {

		Blip = {
			Coords  = vector3(118.6, -1951.12, 20.76),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(120.56, -1948.32, 20.76)
		},

		Armories = {
			vector3(116.68, -1953.36, 20.76)
		},

		Vehicles = {
			{
				Spawner = vector3(118.0, -1944.2, 20.64),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(109.04, -1944.6, 20.8), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(118.6, -1951.12, 20.76)
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
			{ model = 'emperor', price = 3000 }
		},

		member = {
			{ model = 'emperor', price = 3000 }
		},

		intercircle = {
			{ model = 'emperor', price = 3000 }
		},

		boss = {
			{ model = 'emperor', price = 3000 }
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
