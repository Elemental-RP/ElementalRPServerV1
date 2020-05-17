Config = {}
Config.Locale = 'pt'

Config.Price = 2500

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 51, g = 255, b = 255}
Config.MarkerType   = 25

Config.Zones = {}

Config.Shops = {
  {x =  365.44,  y = -593.72,  z = 42.34},
}

for i=1, #Config.Shops, 1 do
	Config.Zones['Shop_' .. i] = {
	 	Pos   = Config.Shops[i],
	 	Size  = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type  = Config.MarkerType
  }

end
