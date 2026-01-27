/datum/discipline/path/conjuring
	name = "Path of Conjuring"
	desc = "A complex path of Thaumaturgy that involves conjuring objects from thin air. Violates Masquerade."
	icon_state = "conjuring"
	power_type = /datum/discipline_power/thaumaturgy/path/conjuring

/datum/discipline_power/thaumaturgy/path/conjuring
	name = "Path of Conjuring"
	desc = "Path of Conjuring Power Description"

	effect_sound = ''
	var/checked_ability = null //Some summons, especially complex ones require additional abilities, to simulate familiarity rules.
	var/roll_difficulty = 6 //Default difficulty.
	var/copy_quality = 0 //The quality of the copy. <5 means there are defects, leading to reduced reliability.
	var/chosen_object = null //The object which has been chosen to be conjured.

GLOBAL_LIST_INIT(conjuring_options, list(
	//Materially simple objects. Anything which is just one material in a basic shape. 
	CAT_SIMPLE = list( 
	/obj/item/vampire_stake,
	/obj/item/melee/baseball_bat/vamp,
	/obj/item/melee/vamp/tire,
	/obj/item/melee/baton/vamp,
	/obj/item/melee/vamp/brick
	),
	//Materially and/or mechanically complex melee weapons. Effectively, anything which isn't a single piece of one material.
	CAT_MELEE = list(
	/obj/item/fireaxe/vamp,
	/obj/item/katana/vamp,
	/obj/item/fireaxe/vamp,
	/obj/item/melee/sabre/rapier,
	/obj/item/melee/sabre/vamp,
	/obj/item/melee/sabre/rapier,
	/obj/item/claymore/longsword,
	/obj/item/knife/vamp,
	/obj/item/melee/vamp/handsickle,
	/obj/item/chainsaw/vamp,
	/obj/item/shovel/vamp,
	/obj/item/scythe/vamp,
	/obj/item/switchblade/vamp,
	/obj/item/darkpack/spear,
	/obj/item/instrument/eguitar/vamp
	),
	//Ranged weapons
	CAT_RANGED = list(
	/obj/item/gun/ballistic/revolver/darkpack/magnum,
	/obj/item/gun/ballistic/revolver/darkpack/snub,
	/obj/item/gun/ballistic/automatic/pistol/darkpack/deagle,
	/obj/item/gun/ballistic/automatic/pistol/darkpack/m1911,
	/obj/item/gun/ballistic/automatic/pistol/darkpack/glock19,
	/obj/item/gun/ballistic/automatic/pistol/darkpack/glock21,
	/obj/item/gun/ballistic/automatic/pistol/darkpack/beretta,
	/obj/item/gun/ballistic/automatic/darkpack/uzi,
	/obj/item/gun/ballistic/automatic/darkpack/mp5,
	/obj/item/gun/ballistic/automatic/darkpack/mac10,
	/obj/item/gun/ballistic/automatic/darkpack/ar15,
	/obj/item/gun/ballistic/automatic/darkpack/huntrifle,
	/obj/item/gun/ballistic/automatic/darkpack/ak74,
	/obj/item/gun/ballistic/automatic/darkpack/thompson,
	/obj/item/gun/ballistic/rifle/darkpack/lever,
	/obj/item/gun/ballistic/automatic/darkpack/sniper,
	/obj/item/gun/ballistic/shotgun/vampire,
	/obj/item/gun/ballistic/shotgun/vampire/doublebarrel,
	/obj/item/gun/ballistic/shotgun/toy/crossbow/vampire,
	/obj/item/gun/ballistic/automatic/darkpack/musket
	),
	//Ammunition for various weapons. No special or unique rounds like incendiaries.
	CAT_AMMO = list(
	/obj/item/ammo_box/darkpack/c9mm,
	/obj/item/ammo_box/darkpack/c45acp,
	/obj/item/ammo_box/darkpack/c44,
	/obj/item/ammo_box/darkpack/c556,
	/obj/item/ammo_box/darkpack/c545,
	/obj/item/ammo_box/darkpack/c12g,
	/obj/item/ammo_box/darkpack/arrows,
	/obj/item/ammo_box/darkpack/c50,
	/obj/item/ammo_box/magazine/darkpackthompson,
	/obj/item/ammo_box/magazine/darkpack545,
	/obj/item/ammo_box/magazine/darkpack556,
	/obj/item/ammo_box/magazine/darkpack556/hunt,
	/obj/item/ammo_box/magazine/darkpack45smg,
	/obj/item/ammo_box/magazine/darkpack9mp5,
	/obj/item/ammo_box/magazine/darkpack9mm,
	/obj/item/ammo_box/magazine/semi9mm,
	/obj/item/ammo_box/magazine/glock45acp,
	/obj/item/ammo_box/magazine/darkpack45acp,
	/obj/item/ammo_box/magazine/m44
	),
	//Anything else which is mechanically or materially complex, but not a weapon. Lighters, etc.
	CAT_MISC = list(
	),
))

