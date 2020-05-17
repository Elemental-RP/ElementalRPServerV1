Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 2.3, y = 2.3, z = 0.65 }
Config.MarkerColor                = { r = 33, g = 107, b = 255 }

Config.EnablePlayerManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'br'

Config.LawyerStations = {
	Lawyer = {
		Blip = {
		    Pos     = {x = -1913.7734375,y = -574.34735107422,z = 10.435150146484 },
		    Sprite  = 498,
		    Display = 4,
		    Scale   = 1.2,
		    Colour  = 5,
		},

		Cloakrooms = {
			{ x = -1905.6109619141,y = -570.30017089844,z = 18.097215652466},
		},

		Vehicles = {
			{
				Spawner    = { x = -1902.418,y = -562.752,z = 10.8 },
				SpawnPoints = {
					{ x = -1895.074,y = -564.311,z = 10.8, heading = 90.0, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			{ x = -1894.544,y = -564.821,z = 10.8 }
		},

		BossActions = {
			{x = -1912.82,y = -571.3,z = 18.1 }
		},
	},
}
-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {

	},

	recruit = { --Cadete
		{
			model = 'wraith',
			label = 'Rolls Royce'
		}
	},

	employe = { --Chefe
		{
			model = 'wraith',
			label = 'Rolls Royce'
		}
	},

	boss = { --Comissário
		{
			model = 'wraith',
			label = 'Rolls Royce'
		}
	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		-- male = {
			-- ['tshirt_1'] = 53,  ['tshirt_2'] = 1,
			-- ['torso_1'] = 149,  ['torso_2'] = 5,
			-- ['decals_1'] = 0,   ['decals_2'] = 0,
			-- ['arms'] = 0,
			-- ['pants_1'] = 35,   ['pants_2'] = 0,
			-- ['shoes_1'] = 51,   ['shoes_2'] = 0,
			-- ['helmet_1'] = 10,  ['helmet_2'] = 6,
			-- ['chain_1'] = 8,    ['chain_2'] = 0,
			-- ['ears_1'] = -1,    ['ears_2'] = 0
		-- },
		-- female = {
			-- ['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			-- ['torso_1'] = 48,   ['torso_2'] = 0,
			-- ['decals_1'] = 0,   ['decals_2'] = 0,
			-- ['arms'] = 44,
			-- ['pants_1'] = 34,   ['pants_2'] = 0,
			-- ['shoes_1'] = 27,   ['shoes_2'] = 0,
			-- ['helmet_1'] = 45,  ['helmet_2'] = 0,
			-- ['chain_1'] = 0,    ['chain_2'] = 0,
			-- ['ears_1'] = 2,     ['ears_2'] = 0
		-- }
	},
	employe_wear = {
		-- male = {
			-- ['tshirt_1'] = 53,  ['tshirt_2'] = 1,
			-- ['torso_1'] = 149,  ['torso_2'] = 3,
			-- ['decals_1'] = 0,   ['decals_2'] = 0,
			-- ['arms'] = 0,
			-- ['pants_1'] = 35,   ['pants_2'] = 0,
			-- ['shoes_1'] = 51,   ['shoes_2'] = 0,
			-- ['helmet_1'] = 10,  ['helmet_2'] = 6,
			-- ['chain_1'] = 8,    ['chain_2'] = 0,
			-- ['ears_1'] = -1,    ['ears_2'] = 0
		-- },
		-- female = {
			-- ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			-- ['torso_1'] = 48,   ['torso_2'] = 0,
			-- ['decals_1'] = 7,   ['decals_2'] = 3,
			-- ['arms'] = 44,
			-- ['pants_1'] = 34,   ['pants_2'] = 0,
			-- ['shoes_1'] = 27,   ['shoes_2'] = 0,
			-- ['helmet_1'] = -1,  ['helmet_2'] = 0,
			-- ['chain_1'] = 0,    ['chain_2'] = 0,
			-- ['ears_1'] = 2,     ['ears_2'] = 0
		-- }
	},

	boss_wear = { -- currently the same as chef_wear
		-- male = {
			-- ['tshirt_1'] = 53,  ['tshirt_2'] = 1,
			-- ['torso_1'] = 149,  ['torso_2'] = 4,
			-- ['decals_1'] = 0,   ['decals_2'] = 0,
			-- ['arms'] = 0,
			-- ['pants_1'] = 35,   ['pants_2'] = 0,
			-- ['shoes_1'] = 51,   ['shoes_2'] = 0,
			-- ['helmet_1'] = 10,  ['helmet_2'] = 6,
			-- ['chain_1'] = 8,    ['chain_2'] = 0,
			-- ['ears_1'] = -1,    ['ears_2'] = 0
		-- },
		-- female = {
			-- ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			-- ['torso_1'] = 48,   ['torso_2'] = 0,
			-- ['decals_1'] = 7,   ['decals_2'] = 3,
			-- ['arms'] = 44,
			-- ['pants_1'] = 34,   ['pants_2'] = 0,
			-- ['shoes_1'] = 27,   ['shoes_2'] = 0,
			-- ['helmet_1'] = -1,  ['helmet_2'] = 0,
			-- ['chain_1'] = 0,    ['chain_2'] = 0,
			-- ['ears_1'] = 2,     ['ears_2'] = 0
		-- }
	}
}
