/obj/projectile/energy/electrode/darkpack/paws
	range = 7
	tase_stamina = 120

/obj/projectile/energy/electrode/darkpack/paws/on_hit(mob/living/target, blocked = 0, pierce_hit)
	. = ..()
	if(!istype(target))
		return
	var/datum/splat/werewolf/shifter/shifter = get_shifter_splat(target)
	if(shifter && !ishomid(shifter))
		shifter.transform_fera(/datum/species/human/shifter/homid, force = TRUE)

/obj/projectile/energy/darkpack/plasma //Different to base plasma, which is treated as a beam.
	name = "plasma bolt"
	icon_state = "pulse1"
	damage = 55
	damage_type = BURN
	armor_flag = ENERGY
	armour_penetration = 25
	reflectable = NONE
	wound_bonus = 0
	exposed_wound_bonus = 10

/obj/projectile/energy/darkpack/plasma/light
	name = "light plasma bolt"
	damage = 30
