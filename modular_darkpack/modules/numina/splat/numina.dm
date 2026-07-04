/datum/splat/numina
	abstract_type = /datum/splat/numina


	name = "Numina"
	desc = "Psychics, Sorcerers, and those with True Faith are all classed under Numina \
			They wield a variety of powers, but are ultimately human."
	id = SPLAT_NUMINA

	/// Which forms of Numina they can be. Currently True Faith, Psychic, and Sorcery.
	var/datum/subsplat/numina/true_faith
	var/datum/subsplat/numina/psychic
	var/datum/subsplat/numina/sorcery

	power_type = /datum/discipline/numina

	incompatible_splats = list(
		/datum/splat/vampire,
		/datum/splat/werewolf
	)
