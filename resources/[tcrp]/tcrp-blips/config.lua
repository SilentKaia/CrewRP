Blips = {}
Config = {
    DefaultZ            = 100,              -- Default Z-Axis Coordinate
    DefaultSprite       = 1,                -- Determines the Sprite, see Blip ID's 
    DefaultColor        = 0,                -- Determines the Color, see Blip Color ID's
    DefaultScale        = 0.8,              -- Determines the size of the sprite. 1.0 is full size.
    DefaultType         = 1,                -- Changes category, 1 shows no distance, 2 shows distance, 7 is other players, 10 is property, 11 is owned property.
    DefaultOpacity      = 255,              -- Changes opacity, 0 is transparent, 255 is fully visible
    DefaultDisplay      = 2,                -- Changes how blip is displayed upon client script start, 0 doesn't show up at all, 2 is selectable both maps, 3 is selectable on main map only, 5 is on minimap only, 8 is unselectable on both maps. 
    DefaultHidden       = false,            -- If set to true, hides the blip from the legend on the main map.
    DefaultLayer        = 10,               -- Default layer the blip is set on, lower numbers appear underneath higher ones.
    DefaultText         = "New Blip",       -- Default text Displayed for Blips in legend
    DefaultName         = "Title",           -- Default name for blip location.
    DefaultDictionary   = "blip_images",
    DefaultImage        = "DefaultTCRP"
--[[

    --Default Layers--
    30 = Emergency Services, Important Buildings
    25 = Banks, Jewelry Store, Restaurants/Bars/Nightclubs, Unique Stores, 
    20 = Clothing Stores, Hair Salons, Tattoo Parlors, Jobs/Hobbies
    15 = Pharmacies, Digital Dens, Ammunations, Hardware Stores
    10 = LTD, Liquor Store, Car Wash
    5 = Garages, Public Trash, Apartments for Sale,
    1 = Property for Sale, Gas Stations, Car Washes, Atms
    

    --Format for adding new blips--
[1]  = {
    ["name"]    = "Insert Location Name Here, for future reference",
    ["x"] = 0, ["y"] = 0, ["z"] = 0,
    ["category"]= "what kind of blip this is, used for disabling blip categories",
    ["text"]    = "Blip Text",
    ["sprite"]  = 1, 
    ["color"]   = 1,
    ["scale"]   = 1.0,
    ["type"]    = 1,
    ["display"] = 2,
    ["opacity"] = 255,
    ["hidden"]  = false,
    ["Info.toggle"] = true/false toggles info box,
    ["Info.dictionary"] = "ytd filename for Info.Image",
    ["Info.image"] = "texture name", (Native Image Resolution is 432x240)
    ["Info.textLeft"] = "text line left",["Info.textRight"] = "text line right",
    ["Info.nameLeft"] = "text line left", ["Info.nameRight"] = "text line bold right",
    ----------
    ["Info.headerLeft"] = "text line left", ["Info.headerRight"] = "text line 3 right",
    ["Info.iconLeft"] = "text line left", ["Info.iconRight] = "text line right", ["Info.iconID"] = id for icon 1-25 on right, ["Info.iconColor"] = color for icon same as blip colors, ["Info.iconCheckmark"] = true/false adds a checkmark to the icon,
},

]]--

}
Blips.Main        = {
    --BANKS--
    [1]  = {
        ["name"]    = "Pacific Standard Bank",
        ["x"] = 249.51, ["y"] = 219.82,
        ["category"]= "Bank",
        ["text"]    = "Bank",
        ["sprite"]  = 500,
        ["color"]   = 69, 
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Bank",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "Russel White",
        ["Info.name2Left"] = "Phone",["Info.name2Right"] = "513-6282",
        ["Info.dictionary"] = "blip_images",
        ["Info.image"] = "Pacific Standard Bank",

    },
    [2]  = {
        ["name"]    = "Hawick Fleeca Bank",
        ["x"] = 313.66, ["y"] = -280.59,
        ["category"]= "Bank",
        ["text"]    = "Bank",
        ["sprite"]  = 500,
        ["color"]   = 69,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Bank",
    },
    [3]  = {
        ["name"]    = "Legion Bank and Trust",
        ["x"] = 149.28, ["y"] = -1042.15,
        ["category"]= "Bank",
        ["text"]    = "Bank",
        ["sprite"]  = 500,
        ["color"]   = 69,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Bank",
    },
    [4]  = {
        ["name"]    = "Great Ocean Fleeca Bank",
        ["x"] = -2961.10, ["y"] = 482.91,
        ["category"]= "Bank",
        ["text"]    = "Bank",
        ["sprite"]  = 500,
        ["color"]   = 69,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Bank",
    },
    [5]  = {
        ["name"]    = "Route 68 Fleeca Bank",
        ["x"] = 1175.13, ["y"] = 2708.29,
        ["category"]= "Bank",
        ["text"]    = "Bank",
        ["sprite"]  = 500,
        ["color"]   = 69,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Bank",
    },
    [6]  = {
        ["name"]    = "Blaine County Savings",
        ["x"] = -110.19, ["y"] = 6469.09,
        ["category"]= "Bank",
        ["text"]    = "Bank",
        ["sprite"]  = 500,
        ["color"]   = 69,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Bank",
    },
    [7]  = {
        ["name"]    = "Rockford Hills Fleeca Bank",
        ["x"] = -1211.90, ["y"] = -332.01,
        ["category"]= "Bank",
        ["text"]    = "Bank",
        ["sprite"]  = 500,
        ["color"]   = 69,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Bank",
    },
    [8]  = {
        ["name"]    = "Vinewood Fleeca Bank",
        ["x"] = -351.46, ["y"] = -51.24,
        ["category"]= "Bank",
        ["text"]    = "Bank",
        ["sprite"]  = 500,
        ["color"]   = 69,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Bank",
    },
    --AMMUNATIONS--
    [9]  = {
        ["name"]    = "Rockford Hills Ammunation",
        ["x"] = -1307.79, ["y"] = -393.0,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "No",
        
    },
    [10]  = {
        ["name"]    = "Vinewood Ammunation",
        ["x"] = 250.27, ["y"] = -48.55,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "No",
    },
    [11]  = {
        ["name"]    = "Little Seoul Ammunation",
        ["x"] = -662.92, ["y"] = -937.63,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "No",
    },
    [12]  = {
        ["name"]    = "Strawberry Ammunation",
        ["x"] = 20.66, ["y"] = -1109.07,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["scale"]   = 1.0,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "Yes",
    },
    [13]  = {
        ["name"]    = "Cypress Flats Ammunation",
        ["x"] = 810.87, ["y"] = -2155.01,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["scale"]   = 1.0,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "Yes",
    },
    [14]  = {
        ["name"]    = "Chumash Ammunation",
        ["x"] = -3170.08, ["y"] = 1086.30,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "No",
    },
    [15]  = {
        ["name"]    = "Route 68 Ammunation",
        ["x"] = -1116.73, ["y"] = 2696.38,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "No",
    },
    [16]  = {
        ["name"]    = "Sandy Shores Ammunation",
        ["x"] = 1694.76, ["y"] = 3757.77,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "No",
    },
    [17]  = {
        ["name"]    = "Paleto Bay Ammunation",
        ["x"] = -329.28, ["y"] = 6081.65,
        ["category"]= "Ammu-Nation",
        ["text"]    = "Ammu-Nation",
        ["sprite"]  = 110,
        ["color"]   = 22,
        ["layer"]   = 15,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Gun Store",
        ["Info.nameLeft"] = "Gun Range",["Info.nameRight"] = "No",
    },

    --Restaurants--
    [18]  = {
        ["name"]    = "Hookies",
        ["x"] = -2185.72, ["y"] = 4285.61,
        ["category"]= "Restaurant",
        ["text"]    = "Restaurant",
        ["sprite"]  = 628,
        ["color"]   = 73,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Restaurant",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [19]  = {
        ["name"]    = "Pop's Diner",
        ["x"] =  1589.66, ["y"] = 6456.26,
        ["category"]= "Restaurant",
        ["text"]    = "Restaurant",
        ["sprite"]  = 628,
        ["color"]   = 73,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Restaurant",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [20]  = {
        ["name"]    = "Rex's Diner",
        ["x"] =  2557.18, ["y"] = 2592.03,
        ["category"]= "Restaurant",
        ["text"]    = "Restaurant",
        ["sprite"]  = 628,
        ["color"]   = 73,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Restaurant",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [21]  = {
        ["name"]    = "Pearls",
        ["x"] =  -1829.85, ["y"] = -1190.71,
        ["category"]= "Restaurant",
        ["text"]    = "Restaurant",
        ["sprite"]  = 628,
        ["color"]   = 73,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Restaurant",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [22]  = {
        ["name"]    = "Burgershot",
        ["x"] =  -1193.28, ["y"] = -890.88,
        ["category"]= "Restaurant",
        ["text"]    = "Restaurant",
        ["sprite"]  = 628,
        ["color"]   = 73,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Restaurant",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [23]  = {
        ["name"]    = "Limey's",
        ["x"] =  -1242.11, ["y"] = -283.91,
        ["category"]= "Restaurant",
        ["text"]    = "Restaurant",
        ["sprite"]  = 628,
        ["color"]   = 73,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Restaurant",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [24]  = {
        ["name"]    = "Cherry Popper",
        ["x"] =  -464.57, ["y"] = -29.01,
        ["category"]= "Restaurant",
        ["text"]    = "Restaurant",
        ["sprite"]  = 628,
        ["color"]   = 73,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Restaurant",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [25]  = {
        ["name"]    = "Taco Farmer",
        ["x"] =  10.64, ["y"] = -1602.00,
        ["category"]= "Restaurant",
        ["text"]    = "Restaurant",
        ["sprite"]  = 628,
        ["color"]   = 73,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Restaurant",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    --Mechanics--
    [26]  = {
        ["name"]    = "Mechanic",
        ["x"] =  -337.38, ["y"] = -136.92,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [27]  = {
        ["name"]    = "Mechanic",
        ["x"] =  -1155.53, ["y"] = -2007.18,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [28]  = {
        ["name"]    = "Mechanic",
        ["x"] =  731.81, ["y"] = -1088.82,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [29]  = {
        ["name"]    = "Mechanic",
        ["x"] =  1175.04, ["y"] = 2640.21,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [30]  = {
        ["name"]    = "Mechanic",
        ["x"] =  110.23, ["y"] = 6627.9,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [31]  = {
        ["name"]    = "Mechanic",
        ["x"] =  -1550.1, ["y"] = -3181.79,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Aircraft Mechanic",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [32]  = {
        ["name"]    = "Mechanic",
        ["x"] =  -1423.63, ["y"] = -450.18,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [33]  = {
        ["name"]    = "Mechanic",
        ["x"] =  978.28, ["y"] = -123.31,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [34]  = {
        ["name"]    = "Mechanic",
        ["x"] =  -30.11, ["y"] = -1060.42,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [35]  = {
        ["name"]    = "Mechanic",
        ["x"] =  488.16, ["y"] =  -1313.68,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [36]  = {
        ["name"]    = "Mechanic",
        ["x"] =  1776.84, ["y"] =  3335.06,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [37]  = {
        ["name"]    = "Mechanic",
        ["x"] =  -221.13, ["y"] =  -1329.29,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Mechanic Shop",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [38]  = {
        ["name"]    = "Mechanic",
        ["x"] =  -798.4, ["y"] =  -1500.8,
        ["category"]= "Mechanic Shop",
        ["text"]    = "Mechanic Shop",
        ["sprite"]  = 446,
        ["color"]   = 46,
        ["layer"]   = 20,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Watercraft Mechanic",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    --Other Stores--
    [39]  = {
        ["name"]    = "Cindy's Flower Shop",
        ["x"] =  -1183.29, ["y"] =  -1193.05,
        ["category"]= "Other Stores",
        ["text"]    = "Flower Shop",
        ["sprite"]  = 431,
        ["color"]   = 7,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Store",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    [40]  = {
        ["name"]    = "Bowling Alley",
        ["x"] =  -153.38, ["y"] =  -246.94,
        ["category"]= "Other Stores",
        ["text"]    = "Bowling Alley",
        ["sprite"]  = 685,
        ["color"]   = 0,
        ["scale"]   = 1.0,
        ["layer"]   = 25,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Recreation",
        ["Info.nameLeft"] = "Owner",["Info.nameRight"] = "",
    },
    --Hobby Fuel--
    [41]  = {
        ["name"]    = "Sell Essense",
        ["x"] =  148.09, ["y"] =  -2391.45,
        ["category"]= "Fuel Hobby",
        ["text"]    = "Hobby - Fuel",
        ["sprite"]  = 415,
        ["color"]   = 69,
        ["layer"]   = 20,
        ["scale"]   = 1.0,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Hobby",
        ["Info.nameLeft"] = "Type",["Info.nameRight"] = "Fuel",
    },
    [42]  = {
        ["name"]    = "Gather Oil",
        ["x"] =  1649.91, ["y"] =  -1858.33,
        ["category"]= "Fuel Hobby",
        ["text"]    = "Hobby - Fuel",
        ["sprite"]  = 415,
        ["color"]   = 69,
        ["layer"]   = 20,
        ["scale"]   = 1.0,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Hobby",
        ["Info.nameLeft"] = "Type",["Info.nameRight"] = "Fuel",
    },
    [43]  = {
        ["name"]    = "Refine Oil",
        ["x"] =  305.25, ["y"] =  -2734.30,
        ["category"]= "Fuel Hobby",
        ["text"]    = "Hobby - Fuel",
        ["sprite"]  = 415,
        ["color"]   = 69,
        ["layer"]   = 20,
        ["scale"]   = 1.0,
        ["Info.toggle"] = true,
        ["Info.textLeft"] = "Category", ["Info.textRight"] = "Hobby",
        ["Info.nameLeft"] = "Type",["Info.nameRight"] = "Fuel",
    },
}

ATM = {}
ATM.Config = {
    ["text"]    = "ATM",
    ["sprite"]  = 272,
    ["display"] = 4,
    ["color"]   = 2, 
    ["scale"]   = 0.55,
    ["layer"]   = 1,
    ["opacity"] = 200,
    ["hidden"] = true,
}
ATM.Blips= {
    {['x'] = -0386.733, ['y']  =  6045.95},
    {['x'] = -0110.753, ['y']  =  6467.70},
    {['x'] =  0155.430, ['y']  =  6641.99},
    {['x'] =  0174.672, ['y']  =  6637.21},
    {['x'] =  1703.138, ['y']  =  6426.78},
    {['x'] =  1735.114, ['y']  =  6411.03},
    {['x'] =  1702.842, ['y']  =  4933.59},
    {['x'] =  1967.333, ['y']  =  3744.29},
    {['x'] =  1174.532, ['y']  =  2705.27},
    {['x'] =  2564.399, ['y']  =  2585.10},
    {['x'] =  2558.683, ['y']  =  0349.60},
    {['x'] =  2558.051, ['y']  =  0389.48},
    {['x'] =  1077.692, ['y']  = -0775.79},
    {['x'] =  1139.018, ['y']  = -0469.88},
    {['x'] =  1168.975, ['y']  = -0457.24},
    {['x'] =  1153.884, ['y']  = -0326.54},
    {['x'] =  0236.463, ['y']  =  0217.47},
    {['x'] =  0265.004, ['y']  =  0212.17},
    {['x'] = -0164.568, ['y']  =  0233.50},
    {['x'] = -1827.040, ['y']  =  0785.51},
    {['x'] = -1409.390, ['y']  = -0099.26},
    {['x'] = -1215.640, ['y']  = -0332.23},
    {['x'] = -2072.410, ['y']  = -0316.95},
    {['x'] = -2975.720, ['y']  =  0379.77},
    {['x'] = -2962.600, ['y']  =  0482.19},
    {['x'] = -3144.130, ['y']  =  1127.41},
    {['x'] = -1305.400, ['y']  = -0706.24},
    {['x'] = -0717.614, ['y']  = -0915.88},
    {['x'] = -0526.566, ['y']  = -1222.90},
    {['x'] =  0149.455, ['y']  = -1038.95},
    {['x'] = -0846.304, ['y']  = -0340.40},
    {['x'] = -1216.270, ['y']  = -0331.46},
    {['x'] = -0056.193, ['y']  = -1752.53},
    {['x'] = -0273.001, ['y']  = -2025.60},
    {['x'] =  0314.187, ['y']  = -0278.62},
    {['x'] = -0351.534, ['y']  = -0049.52},
    {['x'] = -1570.197, ['y']  = -0546.65},
    {['x'] =  0033.232, ['y']  = -1347.84},
    {['x'] =  0129.216, ['y']  = -1292.34},
    {['x'] =  0289.012, ['y']  = -1256.54},
    {['x'] =  1686.753, ['y']  =  4815.80},
    {['x'] = -0302.408, ['y']  = -0829.94},
    {['x'] =  0005.134, ['y']  = -0919.94},
    {['x'] = -0284.037, ['y']  =  6224.38},
    {['x'] = -0135.165, ['y']  =  6365.73},
    {['x'] = -0094.969, ['y']  =  6455.30},
    {['x'] =  1821.917, ['y']  =  3683.48},
    {['x'] =  0540.042, ['y']  =  2671.00},
    {['x'] =  0381.282, ['y']  =  0323.25},
    {['x'] =  0285.202, ['y']  =  0143.56},
    {['x'] =  0157.769, ['y']  =  0233.54},
    {['x'] = -1205.350, ['y']  = -0325.57},
    {['x'] = -2955.700, ['y']  =  0488.72},
    {['x'] = -3044.220, ['y']  =  0595.24},
    {['x'] = -3241.100, ['y']  =  0996.68},
    {['x'] = -3241.110, ['y']  =  1009.15},
    {['x'] = -0538.225, ['y']  = -0854.42},
    {['x'] = -0711.156, ['y']  = -0818.95},
    {['x'] = -0256.831, ['y']  = -0719.64},
    {['x'] = -0203.548, ['y']  = -0861.58},
    {['x'] =  0112.410, ['y']  = -0776.16},
    {['x'] =  0112.929, ['y']  = -0818.71},
    {['x'] =  0119.900, ['y']  = -0883.82},
    {['x'] = -0261.692, ['y']  = -2012.64},
    {['x'] = -0254.112, ['y']  = -0692.48},
    {['x'] = -1415.909, ['y']  = -0211.82},
    {['x'] = -1430.122, ['y']  = -0211.01},
    {['x'] =  0287.645, ['y']  = -1282.64},
    {['x'] =  0295.839, ['y']  = -0895.64},
    {['x'] = -1315.730, ['y']  = -0834.89},
    {['x'] =  0146.070, ['y']  = -1035.10},
    {['x'] =  0147.660, ['y']  = -1035.71},
}

GAS = {}
GAS.Config = {
    ["text"]    = "Gas Station",
    ["sprite"]  = 415,
    ["layer"]   = 1,
    ["opacity"] = 200,
}
GAS.Blips = {
    {['x'] =  0049.418, ['y']  =  2778.79}, 
    {['x'] =  0263.894, ['y']  =  2606.46},
    {['x'] =  1039.958, ['y']  =  2671.13},
    {['x'] =  1207.260, ['y']  =  2660.18},
    {['x'] =  2539.685, ['y']  =  2594.19},
    {['x'] =  2679.858, ['y']  =  3263.95},
    {['x'] =  2005.055, ['y']  =  3773.89},
    {['x'] =  1687.156, ['y']  =  4929.39},
    {['x'] =  1701.314, ['y']  =  6416.03},
    {['x'] =  0179.857, ['y']  =  6602.84},
    {['x'] = -0094.461, ['y']  =  6419.59},
    {['x'] = -2554.996, ['y']  =  2334.40},
    {['x'] = -1800.375, ['y']  =  0803.66},
    {['x'] = -1437.622, ['y']  = -0276.75},
    {['x'] = -2096.243, ['y']  = -0320.28},
    {['x'] = -0724.619, ['y']  = -0935.16}, 
    {['x'] = -0526.019, ['y']  = -1211.00},
    {['x'] = -0070.214, ['y']  = -1761.79},
    {['x'] =  0265.648, ['y']  = -1261.31},
    {['x'] =  0819.653, ['y']  = -1028.84},
    {['x'] =  1208.951, ['y']  = -1402.57},
    {['x'] =  1181.381, ['y']  = -0330.85},
    {['x'] =  0620.843, ['y']  =  0269.10},
    {['x'] =  2581.321, ['y']  =  0362.04},
    {['x'] =  0176.631, ['y']  = -1562.03},
    {['x'] =  0176.631, ['y']  = -1562.03},
    {['x'] = -0319.292, ['y']  = -1471.71},
    {['x'] =  1784.324, ['y']  =  3330.55},
}

STORE = {}
STORE.Config= {
    ["text"]    = "Store",
    ["color"]   = 11,
    ["sprite"]  = 59,
    ["layer"]   = 10,
}
STORE.Blips = {
    {["x"] =   0029.41,  ["y"] = -1345.01},
    {["x"] =  -0048.34,  ["y"] = -1752.72},
    {["x"] =  -1220.78,  ["y"] = -0909.19},
    {["x"] =  -1485.59,  ["y"] = -0376.70},
    {["x"] =  -0711.01,  ["y"] = -0911.25},
    {["x"] =   1132.94,  ["y"] = -0983.19},
    {["x"] =   0378.80,  ["y"] =  0329.64},
    {["x"] =   1157.88,  ["y"] = -0319.42},
    {["x"] =   2552.75,  ["y"] =  0386.28}, 
    {["x"] =  -3042.26,  ["y"] =  0588.50},
    {["x"] =  -3246.45,  ["y"] =  1005.64},
    {["x"] =  -2964.96,  ["y"] =  0391.33},
    {["x"] =  -1827.64,  ["y"] =  0793.31},
    {["x"] =   0544.43,  ["y"] =  2666.07},
    {["x"] =   1167.02,  ["y"] =  2711.82},
    {["x"] =   2676.55,  ["y"] =  3286.27},
    {["x"] =   1962.33,  ["y"] =  3746.67},
    {["x"] =   1391.23,  ["y"] =  3609.29},
    {["x"] =   1705.22,  ["y"] =  4925.39},
    {["x"] =   1734.64,  ["y"] =  6417.04},
    {["x"] =  -0162.50,  ["y"] =  6321.38},
}       

PARKING = {}
PARKING.Config = {
    ["text"]    = "Public Parking",
    ["color"]   = 39,
    ["sprite"]  = 357,
    ["layer"]   = 1,
}
PARKING.Blips = {
    {['x'] =   0452.01,  ['y']  =  -1075.57}, 
    {['x'] =   0430.82,  ['y']  =  -0631.92}, 
    {['x'] =   0278.07,  ['y']  =  -0345.85}, 
    {['x'] =   1737.59,  ['y']  =   3710.20}, 
    {['x'] =   0105.36,  ['y']  =   6613.58}, 
    {['x'] =   1865.96,  ['y']  =   2706.25}, 
    {['x'] =   1212.32,  ['y']  =   0339.94}, 
    {['x'] =  -1199.43,  ['y']  =  -1483.47}, 
    {['x'] =  -3143.80,  ['y']  =   1051.23}, 
    {['x'] =   0049.93,  ['y']  =  -1734.65}, 
    {['x'] =  -0570.39,  ['y']  =   0313.67}, 
    {['x'] =   0287.66,  ['y']  =   0962.80}, 
    {['x'] =   1691.01,  ['y']  =   4785.00}, 
    {['x'] =  -0769.22,  ['y']  =   5593.27}, 
    {['x'] =  -0341.04,  ['y']  =   6240.33},
    {['x'] =   1171.86,  ['y']  =  -1524.01}, 
    {['x'] =  -1890.18,  ['y']  =   2044.35}, 
} 

PHARMACY = {}
PHARMACY.Config = {
    ["text"]    = "Pharmacy",
    ["color"]   = 1,
    ["sprite"]  = 403,
    ["layer"]   = 15,
}
PHARMACY.Blips = {
    {['x'] =   0095.83,  ['y']  =  -0229.50}, 
    {['x'] =   0302.73,  ['y']  =  -0732.75}, 
    {['x'] =   0320.31,  ['y']  =  -1075.70}, 
    {['x'] =  -0175.17,  ['y']  =   6383.40},     
} 
DIGITAL = {}
DIGITAL.Config = {
    ["text"]    = "Digital Den",
    ["color"]   = 35,
    ["sprite"]  = 71,
    ["layer"]   = 15,
}
DIGITAL.Blips = {
    ["x"]      = -633.22, ["y"] = -281.99,
    ["x"]      = -658.82, ["y"] = -858.82,
    ["x"]      = 1131.92, ["y"] = -474.17,
}

HAIR = {}
HAIR.Config = {
    ["text"]    = "Hair Stylist",
    ["color"]   = 35,
    ["sprite"]  = 71,
    ["layer"]   = 20,
}
HAIR.Blips = {
    {['x'] = -814.308,  ['y'] = -183.823},
	{['x'] =  136.826,  ['y'] = -1708.373},
	{['x'] = -1282.604, ['y'] = -1116.757},
	{['x'] =  1931.513, ['y'] = 3729.671},
	{['x'] =  1212.840, ['y'] = -472.921},
	{['x'] = -32.885,   ['y'] = -152.319},
	{['x'] = -278.077,  ['y'] = 6228.463},
}

CARWASH = {}
CARWASH.Config = {
    ["text"]    = "Car Wash",
    ["sprite"]  = 100,
    ["layer"]   = 15,
}
CARWASH.Blips = {
    {['x'] =   0026.59,  ['y']  =  -1392.03},
    {['x'] =   0167.10,  ['y']  =  -1719.47},
    {['x'] =  -0074.57,  ['y']  =   6427.87},
    {['x'] =  -0699.63,  ['y']  =  -0932.70},
    {['x'] =  -1485.05,  ['y']  =  -3223.50},
    {['x'] =   1182.53,  ['y']  =   2638.34},
    {['x'] =   1200.87,  ['y']  =  -1454.26},
    {['x'] =   0327.19,  ['y']  =  -0541.04},
    {['x'] =   0994.02,  ['y']  =  -0112.73},
    {['x'] =   0735.58,  ['y']  =  -1071.46},
    {['x'] =  -0029.18,  ['y']  =  -1042.33},
    {['x'] =  -0198.64,  ['y']  =  -1324.34},
    {['x'] =  -1167.22,  ['y']  =  -2013.31},
    {['x'] =  -0326.91,  ['y']  =  -0144.82},
    {['x'] =   1695.15,  ['y']  =   4916.51},
    {['x'] =   0103.80,  ['y']  =   6622.60},
}    
TATTOO = {}
TATTOO.Config = {
    ["text"]    = "Tattoo Parlor",
    ["color"]   = 1,
    ["sprite"]  = 75,
    ["layer"]   = 20,
}
TATTOO.Blips = {
    {['x'] =   1322.64,  ['y']  =  -1651.97},
    {['x'] =  -1153.67,  ['y']  =  -1425.68},
    {['x'] =   0322.13,  ['y']  =   0180.46},
    {['x'] =  -3170.07,  ['y']  =   1075.05},
    {['x'] =   1864.63,  ['y']  =   3747.74},
    {['x'] =  -0293.71,  ['y']  =   6200.04},
}

CLOTHING = {}
CLOTHING.Config = {
    ["text"]    = "Clothing Store",
    ["color"]   = 10,
    ["sprite"]  = 73,
    ["layer"]   = 20,
}
CLOTHING.Blips = {
    {['x'] =   0072.25,  ['y']  =  -1399.102},
    {['x'] =  -0703.77,  ['y']  =  -0152.258},
    {['x'] =  -0167.86,  ['y']  =  -0298.969},
    {['x'] =   0428.69,  ['y']  =  -0800.106},
    {['x'] =  -0829.41,  ['y']  =  -1073.710},
    {['x'] =  -1447.79,  ['y']  =  -0242.461},
    {['x'] =   0011.63,  ['y']  =   6514.224},
    {['x'] =   0123.64,  ['y']  =  -0219.440},
    {['x'] =   1696.29,  ['y']  =   4829.312},
    {['x'] =   0618.09,  ['y']  =   2759.629},
    {['x'] =   1190.55,  ['y']  =   2713.441},
    {['x'] =  -1193.42,  ['y']  =  -0772.262},
    {['x'] =  -3172.49,  ['y']  =   1048.133},
    {['x'] =  -1108.44,  ['y']  =   2708.923},
} 