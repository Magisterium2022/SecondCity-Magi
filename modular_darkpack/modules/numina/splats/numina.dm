/datum/splat/numina
	abstract_type = /datum/splat/numina

	/// Which forms of Numina they can be. Currently True Faith, Psychic, and Sorcery.
	var/datum/subsplat/numina/true_faith
	var/datum/subsplat/numina/psychic
	var/datum/subsplat/numina/sorcery

	power_type = /datum/discipline/numina

	incompatible_splats = list(
		/datum/splat/vampire/ghoul,
		/datum/splat/vampire/kindred,
		/datum/splat/vampire/garou
	)

	/// How many generations away from the first vampire they are. Determines how much blood can be stored and used
	var/generation
	/// How quickly they can spend vitae. Depends on Generation and affects abilities like bloodheal
	var/vitae_spending_rate
	/// Which morality they follow, Humanity if false and Enlightenment if true
	var/enlightenment
	/// The Kindred who created this Kindred, null unless Embraced in-round
	var/mob/living/sire

	/// Timer tracking how long before the Kindred can wake up from torpor
	COOLDOWN_DECLARE(torpor_timer)


