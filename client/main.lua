local playerState = LocalPlayer.state
playerState:set('isInSafeZone', false, false)

function onEnter(self)
    local ped = PlayerPedId()
	playerState.isInSafeZone = true
	if not playerState.isInSafeZone then return end
	if Config.SafeZoneSettings.DisableWeapon then NetworkSetFriendlyFireOption(false) end
	if Config.SafeZoneSettings.UseGhostMode then SetLocalPlayerAsGhost(true) end
	CollectiveC.Notification(1, 'You have entered a safe zone.', 15000)
	CreateThread(function()
		while playerState.isInSafeZone and Config.SafeZoneSettings.DisableWeapon do
			Wait(0)
			local weapon = GetSelectedPedWeapon(ped)
			if not self.allowedWeapons[weapon] then
				DisableControlAction(0, 24, true) -- LEFT MOUSE BUTTON
				DisableControlAction(0, 25, true) -- RIGHT MOUSE BUTTON
				DisableControlAction(0, 37, true) -- TAB
				DisableControlAction(0, 140, true)
				if IsDisabledControlJustPressed(2, 37) then
					TriggerEvent('ox_inventory:disarm')
				end
				if IsDisabledControlJustPressed(0, 24) then
					TriggerEvent('ox_inventory:disarm')
				end
				if IsDisabledControlJustPressed(0, 25) then
					TriggerEvent('ox_inventory:disarm')
				end
				if IsDisabledControlJustPressed(0, 37) then
					TriggerEvent('ox_inventory:disarm')
				end
			end
		end
	end)
end

function onExit(self)
	local ped = PlayerPedId()
	playerState.isInSafeZone = false
	if Config.SafeZoneSettings.DisableWeapon then NetworkSetFriendlyFireOption(true) end
	if Config.SafeZoneSettings.UseGhostMode then SetLocalPlayerAsGhost(false) end
	CollectiveC.Notification(3, 'You are no longer in a safe zone.', 5000)
end

CreateThread(function()
    for k, v in pairs(Config.SafeZones) do
        local SafeZones = lib.zones.box({
            coords = v.pos,
            size = v.size,
            rotation = v.polyH,
            debug = v.debug,
			allowedWeapons = v.AllowedWeapons,
            onEnter = onEnter,
            onExit = onExit
        })
    end
end)