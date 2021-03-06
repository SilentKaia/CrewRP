toggle = true
-- Loads any texture dictionaries needed for any blips --
Citizen.CreateThread(function()
    for k,v in pairs(Blips.Main) do
        if Blips.Main[k] ~= nil then
            local blip = Blips.Main[k]
            RequestStreamedTextureDict(blip["Info.dictionary"], 1)
            while not HasStreamedTextureDictLoaded(blip["Info.dictionary"])  do
                Citizen.Wait(1)
            end
        end
    end
end)

-- Handles the Main Group of Blips --
for k,v in pairs(Blips.Main) do
    local blip = Blips.Main[k]
    if blip and blip["sprite"]~= -1 then
        if not DoesBlipExist(blip["id"]) then
            blip["id"] = AddBlipForCoord(blip["x"], blip["y"], blip["z"] or Config.DefaultZ)
            SetBlipSprite(blip["id"], blip["sprite"] or Config.DefaultSprite)
            SetBlipDisplay(blip["id"], blip["display"] or Config.DefaultDisplay)
            SetBlipAlpha(blip["id"], blip["opacity"] or Config.DefaultOpacity)
            SetBlipCategory(blip["id"], blip["type"] or Config.DefaultType)
            SetBlipPriority(blip["id"], blip["layer"] or Config.DefaultLayer)
            SetBlipScale(blip["id"], blip["scale"] or Config.DefaultScale)
            SetBlipColour(blip["id"], blip["color"] or Config.DefaultColor)
            SetBlipHiddenOnLegend(blip["id"], blip["hidden"] or Config.DefaultHidden)
            if blip["checkmark"] ~= nil then
                ShowTickOnBlip(blip, blip["checkmark"])
            end
            if blip["blueoutline"] ~= nil then
                ShowOutlineIndicatorOnBlip(blip, blip["blueoutline"])
            end
            if blip["shrink"] ~= nil then
                SetBlipShrink(blip, blip["shrink"])
            end
            if blip["number"] ~= nil then
                ShowNumberOnBlip(blip, blip["number"])
            end
            if blip["outlineonly"] ~= nil then
                SetRadiusBlipEdge(blip, blip["outlineonly"])
            end

            if blip["color2red"] and blip["color2green"] and blip["color2blue"] ~= nil then
                SetBlipSecondaryColour(blip, blip["color2red"], blip["color2green"], blip["color2blue"])
            end
            if blip["cone"] ~= nil then
                SetBlipShowCone(blip, blip["cone"])
            end
            if blip["rotation"] ~= nil then
                SetBlipRotation(blip["id"], blip["rotation"])
            end
            if blip["scaleX"] or blip["scaleY"] then
                SetBlipScaleTransformation(blip["id"], blip["scaleX"] or 1.0,blip["scaleY"] or 1.0)
            end
            if blip["Info.toggle"] == true then
                exports['blip_info']:SetBlipInfoTitle(blip["id"], blip["Info.title"] or blip["name"], false)
                exports['blip_info']:SetBlipInfoImage(blip["id"], blip["Info.dictionary"] or Config.DefaultDictionary, blip["Info.image"] or Config.DefaultImage)
            end
            if blip["Info.textLeft"] and blip["Info.textRight"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.textLeft"], blip["Info.textRight"])
            end
            if blip["Info.nameLeft"] and blip["Info.nameRight"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.nameLeft"], blip["Info.nameRight"])
            end
            if blip["Info.text2Left"] and blip["Info.text2Right"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.text2Left"], blip["Info.text2Right"])
            end
            if blip["Info.name2Left"] and blip["Info.name2Right"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.name2Left"], blip["Info.name2Right"])
            end
            if blip["Info.text3Left"] and blip["Info.text3Right"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.text3Left"], blip["Info.text3Right"])
            end
            if blip["Info.name3Left"] and blip["Info.name3Right"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.name3Left"], blip["Info.name3Right"])
            end
            if blip["Info.text4Left"] and blip["Info.text4Right"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.text4Left"], blip["Info.text4Right"])
            end
            if blip["Info.name4Left"] and blip["Info.name4Right"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.name4Left"], blip["Info.name4Right"])
            end
            if blip["Info.text5Left"] and blip["Info.text5Right"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.text5Left"], blip["Info.text5Right"])
            end
            if blip["Info.name5Left"] and blip["Info.name5Right"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.name5Left"], blip["Info.name5Right"])
            end
            if blip["Info.headerLeft"] and blip["Info.headerRight"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.headerLeft"], blip["Info.headerRight"])
            end
            if blip["Info.header2Left"] and blip["Info.header2Right"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.header2Left"], blip["Info.header2Right"])
            end
            if blip["Info.header3Left"] and blip["Info.header3Right"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.header3Left"], blip["Info.header3Right"])
            end
            if blip["Info.header4Left"] and blip["Info.header4Right"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.header4Left"], blip["Info.header4Right"])
            end
            if blip["Info.header5Left"] and blip["Info.header5Right"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.header5Left"], blip["Info.header5Right"])
            end
            if blip["Info.header6Left"] and blip["Info.header6Right"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.header6Left"], blip["Info.header6Right"])
            end
            if blip["Info.header7Left"] and blip["Info.header7Right"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.header7Left"], blip["Info.header7Right"])
            end
            if blip["Info.iconLeft"] and blip["Info.iconRight"] and blip["Info.iconID"] and blip["Info.iconColor"] and blip ["Info.iconCheckmark"] ~= nil then
                exports['blip_info']:AddBlipInfoIcon(blip["id"], blip["Info.iconLeft"], blip["Info.iconRight"], blip["Info.iconID"], blip["Info.iconColor"], blip["Info.iconCheckmark"])
            end
            if blip["Info.icon2Left"] and blip["Info.icon2Right"] and blip["Info.icon2ID"] and blip["Info.icon2Color"] and blip ["Info.icon2Checkmark"] ~= nil then
                exports['blip_info']:AddBlipInfoIcon(blip["id"], blip["Info.icon2Left"], blip["Info.icon2Right"], blip["Info.icon2ID"], blip["Info.icon2Color"], blip["Info.icon2Checkmark"])
            end
            if blip["Info.icon3Left"] and blip["Info.icon3Right"] and blip["Info.icon3ID"] and blip["Info.icon3Color"] and blip ["Info.icon3Checkmark"] ~= nil then
                exports['blip_info']:AddBlipInfoIcon(blip["id"], blip["Info.icon3Left"], blip["Info.icon3Right"], blip["Info.icon3ID"], blip["Info.icon3Color"], blip["Info.icon3Checkmark"])
            end
            SetBlipAsShortRange(blip["id"], true)
            if blip["text"] ~= nil then 
                bliptext = blip["text"]
            else 
                bliptext = "New Blip"
            end
            AddTextEntry("blips", bliptext)
            BeginTextCommandSetBlipName("blips")
            EndTextCommandSetBlipName(blip["id"])
        end
    end
end

-- Handles Creating the Bulk Blips --
for k,v in pairs(Bulkblips) do
    for i = 1, #v.Blips, 1 do
        local blip = AddBlipForCoord(v.Blips[i].x, v.Blips[i].y, v.Blips[i].z or Config.DefaultZ)
        SetBlipSprite(blip, v.Config["sprite"] or Config.DefaultSprite)
        SetBlipDisplay(blip, v.Config["display"] or Config.DefaultDisplay)
        SetBlipAlpha(blip, v.Config["opacity"] or Config.DefaultOpacity) 
        SetBlipCategory(blip, v.Config["type"] or Config.DefaultType)
        SetBlipPriority(blip, v.Config["layer"] or Config.DefaultLayer)
        SetBlipScale(blip, v.Config["scale"] or Config.DefaultScale)
        SetBlipColour(blip, v.Config["color"] or Config.DefaultColor)
        SetBlipHiddenOnLegend(blip, v.Config["hidden"] or Config.DefaultHidden)
        SetBlipAsShortRange(blip, true)
        local bliptable = v.Config["text"]
        AddTextEntry(bliptable, v.Config["text"])
        BeginTextCommandSetBlipName(bliptable)
        EndTextCommandSetBlipName(blip)
    end
end

RegisterNetEvent("tcrp-blips:addblip")
AddEventHandler("tcrp-blips:addblip", function(blipconfig, entity)
    local blip = nil
    if entity ~= nil then
        blip = AddBlipForEntity(entity)
    else
        blip = AddBlipForCoord(blipconfig["x"], blipconfig["y"], blipconfig["z"] or Config.DefaultZ)
    end
    SetBlipSprite(blip, blipconfig["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, blipconfig["display"] or Config.DefaultDisplay)
    SetBlipCategory(blip, blipconfig["type"] or Config.DefaultType)
    SetBlipPriority(blip, blipconfig["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, blipconfig["scale"] or Config.DefaultScale)
    SetBlipColour(blip, blipconfig["color"] or Config.DefaultColor)
    SetBlipHiddenOnLegend(blip, blipconfig["hidden"] or Config.DefaultHidden)
    if blipconfig["duration"] ~= nil then
        DeleteBlip(blip,blipconfig["duration"])
    end
    if blipconfig["rotation"] ~= nil then
        SetBlipRotation(blip, blipconfig["rotation"])
    end
    if blipconfig["height"] ~= nil then
        ShowHeightOnBlip(blip, blipconfig["height"])
    end
    if blipconfig["checkmark"] ~= nil then
        ShowTickOnBlip(blip, blipconfig["checkmark"])
    end
    if blipconfig["blueoutline"] ~= nil then
        ShowOutlineIndicatorOnBlip(blip, blipconfig["blueoutline"])
    end
    if blipconfig["shrink"] ~= nil then
        SetBlipShrink(blip, blipconfig["shrink"])
    end
    if blipconfig["number"] ~= nil then
        ShowNumberOnBlip(blip, blipconfig["number"])
    end
    if blipconfig["outlineonly"] ~= nil then
        SetRadiusBlipEdge(blip, blipconfig["outlineonly"])
    end
    if blipconfig["color2red"] and blipconfig["color2green"] and blipconfig["color2blue"] ~= nil then
        SetBlipSecondaryColour(blip, blipconfig["color2red"], blipconfig["color2green"], blipconfig["color2blue"])
    end
    if blipconfig["cone"] ~= nil then
        SetBlipShowCone(blip, blipconfig["cone"])
    end
    if blipconfig["scaleX"] or blipconfig["scaleY"] ~= nil then
        SetBlipScaleTransformation(blip, blipconfig["scaleX"] or 1.0, blipconfig["scaleY"] or 1.0)
    end
    if blipconfig["Info.toggle"] == true then
        exports['blip_info']:SetBlipInfoTitle(blip, blipconfig["Info.title"] or blipconfig["name"], false)
        exports['blip_info']:SetBlipInfoImage(blip, blipconfig["Info.dictionary"] or Config.DefaultDictionary, blipconfig["Info.image"] or Config.DefaultImage)
    end
    if blipconfig["Info.textLeft"] and blipconfig["Info.textRight"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.textLeft"], blipconfig["Info .textRight"])
    end
    if blipconfig["Info.nameLeft"] and blipconfig["Info.nameRight"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.nameLeft"], blipconfig["Info.nameRight"])
    end
    if blipconfig["Info.text2Left"] and blipconfig["Info.text2Right"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text2Left"], blipconfig["Info.text2Right"])
    end
    if blipconfig["Info.name2Left"] and blipconfig["Info.name2Right"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name2Left"], blipconfig["Info.name2Right"])
    end
    if blipconfig["Info.text3Left"] and blipconfig["Info.text3Right"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text3Left"], blipconfig["Info.text3Right"])
    end
    if blipconfig["Info.name3Left"] and blipconfig["Info.name3Right"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name3Left"], blipconfig["Info.name3Right"])
    end
    if blipconfig["Info.text4Left"] and blipconfig["Info.text4Right"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text4Left"], blipconfig["Info.text4Right"])
    end
    if blipconfig["Info.name4Left"] and blipconfig["Info.name4Right"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name4Left"], blipconfig["Info.name4Right"])
    end
    if blipconfig["Info.text5Left"] and blipconfig["Info.text5Right"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text5Left"], blipconfig["Info.text5Right"])
    end
    if blipconfig["Info.name5Left"] and blipconfig["Info.name5Right"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name5Left"], blipconfig["Info.name5Right"])
    end
    if blipconfig["Info.headerLeft"] and blipconfig["Info.headerRight"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.headerLeft"], blipconfig["Info.headerRight"])
    end
    if blipconfig["Info.header2Left"] and blipconfig["Info.header2Right"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header2Left"], blipconfig["Info.header2Right"])
    end
    if blipconfig["Info.header3Left"] and blipconfig["Info.header3Right"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header2Left"], blipconfig["Info.header2Right"])
    end
    if blipconfig["Info.header4Left"] and blipconfig["Info.header4Right"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header4Left"], blipconfig["Info.header4Right"])
    end
    if blipconfig["Info.header5Left"] and blipconfig["Info.header5Right"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header5Left"], blipconfig["Info.header5Right"])
    end
    if blipconfig["Info.header6Left"] and blipconfig["Info.header6Right"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header6Left"], blipconfig["Info.header6Right"])
    end
    if blipconfig["Info.header7Left"] and blipconfig["Info.header7Right"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header7Left"], blipconfig["Info.header7Right"])
    end
    if blipconfig["Info.iconLeft"] and blipconfig["Info.iconRight"] and blipconfig["Info.iconID"] and blipconfig["Info.iconColor"] and blip ["Info.iconCheckmark"] ~= nil then
        exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.iconLeft"], blipconfig["Info.iconRight"], blipconfig["Info.iconID"], blipconfig["Info.iconColor"], blipconfig["Info.iconCheckmark"])
    end
    if blipconfig["Info.icon2Left"] and blipconfig["Info.icon2Right"] and blipconfig["Info.icon2ID"] and blipconfig["Info.icon2Color"] and blip ["Info.icon2Checkmark"] ~= nil then
        exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.icon2Left"], blipconfig["Info.icon2Right"], blipconfig["Info.icon2ID"], blipconfig["Info.icon2Color"], blipconfig["Info.icon2Checkmark"])
    end
    if blipconfig["Info.icon3Left"] and blipconfig["Info.icon3Right"] and blipconfig["Info.icon3ID"] and blipconfig["Info.icon3Color"] and blip ["Info.icon3Checkmark"] ~= nil then
        exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.icon3Left"], blipconfig["Info.icon3Right"], blipconfig["Info.icon3ID"], blipconfig["Info.icon3Color"], blipconfig["Info.icon3Checkmark"])
    end
    if not blipconfig["longrange"] then
        SetBlipAsShortRange(blip, true)
    else
        SetBlipAsShortRange(blip, false)
    end
    if blipconfig["text"] ~= nil then 
        bliptext = blipconfig["text"]
    else 
        bliptext = "New Blip"
    end
    if blipconfig["flash"] ~= nil and blipconfig["flashinterval"] ~= nil then
        SetBlipFlashes(blip, blipconfig["flash"])
        SetBlipFlashInterval(blip, blipconfig["flashinterval"])
    end
    AddTextEntry("blips", bliptext)
    BeginTextCommandSetBlipName("blips")
    EndTextCommandSetBlipName(blip)
end)


RegisterNetEvent("tcrp-blips:removeblip")
AddEventHandler("tcrp-blips:removeblip", function(blip)
    RemoveBlip(blip)
end)

RegisterNetEvent("tcrp-blips:updateblip")
AddEventHandler("tcrp-blips:updateblip", function(blipsource, table)
    local blip = nil
    local entityblip = GetBlipFromEntity(blipsource)
    local blipconfig = table
    if entityblip ~= nil or 0 then 
        local blip = entityblip
    elseif blipsource ~= nil or 0 then 
        local blip = blipsource
    else
        local blip = nil
    end
    if blip ~= nil then
        if blipconfig["sprite"] ~= nil then
            SetBlipSprite(blip, blipconfig["sprite"])
        end
        if blipconfig["display"] ~= nil then
            SetBlipDisplay(blip, blipconfig["display"])
        end
        if blipconfig["opacity"] ~= nil then
            SetBlipAlpha(blip, blipconfig["opacity"])
        end
        if blipconfig["type"] ~= nil then
        SetBlipCategory(blip, blipconfig["type"])
        end
        if blipconfig["layer"] ~= nil then
        SetBlipPriority(blip, blipconfig["layer"])
        end
        if blipconfig["scale"] ~= nil then
        SetBlipScale(blip, blipconfig["scale"])
        end
        if blipconfig["color"] ~= nil then
        SetBlipColour(blip, blipconfig["color"])
        end
        if blipconfig["hidden"] ~= nil then
        SetBlipHiddenOnLegend(blip, blipconfig["hidden"])
        end
        if blipconfig["rotation"] ~= nil then
            SetBlipRotation(blip, blipconfig["rotation"])
        end
        if blipconfig["scaleX"] or blipconfig["scaleY"] ~= nil then
            SetBlipScaleTransformation(blip, blipconfig["scaleX"] or 1.0,blipconfig["scaleY"] or 1.0)
        end
        if blipconfig["checkmark"] ~= nil then
            ShowTickOnBlip(blip, blipconfig["checkmark"])
        end
        if blipconfig["blueoutline"] ~= nil then
            ShowOutlineIndicatorOnBlip(blip, blipconfig["blueoutline"])
        end
        if blipconfig["shrink"] ~= nil then
            SetBlipShrink(blip, blipconfig["shrink"])
        end
        if blipconfig["number"] ~= nil then
            ShowNumberOnBlip(blip, blipconfig["number"])
        end
        if blipconfig["outlineonly"] ~= nil then
            SetRadiusBlipEdge(blip, blipconfig["outlineonly"])
        end
        if blipconfig["color2red"] and blipconfig["color2green"] and blipconfig["color2blue"] ~= nil then
            SetBlipSecondaryColour(blip, blipconfig["color2red"], blipconfig["color2green"], blipconfig["color2blue"])
        end
        if blipconfig["cone"] ~= nil then
            SetBlipShowCone(blip, blipconfig["cone"])
        end
        if blipconfig["Info.toggle"] == true then
            exports['blip_info']:SetBlipInfoTitle(blip, blipconfig["Info.title"] or blipconfig["name"], false)
            exports['blip_info']:SetBlipInfoImage(blip, blipconfig["Info.dictionary"] or Config.DefaultDictionary, blipconfig["Info.image"] or Config.DefaultImage)
        end
        if blipconfig["Info.textLeft"] and blipconfig["Info.textRight"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.textLeft"], blipconfig["Info.textRight"])
        end
        if blipconfig["Info.nameLeft"] and blipconfig["Info.nameRight"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.nameLeft"], blipconfig["Info.nameRight"])
        end
        if blipconfig["Info.text2Left"] and blipconfig["Info.text2Right"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text2Left"], blipconfig["Info.text2Right"])
        end
        if blipconfig["Info.name2Left"] and blipconfig["Info.name2Right"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name2Left"], blipconfig["Info.name2Right"])
        end
        if blipconfig["Info.text3Left"] and blipconfig["Info.text3Right"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text3Left"], blipconfig["Info.text3Right"])
        end
        if blipconfig["Info.name3Left"] and blipconfig["Info.name3Right"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name3Left"], blipconfig["Info.name3Right"])
        end
        if blipconfig["Info.text4Left"] and blipconfig["Info.text4Right"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text4Left"], blipconfig["Info.text4Right"])
        end
        if blipconfig["Info.name4Left"] and blipconfig["Info.name4Right"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name4Left"], blipconfig["Info.name4Right"])
        end
        if blipconfig["Info.text5Left"] and blipconfig["Info.text5Right"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text5Left"], blipconfig["Info.text5Right"])
        end
        if blipconfig["Info.name5Left"] and blipconfig["Info.name5Right"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name5Left"], blipconfig["Info.name5Right"])
        end
        if blipconfig["Info.headerLeft"] and blipconfig["Info.headerRight"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.headerLeft"], blipconfig["Info.headerRight"])
        end
        if blipconfig["Info.header2Left"] and blipconfig["Info.header2Right"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header2Left"], blipconfig["Info.header2Right"])
        end
        if blipconfig["Info.header3Left"] and blipconfig["Info.header3Right"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header3Left"], blipconfig["Info.header3Right"])
        end
        if blipconfig["Info.header4Left"] and blipconfig["Info.header4Right"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header4Left"], blipconfig["Info.header4Right"])
        end
        if blipconfig["Info.header5Left"] and blipconfig["Info.header5Right"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header5Left"], blipconfig["Info.header5Right"])
        end
        if blipconfig["Info.header6Left"] and blipconfig["Info.header6Right"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header6Left"], blipconfig["Info.header6Right"])
        end
        if blipconfig["Info.header7Left"] and blipconfig["Info.header7Right"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header7Left"], blipconfig["Info.header7Right"])
        end
        if blipconfig["Info.iconLeft"] and blipconfig["Info.iconRight"] and blipconfig["Info.iconID"] and blipconfig["Info.iconColor"] and blip ["Info.iconCheckmark"] ~= nil then
            exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.iconLeft"], blipconfig["Info.iconRight"], blipconfig["Info.iconID"], blipconfig["Info.iconColor"], blipconfig["Info.iconCheckmark"])
        end
        if blipconfig["Info.icon2Left"] and blipconfig["Info.icon2Right"] and blipconfig["Info.icon2ID"] and blipconfig["Info.icon2Color"] and blip ["Info.icon2Checkmark"] ~= nil then
            exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.icon2Left"], blipconfig["Info.icon2Right"], blipconfig["Info.icon2ID"], blipconfig["Info.icon2Color"], blipconfig["Info.icon2Checkmark"])
        end
        if blipconfig["Info.icon3Left"] and blipconfig["Info.icon3Right"] and blipconfig["Info.icon3ID"] and blipconfig["Info.icon3Color"] and blip ["Info.icon3Checkmark"] ~= nil then
            exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.icon3Left"], blipconfig["Info.icon3Right"], blipconfig["Info.icon3ID"], blipconfig["Info.icon3Color"], blipconfig["Info.icon3Checkmark"])
        end
        SetBlipAsShortRange(blip, blipconfig["range"] or true)
    end
end)

function DeleteBlip(blip, duration)
    Citizen.CreateThread(function()
        Citizen.Wait(duration * 1000)
        RemoveBlip(blip)
    end)
end