/datum/mod_theme/alanson
	name = "alanson"
	desc = "A Alanson Light Hardsuit"
	extended_desc = "The Alanson hardsuit is a large bulky suit that can \
only be concealed beneath a loose trench coat. Even with \
such a covering, its presence will be immediately obvious \
if the wearer is out in daylight or in any other brightly lit \
setting. This suit consists of a relatively form-fitting suit \
of composite body armor, fitted with advanced myomar-based \
motors at every major joint. Worn alone, the suit \
can only be made to appear to be a space suit, a deep-sea \
diving suit, a set of advanced military body armor or a suit \
designed for dealing with hazardous materials. During \
specific missions, Alanson hardsuits can be further disguised \
to enhance such perceptions. This suit is normally \
used in moderately hostile environments or for medium- \
threat missions where subtlety is as useful as force."
	default_skin = "engineering"
	armor_type = /datum/armor/mod_theme_alanson
	resistance_flags = FIRE_PROOF|UNACIDABLE|ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	complexity_max = 100
	charge_drain = DEFAULT_CHARGE_DRAIN * 0
	siemens_coefficient = 0
	slowdown_deployed = 0.1
	activation_step_time = MOD_ACTIVATION_STEP_TIME
	hearing_protection = EAR_PROTECTION_FULL
	allowed_suit_storage = list(
		/obj/item/gun,
	)
	variants = list(
		"alanson" = list(
			/obj/item/clothing/head/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL|STOPSPRESSUREDAMAGE|BLOCK_GAS_SMOKE_EFFECT|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEEARS|HIDEHAIR|HIDESNOUT,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE,
				UNSEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/armor/mod_theme_alanson
	melee = 70
	bullet = 70
	laser = 70
	energy = 70
	bomb = 70
	bio = 100
	fire = 100
	acid = 100
	wound = 20

/datum/mod_theme/martinez
	name = "martinez"
	desc = "A Martinez Heavy Hardsuit"
	extended_desc = "The Martinez hardsuit is a large bulky suit that \
stands almost seven and a half feet tall and cannot be \
concealed under any type of clothing. Martinez suits are \
only used for difficult environments, highly dangerous \
missions or when strength is far more important than \
subtlety. Iteration X leaders prefer these suits only be \
used in isolated settings. This suit consists of a large, \
industrial-looking framework of armored super-conducting \
motors, hydraulic cables and heavy supporting struts \
covering and joined to a suit of advanced composite \
body armor. The suit can be made to appear to be a \
specially made deep-sea diving suit, or a piece of advanced industrial machinery."
	default_skin = "interdyne"
	armor_type = /datum/armor/mod_theme_martinez
	resistance_flags = FIRE_PROOF|UNACIDABLE|ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	complexity_max = 100
	charge_drain = DEFAULT_CHARGE_DRAIN * 0
	siemens_coefficient = 0
	slowdown_deployed = -0.1 //Slight speed boost.
	activation_step_time = MOD_ACTIVATION_STEP_TIME
	hearing_protection = EAR_PROTECTION_FULL
	allowed_suit_storage = list(
		/obj/item/gun,
	)
	variants = list(
		"alanson" = list(
			/obj/item/clothing/head/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL|STOPSPRESSUREDAMAGE|BLOCK_GAS_SMOKE_EFFECT|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEEARS|HIDEHAIR|HIDESNOUT,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE,
				UNSEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/armor/mod_theme_martinez
	melee = 90
	bullet = 90
	laser = 90
	energy = 90
	bomb = 90
	bio = 100
	fire = 100
	acid = 100
	wound = 30
