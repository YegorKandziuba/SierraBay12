/area/hallway/primary/thirddeck/fore
	name = "Third Deck - Hallway - Fore"
	icon_state = "hallF"
	req_access = list(access_external_airlocks)

/area/hallway/primary/thirddeck/center
	name = "Third Deck - Hallway - Central"
	icon_state = "hallC3"

/area/hallway/primary/thirddeck/aft
	name = "Third Deck - Hallway - Aft"
	icon_state = "hallA"

/area/hallway/primary/thirddeck/central_stairwell
	name = "Third Deck - Stairwell - Central"
	icon_state = "hallC2"

/area/hallway/primary/thirddeck/aft_stairwell
	name = "Third Deck - Stairwell - Fore "
	icon_state = "hallA"

/area/maintenance/thirddeck
	name = "Third Deck - Maintenance"
	icon_state = "maintcentral"

/area/maintenance/thirddeck/aft
	name = "Third Deck - Maintenance - Aft"
	icon_state = "amaint"

/area/maintenance/thirddeck/foreport
	name = "Third Deck - Maintenance - Fore-Port "
	icon_state = "fpmaint"

/area/maintenance/thirddeck/forestarboard
	name = "Third Deck - Maintenance - Fore-Starboard "
	icon_state = "fsmaint"

/area/maintenance/thirddeck/starboard
	name = "Third Deck - Maintenance - Starboard "
	icon_state = "smaint"

/area/maintenance/thirddeck/port
	name = "Third Deck - Maintenance - Port"
	icon_state = "pmaint"

/area/maintenance/substation/thirddeck
	name = "Third Deck - Substation"

/area/maintenance/cistern
	name = "Third Deck - Water Cistern"
	icon_state = "disposal"
	req_access = list(list(access_cargo, access_engine, access_el))

/* ENGINEERING AREAS
 * =================
 */
/area/engineering/hallway
	name = "Third Deck - Engineering - Hallway"
	icon_state = "engineering_workshop"

/area/engineering/hardstorage
	name = "Third Deck - Engineering - Storage"
	icon_state = "engineering_storage"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_room
	name = "Third Deck - Engine - Supermatter"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
	area_flags = AREA_FLAG_ION_SHIELDED
	ambience = list(
		'maps/sierra/sound/ambience/engineering1.ogg',
		'maps/sierra/sound/ambience/engineering2.ogg',
		'maps/sierra/sound/ambience/engineering3.ogg'
	)
	req_access = list(access_engine_equip)

/area/engineering/engine_eva
	name = "Third Deck - Engineering - EVA"
	icon_state = "engine_eva"
	req_access = list(list(access_eva, access_external_airlocks), access_engine)

/area/engineering/engine_monitoring
	name = "Third Deck - Engine - Monitoring"
	icon_state = "engine_monitoring"
	ambience = list(
		'maps/sierra/sound/ambience/engineering1.ogg',
		'maps/sierra/sound/ambience/engineering2.ogg',
		'maps/sierra/sound/ambience/engineering3.ogg'
	)

/area/engineering/engine_smes
	name = "Third Deck - Engine - SMES"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/engineering/engineering_monitoring
	name = "Third Deck - Engineering - Monitoring"
	icon_state = "engine_monitoring"

/area/engineering/locker_room
	name = "Third Deck - Engineering - Locker Room"
	icon_state = "engineering_locker"

/area/engineering/materials_storage
	name = "Third Deck - Engineering - Materials Storage"
	icon_state = "engineering_storage"

/area/engineering/atmos
	name = "Third Deck - Engineering - Atmospherics"
	icon_state = "atmos"
	ambience = list(
		'maps/sierra/sound/ambience/engineering1.ogg',
		'maps/sierra/sound/ambience/engineering2.ogg',
		'maps/sierra/sound/ambience/engineering3.ogg',
		'maps/sierra/sound/ambience/atmospherics1.ogg'
	)
	sound_env = LARGE_ENCLOSED
	req_access = list(access_atmospherics)

/area/engineering/gravitaional_generator
	name = "Third Deck - Gravitational Generator"
	icon_state = "engine_monitoring"
	req_access = list(list(access_engine_equip, access_heads), list(access_seneng, access_engine_equip))
	sound_env = SMALL_ENCLOSED

/area/engineering/bluespace
	name = "Third Deck - Engineering - BlueSpace Drive"
	icon_state = "engine_monitoring"
	req_access = list(list(access_engine_equip, access_heads), access_engine, access_maint_tunnels)
	sound_env = SMALL_ENCLOSED

/area/engineering/bluespace/chamber
	name = "Third Deck - Engineering - BlueSpace Drive - Chamber"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED

/area/turret_protected/ai_cyborg_station
	name = "Third Deck - Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/turret_protected/ai_cyborg_upload
	name = "Third Deck - Cyborg Upload"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/shield/thirddeck
	name = "Third Deck - Shield Generator"

/* RUST
 * =================
 */

/area/vacant/prototype
	req_access = list(access_engine)

/area/vacant/prototype/control
	name = "\improper Prototype Fusion Reactor Control Room"
	icon_state = "engine_monitoring"

/area/vacant/prototype/engine
	name = "\improper Prototype Fusion Reactor Chamber"
	icon_state = "rust_reactor"

// Solars
/area/maintenance/solar
	name = "First Deck - Solar - Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine)

/area/maintenance/solar/starboard
	name = "First Deck - Solar - Starboard"
	icon_state = "SolarcontrolS"

/area/solar
	area_flags = AREA_FLAG_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space
	sound_env = SPACE

/area/solar/starboard
	name = "First Deck - Solar - Starboard Array"
	icon_state = "panelsS"

/area/solar/port
	name = "First Deck - Solar - Port Array"
	icon_state = "panelsP"

// Storage
/area/storage/tech
	name = "Third Deck - Engineering - Technical Storage"
	icon_state = "storage"
	req_access = list(access_tech_storage)

// Hangar
/area/quartermaster/hangar/upper
	name = "Third Deck - Hangar"

/area/quartermaster/hangar_stairs/upper
	name = "Third Deck - Hangar - Stairs"

// Compactor
/area/maintenance/compactor
	name = "Third Deck - Compactor"
	icon_state = "disposal"
	sound_env = STANDARD_STATION
	req_access = list(list(access_cargo, access_maint_tunnels))

/* RND AREAS
 * =========
 */
/area/rnd/xenobiology/entry2
	name = "Xenobiology Access"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/level2
	name = "Xenobiology Level Two"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/storage
	name = "Xenobiology - Storage"
	icon_state = "xeno_lab"
