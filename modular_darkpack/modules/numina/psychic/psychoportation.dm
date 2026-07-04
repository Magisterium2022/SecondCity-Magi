/datum/discipline/psychic/psychoportation
	name = "Psychoportation"
	desc = {"Teleport through space to a known area.
● Short Hop: Move up to 12 + Intelligence yards in a turn.
●● Simple Jump: Range up to 20 + (3 x Intelligence) yards.
●●● Long Jump: Range up to 40 + (6 x Intelligence) yards.
●●●● Leap: Range up to 80 + (12 x Intelligence) yards.
●●●●● Leap of Faith: Memorise a location, then teleport to it in future."}
	icon_state = "numina"
	power_type = /datum/discipline_power/psychic/psychoportation




/datum/discipline_power/psychic/psychoportation
	name = "Psychoportation power name"
	desc = "Psychoportation power description"
	effect_sound = 'modular_darkpack/modules/werewolf_the_apocalypse/sounds/gifts/wolves.ogg'

/datum/discipline_power/psychic/psychoportation/activate()
	. = ..()

//SHORT HOP
/datum/discipline_power/psychic/psychoportation/short_hop
	name = "Short Hop"
	desc = " Move up to 12 + Intelligence tiles."
	level = 1
	violates_masquerade = TRUE
	cooldown_length = 8 SECONDS
	check_flags = DISC_CHECK_IMMOBILE | DISC_CHECK_CAPABLE | DISC_CHECK_LYING

/datum/discipline_power/psychic/psychoportation/short_hop/activate()
	. = ..()
		owner.client?.view_size?.setTo(8)
