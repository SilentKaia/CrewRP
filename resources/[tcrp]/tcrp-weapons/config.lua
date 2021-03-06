Config = {}

Config.DefaultDamageModifier = 1.0
Config.StunTime = 5000

--[[
    These stack. IE if you have a group apply a modifier of 0.5 and a specific weapon
    apply a modifer of 0.5, the total modifier will be 0.25.
]]
Config.AdditionalModifiers = {
    groups = {
    },
    weapons = {
    },
}

-- Weapons to pull from belt
Config.BeltWeapons = {
    GetHashKey('WEAPON_PISTOL'),
    GetHashKey('WEAPON_PDPISTOL'),
    GetHashKey('WEAPON_PDREVOLVER'),
    GetHashKey('WEAPON_PISTOL_MK2'),
    GetHashKey('WEAPON_SNSPISTOL'),
    GetHashKey('WEAPON_SNSPISTOL_MK2'),
    GetHashKey('WEAPON_COMBATPISTOL'),
    GetHashKey('WEAPON_APPISTOL'),
    GetHashKey('WEAPON_HEAVYPISTOL'),
    GetHashKey('WEAPON_TASER2'),
    GetHashKey('WEAPON_PISTOL50'),
    GetHashKey('WEAPON_VINTAGEPISTOL'),
    GetHashKey('WEAPON_DOUBLEACTION'),
    GetHashKey('WEAPON_REVOLVER'),
    GetHashKey('WEAPON_REVOLVER_MK2'),
    GetHashKey('WEAPON_CERAMICPISTOL'),
    GetHashKey('WEAPON_NAVYREVOLVER'),
    GetHashKey('WEAPON_FLASHLIGHT'),
    GetHashKey('WEAPON_NIGHTSTICK'),
    
}

--Male T-Shirt Holsters
Config.maleShirtHolster = {
    122,
    130,
    174,
}

Config.maleChainHolster = {
    136,
    140,
    141,
    155,
    157,
    159,
}

--Female Tshirt Hoslters
Config.femaleShirtHolster = { 
    152,
    160,
    212,
}

Config.femaleChainHolster = { 
    105,
    109,
    110,
    116,
    118,
    120,
}

Config.MeleeDamage = {
    ["WEAPON_UNARMED"]          = 0.5,              
    --Sharp-- (Pierces Armor)
    ["WEAPON_KNIFE"]            = 0.5,              
    ["WEAPON_DAGGER"]           = 0.6,          
    ["WEAPON_SWITCHBLADE"]      = 0.5,              
    ["WEAPON_MACHETE"]          = 0.6,          
    ["WEAPON_BOTTLE"]           = 0.5,          
    --Blunt--
    ["WEAPON_NIGHTSTICK"]       = 0.5,           
    ["WEAPON_HAMMER"]           = 0.5,       
    ["WEAPON_BAT"]              = 0.6,   
    ["WEAPON_GOLFCLUB"]         = 0.6,       
    ["WEAPON_KNUCKLE"]          = 0.5,       
    ["WEAPON_POOLCUE"]          = 0.6,       
    ["WEAPON_WRENCH"]           = 0.5,
    ["WEAPON_FLASHLIGHT"]       = 0.4,
    --Chop-- 
    ["WEAPON_BATTLEAXE"]        = 0.6,         
    ["WEAPON_CROWBAR"]          = 0.5,          
    ["WEAPON_HATCHET"]          = 0.6,          
    ["WEAPON_STONE_HATCHET"]    = 0.5,                  
}
