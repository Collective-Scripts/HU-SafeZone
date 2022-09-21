Config = {}

Config.NotificationType = { --['mythic_notify_default', 'mythic_notify_old', 'ox_lib', 't-notify', 'col_notify', 'col_notify_new', 'Roda_Notifications' 'esx_notify', 'default-esx']--
	client = 'col_notify_new'
} 

Config.SafeZoneSettings = {
	DisableWeapon = true,
	UseGhostMode = true 
}

Config.SafeZones = {
	{
		pos = vec3(0.0, 0.0, 0.0), -- PolyZone Location
		size = vec3(1, 1, 1), -- PolyZone Size
		polyH = 0, -- PolyZone Heading
		debug = true, -- Debug PolyZone
	}
}