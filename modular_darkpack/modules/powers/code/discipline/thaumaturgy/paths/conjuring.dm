/datum/discipline/path/conjuring
	name = "Path of Conjuring"
	desc = "A complex path of Thaumaturgy that involves conjuring objects from thin air. Violates Masquerade."
	icon_state = "conjuring"
	power_type = /datum/discipline_power/thaumaturgy/path/conjuring

/datum/discipline_power/thaumaturgy/path/conjuring
	name = "Path of Conjuring"
	desc = "Path of Conjuring Power Description"

	effect_sound = ''
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
	var/list/conjured_misc_items = list(
	"Fire Extinguisher" = /obj/item/extinguisher,
	"Lighter" = /obj/item/lighter,
	"Cigar" = /obj/item/storage/fancy/cigarettes/cigars/havana,
	"Cigarettes" = /obj/item/storage/fancy/cigarettes,
	"Torch" = /obj/item/flashlight,
	"Pipe" = /obj/item/cigarette/pipe,
	"Matches" = /obj/item/storage/box/matches,
	"Pen" = /obj/item/pen,
	"Fountain Pen" = /obj/item/pen/fountain,
	"Red Pen" = /obj/item/pen/red,
	"Paper" = /obj/item/paper,
	"Spray Can" = /obj/item/toy/crayon/spraycan,
	"Phone" = /obj/item/smartphone,
	"SIM Card" = /obj/item/sim_card,
	"Lockpick" = /obj/item/vamp/keys/hack,
	"Gloves" = /obj/item/camera,
	"Camera" = /obj/item/camera_film,
	"Camera Film" = /obj/item/camera_film,
	"Tape Recorder" = /obj/item/taperecorder,
	"Tape Recorder Tape" = /obj/item/tape,
	"Screwdriver" = /obj/item/screwdriver,
	"Wirecutters" = /obj/item/wirecutters,
	"Glasses" = /obj/item/clothing/glasses/vampire,
	"Prescription Glasses" = /obj/item/clothing/glasses/vampire/perception,
	"Sunglasses" = /obj/item/clothing/glasses/vampire/sun,
	"Yellow Sunglasses" = /obj/item/clothing/glasses/vampire/yellow,
	"Red Sunglasses" = /obj/item/clothing/glasses/vampire/red,
	"Magister Robes" = /obj/item/clothing/suit/hooded/robes/magister,
	"Tremere Robes" = /obj/item/clothing/suit/hooded/robes/tremere,
	"Red Robes" = /obj/item/clothing/suit/hooded/robes/red,
	"Blue Robes" = /obj/item/clothing/suit/hooded/robes/blue,
	"Green Robes" = /obj/item/clothing/suit/hooded/robes/green,
	"Yellow Robes" = /obj/item/clothing/suit/hooded/robes/yellow,
	"Purple Robes" = /obj/item/clothing/suit/hooded/robes/purple,
	"Dark Red Robes" = /obj/item/clothing/suit/hooded/robes/darkred,
	"White Robes" = /obj/item/clothing/suit/hooded/robes/white,
	"Black Robes" = /obj/item/clothing/suit/hooded/robes/black,
	"Grey Robes" = /obj/item/clothing/suit/hooded/robes/grey,
	"Balaclava" = /obj/item/clothing/mask/vampire/balaclava,
	"Comedy Mask" = /obj/item/clothing/mask/vampire/comedy,
	"Tragedy Mask" = /obj/item/clothing/mask/vampire/tragedy,
	"Venetian Mask" = /obj/item/clothing/mask/vampire/venetian_mask
	)

/datum/discipline_power/thaumaturgy/path/conjuring/activate()
	. = ..()
	copy_quality = success_count

//SUMMON THE SIMPLE FORM - Level 1
/datum/discipline_power/thaumaturgy/path/conjuring/one
	name = "Summon the Simple Form"
	desc = "Conjure a small item made out of a single material with no moving parts."

	level = 1
	check_flags = DISC_CHECK_CAPABLE | DISC_CHECK_CONSCIOUS
	violates_masquerade = TRUE
	toggled = FALSE 

	grouped_powers = list(
		/datum/discipline_power/thaumaturgy/path/conjuring/three
	)

