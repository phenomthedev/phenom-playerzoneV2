local QBCore = exports['qb-core']:GetCoreObject()


function CheckDistanceAndTeleport()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local dist = #(playerCoords - Config.Center)

    if dist > Config.Radius then
        local teleportLocation = Config.TeleportLocations[math.random(#Config.TeleportLocations)]        
        SetEntityCoords(playerPed, teleportLocation.x, teleportLocation.y, teleportLocation.z)
        QBCore.Functions.Notify("You left the area, teleporting you back!", "error")
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(20000) 
        CheckDistanceAndTeleport()
    end
end)
