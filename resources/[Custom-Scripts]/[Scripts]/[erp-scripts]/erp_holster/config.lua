-- Created by Jamelele, April 2019

-- Take a look at the documentation for configuring:
-- https://github.com/Jamelele/holsters/wiki/Configuration-Guide

config = {
  ["weapon"] = "WEAPON_COMBATPISTOL", -- The weapon that the script detects as in or out of the holster
  ["peds"] = {
    ["mp_m_freemode_01"] = { -- Male multiplayer ped
      ["components"] = {
        [7] = { -- Component ID
          [1] = 3, -- Drawable ID, can specify multiple, separated by comma and or line breaks
          [6] = 5,
          [8] = 2,
          [42] = 43,
          [110] = 111,
          [119] = 120
        },
        [8] = { 
          [16] = 18
        }
      }
    },
    ["mp_f_freemode_01"] = { -- Female multiplayer ped
      ["components"] = {
        [7] = { -- Component ID
          [1] = 3,
          [6] = 5,
          [8] = 2,
          [29] = 30,
          [81] = 82
        },
        [8] = {
          [9] = 10
        }
      }
    },
    ["s_m_y_hwaycop_01"] = {
      ["enabled"] = true, -- true/false. Optional field, the ped will default as enabled
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
    ["s_m_y_cop_01"] = {
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
    ["s_m_y_sheriff_01"] = {
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
  }
}