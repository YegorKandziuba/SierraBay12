/* COMMAND AREAS
 * =============
 */
/area/crew_quarters/heads/cobed
	name = "Bridge - Command - Captain's Quarters"
	sound_env = MEDIUM_SOFTFLOOR
	icon_state = "captain"
	req_access = list(access_captain)

/area/crew_quarters/heads/office/captain
	name = "Bridge - Command - Captain's Office"
	icon_state = "heads_cap"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_captain)

/area/crew_quarters/heads/captain
	req_access = list(access_captain)
	icon_state = "heads_cap"

/area/crew_quarters/heads/captain/office_anteroom
	name = "Bridge - Command - Captain's Office Anteroom"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/captain/beach
	name = "Bridge - Command - Captain's Recreation Facility"
	icon_state = "heads_cap"
	sound_env = PLAIN
	req_access = list()

/area/crew_quarters/heads/office/ce
	icon_state = "heads_ce"
	name = "Bridge - Command - CE's Office"
	req_access = list(access_ce)

/area/bridge
	name = "Bridge Deck - Bridge"
	icon_state = "bridge"
	req_access = list(access_bridge)
	ambience = list('maps/sierra/sound/ambience/bridge.wav')

/area/bridge/nano
	icon = 'maps/sierra/icons/turf/areas.dmi'
	icon_state = "bridge_room"

/area/bridge/meeting_room
	name = "Bridge - Command - Meeting Room"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/bridge/lobby
	name = "Bridge - Lobby"
	req_access = list()

/area/bridge/storage
	name = "Bridge - Storage"
	req_access = list(access_bridge)

/area/teleporter
	name = "Bridge - Teleporter"
	icon_state = "teleporter"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_teleporter)

// AI
/area/turret_protected
	req_access = list(access_ai_upload)
	ambience = list(
		'maps/sierra/sound/ambience/aimalf.ogg',
		'maps/sierra/sound/ambience/aiservers.wav',
		'maps/sierra/sound/ambience/aiporthum.ogg',
		'maps/sierra/sound/ambience/ai1.ogg',
		'maps/sierra/sound/ambience/ai2.ogg',
		'maps/sierra/sound/ambience/ai3.ogg'
	)
	forced_ambience = list('maps/sierra/sound/ambience/ambxerxes_looped.wav')

/area/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"

/area/turret_protected/ai_teleport
	name = "First Deck - AI Upload"
	icon_state = "ai_upload"

/area/turret_protected/ai_upload
	name = "First Deck - AI Upload"
	icon_state = "ai_upload"


/area/crew_quarters/safe_room/bridge
	name = "Bridge - Safe Room"

/area/crew_quarters/heads/captain/secret_room/level_two
	name = "First Deck - Captain's bathroom"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/bridge/hall/port
	name = "Bridge - Hall - Port"
	req_access = list(access_sec_doors)

/area/bridge/hall/starboard
	name = "Bridge - Hall - Starboard"
	req_access = list(access_sec_doors)

/area/crew_quarters/heads/captain/secret_room/level_one
	name = "Second Deck - Captain's restroom"
	area_flags = AREA_FLAG_RAD_SHIELDED

// Solars

/area/maintenance/bridge_port
	name = "Bridge - Solar - Port"
	icon_state = "SolarcontrolP"

/area/maintenance/solar/bridge_starboard
	name = "Bridge - Solar - Starboard"
	icon_state = "SolarcontrolS"

/area/solar/bridge_starboard
	name = "Bridge - Solar - Starboard Array"
	icon_state = "panelsS"

/area/solar/bridge_port
	name = "Bridge - Solar - Port Array"
	icon_state = "panelsP"
