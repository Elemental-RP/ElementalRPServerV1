--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

-- // Set max cap on how many drugs a player can sell between a server-restart, remember this cannot be 0, instead set to 9999999999 for unlimited // --
Config.maxCap = 9999999999

-- // MISSION REWARD // --
Config.Reward = {
	["meth"] = math.random(4,12),
	["coke"] = math.random(2,6),
	["weed"] = math.random(8,20),
}

-- // MISSION LOCATIONS // --
Config.MissionPosition = 
{
	{
		Location = vector3(-520.1247,-2877.795,7.295938), -- https://gyazo.com/98c3e756a054c647d2e1e42e417fe8a6
		InUse = false,
		GoonSpawns = {
			vector3(-523.3846,-2877.983,7.295937),
			vector3(-512.6961,-2867.888,7.295936),
			vector3(-540.0925,-2848.624,6.000387),
			vector3(-516.5098,-2872.221,11.55055),
			vector3(-489.3558,-2844.501,11.55055),
			vector3(-510.7731,-2870.986,17.60062),
			vector3(-555.9444,-2850.314,6.000383),
			vector3(-525.8635,-2890.978,6.00038),
			vector3(-534.2731,-2896.717,6.000388)
		}
	},
	{
		Location = vector3(485.3236,-3383.7,6.069912), -- https://gyazo.com/bed93c619d979177ceec51ce7de78b60
		InUse = false,
		GoonSpawns = {
			vector3(489.7149,-3382.499,6.069914),
			vector3(478.4058,-3382.275,6.069916),
			vector3(471.6081,-3371.956,6.069911),
			vector3(495.6046,-3370.103,6.069911),
			vector3(483.8217,-3386.293,9.25804),
			vector3(474.7548,-3383.656,10.43177),
			vector3(475.8879,-3339.373,6.069908),
			vector3(498.851,-3334.721,29.87959),
			vector3(500.6356,-3338.684,24.58636),
			vector3(481.7979,-3264.463,16.13213)
		}
	},
	{
		Location = vector3(141.8366,-3102.032,5.896308), -- https://gyazo.com/bf2cddb0ae715bc0c3fbdae82f47f9dd
		InUse = false,
		GoonSpawns = {
			vector3(141.8366,-3102.032,5.896308),
			vector3(152.8683,-3112.24,5.896309),
			vector3(128.81,-3112.42,5.91),
			vector3(126.78,-3075.39,5.94),
			vector3(152.46,-3076.02,5.9),
			vector3(157.04,-3102.8,7.03),
			vector3(157.12,-3078.32,7.03),
			vector3(117.79,-3082.03,6.02),
			vector3(116.83,-3103.31,6.02),
			vector3(120.06,-3106.19,16.07),
			vector3(155.07,-3102.61,15.96)
		}
	},
	{
		Location = vector3(-106.08,-2230.32,7.81), -- https://gyazo.com/175117832d1a3d40fdac639b56ee587c
		InUse = false,
		GoonSpawns = {
			vector3(-106.08,-2230.32,7.81),
			vector3(-112.27,-2212.6,7.81),
			vector3(-124.87,-2232.4,7.81),
			vector3(-136.17,-2214.41,7.81),
			vector3(-137.2,-2228.82,7.81),
			vector3(-102.64,-2231.67,11.63),
			vector3(-97.51,-2230.7,7.81),
			vector3(-97.51,-2230.7,7.81),
			vector3(-89.15,-2213.41,7.81),
			vector3(-104.95,-2220.92,7.81),
			vector3(-73.89,-2212.6,7.81)
		}
	},
	{
		Location = vector3(1515.7,-2137.4,76.73), -- https://gyazo.com/5fbae09413c605631bc6ac80fd0bf165
		InUse = false,
		GoonSpawns = {
			vector3(1515.7,-2137.4,76.73),
			vector3(1523.94,-2139.34,76.99),
			vector3(1509.22,-2151.57,77.39),
			vector3(1494.6,-2140.0,76.54),
			vector3(1494.96,-2129.02,76.09),
			vector3(1508.75,-2121.41,76.56),
			vector3(1519.0,-2120.57,76.42),
			vector3(1519.01,-2132.23,76.63),
			vector3(1528.54,-2153.9,77.79),
			vector3(1526.19,-2145.04,77.27),
			vector3(1541.76,-2148.5,77.5)
		}
	},
	{
		Location = vector3(2368.46,3039.25,48.15), -- https://gyazo.com/cfd9d2db705aa82ad64a1281e71ed953
		InUse = false,
		GoonSpawns = {
			vector3(2368.46,3039.25,48.15),
			vector3(2368.75,3034.93,51.08),
			vector3(2367.93,3052.35,48.3),
			vector3(2368.35,3061.55,48.3),
			vector3(2371.41,3049.48,48.15),
			vector3(2345.83,3043.72,48.16),
			vector3(2376.2,3039.92,48.15),
			vector3(2356.61,3051.86,48.57),
			vector3(2374.05,3061.5,48.15),
			vector3(2378.78,3083.22,48.15),
			vector3(2365.02,3046.76,48.15)
		}
	}--,
	-- add more missions here, remember "," after last ")"
}
