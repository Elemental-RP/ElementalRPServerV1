Config = {}

Config.Zones = {}
Config.Price = 400

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 2.4}
Config.MarkerColor  = {r = 255, g = 128, b = 0}
Config.MarkerType   = 25
Config.Locale = 'br'

Config.Shops = {
	{x = -814.308,  y = -183.823,  z = 36.568},
	{x = 136.826,   y = -1708.373, z = 28.291},
	{x = -1282.604, y = -1116.757, z = 5.990},
	{x = 1931.513,  y = 3729.671,  z = 31.844},
	{x = 1212.840,  y = -472.921,  z = 65.208},
	{x = -32.885,   y = -152.319,  z = 56.076},
	{x = -278.077,  y = 6228.463,  z = 30.695},
	{x = -1013.1443,y = -2776.4836,z = 13.6442},
	{x = 954.0087,  y = 16.5017,   z = 116.4142, hidden = true},
	{x = 1649.5001, y = 4874.0732, z = 41.15}
}
for i=1, #Config.Shops, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Shops[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end