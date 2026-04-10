/datum/discipline/chi/yin_prana
	name = "Yin Prana"
	desc = "Invoke the power of Cold and Death."
	icon_state = "ghostfire"
	power_type = /datum/discipline_power/chi/yin_prana

/datum/discipline_power/chi/yin_prana
	name = "Yin Prana power name"
	desc = "Yin Prana power description"
	effect_sound = 'code/modules/wod13/sounds/ghostflameshintai_activate.ogg'

/datum/discipline_power/chi/yin_prana/pre_activation_checks()
	. = ..()
	if(discipline.level > max(st_get_stat(STAT_STRENGTH), st_get_stat(STAT_STAMINA)))
		to_chat(owner, span_warning("You don't feel tough or strong enough to use that level of Yang Prana!"))
		return
	else
		owner.visible_message(span_notice("[owner] begins focusing intently, freezing completely still in place."))



//
/datum/discipline_power/chi/yin_prana/principle_of_motion
	name = "Principle of Motion"
	desc = "I"
	level = 1
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE



/datum/discipline_power/chi/yin_prana/principle_of_motion/activate()
	. = ..()

/datum/discipline_power/chi/yin_prana/goblin_face/deactivate()
	. = ..()
