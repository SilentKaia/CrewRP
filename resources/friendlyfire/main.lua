Citizen.CreateThread(function()
    --PvP Enabled
    while true do
        Citizen.Wait(0)
        SetCanAttackFriendly(GetPlayerPed(-1), true, false)
        NetworkSetFriendlyFireOption(true)
    end
end)