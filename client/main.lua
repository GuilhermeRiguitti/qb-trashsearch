--[[ 
  qb-trashsearch
  Um sistema de vasculhamento de lixeiras para QBCore
  
  Desenvolvido por: Guilherme Riguitti
  GitHub: https://github.com/GuilhermeRiguitti
  
  Copyright (c) 2025 Guilherme Riguitti
]]--

local QBCore = exports['qb-core']:GetCoreObject()
local searched = {}
local canSearch = true

-- Function to check if the object is a trash bin
local function IsTrashBin(object)
    if object and DoesEntityExist(object) then
        local model = GetEntityModel(object)
        for i = 1, #Config.TrashBinModels do
            if model == GetHashKey(Config.TrashBinModels[i]) then
                return true
            end
        end
    end
    return false
end

-- Function to search trash bin
local function SearchTrashBin(entity)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local entityCoords = GetEntityCoords(entity)

    -- Check distance
    if #(pos - entityCoords) > 2.0 then
        return QBCore.Functions.Notify('Você está muito longe da lixeira', 'error')
    end

    -- Check if bin was already searched
    local entityId = NetworkGetNetworkIdFromEntity(entity)
    if searched[entityId] then
        return QBCore.Functions.Notify('Esta lixeira já foi vasculhada recentemente', 'error')
    end

    -- Check if player is already searching
    if not canSearch then
        return QBCore.Functions.Notify('Você já está vasculhando uma lixeira', 'error')
    end

    -- Start searching animation
    canSearch = false
    searched[entityId] = true
    
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_BUM_BIN", 0, true)
    QBCore.Functions.Progressbar("search_trash", "Vasculhando lixeira...", Config.SearchTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        ClearPedTasks(ped)
        TriggerServerEvent('qb-trashsearch:server:searchTrash')
        canSearch = true
        
        -- Reset the bin search cooldown after some time
        Citizen.SetTimeout(Config.SearchCooldown, function()
            searched[entityId] = false
        end)
    end, function() -- Cancel
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Cancelado...", "error")
        canSearch = true
    end)
end

-- Create Target Interactions if target system is enabled
Citizen.CreateThread(function()
    if Config.UseTarget then
        -- Add target for all trash bin models
        exports['qb-target']:AddTargetModel(Config.TrashBinModels, {
            options = {
                {
                    icon = "fas fa-dumpster",
                    label = "Vasculhar Lixeira",
                    action = function(entity)
                        SearchTrashBin(entity)
                    end,
                },
            },
            distance = 2.0,
        })
    else
        -- Key based interaction
        Citizen.CreateThread(function()
            local textUI = false
            while true do
                local sleep = 1000
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                
                -- Find closest trash bin
                local nearbyObject, nearbyID
                for i = 1, #Config.TrashBinModels do
                    local modelHash = GetHashKey(Config.TrashBinModels[i])
                    nearbyObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, modelHash, false, false, false)
                    
                    if DoesEntityExist(nearbyObject) then
                        nearbyID = NetworkGetNetworkIdFromEntity(nearbyObject)
                        break
                    end
                end
                
                -- If trash bin found, show interaction
                if nearbyObject and DoesEntityExist(nearbyObject) then
                    sleep = 0
                    if not textUI then
                        exports['qb-core']:DrawText('[E] Vasculhar Lixeira', 'left')
                        textUI = true
                    end
                    if IsControlJustPressed(0, 38) then -- E key
                        SearchTrashBin(nearbyObject)
                    end
                else
                    if textUI then
                        exports['qb-core']:HideText()
                        textUI = false
                    end
                end
                
                Citizen.Wait(sleep)
            end
        end)
    end
end)
