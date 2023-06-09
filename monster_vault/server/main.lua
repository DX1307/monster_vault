ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('monster_vault:getItem')
AddEventHandler('monster_vault:getItem', function(--[[owner,--]] job, type, item, count, ammo)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(xPlayer.identifier)

	if type == 'item_standard' then

		local sourceItem = xPlayer.getInventoryItem(item)

		if job == 'vault' or job == 'vault1' or job == 'vault2' or job == 'vault3' or job == 'vault4' or job == 'vault5' or job == 'vault6' or job == 'vault7' or job == 'vault8' or job == 'vault9' or job == 'vault10' or job == 'vault11' or job == 'vault12' or job == 'vault13' or job == 'vault14' or job == 'vault15' or job == 'vault16' or job == 'vault17' or job == 'vault18' or job == 'vault19' or job == 'vault20'  then
			TriggerEvent('esx_addoninventory:getInventory', 'vault', xPlayerOwner.identifier, function(inventory)
				local inventoryItem = inventory.getItem(item)
	
				
				if count > 0 and inventoryItem.count >= count then
					if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
						--TriggerClientEvent('mythic_notify:client:SendAlert', _source,  {type = 'error', text = _U('player_cannot_hold'), length = 5500})
						TriggerClientEvent('okokNotify:Alert', source, "vault", "คุณมีพื้นที่ว่างไม่เพียงพอ!", 5000, 'error')
					else
						inventory.removeItem(item, count)
						xPlayer.addInventoryItem(item, count)
						--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'success', text = _U('have_withdrawn', count, inventoryItem.label), length = 8500})
					end
				else
					--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('not_enough_in_vault'), length = 5500})
					TriggerClientEvent('okokNotify:Alert', source, "vault", "ไอเทมนั้นในห้องนิรภัยไม่เพียงพอ!", 5000, 'error')
				end
			end)
		else
			print('notify: not permission for this job')
		end

	elseif type == 'item_account' then
		if job == 'vault' or job == 'vault1' or job == 'vault2' or job == 'vault3' or job == 'vault4' or job == 'vault5' or job == 'vault6' or job == 'vault7' or job == 'vault8' or job == 'vault9' or job == 'vault10' or job == 'vault11' or job == 'vault12' or job == 'vault13' or job == 'vault14' or job == 'vault15' or job == 'vault16' or job == 'vault17' or job == 'vault18' or job == 'vault19' or job == 'vault20'    then
			TriggerEvent('esx_addonaccount:getAccount', 'vault_' .. item, xPlayerOwner.identifier, function(account)
				local roomAccountMoney = account.money
	
				if roomAccountMoney >= count then
					account.removeMoney(count)
					xPlayer.addAccountMoney(item, count)
				else
					--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('amount_invalid'), length = 5500})
					TriggerClientEvent('okokNotify:Alert', source, "vault", "จำนวนเงินที่ไม่ถูกต้อง!", 5000, 'error')
				end
			end)
		else
			--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = "You not have permission", length = 5500})
			TriggerClientEvent('okokNotify:Alert', source, "vault", "คุณไม่ได้รับอนุญาต!", 5000, 'error')
		end
	elseif type == 'item_weapon' then
		
		if job == 'vault' or job == 'vault1' or job == 'vault2' or job == 'vault3' or job == 'vault4' or job == 'vault5' or job == 'vault6' or job == 'vault7' or job == 'vault8' or job == 'vault9' or job == 'vault10' or job == 'vault11' or job == 'vault12' or job == 'vault13' or job == 'vault14' or job == 'vault15' or job == 'vault16' or job == 'vault17' or job == 'vault18' or job == 'vault19' or job == 'vault20'    then
			TriggerEvent('esx_datastore:getDataStore', 'vault', xPlayerOwner.identifier, function(store)
				local storeWeapons = store.get('weapons') or {}
				local weaponName   = nil
				local ammo         = nil
	
				for i=1, #storeWeapons, 1 do
					if storeWeapons[i].name == item then
						weaponName = storeWeapons[i].name
						ammo       = storeWeapons[i].ammo
	
						table.remove(storeWeapons, i)
						break
					end
				end
	
				store.set('weapons', storeWeapons)
				xPlayer.addWeapon(weaponName, 0)
				-- xPlayer.addWeaponAmmo(weaponName,ammo)
			end)
		else
			--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = 'You not have permission', length = 5500})
			TriggerClientEvent('okokNotify:Alert', source, "vault", "คุณไม่ได้รับอนุญาต!", 5000, 'error')
		end
	end

end)

