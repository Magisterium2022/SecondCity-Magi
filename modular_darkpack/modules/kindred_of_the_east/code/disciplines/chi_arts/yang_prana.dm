/datum/discipline/chi/yang_prana
	name = "Yang Prana"
	desc = "Invoke the power of flames."
	icon_state = "ghostfire"
	power_type = /datum/discipline_power/chi/ghost_flame_shintai

/datum/discipline_power/chi/yang_prana
	name = "Yang Prana power name"
	desc = "Yang Prana power description"
	effect_sound = 'code/modules/wod13/sounds/ghostflameshintai_activate.ogg'

/datum/discipline_power/chi/yang_prana/pre_activation_checks()
	. = ..()
	if(discipline.level > max(st_get_stat(STAT_DEXTERITY), st_get_stat(STAT_STAMINA)))
		to_chat(owner, span_warning("You don't feel tough or dextrous enough to use that level of Yang Prana!"))
		return
	else
		owner.visible_message(span_notice("[owner] begins performing an elaborate set of flips and jumps!"))
		emote("flip")



//GOBLIN FACE
/datum/discipline_power/chi/yang_prana/principle_of_motion
	name = "Principle of Motion"
	desc = "I"
	level = 1
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE



/datum/discipline_power/chi/yang_prana/principle_of_motion/activate()
	. = ..()

/datum/discipline_power/chi/yang_prana/goblin_face/deactivate()
	. = ..()
