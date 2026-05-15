/datum/discipline/temporis
	name = "Temporis"
	desc = "Temporis is a Discipline unique to the True Brujah. Supposedly a refinement of Celerity, Temporis grants the Cainite the ability to manipulate the flow of time itself."
	icon_state = "temporis"
	clan_restricted = TRUE
	power_type = /datum/discipline_power/temporis
	signature_clan = VAMPIRE_CLAN_TRUE_BRUJAH

/datum/discipline_power/temporis
	name = "Temporis power name"
	desc = "Temporis power description"

	activate_sound = 'modular_darkpack/modules/powers/sounds/temporis/temporis.ogg'

/datum/discipline_power/temporis/activate()
	. = ..()
	ADD_TRAIT(owner, TRAIT_TIMEWARPER, DISCIPLINE_TRAIT(type))

/datum/discipline_power/temporis/proc/celerity_explode(datum/source, datum/discipline_power/power, atom/target)
	SIGNAL_HANDLER

	if (!istype(power, /datum/discipline_power/celerity))
		return

	to_chat(owner, span_userdanger("You try to use Celerity, but your active Temporis causes your body to wrench itself apart!"))
	INVOKE_ASYNC(owner, TYPE_PROC_REF(/mob, emote), "scream")
	addtimer(CALLBACK(owner, TYPE_PROC_REF(/mob/living/carbon/human, gib)), 3 SECONDS)

	return POWER_CANCEL_ACTIVATION

//HOURGLASS OF THE MIND
/datum/discipline_power/temporis/hourglass_of_the_mind
	name = "Hourglass of the Mind"
	desc = "Gain a perfect sense of time. Know exactly when you are."

	level = 1
	check_flags = DISC_CHECK_CONSCIOUS
	vitae_cost = 0

/datum/discipline_power/temporis/hourglass_of_the_mind/post_gain()
	ADD_TRAIT(owner, TRAIT_TIME_SENSE, DISCIPLINE_TRAIT(type))

/datum/discipline_power/temporis/hourglass_of_the_mind/activate()
	. = ..()
	to_chat(owner, "<b>[server_timestamp("hh:mm:ss", ic_time = TRUE, twelve_hour_clock = owner.client?.prefs.read_preference(/datum/preference/toggle/twelve_hour))]</b>")

	// Check range for targets with that have warped time this round and display them, if any exist
	var/list/targets = list()
	var/list/targets_weak = list()
	for(var/mob/living/carbon/human/target in view(range, owner))
		if(target == owner)
			continue
		if(HAS_TRAIT(target, TRAIT_TIMEWARPER)) //Temporis and other obvious time warping effects.
			targets += target
		if(HAS_TRAIT(target, TRAIT_TIMEWARPER_MINOR)) //Celerity and other weak time warping effects.
			targets_weak += target
	if(targets.len)
		var/target_list = ""
		for(var/i = 1 to targets.len)
			var/mob/living/carbon/human/target = targets[i]
			target_list += target.name
			if(i < targets.len - 1)
				target_list += ", "
			else if(i == targets.len - 1)
				target_list += " and "
		to_chat(owner, span_notice("[english_list(targets)] [targets.len == 1 ? "has" : "have"] temporal distortions around [targets.len == 1 ? "themself" : "themselves"]."))
	if(targets_weak.len)
		var/target_weak_list = ""
		for(var/i = 1 to targets_weak.len)
			var/mob/living/carbon/human/target = targets_weak[i]
			target_weak_list += target.name
			if(i < targets_weak.len - 1)
				target_weak_list += ", "
			else if(i == targets_weak.len - 1)
				target_weak_list += " and "
		to_chat(owner, span_notice("[english_list(targets_weak)] [targets_weak.len == 1 ? "has" : "have"] weak temporal distortions around [targets_weak.len == 1 ? "themself" : "themselves"]."))
	else
		to_chat(owner, span_notice("There are no temporal distortions nearby."))

//RECURRING CONTEMPLATION
/datum/discipline_power/temporis/recurring_contemplation
	name = "Recurring Contemplation"
	desc = "Trap your target into repeating the same set of actions."

	level = 2
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE
	target_type = TARGET_LIVING
	range = 7
	vitae_cost = 0 //You *can* spend a BP to boost this, but it'd extend time to hours or a day.

	hostile = TRUE

	cooldown_length = 15 SECONDS


/datum/storyteller_roll/temporis/recurring_contemplation_roll
	bumper_text = "Recurring Contemplation"
	applicable_stats = list(STAT_MANIPULATION, STAT_OCCULT)
	numerical = TRUE
	roll_output_type = ROLL_PRIVATE

/datum/discipline_power/temporis/recurring_contemplation/pre_activation_checks(mob/living/target)
	. = ..()
	recurring_contemplation_roll = new()
	recurring_contemplation_roll.difficulty = target.st_get_stat(STAT_TEMPORARY_WILLPOWER)
	successes = recurring_contemplation_roll.st_roll(owner, target)

/datum/discipline_power/temporis/recurring_contemplation/activate(mob/living/target)
	. = ..()
	if(successes <= 0)
		to_chat(owner, span_notice("Your efforts fail to loop [target]!"))
		return
	target.AddComponent(/datum/component/dejavu, rewinds = (successes * (1 MINUTE / city_time_rate_multiplier)), interval = (5 SECONDS))

