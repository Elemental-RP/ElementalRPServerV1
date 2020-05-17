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

Config.TheLostMCStations = {
	TheLostMCBase = {

		Blip = {
			Coords  = vector3(997.12, -116.96, 74.08),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(985.64, -133.76, 78.88)
		},

		Armories = {
			vector3(997.12, -116.96, 74.08)
		},

		Vehicles = {
			{
				Spawner = vector3(981.64, -129.2, 74.08),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(979.96, -124.0, 74.04), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(989.96, -136.68, 74.04)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	},

	member = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	},

	intercircle = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	},

	boss = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'zombieb', price = 3000 }
		},

		member = {
			{ model = 'zombieb', price = 3000 }
		},

		intercircle = {
			{ model = 'zombieb', price = 3000 }
		},

		boss = {
			{ model = 'zombieb', price = 3000 }
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
