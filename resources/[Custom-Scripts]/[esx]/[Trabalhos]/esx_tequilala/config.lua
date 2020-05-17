Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = 10

Config.Locale                     = 'br'

Config.TQLLStations = {

	tequilala = {

		Blip = {
			Coords  = vector3(-556.0, 273.48, 83.0),
			Sprite  = 93,
			Display = 4,
			Scale   = 1.2,
			Colour  = 27
		},

		Cloakrooms = {
			vector3(-552.12, 278.36, 81.26)
		},

		Armories = {
			vector3(-576.2, 291.36, 78.26)
		},

		Fridge = {
			vector3(-561.84, 288.48, 81.26)
		},

		Vehicles = {
			{
				Spawner = vector3(137.177,  -1278.757, 28.371),
				InsideShop = vector3(138.436, -1263.095, 28.626),
				SpawnPoints = {
					{coords = vector3(142.6, -1271.28, 29.0), heading = 90.0, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(0, 0, -800),
				InsideShop = vector3(0, 0, -800),
				SpawnPoints = {
					{coords = vector3(0, 0, -800), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-571.48, 285.64, 78.26)
		}

	}

}

Config.AuthorizedVehicles = {
	car = {
		recruit = {},
		barman = {},
		security = {},
		boss = {}
	},

	helicopter = {
		recruit = {},
		barman = {},
		security = {},
		boss = {}
	}
}

Config.CustomPeds = {
	shared = {},
	barman = {},
	security = {},
	boss = {}
}

Config.Uniforms = {
  barman_outfit = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 40,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 40,
        pants_1 = 28,   pants_2 = 2,
        shoes_1 = 38,   shoes_2 = 4,
        chain_1 = 118,  chain_2 = 0
    },
    female = {
        tshirt_1 = 3,   tshirt_2 = 0,
        torso_1 = 8,    torso_2 = 2,
        decals_1 = 0,   decals_2 = 0,
        arms = 5,
        pants_1 = 44,   pants_2 = 4,
        shoes_1 = 0,    shoes_2 = 0,
        chain_1 = 0,    chain_2 = 2
    }
  },
  dancer_outfit_1 = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 40,
        pants_1 = 61,   pants_2 = 9,
        shoes_1 = 16,   shoes_2 = 9,
        chain_1 = 118,  chain_2 = 0
    },
    female = {
        tshirt_1 = 3,   tshirt_2 = 0,
        torso_1 = 22,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 4,
        pants_1 = 22,   pants_2 = 0,
        shoes_1 = 18,   shoes_2 = 0,
        chain_1 = 61,   chain_2 = 1
    }
  },
  dancer_outfit_2 = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 62,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 14,
        pants_1 = 4,    pants_2 = 0,
        shoes_1 = 34,   shoes_2 = 0,
        chain_1 = 118,  chain_2 = 0
    },
    female = {
        tshirt_1 = 3,   tshirt_2 = 0,
        torso_1 = 22,   torso_2 = 2,
        decals_1 = 0,   decals_2 = 0,
        arms = 4,
        pants_1 = 20,   pants_2 = 2,
        shoes_1 = 18,   shoes_2 = 2,
        chain_1 = 0,    chain_2 = 0
    }
  },
  dancer_outfit_3 = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 4,    pants_2 = 0,
        shoes_1 = 34,   shoes_2 = 0,
        chain_1 = 118,  chain_2 = 0
    },
    female = {
        tshirt_1 = 3,   tshirt_2 = 0,
        torso_1 = 22,   torso_2 = 1,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 19,   pants_2 = 1,
        shoes_1 = 19,   shoes_2 = 3,
        chain_1 = 0,    chain_2 = 0
    }
  },
  dancer_outfit_4 = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 61,   pants_2 = 5,
        shoes_1 = 34,   shoes_2 = 0,
        chain_1 = 118,  chain_2 = 0
    },
    female = {
        tshirt_1 = 3,   tshirt_2 = 0,
        torso_1 = 82,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 63,   pants_2 = 11,
        shoes_1 = 41,   shoes_2 = 11,
        chain_1 = 0,    chain_2 = 0
    }
  },
  dancer_outfit_5 = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 21,   pants_2 = 0,
        shoes_1 = 34,   shoes_2 = 0,
        chain_1 = 118,  chain_2 = 0
    },
    female = {
        tshirt_1 = 3,   tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 5,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 63,   pants_2 = 2,
        shoes_1 = 41,   shoes_2 = 2,
        chain_1 = 0,    chain_2 = 0
    }
  },
  dancer_outfit_6 = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 81,   pants_2 = 0,
        shoes_1 = 34,   shoes_2 = 0,
        chain_1 = 118,  chain_2 = 0
    },
    female = {
        tshirt_1 = 3,   tshirt_2 = 0,
        torso_1 = 18,   torso_2 = 3,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 63,   pants_2 = 10,
        shoes_1 = 41,   shoes_2 = 10,
        chain_1 = 0,    chain_2 = 0
    }
  },
  dancer_outfit_7 = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 40,
        pants_1 = 61,   pants_2 = 9,
        shoes_1 = 16,   shoes_2 = 9,
        chain_1 = 118,  chain_2 = 0
    },
    female = {
        tshirt_1 = 3,   tshirt_2 = 0,
        torso_1 = 111,  torso_2 = 6,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 63,   pants_2 = 6,
        shoes_1 = 41,   shoes_2 = 6,
        chain_1 = 0,    chain_2 = 0
    }
  }
}
