/datum/splat/vampire/kindred/kuei_jin/get_splat_description()
	return "Kindred of the East!"

// Pulled straight from the wiki https://whitewolf.fandom.com/wiki/Vampire_(WOD)
/datum/splat/vampire/kindred/kuei_jin/get_splat_lore()
	return list(
		"Kuei-jin are the vampires of East and Southeast Asia, the karmically cursed outcasts dwelling on the Middle Kingdom's fringes. Other terms to describe them include Wan Kuei, Wan Xian, Gui Ren, asuratizayya (in India and by the Ravnos), or simply the \"Hungry Dead\".",
	)

/datum/splat/vampire/kindred/kuei_jin/create_pref_unique_perks() //Overrides base to avoid Kuei-Jin having their pick of Kindred clans.
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = FA_ICON_BOOK_DEAD,
			SPECIES_PERK_NAME = "Dharma",
			SPECIES_PERK_DESC = "Each Kuei-Jin follows some form of Dharma, a path to enlightenment or personal philosophy and morality, taking many forms!",
		),
	)

	return to_add
