local playerState = LocalPlayer.state
playerState:set('isInSafeZone', false, false)

function onEnter(self)
    local ped = PlayerPedId()
	playerState.isInSafeZone = true
	if not playerState.isInSafeZone then return end
	if Config.SafeZoneSettings.DisableFiring then NetworkSetFriendlyFireOption(false) end
	if IsPedInAnyVehicle(ped) and Config.SafeZoneSettings.UseGhostMode then SetLocalPlayerAsGhost(true) else SetLocalPlayerAsGhost(true) end
	CollectiveC.Notification(1, 'You\'re inside of a safe zone.', 15000)
	loopInSafeZone = SetInterval(function()
		if playerState.isInSafeZone and Config.SafeZoneSettings.DisableWeapon then
			DisableControlAction(0, 24, true) -- LEFT MOUSE BUTTON
			DisableControlAction(0, 25, true) -- RIGHT MOUSE BUTTON
			DisableControlAction(0, 37, true) -- TAB
			if IsDisabledControlJustPressed(2, 37) then
				TriggerEvent('ox_inventory:disarm')
			end
			if IsDisabledControlJustPressed(2, 24) then
				TriggerEvent('ox_inventory:disarm')
			end
			if IsDisabledControlJustPressed(2, 25) then
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
	end, 0)
end

function onExit(self)
	local ped = PlayerPedId()
	playerState.isInSafeZone = false
	if Config.SafeZoneSettings.DisableFiring then NetworkSetFriendlyFireOption(true) end
	if IsPedInAnyVehicle(ped) and Config.SafeZoneSettings.UseGhostMode then SetLocalPlayerAsGhost(false) else SetLocalPlayerAsGhost(false) end
end

Citizen.CreateThread(function()
    for k, v in pairs(Config.SafeZones) do
        local SafeZones = lib.zones.box({
            coords = v.pos,
            size = v.size,
            rotation = v.polyH,
            debug = v.debug,
            inside = insideZone,
            onEnter = onEnter,
            onExit = onExit
        })
    end
end)