local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('nightvision', function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer then
        TriggerClientEvent('arslan-vision:useNightVision', source)
    end
end)

QBCore.Functions.CreateUseableItem('thermalvision', function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer then
        TriggerClientEvent('arslan-vision:useThermalVision', source)
    end
end)
