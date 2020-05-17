Config = {}
Config.MarkerType = 1
Config.DrawDistance = 100.0
Config.ZoneSize = {x = 2.5, y = 2.5, z = 0.5}
Config.MarkerColor = {r = 100, g = 204, b = 100}
Config.KeyStopAction = 'X'
-- Show blip in map?
Config.ShowBlips = false

Config.Locale = 'br'

-- Before add any drug/item here you have to add the translation of the item
Config.Drugs = {
  -- Translated name
  [_U('weed')] = {
    Item = 'weed', -- Item to pickup
    ItemTransform = 'weed_pooch', -- Item to transform
    AlertCops = true, -- Alert police?
    RequiredCops = 0, -- How many cops need to the action start??
    QToProcess = 5, -- Quantity necessary to process
    QToSell = 1, -- Quantity necessary to sell
    TimeToFarm = 20, -- Time to farm in seconds
    TimeToProcess = 15, -- Time to process in seconds
    TimeToSell = 30, -- Time to sell in seconds
    Usable = true, -- Can it be consumed?
    UseEffect = true, -- Effect after consume
    Zones = {
      -- Field: Farm location
      -- Processing: Process location
      -- Dealer: Seller location
      -- callPolice: true/false, call the police in the position?
      -- callPoliceChance: chance in percentage to call the police
      -- sellMin: Min receveid by selling
      -- sellMax: Max received by selling
      -- multiplierPolice: true/false Multiply the min/max based on cops online
      Field = {x = -2174.12, y = 5204.11, z = 17.78 - 1.0001, name = _U('field', _U('weed')), sprite = 496, color = 52, callPolice = false, callPoliceChance = 100},
      Processing = {x = 1388.67, y = 3605.48, z = 38.94 - 1.0001, name = _U('processing', _U('weed')), sprite = 496, color = 52, callPolice = false, callPoliceChance = 100},
      Dealer = {x = 478.27, y = -3369.85, z = 6.07 - 1.0001, h = 45.24, name = _U('dealer', _U('weed')), sprite = 500, color = 75, callPolice = true, callPoliceChance = 100, NPCHash = 653210662, sellMin = 100, sellMax = 500, multiplierPolice = true},
    }
  },
  -- Translated name
  [_U('meth')] = {
    Item = 'meth', -- Item to pickup
    ItemTransform = 'meth_pooch', -- Item to transform
    AlertCops = true, -- Alert police?
    RequiredCops = 3, -- How many cops need to the action start??
    QToProcess = 5, -- Quantity necessary to process
    QToSell = 1, -- Quantity necessary to sell
    TimeToFarm = 20, -- Time to farm in seconds
    TimeToProcess = 15, -- Time to process in seconds
    TimeToSell = 30, -- Time to sell in seconds
    Usable = true, -- Can it be consumed?
    UseEffect = true, -- Effect after consume
    Zones = {
      -- Field: Farm location
      -- Processing: Process location
      -- Dealer: Seller location
      -- callPolice: true/false, call the police in the position?
      -- callPoliceChance: chance in percentage to call the police
      -- sellMin: Min receveid by selling
      -- sellMax: Max received by selling
      -- multiplierPolice: true/false Multiply the min/max based on cops online
      Field = {x = 518.22, y = 3105.71, z = 39.53, name = _U('field', _U('meth')), sprite = 499, color = 26, callPolice = false, callPoliceChance = 100},
      Processing = {x = 2433.93, y = 4968.97, z = 42.35 - 1.0001, name = _U('processing', _U('meth')), sprite = 499, color = 26, callPolice = false, callPoliceChance = 100},
      Dealer = {x = -948.89, y = -1252.87, z = 7.98 - 1.0001, h = 45.24, name = _U('dealer', _U('meth')), sprite = 500, color = 75, callPolice = true, callPoliceChance = 100, NPCHash = 653210662, sellMin = 300, sellMax = 800, multiplierPolice = true},
    }
  },
  -- Translated name
  [_U('opium')] = {
    Item = 'opium', -- Item to pickup
    ItemTransform = 'opium_pooch', -- Item to transform
    AlertCops = true, -- Alert police?
    RequiredCops = 2, -- How many cops need to the action start??
    QToProcess = 5, -- Quantity necessary to process
    QToSell = 1, -- Quantity necessary to sell
    TimeToFarm = 20, -- Time to farm in seconds
    TimeToProcess = 15, -- Time to process in seconds
    TimeToSell = 30, -- Time to sell in seconds
    Usable = true, -- Can it be consumed?
    UseEffect = true, -- Effect after consume
    Zones = {
      -- Field: Farm location
      -- Processing: Process location
      -- Dealer: Seller location
      -- callPolice: true/false, call the police in the position?
      -- callPoliceChance: chance in percentage to call the police
      -- sellMin: Min receveid by selling
      -- sellMax: Max received by selling
      -- multiplierPolice: true/false Multiply the min/max based on cops online
      Field = {x = 2888.28, y= 1513.71, z=24.97, name = _U('field', _U('opium')), sprite = 51, color = 60, callPolice = false, callPoliceChance = 100},
      Processing = {x = -329.58, y = -1310.04, z = 30.39, name = _U('processing', _U('opium')), sprite = 51, color = 60, callPolice = false, callPoliceChance = 100},
      Dealer = {x = 1053.95, y = -3246.49, z = 5.89 - 1.0001, h = 45.24, name = _U('dealer', _U('opium')), sprite = 500, color = 75, callPolice = true, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 600, multiplierPolice = true},
    }
  },
  -- Translated name
  [_U('coke')] = {
    Item = 'coke', -- Item to pickup
    ItemTransform = 'coke_pooch', -- Item to transform
    AlertCops = true, -- Alert police?
    RequiredCops = 1, -- How many cops need to the action start??
    QToProcess = 5, -- Quantity necessary to process
    QToSell = 1, -- Quantity necessary to sell
    TimeToFarm = 20, -- Time to farm in seconds
    TimeToProcess = 15, -- Time to process in seconds
    TimeToSell = 30, -- Time to sell in seconds
    Usable = true, -- Can it be consumed?
    UseEffect = true, -- Effect after consume
    Zones = {
      -- Field: Farm location
      -- Processing: Process location
      -- Dealer: Seller location
      -- callPolice: true/false, call the police in the position?
      -- callPoliceChance: chance in percentage to call the police
      -- sellMin: Min receveid by selling
      -- sellMax: Max received by selling
      -- multiplierPolice: true/false Multiply the min/max based on cops online
      Field = {x = 1093.6, y = -3196.68, z = -38.99 - 1.0001, name = _U('field', _U('coke')), sprite = 501, color = 40, callPolice = false, callPoliceChance = 100},
      Processing = {x = 1721.54, y = -2673.32, z = 3.54 - 1.0001, name = _U('processing', _U('coke')), sprite = 478, color = 40, callPolice = false, callPoliceChance = 100},
      Dealer = {x = 1124.14, y = -3151.38, z = -37.06 - 1.0001, h = 45.24, name = _U('dealer', _U('coke')), sprite = 500, color = 75, callPolice = true, callPoliceChance = 100, NPCHash = 653210662, sellMin = 100, sellMax = 600, multiplierPolice = true}
    }
  }
}
