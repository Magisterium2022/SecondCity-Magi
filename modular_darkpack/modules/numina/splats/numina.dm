/datum/splat/numina
	name = "Numina"
	desc = "The supernatural is not limited to Vampires and Werewolves. Some humans are possessed of strange abilities, whether through innate traits, faith, or long decades of practice."
	id = SPLAT_NUMINA

	splat_actions = list(
		/datum/action/cooldown/mob_cooldown/give_vitae,
		/datum/action/cooldown/blood_power,
	)
	splat_biotypes = MOB_UNDEAD

	incompatible_splats = list(
		/datum/splat/vampire/ghoul
	)

	/// How many generations away from the first vampire they are. Determines how much blood can be stored and used
	var/generation
	/// How quickly they can spend vitae. Depends on Generation and affects abilities like bloodheal
	var/vitae_spending_rate
	/// Which vampiric bloodline or Clan they fall into. Determines natural Disciplines. Singleton reference, never modify
	var/datum/subsplat/vampire_clan/clan
	/// Which morality they follow, Humanity if false and Enlightenment if true
	var/enlightenment
	/// The Kindred who created this Kindred, null unless Embraced in-round
	var/mob/living/sire

	/// Timer tracking how long before the Kindred can wake up from torpor
	COOLDOWN_DECLARE(torpor_timer)


