ESX       = nil
ESXLoaded = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
    ESXLoaded      = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    while not ESXLoaded do
        Citizen.Wait(10)
    end
    for k, v in pairs(Config.Shops) do

        local marker = {
            name       = v.name .. '_shop',
            type       = Config.Markers.types[v.type].marker,
            coords     = v.coords,
            colour     = Config.Markers.color[v.job],
            size       = vector3(0.5, 0.5, 0.5),
            dist       = Config.Markers.types[v.type].dist,
            msg        = 'Press ~INPUT_CONTEXT~ to open Garage at ' .. v.name,
            action     = function()
                OpenGarage(v)
            end,
            garage     = v,
            shouldDraw = function()
                return ESX.PlayerData.job.name == v.job
            end
        }
        TriggerEvent('disc-base:registerMarker', marker)
    end
end)

function OpenGarage(garage)

    local menu = {
        name    = 'garage',
        title   = 'Garage for ' .. garage.name,
        options = {
            { label = 'Garage', action = function()
                ShowCars(garage)
            end },
            { label = 'Store Nearby Vehicle', action = function()
                StoreCar(garage)
            end },
            { label = 'Claim Vehicle', action = function()
                ShowClaimCars(garage)
            end },
            { label = 'Buy Vehicle', action = function()
                ShowBuyCars(garage)
            end } , 
            { label = 'Return Vehicle' , action = function()
                ShowReturnVehicles(garage)
            end}
        }
    }
    TriggerEvent('disc-base:openMenu', menu)
end

function ShowCars(garage)
    ESX.TriggerServerCallback('disc-jobcars:getJobCars', function(foundCars)
        local cars = {}
        
        for k, v in pairs(foundCars) do
            for rank, rankveh in pairs(garage.cars) do
                for j = 1, #rankveh, 1 do
                    if v.model == rankveh[j].model then
                        local props       = json.decode(v.props)
                        local vehicleName = rankveh[j].name
                        local label       = ('%s - %s: '):format(vehicleName, props.plate)
                        local action
                        if v.stored then
                            label  = label .. ('%s'):format('Stored')
                            action = function()
                                SpawnCar(garage, props)
                            end
                        else
                            label  = label .. ('%s'):format('Out')
                            action = CannotSpawnCar
                        end

                        table.insert(cars, {
                            label  = label,
                            action = action
                        })
                        break
                    end
                end
            end
        end

        if #foundCars == 0 or #cars == 0 then
            exports['mythic_notify']:SendAlert('inform', 'No vehicle to spawn')
            return
        end

        local menu = {
            name    = 'garage_open',
            title   = 'Vehicles',
            options = cars
        }
        TriggerEvent('disc-base:openMenu', menu)
    end)
end

function ShowReturnVehicles(garage)
    ESX.TriggerServerCallback('disc-jobcars:getJobCars', function(foundCars)
        local cars = {}
        
        for k, v in pairs(foundCars) do
            for rank, rankveh in pairs(garage.cars) do
                for j = 1, #rankveh, 1 do
                    if v.model == rankveh[j].model then
                        local props       = json.decode(v.props)
                        local vehicleName = rankveh[j].name
                        local label       = ('%s - %s: '):format(vehicleName, props.plate)
                        local action
                        
                        label  = label .. ('%s'):format('Stored')
                        action = function()
                            ConfirmReturnCar(garage, props.plate)
                        end
                        

                        table.insert(cars, {
                            label  = label,
                            action = action
                        })
                        break
                    end
                end
            end
        end

        if #foundCars == 0 or #cars == 0 then
            exports['mythic_notify']:SendAlert('inform', 'No vehicle to return')
            return
        end

        local menu = {
            name    = 'garage_open',
            title   = 'Vehicles',
            options = cars
        }
        TriggerEvent('disc-base:openMenu', menu)
    end)
end

function SpawnCar(garage, props)
    local playerPed = PlayerPedId()
    exports['mythic_notify']:SendAlert('success', 'Spawned Vehicle')
    ESX.Game.SpawnVehicle(props.model, garage.coords, garage.heading, function(vehicle)
        ESX.Game.SetVehicleProperties(vehicle, props)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        TriggerServerEvent('disc-jobcars:spawnCar', props.plate)
        SetVehicleFuelLevel(vehicle, 100.0)
        DecorSetFloat(vehicle, "_FUEL_LEVEL",  GetVehicleFuelLevel(vehicle))
    end)
    ESX.UI.Menu.CloseAll()
end

function CannotSpawnCar()
    exports['mythic_notify']:SendAlert('error', 'Vehicle is Out')
end

function ShowBuyCars(garage)
    local cars = {}
    if garage.cars[ESX.PlayerData.job.grade_name] and #garage.cars[ESX.PlayerData.job.grade_name] > 0 then
        for k, v in pairs(garage.cars[ESX.PlayerData.job.grade_name]) do
            table.insert(cars, {
                label  = v.name .. (' $%s'):format(v.price),
                action = function()
                    ConfirmBuyCar(v, garage)
                end
            })
        end
    end
    if garage.cars['all'] then
        for k, v in pairs(garage.cars['all']) do
            table.insert(cars, {
                label  = v.name .. (' $%s'):format(v.price),
                action = function()
                    ConfirmBuyCar(v, garage)
                end
            })
        end
    end

    if #cars == 0 then
        exports['mythic_notify']:SendAlert('inform', 'No vehicle to buy for ' .. ESX.PlayerData.job.grade_name)
        return
    end

    local menu = {
        name    = 'garage_shop',
        title   = 'Shop',
        options = cars
    }

    TriggerEvent('disc-base:openMenu', menu)
