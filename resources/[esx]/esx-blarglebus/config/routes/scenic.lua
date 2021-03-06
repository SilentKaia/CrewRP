ScenicRoute = {
    Name                = 'scenic_route',
    BusModel            = 'coach',
    Capacity            = 5,
    Doors               = { 0, 1, 2, 3 },
    FirstSeat           = 1,
    -- SpawnPoint = {x = 427.6807, y = -582.7913, z = 28.5165, heading = 135.64},
    SpawnPoint          = { x = 453.9, y = -584.44, z = 28.5165, heading = 97.77 },
    Payment             = 2000,
    PaymentPerPassenger = 10,
    Lines               = {
        {
            Name     = 'scenic_route',
            BusColor = 39,
            Stops    = {
                { x = 424.7632, y = -638.9176, z = 28.5001, name = 'stop_dashound', unloadType = UnloadType.All },
                { x = -2973.2265, y = 408.1283, z = 15.1100, name = 'stop_banham_canyon', unloadType = UnloadType.Some },
                { x = -2522.2990, y = 2340.5200, z = 33.0598, name = 'stop_lago_zancudo', unloadType = UnloadType.Some },
                { x = -2201.1, y = 4249.89, z = 46.9, name = 'stop_north_chumash', unloadType = UnloadType.Some },
                { x = -1525.0812, y = 4949.1962, z = 61.9035, name = 'stop_chiliad', unloadType = UnloadType.Some },
                { x = -329.8910, y = 6185.0571, z = 31.6218, name = 'stop_paleto_bay', unloadType = UnloadType.Some },
                { x = 1658.6237, y = 4857.0190, z = 41.2123, name = 'stop_grapeseed', unloadType = UnloadType.Some },
                { x = 1962.9892, y = 3710.2802, z = 32.2184, name = 'stop_sandy_shores', unloadType = UnloadType.Some },
                { x = 2237.2424, y = 3190.7673, z = 48.7102, name = 'stop_senora_park', unloadType = UnloadType.Some },
                { x = 549.9940, y = 2700.2866, z = 42.1508, name = 'stop_harmony', unloadType = UnloadType.Some },
                { x = 424.7632, y = -638.9176, z = 28.5001, name = 'stop_dashound', unloadType = UnloadType.All },
            }
        }
    }
}
