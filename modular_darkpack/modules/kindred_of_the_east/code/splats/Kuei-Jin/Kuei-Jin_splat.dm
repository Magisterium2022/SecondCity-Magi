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
		TRAIT_STAKE_IMMUNE,
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

/datum/splat/vampire/kindred/kuei_jin/on_gain()
	if (!isdummy(owner))
		GLOB.kindred_list |= owner

	// Set generation for dominate, etc, purposes.
	set_generation(14 - dharma)

	owner.give_st_power() //Add Chi healing and check for if they're Scorpion Eaters or not to use the right chi.

	//vampires die instantly upon having their heart removed
	RegisterSignal(owner, COMSIG_CARBON_LOSE_ORGAN, PROC_REF(handle_lose_organ))

	//vampires don't die while in crit, they just slip into torpor after 2 minutes of being critted
	RegisterSignal(owner, SIGNAL_ADDTRAIT(TRAIT_CRITICAL_CONDITION), PROC_REF(handle_enter_critical_condition))

	//vampires resist vampire bites better than mortals
	RegisterSignal(owner, COMSIG_MOB_VAMPIRE_SUCKED, PROC_REF(on_vampire_bitten))

	// Apply bashing damage resistance
	RegisterSignal(owner, COMSIG_MOB_APPLY_DAMAGE_MODIFIERS, PROC_REF(damage_resistance))

	// Prevent blood loss and regeneration effects
	RegisterSignal(owner, COMSIG_HUMAN_ON_HANDLE_BLOOD, PROC_REF(kindred_blood))

	RegisterSignal(owner, COMSIG_LIVING_DEATH, PROC_REF(on_kindred_death))

	// Yang aspected Kuei-Jin can eat food just fine, but Yin aspected can't.
	if((src.chi_aspected = yin) || (src.chi_aspected = yin_strong))
		var/obj/item/organ/tongue/tongue = owner.get_organ_by_type(/obj/item/organ/tongue)
		tongue?.liked_foodtypes = NONE
		tongue?.disliked_foodtypes = NONE
		tongue?.toxic_foodtypes = ~(GORE | MEAT | RAW)

	if(src.chi_aspected = yin_strong)
		ADD_TRAIT(src, TRAIT_COLD_AURA, GENERIC) //Stacks with observe text to make them look paler.

	if((src.chi_aspected = yang) || (src.chi_aspected = yang_strong))
		ADD_TRAIT(src, TRAIT_WARM_AURA, GENERIC)
		ADD_TRAIT(src, TRAIT_BLUSH_OF_HEALTH, GENERIC)

	// Apply temperature damage modifiers
	owner.physiology.heat_mod *= 2
	owner.physiology.cold_mod *= 0.25

/datum/splat/vampire/kindred/on_lose()


	UnregisterSignal(owner, list(
		COMSIG_CARBON_LOSE_ORGAN,
		SIGNAL_ADDTRAIT(TRAIT_CRITICAL_CONDITION),
		COMSIG_MOB_VAMPIRE_SUCKED,
		COMSIG_MOB_APPLY_DAMAGE_MODIFIERS,
		COMSIG_HUMAN_ON_HANDLE_BLOOD,
		COMSIG_LIVING_DEATH
	))

	// Reset tongue
	var/obj/item/organ/tongue/tongue = owner.get_organ_by_type(/obj/item/organ/tongue)
	tongue?.liked_foodtypes = initial(tongue.liked_foodtypes)
	tongue?.disliked_foodtypes = initial(tongue.disliked_foodtypes)
	tongue?.toxic_foodtypes = initial(tongue.toxic_foodtypes)

	// Reset blood type
	owner.set_blood_type()

	// Reset temperature damage modifiers
	owner.physiology.heat_mod *= 0.5
	owner.physiology.cold_mod *= 4
