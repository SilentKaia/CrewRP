RegisterServerEvent('vk_main:addMoney')
AddEventHandler('vk_main:addMoney', function(price)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        user:addMoney((price))
    end)
end)

RegisterServerEvent('vk_main:addMoneyToTarget')
AddEventHandler('vk_main:addMoneyToTarget', function(price, target)
    TriggerEvent('es:getPlayerFromId', target, function(user)
        user:addMoney((price))
    end)
end)