//LEADEN MOMENT
/datum/discipline_power/temporis/leaden_moment
	name = "Leaden Moment"
	desc = "Slow time around your opponent, reducing their speed."

	level = 3
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE
	target_type = TARGET_LIVING
	range = 7

	hostile = TRUE

	multi_activate = TRUE
	cooldown_length = 15 SECONDS

/datum/storyteller_roll/temporis/leaden_moment_roll
	bumper_text = "Leaden Moment"
	applicable_stats = list(STAT_INTELLIGENCE, STAT_OCCULT)
	numerical = TRUE
	roll_output_type = ROLL_PRIVATE

/datum/movespeed_modifier/temporis
/datum/actionspeed_modifier/status_effect/temporis

/datum/discipline_power/temporis/leaden_moment/pre_activation_checks(mob/living/target)
	. = ..()
	leaden_moment_roll = new()
	successes = leaden_moment_roll.st_roll(owner, target)

/datum/discipline_power/temporis/leaden_moment/activate(mob/living/target)
	. = ..()
	if(successes == 0)
		to_chat(owner, span_notice("Your efforts fail to slow [target]] down!"))
		return
	var/datum/movespeed_modifier/temporis/leaden_moment = new()
	var/datum/actionspeed_modifier/status_effect/temporis/leaden_moment_action = new()
	leaden_moment.multiplicative_slowdown = (2 + round(abs(successes / 2)))
	leaden_moment_action.multiplicative_slowdown = (2 + round(abs(successes / 2)))
	var/duration = (1 TURNS * round(abs(successes / 2)))
	if(successes < 0)
		to_chat(owner, span_userdanger("<b>Slow down.</b>"))
		owner.add_movespeed_modifier(/datum/movespeed_modifier/temporis)
		owner.add_actionspeed_modifier(leaden_moment_action)
		addtimer(CALLBACK(owner, PROC_REF(remove_movespeed_modifier), /datum/movespeed_modifier/temporis, duration))
		addtimer(CALLBACK(owner, PROC_REF(remove_actionspeed_modifier), /datum/actionspeed_modifier/status_effect/temporis, duration))
	to_chat(target, span_userdanger("<b>Slow down.</b>"))
	target.add_movespeed_modifier(/datum/movespeed_modifier/temporis)
	target.add_actionspeed_modifier(leaden_moment_action)
	addtimer(CALLBACK(target, PROC_REF(remove_movespeed_modifier), /datum/movespeed_modifier/temporis, duration))
	addtimer(CALLBACK(target, PROC_REF(remove_actionspeed_modifier), /datum/actionspeed_modifier/status_effect/temporis, duration))


//PATIENCE OF THE NORNS
/datum/discipline_power/temporis/patience_of_the_norns
	name = "Patience of the Norns"
	desc = "Be in multiple places at once, creating several false images."

	level = 4
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE

	violates_masquerade = TRUE

	cancelable = TRUE
	duration_length = 10 SECONDS
	cooldown_length = 15 SECONDS

/datum/discipline_power/temporis/patience_of_the_norns/activate()
	. = ..()
	var/matrix/initial_matrix = matrix(owner.transform)
	var/matrix/secondary_matrix = matrix(owner.transform)
	var/matrix/tertiary_matrix = matrix(owner.transform)
	initial_matrix.Translate(1,0)
	secondary_matrix.Translate(0,1)
	tertiary_matrix.Translate(1)
	animate(owner, transform = initial_matrix, time = 1 SECONDS, loop = 0)
	animate(owner, transform = secondary_matrix, time = 1 SECONDS, loop = 0, ANIMATION_PARALLEL)
	animate(owner, transform = tertiary_matrix, time = 1 SECONDS, loop = 0, ANIMATION_PARALLEL)
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(temporis_visual))
	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(celerity_explode))

/datum/discipline_power/temporis/patience_of_the_norns/deactivate()
	. = ..()
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)
	UnregisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION)

/datum/discipline_power/temporis/patience_of_the_norns/proc/temporis_visual(datum/discipline_power/temporis/source, atom/newloc, dir)
	SIGNAL_HANDLER

	new /obj/effect/temporis/patience_of_the_norns(owner.loc, owner)

	SEND_SIGNAL(owner, COMSIG_MASQUERADE_VIOLATION)

//CLOTHOS GIFT
/datum/discipline_power/temporis/clothos_gift
	name = "Clotho's Gift"
	desc = "Accelerate yourself through time and magnify your speed."

	level = 5
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE
	vitae_cost = 3

	violates_masquerade = TRUE

	cancelable = TRUE
	duration_length = 10 SECONDS
	cooldown_length = 15 SECONDS

/datum/discipline_power/temporis/clothos_gift/activate()
	. = ..()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/temporis5)
	owner.next_move_modifier *= 0.25
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(temporis_visual))
	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(celerity_explode))

/datum/discipline_power/temporis/clothos_gift/deactivate()
	. = ..()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/temporis5)
	owner.next_move_modifier /= 0.25
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)
	UnregisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION)

/datum/discipline_power/temporis/clothos_gift/proc/temporis_visual(datum/discipline_power/temporis/source, atom/newloc, dir)
	SIGNAL_HANDLER

	new /obj/effect/temporis/clothos_gift(owner.loc, owner)

	SEND_SIGNAL(owner, COMSIG_MASQUERADE_VIOLATION)

/datum/movespeed_modifier/temporis5
	multiplicative_slowdown = -2.5
