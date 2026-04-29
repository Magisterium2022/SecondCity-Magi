/datum/discipline/chi/black_wind
	name = "Black Wind"
	desc = "Draw upon your P'o for speed and power, but risk your control." //RAW is a little unclear as to whether it costs chi per turn, stating both that it's gained at the same speed as lost, and that you need to spend it, but given there's a frenzy roll every turn it's on, I'm inclined to be favourable towards the cost.
	icon_state = "blackwind"
	power_type = /datum/discipline_power/chi/black_wind

/datum/discipline_power/chi/black_wind
	name = "Black Wind power name"
	desc = "Black Wind power description"

	activate_sound = 'code/modules/wod13/sounds/blackwind_activate.ogg'
	deactivate_sound = 'code/modules/wod13/sounds/blackwind_activate.ogg'
	duration_length = 2 TURNS

/datum/discipline_power/chi/black_wind/activate()
	. = ..() //Add proper frenzy check. 



//BLACK WIND 1
/datum/discipline_power/chi/black_wind/one
	name = "Black Wind 1"
	desc = "Draw upon the barest essence of your P'o."

	check_flags = DISC_CHECK_LYING | DISC_CHECK_IMMOBILE

	toggled = TRUE

	grouped_powers = list(
		/datum/discipline_power/chi/black_wind/two,
		/datum/discipline_power/chi/black_wind/three,
		/datum/discipline_power/chi/black_wind/four,
		/datum/discipline_power/chi/black_wind/five
	)

/datum/discipline_power/chi/black_wind/one/activate()
	. = ..()

	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(temporis_explode))
	owner.apply_status_effect(/datum/status_effect/celerity/one)

/datum/discipline_power/chi/black_wind/one/deactivate()
	. = ..()

	UnregisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION)
	owner.remove_status_effect(/datum/status_effect/celerity/one)

/datum/discipline_power/chi/black_wind/one/post_gain()
	owner.st_add_stat_mod(STAT_DEXTERITY, 1, "Black Wind")

//BLACK WIND 2
/datum/discipline_power/chi/black_wind/two
	name = "Black Wind 2"
	desc = "Enhance your speed through your inner darkness."

	check_flags = DISC_CHECK_LYING | DISC_CHECK_IMMOBILE

	toggled = TRUE

	grouped_powers = list(
		/datum/discipline_power/chi/black_wind/one,
		/datum/discipline_power/chi/black_wind/three,
		/datum/discipline_power/chi/black_wind/four,
		/datum/discipline_power/chi/black_wind/five
	)

/datum/discipline_power/chi/black_wind/two/activate()
	. = ..()

	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(temporis_explode))
	owner.apply_status_effect(/datum/status_effect/celerity/two)

/datum/discipline_power/chi/black_wind/two/deactivate()
	. = ..()

	UnregisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION)
	owner.remove_status_effect(/datum/status_effect/celerity/two)

/datum/discipline_power/chi/black_wind/two/post_gain()
	owner.st_add_stat_mod(STAT_DEXTERITY, 2, "Black Wind")

//BLACK WIND 3
/datum/discipline_power/chi/black_wind/three
	name = "Black Wind 3"
	desc = "Trade control for speed. Move swiftly."

	check_flags = DISC_CHECK_LYING | DISC_CHECK_IMMOBILE

	toggled = TRUE

	grouped_powers = list(
		/datum/discipline_power/chi/black_wind/one,
		/datum/discipline_power/chi/black_wind/two,
		/datum/discipline_power/chi/black_wind/four,
		/datum/discipline_power/chi/black_wind/five
	)

/datum/discipline_power/chi/black_wind/three/activate()
	. = ..()

	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(temporis_explode))
	owner.apply_status_effect(/datum/status_effect/celerity/three)

/datum/discipline_power/chi/black_wind/three/deactivate()
	. = ..()

	UnregisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION)
	owner.remove_status_effect(/datum/status_effect/celerity/three)

/datum/discipline_power/chi/black_wind/three/post_gain()
	owner.st_add_stat_mod(STAT_DEXTERITY, 3, "Black Wind")

//BLACK WIND 4
/datum/discipline_power/chi/black_wind/four
	name = "Black Wind 4"
	desc = "Speed enough to match any, but at what cost?"

	check_flags = DISC_CHECK_LYING | DISC_CHECK_IMMOBILE

	toggled = TRUE

	grouped_powers = list(
		/datum/discipline_power/chi/black_wind/one,
		/datum/discipline_power/chi/black_wind/two,
		/datum/discipline_power/chi/black_wind/three,
		/datum/discipline_power/chi/black_wind/five
	)

/datum/discipline_power/chi/black_wind/four/activate()
	. = ..()

	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(temporis_explode))
	owner.apply_status_effect(/datum/status_effect/celerity/four)

/datum/discipline_power/chi/black_wind/four/deactivate()
	. = ..()

	UnregisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION)
	owner.remove_status_effect(/datum/status_effect/celerity/four)

/datum/discipline_power/chi/black_wind/four/post_gain()
	owner.st_add_stat_mod(STAT_DEXTERITY, 4, "Black Wind")

//BLACK WIND 5
/datum/discipline_power/chi/black_wind/five
	name = "Black Wind 5"
	desc = "Lose control, and gain swiftness."

	check_flags = DISC_CHECK_LYING | DISC_CHECK_IMMOBILE

	toggled = TRUE

	grouped_powers = list(
		/datum/discipline_power/chi/black_wind/one,
		/datum/discipline_power/chi/black_wind/two,
		/datum/discipline_power/chi/black_wind/three,
		/datum/discipline_power/chi/black_wind/four
	)

/datum/discipline_power/chi/black_wind/five/activate()
	. = ..()

	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(temporis_explode))
	owner.apply_status_effect(/datum/status_effect/celerity/five)

/datum/discipline_power/chi/black_wind/five/deactivate()
	. = ..()

	UnregisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION)
	owner.remove_status_effect(/datum/status_effect/celerity/five)

/datum/discipline_power/chi/black_wind/five/post_gain()
	owner.st_add_stat_mod(STAT_DEXTERITY, 5, "Black Wind")
