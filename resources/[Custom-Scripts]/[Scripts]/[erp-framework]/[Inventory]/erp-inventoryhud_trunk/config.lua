Config = {}

Config.CheckOwnership = true -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = "en"

Config.OpenKey = 303

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 100

Config.localWeight = {
  	WEAPON_KNIFE  = 870,
  	WEAPON_NIGHTSTICK  = 870,
  	WEAPON_HAMMER  = 870,
  	WEAPON_BAT  = 870,
  	WEAPON_GOLFCLUB  = 870,
  	WEAPON_CROWBAR  = 870,
  	WEAPON_PISTOL  = 1230,
  	WEAPON_COMBATPISTOL  = 1230,
  	WEAPON_APPISTOL  = 1230,
  	WEAPON_PISTOL50  = 1230,
  	WEAPON_MICROSMG  = 1230,
  	WEAPON_SMG  = 1230,
  	weapon_assaultsmg  = 1230,
  	WEAPON_ASSAULTRIFLE  = 1230,
  	WEAPON_CARBINERIFLE  = 1230,
  	WEAPON_ADVANCEDRIFLE  = 1230,
  	WEAPON_MG  = 1230,
  	WEAPON_COMBATMG  = 1230,
  	WEAPON_PUMPSHOTGUN  = 1230,
  	WEAPON_SAWNOFFSHOTGUN  = 1230,
  	WEAPON_ASSAULTSHOTGUN  = 1230,
  	WEAPON_BULLPUPSHOTGUN  = 1230,
  	WEAPON_STUNGUN  = 8700,
  	weapon_sniperrifle  = 1230,
  	WEAPON_HEAVYSNIPER  = 1230,
  	WEAPON_GRENADELAUNCHER  = 1230,
  	WEAPON_RPG  = 1230,
  	WEAPON_STINGER  = 1230,
  	WEAPON_MINIGUN  = 1230,
  	WEAPON_GRENADE  = 1230,
  	WEAPON_STICKYBOMB  = 1230,
  	WEAPON_SOMKEGRENADE  = 870,
  	WEAPON_BZGAS  = 870,
  	WEAPON_MOLOTOV  = 870,
  	WEAPON_FIREEXTINGUISHER  = 1230,
  	WEAPON_PETROLCAN  = 870,
  	WEAPON_DIGISCANNER  = 1230,
  	WEAPON_BALL  = 870,
  	WEAPON_SNSPISTOL  = 1230,
  	WEAPON_BOTTLE  = 870,
  	WEAPON_GUSENBERG  = 1230,
  	WEAPON_SPECIALCARBINE  = 1230,
  	WEAPON_HEAVYPISTOL  = 1230,
  	WEAPON_BULLPUPRIFLE  = 1230,
  	WEAPON_DAGGER  = 870,
  	WEAPON_VINTAGEPISTOL  = 1230,
  	WEAPON_FIREWORK  = 1230,
  	WEAPON_MUSTKET = 1230,
  	WEAPON_HEAVYSHOTGUN  = 1230,
  	WEAPON_MARKSMANRIFLE  = 1230,
  	WEAPON_HOMINGLAUNCHER  = 1230,
  	WEAPON_PROXMINE  = 1230,
  	WEAPON_SNOWBALL  = 870,
  	WEAPON_FLAREGUN  = 870,
  	WEAPON_GARBAGEBAG  = 870,
  	WEAPON_HANDCUFFS  = 870,
  	WEAPON_COMBATPDW  = 1230,
  	WEAPON_MARKSMANPISTOL  = 1230,
  	WEAPON_KNUCKLE  = 1230,
  	WEAPON_HATCHET  = 1230,
  	WEAPON_RAILGUN  = 1230,
  	weapon_machete  = 1230,
  	WEAPON_MACHINEPISTOL  = 1230,
  	WEAPON_SWITCHBLADE  = 870,
  	WEAPON_REVOLVER  = 1230,
  	WEAPON_DBSHOTGUN  = 1230,
  	WEAPON_COMPACTRIFLE  = 1230,
  	WEAPON_AUTOSHOTGUN  = 1230,
  	WEAPON_BATTLEAXE  = 870,
  	WEAPON_COMPACTLAUNCHER  = 1230,
  	WEAPON_MINISMG  = 1230,
  	WEAPON_PIPEBOMB  = 1230,
  	WEAPON_POOLCUE  = 870,
  	WEAPON_WRENCH  = 870,
  	WEAPON_FLASHLIGHT  = 870,
  	GADGET_NIGHTVISION  = 870,
  	GADGET_PARACHUTE  = 870,
  	WEAPON_FLARE  = 870,
  	WEAPON_DOUBLEACTION  = 1230,
	  black_money = -1
}

Config.VehicleLimit = {
    [0] = 50000, --Compact
    [1] = 90000, --Sedan
    [2] = 110000, --SUV
    [3] = 100000, --Coupes
    [4] = 120000, --Muscle
    [5] = 50000, --Sports Classics
    [6] = 50000, --Sports
    [7] = 50000, --Super
    [8] = 0, --Motorcycles
    [9] = 200000, --Off-road
    [10] = 200000, --Industrial
    [11] = 100000, --Utility
    [12] = 150000, --Vans
    [13] = 0, --Cycles
    [14] = 300000, --Boats
    [15] = 300000, --Helicopters
    [16] = 300000, --Planes
    [17] = 50000, --Service
    [18] = 50000, --Emergency
    [19] = 50000, --Military
    [20] = 50000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    police = "PSP",
    ambulance = "INEM",
    brisa_mvito = "MECANICO"
}
