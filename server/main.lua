--[[ 
  qb-trashsearch
  Um sistema de vasculhamento de lixeiras para QBCore
  
  Desenvolvido por: Guilherme Riguitti
  GitHub: https://github.com/GuilhermeRiguitti
  
  Copyright (c) 2025 Guilherme Riguitti
]]--

local QBCore = exports['qb-core']:GetCoreObject()

-- Server event for searching trash
RegisterNetEvent('qb-trashsearch:server:searchTrash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    -- Check if player finds nothing
    if math.random(1, 100) <= Config.ChanceToFindNothing then
        TriggerClientEvent('QBCore:Notify', src, "Você não encontrou nada útil", "error")
        return
    end
    
    -- Determine how many different items the player will find (1 to MaxItemsPerSearch)
    local itemCount = math.random(1, Config.MaxItemsPerSearch)
    local foundItems = {}
    local possibleItems = Config.Items
    
    -- Shuffle the items array for randomness
    for i = #possibleItems, 2, -1 do
        local j = math.random(i)
        possibleItems[i], possibleItems[j] = possibleItems[j], possibleItems[i]
    end
    
    -- Try to add items based on their chance
    for i = 1, #possibleItems do
        if #foundItems >= itemCount then break end
        
        local item = possibleItems[i]
        if math.random(1, 100) <= item.chance then
            local amount = math.random(item.min, item.max)
            
            -- Add item to player's inventory
            local added = Player.Functions.AddItem(item.name, amount)
            if added then
                table.insert(foundItems, {label = item.label, amount = amount})
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], 'add')
            end
        end
    end
    
    -- Notify player about found items
    if #foundItems > 0 then
        local itemsText = "Você encontrou: "
        for i, item in ipairs(foundItems) do
            itemsText = itemsText .. item.amount .. "x " .. item.label
            if i < #foundItems then
                itemsText = itemsText .. ", "
            end
        end
        TriggerClientEvent('QBCore:Notify', src, itemsText, "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "Você não encontrou nada útil", "error")
    end
end)
