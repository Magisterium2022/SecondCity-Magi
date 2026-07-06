/datum/discipline/chi/jade_shintai
	name = "Jade Shintai"
	desc = ""
	icon_state = ""
	power_type = /datum/discipline_power/chi/jade_shintai

/datum/discipline_power/chi/jade_shintai
	name = "Jade Shintai power name"
	desc = "Jade Shintai power description"
	effect_sound = ''

//STAND UPON THE DRAGON'S BACK
/datum/discipline_power/chi/jade_shintai/standing
	name = "Stand Upon the Dragon's Back"
	desc = "Root yourself into the Earth and become immovable."
	level = 1
	violates_masquerade = FALSE
	cooldown_length = 1 TURNS
	toggled = TRUE

/datum/discipline_power/chi/jade_shintai/standing/activate()
	. = ..()
	to_chat(owner, span_warning("You focus, cycling the Chi of the Earth through your body and attuning yourself with the ground."))
	ADD_TRAIT(owner, TRAIT_STUNIMMUNE, CHI_TRAIT)
	ADD_TRAIT(owner, TRAIT_PUSHIMMUNE, CHI_TRAIT)

/datum/discipline_power/chi/jade_shintai/standing/deactivate()
	. = ..()
	to_chat(owner, span_warning("You stop cycling the Earth's Chi through your body."))
	REMOVE_TRAIT(owner, TRAIT_STUNIMMUNE, CHI_TRAIT)
	REMOVE_TRAIT(owner, TRAIT_PUSHIMMUNE, CHI_TRAIT)

//TREAD THE THRASHING DRAGON'S TAIL
/datum/discipline_power/chi/jade_shintai/tread
	name = "Tread the Thrashing Dragon's Tail"
	desc = "Align your Chi with the surroundings and become light enough to walk on water and up walls."
	level = 2
	violates_masquerade = FALSE
	cooldown_length = 1 TURNS
	toggled = TRUE

/datum/discipline_power/chi/jade_shintai/tread/activate()
	. = ..()
	to_chat(owner, span_warning("You focus on the natural Chi currents, aligning yourself with them."))
	ADD_TRAIT(owner, TRAIT_FREERUNNING, CHI_TRAIT)
	ADD_TRAIT(owner, TRAIT_NO_SLIP_ALL, CHI_TRAIT)
	ADD_TRAIT(owner, TRAIT_IMMERSE_STOPPED, CHI_TRAIT)
	owner.st_add_stat_mod(STAT_ATHLETICS, 10, "Shintai")

/datum/discipline_power/chi/jade_shintai/tread/deactivate()
	. = ..()
	to_chat(owner, span_warning("You stop aligning yourself with the natural Chi currents.."))
	REMOVE_TRAIT(owner, TRAIT_FREERUNNING, CHI_TRAIT)
	REMOVE_TRAIT(owner, TRAIT_NO_SLIP_ALL, CHI_TRAIT)
	REMOVE_TRAIT(owner, TRAIT_IMMERSE_STOPPED, CHI_TRAIT)
	owner.st_remove_stat_mod(STAT_ATHLETICS, 10, "Shintai")

//PLACATE THE EARTH DRAGON
/datum/discipline_power/chi/jade_shintai/placate
	name = "Placate the Earth Dragon"
	desc = "Align your Chi with the surroundings and become light enough to walk on water and up walls."
	level = 3
	violates_masquerade = FALSE
	cooldown_length = 1 TURNS
	toggled = TRUE

/datum/storyteller_roll/placate
	bumper_text = "placate"
	applicable_stats = list(STAT_MANIPULATION, STAT_ETIQUETTE)
	numerical = TRUE
	roll_output_type = ROLL_PRIVATE

/datum/discipline_power/chi/jade_shintai/placate/pre_activation_checks()
	. = ..()
	if(activating) // Prevent multi-activation while the do_after is ongoing
		to_chat(owner, span_warning("You are already attempting to activate Placate the Earth Dragon!"))
		return FALSE
	if(HAS_TRAIT(SPENDING_YIN))
		if(owner.yin_chi <= 0)
			to_chat(owner, span_warning("You do not have enough Yin Chi!"))
			return FALSE
		owner.adjust_chi_pool(1, TRUE, null, Yin)
		activating = TRUE
	if(HAS_TRAIT(SPENDING_YANG))
		if(owner.yang_chi <= 0)
			to_chat(owner, span_warning("You do not have enough Yin Chi!"))
			return FALSE
		owner.adjust_chi_pool(-1, TRUE, null, Yang)
		activating = TRUE
	to_chat(owner, span_warning("You focus on attuning yourself with the Earth"))

	var/datum/storyteller_roll/placate/earth = new()
	earth.difficulty = owner.get_gauntlet_rating()
	var/roll_result = earth.st_roll(user, src)

	if(roll_result <= 0)
		to_chat(owner, span_warning("The local Wall rebuffs your efforts"))
		return FALSE
	if(do_after(owner, 3 TURNS, timed_action_flags = (IGNORE_USER_LOC_CHANGE | IGNORE_TARGET_LOC_CHANGE | IGNORE_HELD_ITEM)))
		return TRUE

/datum/discipline_power/chi/jade_shintai/placate/activate()
	. = ..()
	var/placate_choice = tgui_input_list(owner, Do you wish to pass a barrier or sink below the earth?", "Choice", list("Barrier", "Sink"))
		if(!placate_choice)
			return FALSE
	switch(placate_choice)
		if("Barrier")

		if("Sink")
			owner.drop_all_held_items()
			owner.Stun(1 TURNS) // Dirt can't move, and neither can you!
			animate(owner, transform = matrix()/4, color = "#35240b", time = 1 SECONDS) // Sink into the earth
			addtimer(CALLBACK(src, PROC_REF(become_soil)), 1 SECONDS)

/datum/discipline_power/chi/jade_shintai/placate/proc/become_soil()
	animate(owner, transform = matrix(), color = "#ffffff", time = 10) // Reset ourselves while we're invisible
	D = new (get_turf(owner)) // Spawn some dirt
	D.alpha = 64 // Subtle dirt
	owner.forceMove(D) // Put ourselves inside the dirt
