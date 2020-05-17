Config                            = {}
Config.Locale                     = 'br'

Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 15, max = 40 }

Config.Vehicles = {
	'adder',
	'asea',
	'asterope',
	'banshee',
	'buffalo'
}

Config.Zones = {

	MechanicActions = {
		Pos   = { x = 950.8, y = -968.76, z = 38.51 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},

	Garage = {
		Pos   = { x = 950.8, y = -968.76, z = -3998.51 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},

	Craft = {
		Pos   = { x = 953.28, y = -977.59, z = 39.51 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos   = { x = 925.15, y = -966.04, z = 39.5 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = { x = 951.78, y = -958.68, z = 39.5 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},

	VehicleDelivery = {
		Pos   = { x = 952.44, y = -989.03, z = 39.76 },
		Size  = { x = 20.0, y = 20.0, z = 3.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
}

Config.Towables = {
	vector3(-2480.9, -212.0, 17.4),
	vector3(-2723.4, 13.2, 15.1),
	vector3(-3169.6, 976.2, 15.0),
	vector3(-3139.8, 1078.7, 20.2),
	vector3(-1656.9, -246.2, 54.5),
	vector3(-1586.7, -647.6, 29.4),
	vector3(-1036.1, -491.1, 36.2),
	vector3(-1029.2, -475.5, 36.4),
	vector3(75.2, 164.9, 104.7),
	vector3(-534.6, -756.7, 31.6),
	vector3(487.2, -30.8, 88.9),
	vector3(-772.2, -1281.8, 4.6),
	vector3(-663.8, -1207.0, 10.2),
	vector3(719.1, -767.8, 24.9),
	vector3(-971.0, -2410.4, 13.3),
	vector3(-1067.5, -2571.4, 13.2),
	vector3(-619.2, -2207.3, 5.6),
	vector3(1192.1, -1336.9, 35.1),
	vector3(-432.8, -2166.1, 9.9),
	vector3(-451.8, -2269.3, 7.2),
	vector3(939.3, -2197.5, 30.5),
	vector3(-556.1, -1794.7, 22.0),
	vector3(591.7, -2628.2, 5.6),
	vector3(1654.5, -2535.8, 74.5),
	vector3(1642.6, -2413.3, 93.1),
	vector3(1371.3, -2549.5, 47.6),
	vector3(383.8, -1652.9, 37.3),
	vector3(27.2, -1030.9, 29.4),
	vector3(229.3, -365.9, 43.8),
	vector3(-85.8, -51.7, 61.1),
	vector3(-4.6, -670.3, 31.9),
	vector3(-111.9, 92.0, 71.1),
	vector3(-314.3, -698.2, 32.5),
	vector3(-366.9, 115.5, 65.6),
	vector3(-592.1, 138.2, 60.1),
	vector3(-1613.9, 18.8, 61.8),
	vector3(-1709.8, 55.1, 65.7),
	vector3(-521.9, -266.8, 34.9),
	vector3(-451.1, -333.5, 34.0),
	vector3(322.4, -1900.5, 25.8)
}

for k,v in ipairs(Config.Towables) do
	Config.Zones['Towable' .. k] = {
		Pos   = v,
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
end


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
                    labels = {"imgsrc:faturas.png", "imgsrc:anim.png", "imgsrc:limp.png", "imgsrc:repair.png", "imgsrc:del.png", "imgsrc:rebocar.png", "imgsrc:spawn.png"},
                    commands = {"faturas","MECsubmenu1" ,"limparveiculo", "repararcarro", "delveiculo", "rebveiculo","MECsubmenu2"}
                }
            }
        }
    }
}

--Submenu configuration
subMenuConfigs = {
    ['MECsubmenu1'] = {
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
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
										labels = {"imgsrc:faturas.png", "imgsrc:anim.png", "imgsrc:limp.png", "imgsrc:repair.png", "imgsrc:del.png", "imgsrc:rebocar.png", "imgsrc:spawn.png"},
                    commands = {"faturas","MECsubmenu1" ,"limparveiculo", "repararcarro", "delveiculo", "rebveiculo","MECsubmenu2"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"anim fix 1", "anim fix 2", "anim fix 3"},
                    commands = {"e2 fix1", "e2 fix2", "e2 fix3"}
                }
            }
        }
    },
	['MECsubmenu2'] = {
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
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
										labels = {"imgsrc:faturas.png", "imgsrc:anim.png", "imgsrc:limp.png", "imgsrc:repair.png", "imgsrc:del.png", "imgsrc:rebocar.png", "imgsrc:spawn.png"},
                    commands = {"faturas","MECsubmenu1" ,"limparveiculo", "repararcarro", "delveiculo", "rebveiculo","MECsubmenu2"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"imgsrc:cone.png", "imgsrc:macaco.png", "imgsrc:ferramentas.png"},
                    commands = {"cone", "trolley", "ferramentas"}
                }
            }
        }
    }
}
