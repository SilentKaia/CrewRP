ESX              = nil
local Categories = {}
local Vehicles   = {}

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

TriggerEvent('esx_phone:registerNumber', 'cardealer', _U('dealer_customers'), false, false)
for s, z in pairs(Config.Zones) do
	TriggerEvent('esx_society:registerSociety', s, Config.Labels[s], 'society_' .. s, 'society_' .. s, 'society_' .. s,
				 { type = 'private' })
end

function RemoveOwnedVehicle(plate)
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	})
end

MySQL.ready(function()
	Categories     = MySQL.Sync.fetchAll('SELECT * FROM vehicle_categories')
	local vehicles = MySQL.Sync.fetchAll('SELECT * FROM vehicles')

	for i = 1, #vehicles, 1 do
		local vehicle = vehicles[i]

		for j = 1, #Categories, 1 do
			if Categories[j].name == vehicle.category then
				vehicle.categoryLabel = Categories[j].label
				break
			end
		end

		table.insert(Vehicles, vehicle)
	end

	-- send information after db has loaded, making sure everyone gets vehicle information
	TriggerClientEvent('esx_vehicleshop:sendCategories', -1, Categories)
	TriggerClientEvent('esx_vehicleshop:sendVehicles', -1, Vehicles)
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwned')
AddEventHandler('esx_vehicleshop:setVehicleOwned', function(vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
						{
							['@owner']   = xPlayer.identifier,
							['@plate']   = vehicleProps.plate,
							['@vehicle'] = json.encode(vehicleProps)
						}, function(rowsChanged)
			TriggerClientEvent('esx:showNotification', _source, _U('vehicle_belongs', vehicleProps.plate))
		end)
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwnedPlayerId')
AddEventHandler('esx_vehicleshop:setVehicleOwnedPlayerId', function(playerId, vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
						{
							['@owner']   = xPlayer.identifier,
							['@plate']   = vehicleProps.plate,
							['@vehicle'] = json.encode(vehicleProps)
						}, function(rowsChanged)
			TriggerClientEvent('esx:showNotification', playerId, _U('vehicle_belongs', vehicleProps.plate))
		end)
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwnedSociety')
AddEventHandler('esx_vehicleshop:setVehicleOwnedSociety', function(society, vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
						{
							['@owner']   = 'society:' .. society,
							['@plate']   = vehicleProps.plate,
							['@vehicle'] = json.encode(vehicleProps),
						}, function(rowsChanged)

		end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:sellVehicle', function(source, cb, vehicle)
	MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
		['@vehicle'] = vehicle
	}, function(result)
		local id      = result[1].id
		local price   = result[1].price
		local society = result[1].society

		TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
			if account.money >= price then
				account.removeMoney(price)
				MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
					['@id'] = id
				})
				cb(true)
			else
				cb(false)
			end
		end)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:rentVehicle',
						   function(source, cb, vehicle, plate, playerName, basePrice, rentPrice, target)
							   local xPlayer = ESX.GetPlayerFromId(target)

							   MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1',
													{
														['@vehicle'] = vehicle
													}, function(result)
									   local id      = result[1].id
									   local price   = result[1].price
									   local society = result[1].society
									   local owner   = xPlayer.identifier

									   TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
										   if account.money >= price then
											   MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
												   ['@id'] = id
											   })

											   MySQL.Async.execute('INSERT INTO rented_vehicles (vehicle, plate, player_name, base_price, rent_price, owner) VALUES (@vehicle, @plate, @player_name, @base_price, @rent_price, @owner)',
																   {
																	   ['@vehicle']     = vehicle,
																	   ['@plate']       = plate,
																	   ['@player_name'] = playerName,
																	   ['@base_price']  = basePrice,
																	   ['@rent_price']  = rentPrice,
																	   ['@owner']       = owner
																   })
											   cb(true)
										   else
											   cb(false)
										   end
									   end)
								   end)
						   end)

-- unused?
RegisterServerEvent('esx_vehicleshop:setVehicleForAllPlayers')
AddEventHandler('esx_vehicleshop:setVehicleForAllPlayers', function(props, x, y, z, radius)
	TriggerClientEvent('esx_vehicleshop:setVehicle', -1, props, x, y, z, radius)
end)

RegisterServerEvent('esx_vehicleshop:getStockItem')
AddEventHandler('esx_vehicleshop:getStockItem', function(itemName, count, society)
	local _source    = source
	local xPlayer    = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_' .. society, function(inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_in_society'))
		end
	end)
end)

RegisterServerEvent('esx_vehicleshop:takeRentalPayments')
AddEventHandler('esx_vehicleshop:takeRentalPayments', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
		MySQL.Async.fetchAll('SELECT * FROM rented_vehicles WHERE owner = @owner', {
			['@owner'] = xPlayer.identifier
		}, function(result)
			if result then
				for i = 1, #result, 1 do
					if result[i].payments > 0 then
						local rental_payment = result[i].rent_price * result[i].payments
						xPlayer.removeAccountMoney('bank', rental_payment)
						TriggerClientEvent('esx:showNotification', xPlayer.source,
										   _U('paid_rental', result[i].payments, ESX.Math.GroupDigits(rental_payment)))
						MySQL.Async.execute('UPDATE rented_vehicles SET payments = 0 WHERE plate = @plate',
											{ ['@plate'] = result[i].plate })
					end
				end
			end
		end)
	end
end)

RegisterServerEvent('esx_vehicleshop:putStockItems')
AddEventHandler('esx_vehicleshop:putStockItems', function(itemName, count, society)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_' .. society, function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _source, _U('have_deposited', count, item.label))
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getCategories', function(source, cb)
	cb(Categories)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehicles', function(source, cb)
	cb(Vehicles)
end)

