Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 25, x = 1.5, y = 1.5, z = 0.5, r = 250, g = 250, b = 0, a = 100, rotate = false}

Config.ReviveReward               = 950  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'br'

Config.EarlyRespawnTimer          = 60000 * 8  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = {coords = vector3(345.28, -592.16, 43.28), heading = 246.7}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(321.06, -563.66, 28.79),
			sprite = 61,
			scale  = 1.0,
			color  = 46
		},

		AmbulanceActions = {
			vector3(301.83, -598.84, 42.40)
		},

		Pharmacies = {
			vector3(311.91, -597.54, 42.40)
		},

		Vehicles = {
			{
				Spawner = vector3(299.44, -573.34, 43.26),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 225, g = 225, b = 0, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(292.81, -569.94, 43.47), heading = 56.19, radius = 4.0 },
					{ coords = vector3(297.22, -578.16, 43.48), heading = 356.62, radius = 4.0 },
					{ coords = vector3(289.95, -581.69, 43.47), heading = 339.8, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.94, -587.24, 74.17),
                InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 225, g = 225, b = 0, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(351.99, -586.68, 74.07), heading = 153.19, radius = 4.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{ model = 'ems_gs1200', price = 50},
			{ model = 'ambulance', price = 50}
		},

		doctor = {
			{ model = 'ambulancei', price = 50},
			{ model = 'ambulancesiv', price = 50}
		},

		chief_doctor = {
			{ model = 'ambulancei', price = 50}
		},

		boss = {
			{ model = 'ambulancei', price = 50},
			{ model = 'ems_gs1200', price = 50},
			{ model = 'ambulancesiv', price = 50},
			{ model = 'ambulance', price = 50}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'swift', price = 5000}
		},

		chief_doctor = {
			{model = 'swift', price = 5000}
		},

		boss = {
			{model = 'swift', price = 5000}
		}
	}
}


---------------------------------------------------------------------------------------------------
----------------------------------------------------------- RADIALMENU-----------------------------
---------------------------------------------------------------------------------------------------

-- ALERT !!!! - TO ACTIVE THE ANIMATIONS FUNCTIONALITY, YOU NEED TO HAVE THESE ANIMATIONS REGISTERED AS COMMANDS SOMEWHERE
-- 				I Recommend Radian_Animations!

--{name = 'fix1', data = {type = 'anim', ad = "amb@prop_human_bum_bin@base", anim = "base", prop = 0, proptwo = 0, boneone = nil, bonetwo = nil, body = 49, x = 0.0, y = 0.0, z = 0.0, xa = 0.0, yb = 0.0, zc = 0.0}},
--{name = 'fix2', data = {type = 'anim', ad = "amb@prop_human_movie_bulb@base", anim = "base", prop = 0, proptwo = 0, boneone = nil, bonetwo = nil, body = 49, x = 0.0, y = 0.0, z = 0.0, xa = 0.0, yb = 0.0, zc = 0.0}},
--{name = 'fix3', data = {type = 'anim', ad = "amb@prop_human_bum_bin@idle_a", anim = "idle_a", prop = 0, proptwo = 0, boneone = nil, bonetwo = nil, body = 49, x = 0.0, y = 0.0, z = 0.0, xa = 0.0, yb = 0.0, zc = 0.0}},

menuConfigs = {
    ['menu'] = {
        enableMenu = function()
            return true
        end,
        data = {
								keybind = 167,
            		style = {
                		sizePx = 600,
		                slices = {
		                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
		                    hover = { ['fill'] = '#ffcc00', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
		                    selected = { ['fill'] = '#ffcc00', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
		                },
		                titles = {
		                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 12, ['font-weight'] = 'bold' },
		                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 12, ['font-weight'] = 'bold' },
		                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 12, ['font-weight'] = 'bold' }
		                },
		                icons = {
		                    width = 64,
		                    height = 64
		                }
            		},
		            wheels = {
					    	{
                    navAngle = 0,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.0,
                    labels = {"imgsrc:logout.png"},
                    commands = {"e2 stop"}
                },
                {
										navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
										--labels = {"imgsrc:InemSubMenu1.png", "imgsrc:reanimar.png", "imgsrc:curarferidaspequenas.png", "imgsrc:tratarferidasgraves.png", "imgsrc:colocarnoveiculo.png"},
										labels = {"Inem SubMenu", "Reanimar", "Curar Feridas Pequenas", "Tratar Feirdas Graves", "Colocar no Veículo", "Procurar Cidadao"},
                    commands = {"InemSubMenu1", "reanimar","curarferidaspequenas","tratarferidasgraves","colocarnoveiculo", "procurarcidadao"}
                }
            }
        }
    }
}

--Submenu configuration
subMenuConfigs = {
    ['InemSubMenu1'] = {
        data = {
            keybind = 166,
            		style = {
                		sizePx = 600,
		                slices = {
		                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
		                    hover = { ['fill'] = '#ffcc00', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
		                    selected = { ['fill'] = '#ffcc00', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
		                },
		                titles = {
		                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 12, ['font-weight'] = 'bold' },
		                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 12, ['font-weight'] = 'bold' },
		                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 12, ['font-weight'] = 'bold' }
		                },
		                icons = {
		                    width = 64,
		                    height = 64
		                }
            		},
            		wheels = {
								{
                    navAngle = 0,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.0,
                    labels = {"imgsrc:logout.png"},
                    commands = {"e2 stop"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"Cadeira de Rodas", "Remover Cadeira", "Maca", "Remover Maca", "Mala de Socorro", "Mala Médica", "Remover Props"},
                    commands = {"cr", "removercr", "maca", "removermaca", "minem", "medbox", "r"}
                }
            }
        }
    }
}
