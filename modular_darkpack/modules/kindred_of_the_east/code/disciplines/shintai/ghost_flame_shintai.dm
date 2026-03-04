/datum/discipline/chi/ghost_flame_shintai
	name = "Ghost-Flame Shintai"
	desc = "Invoke the power of flames."
	icon_state = "ghostfire"
	power_type = /datum/discipline_power/chi/ghost_flame_shintai

/datum/discipline_power/chi/ghost_flame_shintai
	name = "Ghost-Flame Shintai power name"
	desc = "Ghost-Flame Shintai power description"
	effect_sound = 'code/modules/wod13/sounds/ghostflameshintai_activate.ogg'


//GOBLIN FACE
/datum/discipline_power/chi/ghost_flame_shintai/goblin_face
	name = "Goblin Face"
	desc = "Ignite your face with flames of Yin or Yang Chi."
	level = 1
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE

/datum/discipline_power/chi/ghost_flame_shintai/goblin_face/pre_activation_checks()
	. = ..()
	if(activating) // Prevent multi-activation while the do_after is ongoing
		to_chat(owner, span_warning("You are already attempting to activate Goblin Face!"))
		return FALSE
	activating = TRUE
	to_chat(owner, span_warning("You focus, your face beginning to ignite into flames"))
	if(do_after(owner, 1 TURNS, timed_action_flags = (IGNORE_USER_LOC_CHANGE | IGNORE_TARGET_LOC_CHANGE | IGNORE_HELD_ITEM)))
		return TRUE

/datum/discipline_power/chi/ghost_flame_shintai/goblin_face/activate()
	. = ..()
	owner.overlay_fullscreen("ghostflame", /atom/movable/screen/fullscreen/see_through_darkness)
	owner.set_light(1.4,5,"#ff8c00")
	ADD_TRAIT(owner, TRAIT_LUMINESCENT_EYES, DISCIPLINE_TRAIT)
	ADD_TRAIT(owner, TRAIT_MASQUERADE_VIOLATING_FACE, DISCIPLINE_TRAIT)

/datum/discipline_power/chi/ghost_flame_shintai/goblin_face/activate()
	. = ..()
	owner.clear_fullscreen("ghostflame", 5)
	owner.set_light(0)
	ADD_TRAIT(owner, TRAIT_LUMINESCENT_EYES, DISCIPLINE_TRAIT)
	ADD_TRAIT(owner, TRAIT_MASQUERADE_VIOLATING_FACE, DISCIPLINE_TRAIT)
