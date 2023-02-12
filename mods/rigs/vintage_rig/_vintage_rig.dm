
/obj/item/rig/vintage
	name = "antique RIG suit"
	desc = "An extremely bulky, durable vintage suit that has mostly been replaced by sleeker modern designs. Some collectors still value the good old days though."
	icon = 'mods/rigs/icons/obj_suits.dmi'
	icon_state = "vintage_rig"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	offline_slowdown = 5
	online_slowdown = 3.5

	chest_type = /obj/item/clothing/suit/space/rig/vintage
	helm_type =  /obj/item/clothing/head/helmet/space/rig/vintage
	boot_type =  /obj/item/clothing/shoes/magboots/rig/vintage
	glove_type = /obj/item/clothing/gloves/rig/vintage

	initial_modules = list(
		/obj/item/rig_module/device/drill,
		/obj/item/rig_module/device/orescanner,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/healthbar
		)

/obj/item/clothing/suit/space/rig/vintage
	item_icons = list(slot_wear_suit_str = 'mods/rigs/icons/onmob_suit.dmi', slot_back_str ='mods/rigs/icons/onmob_suit.dmi')
	name = "suit"

/obj/item/clothing/gloves/rig/vintage
	icon = 'mods/rigs/icons/obj_gloves.dmi'
	item_icons = list(slot_gloves_str = 'mods/rigs/icons/onmob_hands.dmi')
	name = "gloves"

/obj/item/clothing/shoes/magboots/rig/vintage
	icon = 'mods/rigs/icons/obj_shoes.dmi'
	item_icons = list(slot_shoes_str = 'mods/rigs/icons/onmob_feet.dmi')
	name = "shoes"

/obj/item/clothing/head/helmet/space/rig/vintage
	icon = 'mods/rigs/icons/obj_hats.dmi'
	item_icons = list(slot_head_str = 'mods/rigs/icons/onmob_head.dmi')
	name = "hood"
