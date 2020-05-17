Config.MegaMall = {
    ["entrance"] = {
        ["pos"] = vector3(313.2, -225.52, 54.24),
        ["label"] = "Entrar no Armazem."
    },
    ["exit"] = {
        ["pos"] = vector3(1087.4390869141, -3099.419921875, -38.99995803833),
        ["label"] = "Sair do Armazem."
    },
    ["computer"] = {
        ["pos"] = vector3(1088.4245605469, -3101.2800292969, -38.99995803833),
        ["label"] = "Usar Computador."
    },
    ["object"] = {
        ["pos"] = vector3(1095.916015625, -3100.3781738281, -38.99995803833),
        ["rotation"] = vector3(0.0, 0.0, 270.0)
    }
}

Config.FurnishingPurchasables = {
    ["Beds"] = {
        ["big_double_bed"] = {
            ["label"] = "Double bed.",
            ["description"] = "A bed.",
            ["price"] = 8500,
            ["model"] = `apa_mp_h_bed_double_09`
        },
        ["big_black_bed"] = {
            ["label"] = "Big bed",
            ["description"] = "A bed.",
            ["price"] = 11500,
            ["model"] = `apa_mp_h_yacht_bed_02`
        },
        ["big_black_doublebed"] = {
            ["label"] = "Black double bed.",
            ["description"] ="A bed.",
            ["price"] = 7500,
            ["model"] = `apa_mp_h_bed_double_08`
        },
        ["big_beige_double_bed"] = {
            ["label"] = "Brown/beige big bed.",
            ["description"] = "A bed.",
            ["price"] = 12500,
            ["model"] = `apa_mp_h_yacht_bed_01`
        },
    },

    ["Plant"] = {
        ["high_brown_pot"] = {
            ["label"] = "Long plant in brown pot",
            ["description"] = "Long plant in brown pot",
            ["price"] = 3300,
            ["model"] = `apa_mp_h_acc_plant_tall_01`
        },
        ["short_blue_pot"] = {
            ["label"] = "Short blue plant",
            ["description"] = "Short blue plant",
            ["price"] = 1800,
            ["model"] = `apa_mp_h_acc_vase_flowers_04`
        },
        ["palm_white_pot"] = {
            ["label"] = "Palm plant in white pot",
            ["description"] = "Palm plant in white pot",
            ["price"] = 2600,
            ["model"] = `apa_mp_h_acc_plant_palm_01`
        },
        ["hole_wase"] = {
            ["label"] = "Plant in a hollow pot",
            ["description"] = "Plant in a hollow pot.",
            ["price"] = 2150,
            ["model"] = `apa_mp_h_acc_vase_flowers_02`
        },
        ["white_flower_vase"] = {
            ["label"] = "White bukeet in vase",
            ["description"] = "White bukeet in vase.",
            ["price"] = 1650,
            ["model"] = `hei_heist_acc_flowers_01`
        },
        ["long_vase"] = {
            ["label"] = "Long plant in vase",
            ["description"] = "Long plant in vase.",
            ["price"] = 2250,
            ["model"] = `prop_plant_int_03b`
        }
    },

    ["Storage"] = {
        ["large_drawer"] = {
            ["label"] = "Big dresser",
            ["description"] = "A big dresser where you can store items and such.",
            ["price"] = 5000,
            ["model"] = `hei_heist_bed_chestdrawer_04`,
            ["func"] = function(furnishId)
                OpenStorage("motel-" .. furnishId)
            end
        },
        ["chest_drawer"] = {
            ["label"] = "Dresser",
            ["description"] = "A dresser where you can store items and such.",
            ["price"] = 7500,
            ["model"] = `apa_mp_h_bed_chestdrawer_02`,
            ["func"] = function(furnishId)
                OpenStorage("motel-" .. furnishId)
            end
        },
        ["mini_fridge"] = {
            ["label"] = "Minifridge",
            ["description"] = "A minifridge where you can store food and such.",
            ["price"] = 4500,
            ["model"] = `prop_bar_fridge_03`,
            ["func"] = function(furnishId)
                OpenStorage("motel-" .. furnishId)
            end
        },
    },
    
    ["Rugs"] = {
        ["big_rug"] = {
            ["label"] = "Blue colored mat",
            ["description"] = "Blue colored mat",
            ["price"] = 2100,
            ["model"] = `apa_mp_h_acc_rugwoolm_03`
        },
        ["beige_rug"] = {
            ["label"] = "White/beige mat.",
            ["description"] = "A cool rug.",
            ["price"] = 2500,
            ["model"] = `apa_mp_h_acc_rugwoolm_04`
        },
        ["beige_brown_circle_rug"] = {
            ["label"] = "Beige/brown circle rug",
            ["description"] = "Beige/brown circle rug.",
            ["price"] = 3050,
            ["model"] = `apa_mp_h_acc_rugwoolm_01`
        },
        ["blue_white_turqoise_rug"] = {
            ["label"] = "Blue/white/turqoise mat",
            ["description"] = "Blue/white/turqoise mat.",
            ["price"] = 3500,
            ["model"] = `apa_mp_h_acc_rugwoolm_02`
        },
    },
    
    ["Lamps"] = {
        ["floorlamp_mp_apa"] = {
            ["label"] = "Floorlamp - design",
            ["description"] = "A nice lamp with cool design.",
            ["price"] = 3200,
            ["model"] = `apa_mp_h_floorlamp_b`
        },
        ["floorlamp_basic_mp_apa"] = {
            ["label"] = "Floorlamp with yellow screen",
            ["description"] = "A nice lamp that gives good light and fair design.",
            ["price"] = 2800,
            ["model"] = `apa_mp_h_floorlamp_c`
        },
        ["hanging_brown_yellow_lamp"] = {
            ["label"] = "Hanging floorlamp with yellow light",
            ["description"] = "A nice lamp that gives good light and fair design.",
            ["price"] = 3150,
            ["model"] = `apa_mp_h_lit_floorlamp_05`
        },
        ["red_modern_lamp"] = {
            ["label"] = "Red modern floorlamp",
            ["description"] = "A nice lamp that gives good light and fair design.",
            ["price"] = 4200,
            ["model"] = `apa_mp_h_lit_floorlamp_13`
        },
        ["table_lamp_small"] = {
            ["label"] = "Small table lamp",
            ["description"] = "A nice lamp that gives good light and fair design.",
            ["price"] = 2500,
            ["model"] = `apa_mp_h_lit_lamptable_09`
        },
        ["table_lamp_modern_small"] = {
            ["label"] = "Mid-sized modern lamp",
            ["description"] = "A nice lamp that gives good light and fair design.",
            ["price"] = 2850,
            ["model"] = `apa_mp_h_yacht_table_lamp_01`
        },
        ["ek_colored_fan_lamp"] = {
            ["label"] = "Treecolored fanlamp",
            ["description"] = "A fan lamp.",
            ["price"] = 2410,
            ["model"] = `bkr_prop_biker_ceiling_fan_base`
        },
        ["table_lamp_white"] = {
            ["label"] = "Small table lamp",
            ["description"] = "A nice lamp that gives good light and fair design.",
            ["price"] = 1800,
            ["model"] = `v_ilev_fh_lampa_on`
        },
    },

    ["Benches"] = {
        ["gray_white_tv_table"] = {
            ["label"] = "Gray-white tv table",
            ["description"] = "A cool bench.",
            ["price"] = 5500,
            ["model"] = `apa_mp_h_str_sideboardl_13`
        },
        ["gray_white_tv_smaller_table"] = {
            ["label"] = "Gray-white smaller bench",
            ["description"] = "A cool bench.",
            ["price"] = 3600,
            ["model"] = `apa_mp_h_str_sideboards_01`
        },
        ["ek_colored_tv_table"] = {
            ["label"] = "Tree colored tv table",
            ["description"] = "A cool bench.",
            ["price"] = 4350,
            ["model"] = `apa_mp_h_str_sideboardm_02`
        },
    },

    ["Tables"] = {
        ["modern_triangle_table"] = {
            ["label"] = "Modern table",
            ["description"] = "Cool and fair table.",
            ["price"] = 3400,
            ["model"] = `apa_mp_h_tab_coffee_07`
        },
        ["square_glass_table"] = {
            ["label"] = "Quadrant table",
            ["description"] = "Cool and fair table.",
            ["price"] = 2500,
            ["model"] = `apa_mp_h_tab_sidelrg_07`
        },
        ["tree_ram_glass_table"] = {
            ["label"] = "Tree table",
            ["description"] = "Cool and fair table.",
            ["price"] = 4000,
            ["model"] = `apa_mp_h_yacht_coffee_table_02`
        },
        ["metal_table"] = {
            ["label"] = "Metal sofa table",
            ["description"] = "Cool and fair table.",
            ["price"] = 4250,
            ["model"] = `apa_mp_h_yacht_coffee_table_01`
        },
    },

    ["Paintings"] = {
        ["orange_painting"] = {
            ["label"] = "S - Orange painting",
            ["description"] = "A cool painting.",
            ["price"] = 1500,
            ["model"] = `apa_p_h_acc_artwalll_02`
        },
        ["blue_painting"] = {
            ["label"] = "Blue painting",
            ["description"] = "A cool painting.",
            ["price"] = 1850,
            ["model"] = `apa_p_h_acc_artwalll_01`
        },
        ["turqoise_painting"] = {
            ["label"] = "Turqouise painting",
            ["description"] = "A cool painting.",
            ["price"] = 2050,
            ["model"] = `apa_p_h_acc_artwallm_04`
        },
    },

    ["Electronics"] = {
        ["big_tv"] = {
            ["label"] = "Big TV",
            ["description"] = "A big tv with great quality.",
            ["price"] = 13000,
            ["model"] = `ex_prop_ex_tv_flat_01`
        },
        ["i_mac_keyboard"] = {
            ["label"] = "iMac with keyboard",
            ["description"] = "A shit (mac) computer.",
            ["price"] = 11000,
            ["model"] = `ex_prop_trailer_monitor_01`
        },
        ["black_laptop"] = {
            ["label"] = "Black laptop",
            ["description"] = "A quality computer.",
            ["price"] = 6500,
            ["model"] = `p_amb_lap_top_02`
        },
        ["i_max_keyboard"] = {
            ["label"] = "iMax with keyboard",
            ["description"] = "A quality computer.",
            ["price"] = 11000,
            ["model"] = `xm_prop_x17_computer_01`
        },
    },
}