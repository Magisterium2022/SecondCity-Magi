/datum/mod_theme/tzimisce
	name = "Fleshcrafted Aegis"
	desc = "A horrific but effective monstrosity, created through liberal use of thr discipline of Vicissitude. Combining carefully extracted neural matter with bone plates and layered muscle tissue, this suit provides an effective defence against many forms of attack. It does, however, share the weakness to fire of its creators."
	default_skin = "civilian" //Need to change this
	armor_type = /datum/armor/mod_theme_civilian //Need to change this
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	complexity_max = DEFAULT_MAX_COMPLEXITY - 3
	slowdown_deployed = 0
	variants = list(
		"civilian" = list(
			/obj/item/clothing/head/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEEARS|HIDEEYES|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSEYES,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/armor/mod_theme_tzimisce
	melee = 35
	bullet = 35
	laser = 10
	energy = 10
	bio = 100
	fire = 5
	acid = 25
	wound = 20
