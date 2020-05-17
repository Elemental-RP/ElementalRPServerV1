Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 22
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'br'

Config.AmmuStations = {

	Ammunation = {

		Blip = {
			Pos     = { x = 810.68, y = -2159.53, z = 29.61 },
			Sprite  = 110,
			Display = 4,
			Scale   = 1.2,
			Colour  = 81,
		},

		Armories = {
			{ x = 810.68, y = -2159.53, z = 29.61 },
		},

		Vehicles = {
			{
				Spawner    = { x = 817.25, y = -2146.21, z = 29.34 },
				SpawnPoints = {
					{x = 822.14, y = -2140.43, z = 29.02, heading = 90.0, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			{ x = 821.22, y = -2119.54, z = 29.33 }
		},

		BossActions = {
			{ x = 808.05, y = -2157.19, z = 29.62 }
		},

	},

}

Config.AuthorizedWeapons = {
	soldato = {					
      { weapon = 'WEAPON_KNIFE',                     price = 500 },
	  { weapon = 'WEAPON_SWITCHBLADE',               price = 500 },
      { weapon = 'WEAPON_PISTOL', components = { 0, 30000, 250, 20000, 5000, nil },                   price = 5000 },
      { weapon = 'WEAPON_PISTOL50', components = { 0, 30000, 250, 20000, 5000, nil },                 price = 15000 },
	  { weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
      { weapon = 'WEAPON_FLASHLIGHT',                price = 250 },
      { weapon = 'WEAPON_SAWNOFFSHOTGUN', components = { 5000, nil },           price = 30000 },
	  { weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
	  { weapon = 'WEAPON_MINISMG', components = { 0, 30000, nil },                  price = 35000 },
	  { weapon = 'WEAPON_BULLPUPSHOTGUN', components = { 250, 20000, 25000, nil },            price = 40000 },
	  { weapon = 'WEAPON_COMPACTRIFLE', components = { 0, 30000, 50000, nil },               price = 70000 },
	  { weapon = 'gadget_parachute', price = 200 },
	  { weapon = 'WEAPON_SMG', components = { 0, 30000, 50000, 250, 15000, 20000, 5000, nil },                       price = 65000 }
	},

	capo = {
      { weapon = 'WEAPON_KNIFE',                     price = 500 },
	  { weapon = 'WEAPON_SWITCHBLADE',               price = 500 },
      { weapon = 'WEAPON_PISTOL', components = { 0, 30000, 250, 20000, 5000, nil },                   price = 5000 },
      { weapon = 'WEAPON_PISTOL50', components = { 0, 30000, 250, 20000, 5000, nil },                 price = 15000 },
	  { weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
      { weapon = 'WEAPON_FLASHLIGHT',                price = 250 },
      { weapon = 'WEAPON_SAWNOFFSHOTGUN', components = { 5000, nil },           price = 30000 },
	  { weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
	  { weapon = 'WEAPON_MINISMG', components = { 0, 30000, nil },                  price = 35000 },
	  { weapon = 'WEAPON_BULLPUPSHOTGUN', components = { 250, 20000, 25000, nil },            price = 40000 },
	  { weapon = 'WEAPON_COMPACTRIFLE', components = { 0, 30000, 50000, nil },               price = 70000 },
	  { weapon = 'gadget_parachute', price = 200 },
	  { weapon = 'WEAPON_SMG', components = { 0, 30000, 50000, 250, 15000, 20000, 5000, nil },                       price = 65000 }
	},

	consigliere = {
      { weapon = 'WEAPON_KNIFE',                     price = 500 },
	  { weapon = 'WEAPON_SWITCHBLADE',               price = 500 },
      { weapon = 'WEAPON_PISTOL', components = { 0, 30000, 250, 20000, 5000, nil },                   price = 5000 },
      { weapon = 'WEAPON_PISTOL50', components = { 0, 30000, 250, 20000, 5000, nil },                 price = 15000 },
	  { weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
      { weapon = 'WEAPON_FLASHLIGHT',                price = 250 },
      { weapon = 'WEAPON_SAWNOFFSHOTGUN', components = { 5000, nil },           price = 30000 },
	  { weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
	  { weapon = 'WEAPON_MINISMG', components = { 0, 30000, nil },                  price = 35000 },
	  { weapon = 'WEAPON_BULLPUPSHOTGUN', components = { 250, 20000, 25000, nil },            price = 40000 },
	  { weapon = 'WEAPON_COMPACTRIFLE', components = { 0, 30000, 50000, nil },               price = 70000 },
	  { weapon = 'gadget_parachute', price = 200 },
	  { weapon = 'WEAPON_SMG', components = { 0, 30000, 50000, 250, 15000, 20000, 5000, nil },                       price = 65000 },
	  { weapon = 'WEAPON_CARBINERIFLE', components = { 0, 2500, 2500, 2500, 2500, 2500, 2500, 2500, nil },                       price = 90000 }
	},

	righthand = {
       { weapon = 'WEAPON_KNIFE',                     price = 500 },
	  { weapon = 'WEAPON_SWITCHBLADE',               price = 500 },
      { weapon = 'WEAPON_PISTOL', components = { 0, 30000, 250, 20000, 5000, nil },                   price = 5000 },
      { weapon = 'WEAPON_PISTOL50', components = { 0, 30000, 250, 20000, 5000, nil },                 price = 15000 },
	  { weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
      { weapon = 'WEAPON_FLASHLIGHT',                price = 250 },
      { weapon = 'WEAPON_SAWNOFFSHOTGUN', components = { 5000, nil },           price = 30000 },
	  { weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
	  { weapon = 'WEAPON_MINISMG', components = { 0, 30000, nil },                  price = 35000 },
	  { weapon = 'WEAPON_BULLPUPSHOTGUN', components = { 250, 20000, 25000, nil },            price = 40000 },
	  { weapon = 'WEAPON_COMPACTRIFLE', components = { 0, 30000, 50000, nil },               price = 70000 },
	  { weapon = 'gadget_parachute', price = 200 },
	  { weapon = 'WEAPON_SMG', components = { 0, 30000, 50000, 250, 15000, 20000, 5000, nil },                       price = 65000 },
	  { weapon = 'WEAPON_CARBINERIFLE', components = { 0, 2500, 2500, 2500, 2500, 2500, 2500, 2500, nil },                       price = 90000 }
	},

	boss = {
      { weapon = 'WEAPON_KNIFE',                     price = 500 },
	  { weapon = 'WEAPON_SWITCHBLADE',               price = 500 },
      { weapon = 'WEAPON_PISTOL', components = { 0, 30000, 250, 20000, 5000, nil },                   price = 5000 },
      { weapon = 'WEAPON_PISTOL50', components = { 0, 30000, 250, 20000, 5000, nil },                 price = 15000 },
	  { weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
      { weapon = 'WEAPON_FLASHLIGHT',                price = 250 },
      { weapon = 'WEAPON_SAWNOFFSHOTGUN', components = { 5000, nil },           price = 30000 },
	  { weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
	  { weapon = 'WEAPON_MINISMG', components = { 0, 30000, nil },                  price = 35000 },
	  { weapon = 'WEAPON_BULLPUPSHOTGUN', components = { 250, 20000, 25000, nil },            price = 40000 },
	  { weapon = 'WEAPON_COMPACTRIFLE', components = { 0, 30000, 50000, nil },               price = 70000 },
	  { weapon = 'gadget_parachute', price = 200 },
	  { weapon = 'WEAPON_SMG', components = { 0, 30000, 50000, 250, 15000, 20000, 5000, nil },                       price = 65000 },
	  { weapon = 'WEAPON_CARBINERIFLE', components = { 0, 2500, 2500, 2500, 2500, 2500, 2500, 2500, nil },                       price = 90000 }
	}
}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {
		
	},

	soldato = {
		{
			model = 'Pony',
			label = 'Van'
		},
		{
			model = 'hcbr17',
			label = 'CBR 1000'
		}
	},

	capo = {
		{
			model = 'Pony',
			label = 'Van'
		},
		{
			model = 'hcbr17',
			label = 'CBR 1000'
		}
	},
	consigliere = {
		{
			model = 'Pony',
			label = 'Van'
		},
		{
			model = 'hcbr17',
			label = 'CBR 1000'
		}
    }, 

	righthand = {
		{
			model = 'Pony',
			label = 'Van'
		},
		{
			model = 'hcbr17',
			label = 'CBR 1000'
		}
	},
	
	boss = {
		{
			model = 'Pony',
			label = 'Van'
		},
		{
			model = 'hcbr17',
			label = 'CBR 1000'
		}
	}
}