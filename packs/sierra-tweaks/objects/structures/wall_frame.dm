/obj/structure/wall_frame/hitby(atom/movable/AM, datum/thrownthing/TT)
	..()
	var/tforce = 0
	if(ismob(AM)) // All mobs have a multiplier and a size according to mob_defines.dm
		var/mob/I = AM
		tforce = I.mob_size * (TT.speed/THROWFORCE_SPEED_DIVISOR)
	if (isobj(AM))
		var/obj/O = AM
		tforce = O.throwforce * (TT.speed/THROWFORCE_SPEED_DIVISOR)
	if (tforce < 15)
		return
	damage_health(tforce, DAMAGE_BRUTE)


/obj/structure/wall_frame/osmium
	paint_color = "#9bc6f2"

/obj/structure/wall_frame/voxalloy
	paint_color = "#6c7364"

/obj/structure/wall_frame/prepainted
	paint_color = COLOR_WALL_GUNMETAL

/obj/structure/wall_frame/wood
	paint_color = "#78523b"

/obj/structure/wall_frame/crystal
	paint_color = COLOR_PALE_BLUE_GRAY
