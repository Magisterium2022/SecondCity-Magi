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

GLOBAL_LIST_INIT(conjuring_options, list(
	CAT_SIMPLE = list(
	/obj/item/vampire_stake,
	/obj/item/melee/baseball_bat/vamp,
	/obj/item/melee/vamp/tire,
	/obj/item/melee/baton/vamp,
	/obj/item/melee/vamp/brick
	),
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
	CAT_RANGED = list(
	),
	CAT_MISC = list(
	),
))
