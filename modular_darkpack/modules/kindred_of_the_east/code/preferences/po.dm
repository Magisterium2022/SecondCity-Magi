/datum/preference/choiced/po_type
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_key = "po"
	savefile_identifier = PREFERENCE_CHARACTER
	priority = PREFERENCE_PRIORITY_WORLD_OF_DARKNESS
	relevant_inherent_trait = TRAIT_KJ

/datum/preference/choiced/po_type/is_valid(value, datum/preferences/preferences)
	return isnum(value) && value >= MIN_PLAYER_DHARMA && value <= MAX_PLAYER_DHARMA

/datum/preference/choiced/po_type/deserialize(input, datum/preferences/preferences)


/datum/preferencechoiced/po_type/apply_to_human(mob/living/carbon/human/target, value)
