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



	// Materially simple objects. Anything which is just one material in a basic shape.
	var/list/simple_conjured_items = list(
	"Stake" = /obj/item/vampire_stake,
	"Baseball Bat" = /obj/item/melee/baseball_bat/vamp,
	"Tire Iron" = /obj/item/melee/vamp/tire,
	"Baton" = /obj/item/melee/baton/vamp,
	"Brick" = /obj/item/melee/vamp/brick
	)

	//Materially and/or mechanically complex melee weapons. Effectively, anything which isn't a single piece of one material.
	var/list/conjured_melee_weapons = list(
	"Fire Axe" = /obj/item/fireaxe/vamp,
	"Katana" = /obj/item/katana/vamp,
	"Rapier" = /obj/item/melee/sabre/rapier,
	"Sabre" = /obj/item/melee/sabre/vamp,
	"Longsword" = /obj/item/claymore/longsword,
	"Knife" = /obj/item/knife/vamp,
	"Sickle" = /obj/item/melee/vamp/handsickle,
	"Chainsaw" = /obj/item/chainsaw/vamp,
	"Shovel" = /obj/item/shovel/vamp,
	"Scythe" = /obj/item/scythe/vamp,
	"Switchblade" = /obj/item/switchblade/vamp,
	"Spear" = /obj/item/darkpack/spear,
	"Guitar" = /obj/item/instrument/eguitar/vamp
	)

	//Ranged weapons. Use generic ones, not faction/unique weapons where possible.
	var/list/conjured_ranged_weapons = list(
	"Magnum Revolver" = /obj/item/gun/ballistic/revolver/darkpack/magnum,
	"Snub Revolver" = /obj/item/gun/ballistic/revolver/darkpack/snub,
	"Desert Eagle" = /obj/item/gun/ballistic/automatic/pistol/darkpack/deagle,
	"M1911" = /obj/item/gun/ballistic/automatic/pistol/darkpack/m1911,
	"Brokk 19" = /obj/item/gun/ballistic/automatic/pistol/darkpack/glock19,
	"Beretta" = /obj/item/gun/ballistic/automatic/pistol/darkpack/beretta,
	"Uzi" = /obj/item/gun/ballistic/automatic/darkpack/uzi,
	"MP5" = /obj/item/gun/ballistic/automatic/darkpack/mp5,
	"MAC10" = /obj/item/gun/ballistic/automatic/darkpack/mac10,
	"CAR-15" = /obj/item/gun/ballistic/automatic/darkpack/ar15,
	"Hunting Rifle" = /obj/item/gun/ballistic/automatic/darkpack/huntrifle,
	"AK-74" = /obj/item/gun/ballistic/automatic/darkpack/ak74,
	"Thompson SMG" = /obj/item/gun/ballistic/automatic/darkpack/thompson,
	"Lever-Action" = /obj/item/gun/ballistic/rifle/darkpack/lever,
	"Sniper Rifle" = /obj/item/gun/ballistic/automatic/darkpack/sniper,
	"Shotgun" = /obj/item/gun/ballistic/shotgun/vampire,
	"Double Barrel Shotgun" = /obj/item/gun/ballistic/shotgun/vampire/doublebarrel,
	"Crossbow" = /obj/item/gun/ballistic/shotgun/toy/crossbow/vampire,
	"Musket" = /obj/item/gun/ballistic/automatic/darkpack/musket
	)

	//Ammunition for various weapons. No special or unique rounds like incendiaries.
	var/list/conjured_ammo = list(
	"9mm Ammo Box" = /obj/item/ammo_box/darkpack/c9mm,
	".45 ACP Ammo Box" = /obj/item/ammo_box/darkpack/c45acp,
	".44 Ammo Box" = /obj/item/ammo_box/darkpack/c44,
	"5.56mm Ammo Box" = /obj/item/ammo_box/darkpack/c556,
	"5.45mm Ammo Box" = /obj/item/ammo_box/darkpack/c545,
	"12g Ammo Box" = /obj/item/ammo_box/darkpack/c12g,
	"Arrows Ammo Box" = /obj/item/ammo_box/darkpack/arrows,
	".50 Ammo Box" = /obj/item/ammo_box/darkpack/c50,
	"Thompson SMG Magazine" = /obj/item/ammo_box/magazine/darkpackthompson,
	"5.45mm Magazine" = /obj/item/ammo_box/magazine/darkpack545,
	"5.56mm Magazine" = /obj/item/ammo_box/magazine/darkpack556,
	"5.56mm Hunting Rifle Magazine" = /obj/item/ammo_box/magazine/darkpack556/hunt,
	".45 SMG Magazine" = /obj/item/ammo_box/magazine/darkpack45smg,
	"9mm MP5 Magazine" = /obj/item/ammo_box/magazine/darkpack9mp5,
	"9mm Magazine" = /obj/item/ammo_box/magazine/darkpack9mm,
	"9mm Semi Automatic Magazine" = /obj/item/ammo_box/magazine/semi9mm,
	".45 Brokk ACP Magazine" = /obj/item/ammo_box/magazine/glock45acp,
	".45 ACP Magazine" = /obj/item/ammo_box/magazine/darkpack45acp,
	".44 Magazine" = /obj/item/ammo_box/magazine/m44,
	"Musket Shot" = /obj/item/ammo_casing/vampire/c75
	)

	//Anything else which is mechanically or materially complex, but not a weapon. Lighters, etc.
	var/list/conjured_misc_items
	conjured_misc_items = list(
	)

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
	chosen_object = tgui_input_list(user, "What do you wish to conjure?", "Conjuration", simple_conjured_items)
	chosen_object = new
	user.put_in_hands(chosen_object)

	switch(copy_quality)
		if(>=5)
			return
		if(4)
			chosen_object.name = "Odd [name]"
			chosen_object.force *= 0.9
		if(3)
			chosen_object.name = "Damaged [name]"
			chosen_object.force *= 0.8
		if(2)
			chosen_object.name = "Shoddy [name]"
			chosen_object.force *= 0.7
		if(1)
			chosen_object.name = "Crude [name]"
			chosen_object.force *= 0.6

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
	desc = "Conjure permanent complex objects of multiple components and with moving parts."

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

	var/list/conjuring_choices = list("Simple Items", "Melee Weapons", "Ranged Weapons", "Ammo", "Misc Items")
	var/conjuring_category = tgui_input_list(user, "What do you wish to conjure?", "Conjuration", simple_conjured_items)
	switch(conjuring_category)
		if("Simple Items")
			chosen_object = tgui_input_list(user, "What do you wish to conjure?", "Conjuration", simple_conjured_items)
		if("Melee Weapons")
			chosen_object = tgui_input_list(user, "What do you wish to conjure?", "Conjuration", conjured_melee_weapons)
		if("Ranged Weapons")
			chosen_object = tgui_input_list(user, "What do you wish to conjure?", "Conjuration", conjured_ranged_weapons)
		if("Ammo")
			chosen_object = tgui_input_list(user, "What do you wish to conjure?", "Conjuration", conjured_ammo)
		if("Misc items")
			chosen_object = tgui_input_list(user, "What do you wish to conjure?", "Conjuration", conjured_misc_items)
		else
			display_results(user, span_notice("Something has gone wrong in the list of conjuring item categories, probably a misspelled entry, let a coder know."))
			return
	chosen_object = new
	user.put_in_hands(chosen_object)
	switch(copy_quality)
		if(>=5)
			return
		if(4)
			chosen_object.name = "Odd [name]"
			chosen_object.force *= 0.9
			if(chosen_object = /obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 5
		if(3)
			chosen_object.name = "Damaged [name]"
			chosen_object.force *= 0.8
			if(chosen_object = /obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 10
		if(2)
			chosen_object.name = "Shoddy [name]"
			chosen_object.force *= 0.7
			if(chosen_object = /obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 15
		if(1)
			chosen_object.name = "Crude [name]"
			chosen_object.force *= 0.6
			if(chosen_object = /obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 20