/datum/discipline_power/thaumaturgy/path/conjuring/activate()
	. = ..()
	if(.)
		return
	copy_quality = success_count

//SUMMON THE SIMPLE FORM - Level 1
/datum/discipline_power/thaumaturgy/path/conjuring/one
	name = "Summon the Simple Form"
	desc = "Conjure a small item made out of a single material with no moving parts."

	level = 1
	check_flags = DISC_CHECK_CAPABLE | DISC_CHECK_CONSCIOUS
	violates_masquerade = TRUE
	toggled = TRUE
	duration_length = 1 SCENES

	grouped_powers = list(
		/datum/discipline_power/thaumaturgy/path/conjuring/three
	)

/datum/discipline_power/thaumaturgy/path/conjuring/one/activate()
	. = ..()

	chosen_object = switch(GLOB.conjuring_options[CAT_SIMPLE])

	chosen_object = new
	user.put_in_hands(chosen_object)

	switch(copy_quality)
		if(>=5)
			return
		if(4)
			chosen_object.name = "Odd [name]"
		if(3)
			chosen_object.name = "Damaged [name]"
		if(2)
			chosen_object.name = "Shoddy [name]"
		if(1)
			chosen_object.name = "Crude [name]"

//PERMANENCY - Level 2
/datum/discipline_power/thaumaturgy/path/conjuring/two
	name = "Permanency"
	desc = "Render a created item permanent."

	level = 2
	check_flags = DISC_CHECK_CAPABLE | DISC_CHECK_CONSCIOUS
	violates_masquerade = TRUE
	toggled = FALSE
	vitae_cost = 3

//MAGIC OF THE SMITH - Level 3
/datum/discipline_power/thaumaturgy/path/conjuring/three
	name = "Magic of the Smith"
	desc = "Conjure complex objects of multiple components and with moving parts."

	level = 3
	check_flags = DISC_CHECK_CAPABLE | DISC_CHECK_CONSCIOUS
	violates_masquerade = TRUE
	toggled = FALSE
	vitae_cost = 5

	grouped_powers = list(
		/datum/discipline_power/thaumaturgy/path/conjuring/one
	)

/datum/discipline_power/thaumaturgy/path/conjuring/three/activate()
	. = ..()

	switch(GLOB.conjuring_options)
		if(CAT_SIMPLE)
			chosen_object = switch(GLOB.conjuring_options[CAT_SIMPLE])
		if(CAT_MELEE)
			chosen_object = switch(GLOB.conjuring_options[CAT_MELEE])
		if(CAT_RANGED)
			chosen_object = switch(GLOB.conjuring_options[CAT_RANGED])
		if(CAT_AMMO)
			chosen_object = switch(GLOB.conjuring_options[CAT_AMMO])
		if(CAT_MISC)
			chosen_object = switch(GLOB.conjuring_options[CAT_MISC])

	chosen_object = new
	user.put_in_hands(chosen_object)
	switch(copy_quality)
		if(>=5)
			return
		if(4)
			chosen_object.name = "Odd [name]"
			for(/obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 5
		if(3)
			chosen_object.name = "Damaged [name]"
			for(/obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 10
		if(2)
			chosen_object.name = "Shoddy [name]"
			for(/obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 15
		if(1)
			chosen_object.name = "Crude [name]"
			for(/obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 20