end

function ConfirmReturnCar(garage, car)

    local options = {
        { label = ('%s'):format('Yes'), action = function()
            ReturnCar(car, garage)
        end },
        { label = ('%s'):format('No'), action = function()
            ESX.UI.Menu.Close('default', 'disc-base', 'garage_shop_confirm')
        end },
    }

    local menu    = {
        name    = 'garage_shop_confirm',
        title   = 'Confirm',
        options = options
    }
    TriggerEvent('disc-base:openMenu', menu)

end

function ConfirmBuyCar(car, garage)

    local options = {
        { label = ('%s for $%s'):format('Yes', car.price), action = function()
            BuyCar(car, garage)
        end },
        { label = ('%s>'):format('No'), action = function()
            ESX.UI.Menu.Close('default', 'disc-base', 'garage_shop_confirm')
        end },
    }

    local menu    = {
        name    = 'garage_shop_confirm',
        title   = 'Confirm',
        options = options
    }
    TriggerEvent('disc-base:openMenu', menu)

end

function ReturnCar(car, garage)

    local plate = car
    TriggerServerEvent('disc-jobcars:ReturnCar', plate)
    exports['mythic_notify']:SendAlert('success', 'Vehicle Returned!')
    ESX.UI.Menu.CloseAll()
   
end

function BuyCar(car, garage)
    ESX.TriggerServerCallback('disc-jobcars:canBuyCar', function(canbuy)
        if canbuy == 1 then
            exports['mythic_notify']:SendAlert('success', 'Bought Vehicle')

            ESX.Game.SpawnLocalVehicle(car.model, garage.shopCoords, 0.0, function(vehicle)
                SetEntityCollision(vehicle, false, true)
                FreezeEntityPosition(vehicle, true)

                local newPlate = exports['esx_vehicleshop']:GeneratePlate()
                local props    = ESX.Game.GetVehicleProperties(vehicle)
                props.plate    = newPlate

                TriggerServerEvent('disc-jobcars:buyCar', car, props, newPlate)
                ESX.Game.DeleteVehicle(vehicle)
            end)
            ESX.UI.Menu.CloseAll()
        elseif canbuy == 0 then
            exports['mythic_notify']:SendAlert('error', 'Not Enough Money')
        else
            exports['mythic_notify']:SendAlert('error', 'Failed to Buy')
        end
    end, car)
end

function StoreCar()
    local playerCoords            = GetEntityCoords(PlayerPedId())
    local vehicles, vehiclePlates = ESX.Game.GetVehiclesInArea(playerCoords, 30.0), {}

    if #vehicles > 0 then
        for k, v in ipairs(vehicles) do
            if GetVehicleNumberOfPassengers(v) == 0 and IsVehicleSeatFree(v, -1) then
                local props    = ESX.Game.GetVehicleProperties(v)
                table.insert(vehiclePlates, {
                    vehicle = v,
                    plate   = ESX.Math.Trim(GetVehicleNumberPlateText(v)),
                    props   = props,
                })
            end
        end
    else
        exports['mythic_notify']:SendAlert('error', 'No Vehicle Found')
        return
    end
    ESX.TriggerServerCallback('disc-jobcars:storeNearbyJobCar', function(storeSuccess, foundNum)
        if storeSuccess then
            local vehicleId = vehiclePlates[foundNum]
            local attempts  = 0
            ESX.Game.DeleteVehicle(vehicleId.vehicle)
            IsBusy = true

            -- Workaround for vehicle not deleting when other players are near it.
            while DoesEntityExist(vehicleId.vehicle) do
                attempts = attempts + 1

                -- Give up
                if attempts > 30 then
                    break
                end

                vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 30.0)
                if #vehicles > 0 then
                    for k, v in ipairs(vehicles) do
                        if ESX.Math.Trim(GetVehicleNumberPlateText(v)) == vehicleId.plate then
                            ESX.Game.DeleteVehicle(v)
                            break
                        end
                    end
                end
                Citizen.Wait(500)
            end

            IsBusy = false
            exports['mythic_notify']:SendAlert('success', 'Stored Vehicle')
        else
            exports['mythic_notify']:SendAlert('error', 'Failed to Store Vehicle')
        end
    end, vehiclePlates)

end

function ShowClaimCars(garage)
    ESX.TriggerServerCallback('disc-jobcars:getClaimableCars', function(foundCars)
        local cars = {}

        for k, v in pairs(foundCars) do
            for rank, rankveh in pairs(garage.cars) do
                for j = 1, #rankveh, 1 do
                    if v.model == rankveh[j].model then
                        local props       = json.decode(v.props)
                        local vehicleName = rankveh[j].name
                        local label       = ('%s - %s: '):format(vehicleName, props.plate)

                        table.insert(cars, {
                            label  = label,
                            action = function()
                                ClaimCar(props.plate)
                            end
                        })
                        break
                    end
                end
            end
        end

        if #foundCars == 0 or #cars == 0 then
            exports['mythic_notify']:SendAlert('inform', 'No vehicle to spawn')
            return
        end

        local menu = {
            name    = 'garage_claim',
            title   = 'Claim Vehicle',
            options = cars
        }
        TriggerEvent('disc-base:openMenu', menu)
    end)
end

function ClaimCar(plate)
    exports['mythic_notify']:SendAlert('Success', 'Claimed Vehicle for $' .. Config.ClaimPrice)
    ESX.UI.Menu.Close('default', 'disc-base', 'garage_claim')
    TriggerServerEvent('disc-jobcars:payClaim')
    TriggerServerEvent('disc-jobcars:storeCar', plate)
end