RegisterServerEvent('monster_vault:putItem')
AddEventHandler('monster_vault:putItem', function(--[[owner,--]] job, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(xPlayer.identifier)

	if type == 'item_standard' then

		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then

		if job == 'vault' or job == 'vault1' or job == 'vault2' or job == 'vault3' or job == 'vault4' or job == 'vault5' or job == 'vault6' or job == 'vault7' or job == 'vault8' or job == 'vault9' or job == 'vault10' or job == 'vault11' or job == 'vault12' or job == 'vault13' or job == 'vault14' or job == 'vault15' or job == 'vault16' or job == 'vault17' or job == 'vault18' or job == 'vault19' or job == 'vault20'   then
				TriggerEvent('esx_addoninventory:getInventory', 'vault', xPlayerOwner.identifier, function(inventory)
					xPlayer.removeInventoryItem(item, count)
					inventory.addItem(item, count)
					--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'success', text = _U('have_deposited', count, inventory.getItem(item).label), length = 7500})
				end)
			else
				--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = "error", text = 'You not have permission for this job!', length = 5500})
				TriggerClientEvent('okokNotify:Alert', source, "vault", "คุณไม่ได้รับอนุญาต!", 5000, 'error')
			end
		else
			--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = "error", text = _U('invalid_quantity'), length = 5500})
			TriggerClientEvent('okokNotify:Alert', source, "vault", "ปริมาณที่ไม่ถูกต้อง!", 5000, 'error')
		end

	elseif type == 'item_account' then

		local playerAccountMoney = xPlayer.getAccount(item).money

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney(item, count)
			
		if job == 'vault' or job == 'vault1' or job == 'vault2' or job == 'vault3' or job == 'vault4' or job == 'vault5' or job == 'vault6' or job == 'vault7' or job == 'vault8' or job == 'vault9' or job == 'vault10' or job == 'vault11' or job == 'vault12' or job == 'vault13' or job == 'vault14' or job == 'vault15' or job == 'vault16' or job == 'vault17' or job == 'vault18' or job == 'vault19' or job == 'vault20'   then
				TriggerEvent('esx_addonaccount:getAccount', 'vault_' .. item, xPlayerOwner.identifier, function(account)
					account.addMoney(count)
				end)
			else
				xPlayer.addAccountMoney(item, count)
				--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = 'This job not allow for black money', length = 5500})
				TriggerClientEvent('okokNotify:Alert', source, "vault", "งานนี้ไม่รับเงินดำ!", 5000, 'error')
			end
			
		else
			--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('amount_invalid'), length = 5500})
			TriggerClientEvent('okokNotify:Alert', source, "vault", "จำนวนเงินที่ไม่ถูกต้อง!", 5000, 'error')
		end

	elseif type == 'item_weapon' then
		
		if job == 'vault' or job == 'vault1' or job == 'vault2' or job == 'vault3' or job == 'vault4' or job == 'vault5' or job == 'vault6' or job == 'vault7' or job == 'vault8' or job == 'vault9' or job == 'vault10' or job == 'vault11' or job == 'vault12' or job == 'vault13' or job == 'vault14' or job == 'vault15' or job == 'vault16' or job == 'vault17' or job == 'vault18' or job == 'vault19' or job == 'vault20'   then
			TriggerEvent('esx_datastore:getDataStore', 'vault', xPlayerOwner.identifier, function(store)
				local storeWeapons = store.get('weapons') or {}
	
				table.insert(storeWeapons, {
					name = item,
					ammo = count
				})
	
				xPlayer.removeWeapon(item)
				store.set('weapons', storeWeapons)
				
			end)
		else
			--TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = 'You not have permission', length = 5500})
			TriggerClientEvent('okokNotify:Alert', source, "vault", "คุณไม่ได้รับอนุญาต!", 5000, 'error')
		end
	end

end)

ESX.RegisterServerCallback('monster_vault:getVaultInventory', function(source, cb, item, refresh)
	-- local xPlayer    = ESX.GetPlayerFromIdentifier(owner)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem
	if item.needItemLicense ~= '' or item.needItemLicense ~= nil then
		xItem = xPlayer.getInventoryItem(item.needItemLicense)
	else
		xItem = nil
	end
	local refresh = refresh or false

	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	if not refresh and (item.needItemLicense ~= '' or item.needItemLicense ~= nil) and xItem ~= nil and xItem.count < 1 then
		-- if xItem.count < 1 then
		cb(false)
		-- end
		-- return
	elseif not item.InfiniteLicense and not refresh and xItem ~= nil and xItem.count > 0 then
		-- if not item.InfiniteLicense then
			xPlayer.removeInventoryItem(item.needItemLicense, 1)
		-- end
	end

	-- if item.job == xPlayer.job.name then
	-- 	print('u job: '..xPlayer.job.name)
	-- end

	local typeVault = 'vault'
	--local society = false
--	if string.find(item.job, "vault") then
		--typeVault = item.job
--society = true

	--end
	--print("Vault: "..typeVault)

	--if society then
		TriggerEvent('esx_addonaccount:getAccount', typeVault..'_black_money', xPlayer.identifier, function(account)
			blackMoney = account.money
		end)

		TriggerEvent('esx_addoninventory:getInventory', typeVault, xPlayer.identifier, function(inventory)
			items = inventory.items
		end)

		TriggerEvent('esx_datastore:getDataStore', typeVault, xPlayer.identifier, function(store)
			weapons = store.get('weapons') or {}
		end)

		cb({
			blackMoney = blackMoney,
			items      = items,
			weapons    = weapons,
			job = item.job
		})
	--end
end)