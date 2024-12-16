local QBCore = exports['qb-core']:GetCoreObject()
local isNightVisionActive = false
local isThermalVisionActive = false
local thermalCooldown = false
local cooldownEndTime = 0

local Emote = {
    On = { Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 600 },
    Off = { Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 600 },
}

RegisterNetEvent('arslan-vision:useNightVision', function()
    local playerPed = PlayerPedId()
    if not isNightVisionActive then
        RequestAnimDict(Emote.On.Dict)
        while not HasAnimDictLoaded(Emote.On.Dict) do
            Citizen.Wait(10)
        end
        TaskPlayAnim(playerPed, Emote.On.Dict, Emote.On.Anim, 8.0, -8.0, Emote.On.Dur, Emote.On.Move, 0, false, false, false)
        Citizen.Wait(Emote.On.Dur)
        ClearPedTasks(playerPed)
        SetNightvision(true)
        isNightVisionActive = true
        QBCore.Functions.Notify('Night Vision Açıldı', 'success')
    else
        RequestAnimDict(Emote.Off.Dict)
        while not HasAnimDictLoaded(Emote.Off.Dict) do
            Citizen.Wait(10)
        end
        TaskPlayAnim(playerPed, Emote.Off.Dict, Emote.Off.Anim, 8.0, -8.0, Emote.Off.Dur, Emote.Off.Move, 0, false, false, false)
        Citizen.Wait(Emote.Off.Dur)
        ClearPedTasks(playerPed)
        SetNightvision(false)
        isNightVisionActive = false
        QBCore.Functions.Notify('Night Vision Kapatıldı', 'error')
    end
end)

RegisterNetEvent('arslan-vision:useThermalVision', function()
    local playerPed = PlayerPedId()
    local currentTime = GetGameTimer()
    
    if currentTime < cooldownEndTime then
        local timeLeft = math.ceil((cooldownEndTime - currentTime) / 1000)
        QBCore.Functions.Notify('Thermal Vision Çok Isındı ' .. timeLeft .. ' sn sonra tekrar kullanılabilir.', 'error')
        return
    end

    if isThermalVisionActive then
        RequestAnimDict(Emote.Off.Dict)
        while not HasAnimDictLoaded(Emote.Off.Dict) do
            Citizen.Wait(10)
        end
        TaskPlayAnim(playerPed, Emote.Off.Dict, Emote.Off.Anim, 8.0, -8.0, Emote.Off.Dur, Emote.Off.Move, 0, false, false, false)
        Citizen.Wait(Emote.Off.Dur)
        ClearPedTasks(playerPed)
        SetSeethrough(false)
        isThermalVisionActive = false
        QBCore.Functions.Notify('Thermal Vision Kapatıldı', 'error')
        cooldownEndTime = GetGameTimer() + 240000
        return
    end

    RequestAnimDict(Emote.On.Dict)
    while not HasAnimDictLoaded(Emote.On.Dict) do
        Citizen.Wait(10)
    end
    TaskPlayAnim(playerPed, Emote.On.Dict, Emote.On.Anim, 8.0, -8.0, Emote.On.Dur, Emote.On.Move, 0, false, false, false)
    Citizen.Wait(Emote.On.Dur)
    ClearPedTasks(playerPed)
    SetSeethrough(true)
    isThermalVisionActive = true
    QBCore.Functions.Notify('Thermal Vision Açıldı', 'success')

    CreateThread(function()
        Citizen.Wait(120000)
        if isThermalVisionActive then
            SetSeethrough(false)
            isThermalVisionActive = false
            QBCore.Functions.Notify('Thermal Vision Çok Isındı', 'error')
            cooldownEndTime = GetGameTimer() + 240000
        end
    end)
end)
