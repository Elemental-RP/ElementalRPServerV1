Config = {}

-- Pawn Shop Positions:
Config.PawnZones = {
	PawnShops = {
		Pos = {
			{x = 412.42,  y = 314.41, z = 103.02},
			{x = 182.76821899414,  y = -1319.3857421875, z = 29.317152023315},
			{x = -1459.3402099609,  y = -413.79244995117, z = 35.739379882813}
		}
	}
}

-- Pawn Shop Blip Settings:
Config.EnablePawnShopBlip = true
Config.BlipSprite = 59
Config.BlipDisplay = 4
Config.BlipScale = 0.65
Config.BlipColour = 5
Config.BlipName = "Penhores"

-- Pawn Shop Marker Settings:
Config.KeyToOpenShop = 38														-- default 38 is E
Config.ShopMarker = 27 															-- marker type
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 } 					-- rgba color of the marker
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  						-- the scale for the marker on the x, y and z axis
Config.ShopDraw3DText = "Pressiona ~g~[E]~s~ para abrir os ~y~Penhores~s~"					-- set your desired text here

-- Pawn Shop Item List:
Config.ItemsInPawnShop = {
	{ itemName = 'hackerDevice', label = 'Dispositivo de Hacker', BuyInPawnShop = false, BuyPrice = 1000, SellInPawnShop = true, SellPrice = 1500 },
	{ itemName = 'drugBUSBC', label = 'USB-C Preta', BuyInPawnShop = false, BuyPrice = 1000, SellInPawnShop = true, SellPrice = 1400 },
	{ itemName = 'weedburn', label = 'Green USB', BuyInPawnShop = false, BuyPrice = 2000, SellInPawnShop = true, SellPrice = 1300 },
	{ itemName = 'methburn', label = 'Blue USB', BuyInPawnShop = false, BuyPrice = 500, SellInPawnShop = true, SellPrice = 2300 },
	{ itemName = 'cokeburn', label = 'White USB', BuyInPawnShop = false, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 1900 },

	{ itemName = 'dia_box', label = 'Caixa de Diamantes', BuyInPawnShop = false, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 2400 },
	{ itemName = 'gold_bar', label = 'Barra de Ouro', BuyInPawnShop = false, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 1950 },

	{ itemName = 'diamond', label = 'Diamante', BuyInPawnShop = false, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 70 },
	{ itemName = 'gold', label = 'Ouro', BuyInPawnShop = false, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 50 },
	{ itemName = 'rolex', label = 'Relógio Rolex', BuyInPawnShop = false, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 3500 },

	{ itemName = 'thermal_charge', label = 'Carga Térmica', BuyInPawnShop = true, BuyPrice = 7500, SellInPawnShop = true, SellPrice = 6500 },
}

