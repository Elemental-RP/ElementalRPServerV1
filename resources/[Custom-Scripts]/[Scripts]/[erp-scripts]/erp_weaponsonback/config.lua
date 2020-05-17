Config = {}

-- 'bone' use bonetag https://pastebin.com/D7JMnX1g
-- x,y,z are offsets
Config.RealWeapons = {

	--{name = 'WEAPON_NIGHTSTICK', 			bone = 58271, x = -0.20, y = 0.1,  z = -0.10, xRot = -55.0,  yRot = 90.00, zRot = 5.0, category = 'melee', 			    model = 'w_me_nightstick'},
	{name = 'WEAPON_BAT', 					bone = 58271, x = -0.20, y = 0.1,  z = -0.10, xRot = -55.0,  yRot = 90.00, zRot = 5.0, 		category = 'melee', 		model = 'w_me_bat'},
	{name = 'WEAPON_KNIFE', 				bone = 24818, x = -0.2,   y = -0.14,z = 0.07, xRot = 0.0, yRot = 180.0, zRot = 0.0, category = 'melee', 		        model = 'prop_w_me_knife_01'},

	{name = 'WEAPON_SMG_Mk2', 				bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_smgmk2'},
	{name = 'WEAPON_SMG', 					bone = 11816, x = -0.35, y = 0.18, z = -0.05, xRot = 360.0, yRot = -40.0, zRot = 1.0, category = 'machine', 	    model = 'w_sb_smg'},
	--{name = 'WEAPON_MG', 					bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	    model = 'w_mg_mg'},
	--{name = 'WEAPON_COMBATMG', 				bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_combatmg'},
	{name = 'WEAPON_ASSAULTSMG', 			bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_assaultsmg'},
	{name = 'WEAPON_MICROSMG', 				bone = 24818, x = 0.0,     y = 0.0,     z = 0.0,     xRot = 0.0, yRot = 0.0, zRot = 0.0,   category = 'machine', 	model = 'wb_sb_microsmg'},

	{name = 'WEAPON_ASSAULTRIFLE', 			 bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_assaultrifle'},
	{name = 'WEAPON_CARBINERIFLE', 			 bone = 24818, x = 0.15,    y = -0.15, 	z = 0.0,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	    model = 'w_ar_carbinerifle'},
	{name = 'WEAPON_CARBINERIFLE_Mk2', 		 bone = 24818, x = 0.15,    y = -0.15, 	z = -0.05,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_carbineriflemk2'},
	--{name = 'WEAPON_ADVANCEDRIFLE', 		 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_advancedrifle'},
	{name = 'WEAPON_SPECIALCARBINE', 		 bone = 24818, x = 0.10, y = -0.15,     z = 0.0,     xRot = 0.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_specialcarbine'},
	{name = 'WEAPON_SPECIALCARBINE_Mk2',	 bone = 24818, x = 0.10, y = -0.15,     z = 0.0,     xRot = 0.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_specialcarbinemk2'},


	{name = 'WEAPON_PUMPSHOTGUN', 			bone = 24818, x = 0.01,  y = -0.14, z = -0.05,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_pumpshotgun'},
	{name = 'WEAPON_BULLPUPSHOTGUN', 		bone = 11816, x = -0.35, y = 0.18, z = -0.05, xRot = 360.0, yRot = -40.0, zRot = 1.0, category = 'shotgun', 	model = 'w_sg_bullpupshotgun'},
	{name = 'WEAPON_ASSAULTSHOTGUN', 		bone = 11816, x = -0.35, y = 0.18, z = -0.05, xRot = 360.0, yRot = -40.0, zRot = 1.0, category = 'shotgun', 	model = 'w_sg_assaultshotgun'},
	{name = 'WEAPON_HEAVYSHOTGUN', 			bone = 11816, x = -0.35, y = 0.18, z = -0.05, xRot = 360.0, yRot = -40.0, zRot = 1.0, category = 'shotgun', 	model = 'w_sg_heavyshotgun'},

	{name = 'WEAPON_SNIPERRIFLE', 			bone = 24818, x = 0.05,    y = -0.15, 	z = 0.10,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_sniperrifle'},
	{name = 'WEAPON_HEAVYSNIPER', 			bone = 24818, x = 0.05,    y = -0.15, 	z = 0.10,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_heavysniper'}
}