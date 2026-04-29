/datum/preference/numeric/dharma
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_key = "dharma"
	savefile_identifier = PREFERENCE_CHARACTER
	priority = PREFERENCE_PRIORITY_WORLD_OF_DARKNESS
	relevant_inherent_trait = TRAIT_DRINKS_BLOOD
	minimum = MIN_PLAYER_DHARMA
	maximum = MAX_PLAYER_DHARMA

/datum/preference/numeric/dharma/is_valid(value, datum/preferences/preferences)
	return isnum(value) && value >= MIN_PLAYER_DHARMA && value <= MAX_PLAYER_DHARMA

/datum/preference/numeric/dharma/deserialize(input, datum/preferences/preferences)
	if(istext(input))
		input = text2num(input)
	return sanitize_float(input, MIN_PLAYER_DHARMA, MAX_PLAYER_DHARMA, 1, rand(MIN_PLAYER_DHARMA, MAX_PLAYER_DHARMA))

/datum/preference/numeric/dharma/apply_to_human(mob/living/carbon/human/target, value)
	//get_kindred_splat(target)?.set_generation(value)