ESX.RegisterServerCallback('esx_vehicleshop:buyVehicle', function(source, cb, vehicleModel)
	local xPlayer     = ESX.GetPlayerFromId(source)
	local vehicleData = nil

	for i = 1, #Vehicles, 1 do
		if Vehicles[i].model == vehicleModel then
			vehicleData = Vehicles[i]
			break
		end
	end

	if xPlayer.getMoney() >= vehicleData.price then
		xPlayer.removeMoney(vehicleData.price)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:buyVehicleSociety', function(source, cb, society, vehicleModel)
	local vehicleData = nil

	for i = 1, #Vehicles, 1 do
		if Vehicles[i].model == vehicleModel then
			vehicleData = Vehicles[i]
			break
		end
	end

	MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, price, society) VALUES (@vehicle, @price, @society)',
						{
							['@vehicle'] = vehicleData.model,
							['@price']   = vehicleData.price,
							['@society'] = 'society_' .. society
						}, function(rowsChanged)
			cb(true)
		end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getPersonnalVehicles', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
		['@owner'] = xPlayer.identifier
	}, function(result)
		local vehicles = {}

		for i = 1, #result, 1 do
			local vehicleData = json.decode(result[i].vehicle)
			table.insert(vehicles, vehicleData)
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getCommercialVehicles', function(source, cb, society)
	print(society)
	MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles WHERE society = @society ORDER BY vehicle ASC', {
		['@society'] = 'society_' .. society
	}, function(result)
		local vehicles = {}

		for i = 1, #result, 1 do
			table.insert(vehicles, {
				name  = result[i].vehicle,
				price = result[i].price
			})
		end

		cb(vehicles)
	end)
end)

RegisterServerEvent('esx_vehicleshop:returnProvider')
AddEventHandler('esx_vehicleshop:returnProvider', function(vehicleModel)
	local _source = source

	MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
		['@vehicle'] = vehicleModel
	}, function(result)

		if result[1] then
			local id    = result[1].id
			local price = ESX.Round(result[1].price * 0.75)

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
				account.addMoney(price)
			end)

			MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
				['@id'] = id
			})

			TriggerClientEvent('esx:showNotification', _source,
							   _U('vehicle_sold_for', vehicleModel, ESX.Math.GroupDigits(price)))
		else

			print(('esx_vehicleshop: %s attempted selling an invalid vehicle!'):format(GetPlayerIdentifiers(_source)[1]))
		end

	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getRentedVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM rented_vehicles ORDER BY player_name ASC', {}, function(result)
		local vehicles = {}

		for i = 1, #result, 1 do
			table.insert(vehicles, {
				name       = result[i].vehicle,
				plate      = result[i].plate,
				playerName = result[i].player_name
			})
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:giveBackVehicle', function(source, cb, plate, society)
	MySQL.Async.fetchAll('SELECT * FROM rented_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then
			local vehicle   = result[1].vehicle
			local basePrice = result[1].base_price

			MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, price, society) VALUES (@vehicle, @price, @society)',
								{
									['@vehicle'] = vehicle,
									['@price']   = basePrice,
									['@society'] = 'society_' .. society
								})

			MySQL.Async.execute('DELETE FROM rented_vehicles WHERE plate = @plate', {
				['@plate'] = plate
			})

			RemoveOwnedVehicle(plate)
			cb(true)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:resellVehicle', function(source, cb, plate, price)
	-- todo: remove price
	MySQL.Async.fetchAll('SELECT * FROM rented_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then
			-- is it a rented vehicle?
			cb(false) -- it is, don't let the player sell it since he doesn't own it
		else
			local xPlayer = ESX.GetPlayerFromId(source)

			MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND @plate = plate',
								 {
									 ['@owner'] = xPlayer.identifier,
									 ['@plate'] = plate
								 }, function(result)

					-- does the owner match?
					if result[1] ~= nil then

						-- todo: does model match?
						xPlayer.addMoney(price)
						RemoveOwnedVehicle(plate)
						cb(true)

					else

						if xPlayer.job.grade_name == 'boss' then
							MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND @plate = plate',
												 {
													 ['@owner'] = 'society:' .. xPlayer.job.name,
													 ['@plate'] = plate
												 }, function(result)
									if result[1] ~= nil then
										xPlayer.addMoney(price)
										RemoveOwnedVehicle(plate)
										cb(true)
									else
										cb(false)
									end
								end)
						else
							cb(false)
						end
					end

				end)
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getStockItems', function(source, cb, society)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_' .. society, function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({ items = items })
end)

ESX.RegisterServerCallback('esx_vehicleshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate UNION SELECT 1 FROM job_cars WHERE plate = @plate',
						 {
							 ['@plate'] = plate
						 }, function(result)
			cb(result[1] ~= nil)
		end)
end)

if Config.EnablePvCommand then
	TriggerEvent('es:addGroupCommand', 'pv', 'user', function(source, args, user)
		TriggerClientEvent('esx_vehicleshop:openPersonnalVehicleMenu', source)
	end, { help = _U('leaving') })
end

function PayRent(d, h, m)
	MySQL.Async.fetchAll('SELECT * FROM rented_vehicles', {}, function(result)
		for i = 1, #result, 1 do
			MySQL.Sync.execute('UPDATE rented_vehicles SET payments = @payments + 1 WHERE plate = @plate',
							   {
								   ['@plate']    = result[i].plate,
								   ['@payments'] = result[i].payments
							   })

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
				account.addMoney(result[i].rent_price)
			end)
		end
	end)
end

TriggerEvent('cron:runAt', 22, 00, PayRent)