/datum/discipline_power/thaumaturgy/path/conjuring/one/activate()
	. = ..()
	chosen_object = tgui_input_list(owner, "What do you wish to conjure?", "Conjuration", simple_conjured_items)
	chosen_object = new
	owner.put_in_hands(chosen_object)
	addtimer(CALLBACK(src, PROC_REF(object_willpower_cost) chosen_object, owner), 1 SCENES) //RAW is one turn, but you can't do anything in that, and this is a small, single item.
	switch(copy_quality)
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
	var/conjuring_category = tgui_input_list(owner, "What do you wish to conjure?", "Conjuration", simple_conjured_items)
	switch(conjuring_category)
		if("Simple Items")
			chosen_object = tgui_input_list(owner, "What do you wish to conjure?", "Conjuration", simple_conjured_items)
		if("Melee Weapons")
			chosen_object = tgui_input_list(owner, "What do you wish to conjure?", "Conjuration", conjured_melee_weapons)
		if("Ranged Weapons")
			chosen_object = tgui_input_list(owner, "What do you wish to conjure?", "Conjuration", conjured_ranged_weapons)
		if("Ammo")
			chosen_object = tgui_input_list(owner, "What do you wish to conjure?", "Conjuration", conjured_ammo)
		if("Misc items")
			chosen_object = tgui_input_list(owner, "What do you wish to conjure?", "Conjuration", conjured_misc_items)
		else
			display_results(owner, span_notice("Something has gone wrong in the list of conjuring item categories, probably a misspelled entry, let a coder know."))
			return

	if(!chosen_object.conjure_ability_checked = null) 
			ability_check = owner.st_get_stat(chosen_object.conjure_ability_checked)
			ability_check_roll = SSroll.storyteller_roll(dice = owner.st_get_stat(chosen_object.conjure_ability_checked), difficulty = (chosen_object.conjure_difficulty), numerical = TRUE, mobs_to_show_output = owner)
		if(ability_check < chosen_object.conjure_ability_minimum)
			to_chat(owner, span_warning("You don't feel familiar enough with [chosen_object.conjure_ability_check] to summon a [chosen_object.name]"))
			owner.bloodpool += 5 //Returns the BP spent on the ability, because they never had a chance to summon it.
			return
		if(ability_check_roll <= 0)
			to_chat(owner, span_warning("You focus on creating the [chosen_object.name], but the mental image slips from your grip. Maybe if you tried again?"))
			return

	chosen_object = new
	owner.put_in_hands(chosen_object)
	switch(copy_quality)
		if(4)
			chosen_object.name = "Odd [name]"
			chosen_object.force *= 0.9
			chosen_object.toolspeed *= 0.9
			chosen_object.block_chance *= 0.9
			if(chosen_object = /obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 5
		if(3)
			chosen_object.name = "Damaged [name]"
			chosen_object.force *= 0.8
			chosen_object.toolspeed *= 0.8
			chosen_object.block_chance *= 0.8
			if(chosen_object = /obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 10
		if(2)
			chosen_object.name = "Shoddy [name]"
			chosen_object.force *= 0.7
			chosen_object.toolspeed *= 0.7
			chosen_object.block_chance *= 0.7
			if(chosen_object = /obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 15
		if(1)
			chosen_object.name = "Crude [name]"
			chosen_object.force *= 0.6
			chosen_object.toolspeed *= 0.6
			chosen_object.block_chance *= 0.6
			if(chosen_object = /obj/item/gun/ballistic)
				can_misfire = TRUE
				misfire_probability += 20

/datum/discipline_power/thaumaturgy/path/conjuring/proc/object_willpower_cost(obj/item/chosen_object, mob/living/carbon/human/owner)
	willpower_object_sustain = tgui_input_list(owner, "Do you want to sustain [chosen_object]? It will cost one willpower.", "Conjuration", "Yes", "No")
	switch(willpower_object_sustain)
		if("Yes")
			if(owner.st_get_stat(STAT_TEMPORARY_WILLPOWER) <= 0)
				to_chat(owner, span_warning("You don't have any temporary willpower left to sustain[chosen_object]!"))
				qdel(chosen_object)
				return FALSE
			owner.st_set_stat(STAT_TEMPORARY_WILLPOWER, max((owner.st_get_stat(STAT_TEMPORARY_WILLPOWER) - 1),0))
			addtimer(CALLBACK(src, PROC_REF(object_willpower_cost) chosen_object, user), 1 SCENES)
		if("No")
			to_chat(owner, span_warning("You allow the [chosen_object.name] to disspear into nothingness!"))
			qdel(chosen_object)
		else
			to_chat(owner, span_warning("You lose focus and allow the [chosen_object.name] to disspear into nothingness! It looks like a non-standard exit has occured, let a coder know if you got this by accident"))
			qdel(chosen_object)
