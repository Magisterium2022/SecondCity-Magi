/datum/splat/vampire/kindred/kuei_jin
	name = "Kuei Jin"
	desc = "Hungry dead, risen from the Hells to return to life \
			They seek enlightenment based on their philosophy."
	id = SPLAT_KJ

	splat_traits = list(
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOHUNGER,
		TRAIT_NOBREATH,
		TRAIT_NOCRITDAMAGE,
		TRAIT_LIVERLESS_METABOLISM,
		TRAIT_RADIMMUNE,
		TRAIT_CAN_ENTER_TORPOR,
		TRAIT_KJ_DHARMAS,
		TRAIT_KJ_RANKS,
		TRAIT_UNAGING,
		TRAIT_DRINKS_BLOOD
	)
	splat_actions = list(

	)
	splat_biotypes = MOB_UNDEAD

	incompatible_splats = list(
		/datum/splat/vampire/ghoul,
		/datum/splat/vampire
	)

	/// What level their Dharma is at. Equivalent to Generation for Kindred, with 1 being roughly 13th and 10 being roughly 3rd.
	var/dharma_level
	/// How quickly they can spend Chi. Depends on Dharma level.
	var/chi_spending_rate
	/// Which Dharma they follow. Determines some factors, such as access to unique Chi Disciplines. Singleton reference, never modify
	var/datum/subsplat/dharma
	/// What Chi aspect they are cycled towards. Yang is energetic and life, Yin is calm and death. Being extremely cycled towards one or the other has consequences.
	var/chi_aspected
