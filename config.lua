--[[ 
  qb-trashsearch
  Um sistema de vasculhamento de lixeiras para QBCore
  
  Desenvolvido por: Guilherme Riguitti
  GitHub: https://github.com/GuilhermeRiguitti
  
  Copyright (c) 2025 Guilherme Riguitti
]]--

Config = {}

-- General settings
Config.SearchTime = 5000 -- Time in ms to search a trash bin
Config.SearchCooldown = 30000 -- Time in ms before a player can search the same bin again
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target for interactions

-- Props that can be searched (trash bins models)
Config.TrashBinModels = {
    -- Small trash bins
    'prop_bin_01a',
    'prop_bin_03a',
    'prop_bin_05a',
    'prop_bin_06a',
    'prop_bin_07a',
    'prop_bin_07b',
    'prop_bin_07c',
    'prop_bin_07d',
    'prop_bin_08a',
    'prop_bin_08open',
    'prop_bin_09a',
    'prop_bin_10a',
    'prop_bin_10b',
    'prop_bin_11a',
    'prop_bin_11b',
    'prop_bin_12a',
    'prop_bin_13a',
    'prop_bin_14a',
    'prop_bin_14b',
    'prop_bin_beach_01a',
    'prop_bin_beach_01d',
    'prop_recyclebin_01a',
    'prop_recyclebin_02_c',
    'prop_recyclebin_02_d',
    'prop_recyclebin_02a',
    'prop_recyclebin_02b',
    'prop_recyclebin_03_a',
    'prop_recyclebin_04_a',
    'prop_recyclebin_04_b',
    'prop_recyclebin_05_a',
    -- Dumpsters
    'prop_dumpster_01a',
    'prop_dumpster_02a',
    'prop_dumpster_02b',
    'prop_dumpster_3a',
    'prop_dumpster_4a',
    'prop_dumpster_4b',
    -- Cardboard boxes
    'prop_box_ammo01a',
    'prop_box_ammo02a',
    'prop_box_ammo03a',
    'prop_box_ammo04a',
    'prop_box_ammo05b',
    'prop_box_ammo06a',
    'prop_box_ammo07a',
    'prop_box_ammo07b',
    -- Garbage bags and piles
    'prop_rub_binbag_01',
    'prop_rub_binbag_01b',
    'prop_rub_binbag_03',
    'prop_rub_binbag_03b',
    'prop_rub_binbag_04',
    'prop_rub_binbag_05',
    'prop_rub_binbag_06',
    'prop_rub_binbag_08',
    'prop_rub_binbag_sd_01',
    'prop_rub_binbag_sd_02',
    'prop_rub_buswreck_01',
    'prop_rub_buswreck_03',
    'prop_rub_buswreck_06',
    'prop_rub_pile_01',
    'prop_rub_pile_02',
    'prop_rub_pile_03',
    'prop_rub_pile_04',
}

-- Items that can be found in trash bins with their probability
Config.Items = {
    -- Materials
    {name = 'metalscrap', label = 'Sucata de Metal', chance = 60, min = 3, max = 10},
    {name = 'plastic', label = 'Plástico', chance = 40, min = 3, max = 10},
    {name = 'copper', label = 'Cobre', chance = 60, min = 3, max = 10},
    {name = 'iron', label = 'Ferro', chance = 25, min = 3, max = 10},
    {name = 'aluminum', label = 'Alumínio', chance = 60, min = 3, max = 10},
    {name = 'steel', label = 'Aço', chance = 60, min = 3, max = 10},
    {name = 'rubber', label = 'Borracha', chance = 60, min = 3, max = 10},
    {name = 'glass', label = 'Vidro', chance = 35, min = 3, max = 10},
    
    -- Miscellaneous trash items (optional for realism)
    {name = 'empty_weed_bag', label = 'Saco Vazio', chance = 8, min = 1, max = 1},
    {name = 'empty_evidence_bag', label = 'Saco de Evidência Vazio', chance = 5, min = 1, max = 1},
}

-- Chance settings
Config.ChanceToFindNothing = 10 -- Percentage chance to find nothing
Config.MaxItemsPerSearch = 3 -- Maximum number of different items that can be found in one search
