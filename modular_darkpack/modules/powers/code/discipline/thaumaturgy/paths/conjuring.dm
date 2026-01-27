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
	),
	CAT_RANGED = list(
	),
	CAT_MISC = list(
	),
))
