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
    -- Dumpsters
    'prop_dumpster_01a',
    'prop_dumpster_02a',
    'prop_dumpster_02b',
    'prop_dumpster_3a',
    'prop_dumpster_4a',
    'prop_dumpster_4b',
}

-- Items that can be found in trash bins with their probability
Config.Items = {
    -- Materials
    {name = 'metalscrap', label = 'Sucata de Metal', chance = 35, min = 1, max = 3},
    {name = 'plastic', label = 'Plástico', chance = 40, min = 1, max = 3},
    {name = 'copper', label = 'Cobre', chance = 25, min = 1, max = 2},
    {name = 'iron', label = 'Ferro', chance = 25, min = 1, max = 2},
    {name = 'aluminum', label = 'Alumínio', chance = 25, min = 1, max = 2},
    {name = 'steel', label = 'Aço', chance = 20, min = 1, max = 2},
    {name = 'rubber', label = 'Borracha', chance = 30, min = 1, max = 3},
    {name = 'glass', label = 'Vidro', chance = 35, min = 1, max = 3},
    
    -- Miscellaneous trash items (optional for realism)
    {name = 'empty_weed_bag', label = 'Saco Vazio', chance = 15, min = 1, max = 2},
    {name = 'empty_evidence_bag', label = 'Saco de Evidência Vazio', chance = 5, min = 1, max = 1},
}

-- Chance settings
Config.ChanceToFindNothing = 30 -- Percentage chance to find nothing
Config.MaxItemsPerSearch = 2 -- Maximum number of different items that can be found in one search
