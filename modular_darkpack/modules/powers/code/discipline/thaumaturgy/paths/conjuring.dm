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
	var/copy_quality = 0

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
	//Anything else which is mechsnically or materially complex,  ut not a weapon. Lighters, etc.
	CAT_MISC = list(
	),
))
