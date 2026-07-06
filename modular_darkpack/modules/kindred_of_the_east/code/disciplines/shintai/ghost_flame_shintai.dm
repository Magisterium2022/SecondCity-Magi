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
	if(HAS_TRAIT(SPENDING_YIN))
		owner.overlay_fullscreen("ghostflame", /atom/movable/screen/fullscreen/see_through_darkness)
		owner.set_light(1.4,5,"#4d4cb4")
	if(HAS_TRAIT(SPENDING_YANG))
		owner.overlay_fullscreen("ghostflame", /atom/movable/screen/fullscreen/see_through_darkness)
		owner.set_light(1.4,5,"#ff8c00")
	else
		return
	ADD_TRAIT(owner, TRAIT_LUMINESCENT_EYES, DISCIPLINE_TRAIT)
	ADD_TRAIT(owner, TRAIT_MASQUERADE_VIOLATING_FACE, DISCIPLINE_TRAIT)

/datum/discipline_power/chi/ghost_flame_shintai/goblin_face/deactivate()
	. = ..()
	owner.clear_fullscreen("ghostflame", 5)
	owner.set_light(0)
	REMOVE_TRAIT(owner, TRAIT_LUMINESCENT_EYES, DISCIPLINE_TRAIT)
	REMOVE_TRAIT(owner, TRAIT_MASQUERADE_VIOLATING_FACE, DISCIPLINE_TRAIT)

//GOBLIN SPARK
/datum/discipline_power/chi/ghost_flame_shintai/goblin_spark
	name = "Goblin Spark"
	desc = "Send out sparks of Yin or Yang Chi."
	level = 2
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE

//GOBLIN SHAPES
/datum/discipline_power/chi/ghost_flame_shintai/goblin_shapes
	name = "Goblin Shapes"
	desc = "Create a form of Yin or Yang Chi."
	level = 3
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE

//GOBLIN SCORCH
/datum/discipline_power/chi/ghost_flame_shintai/goblin_scorch
	name = "Goblin Scorch"
	desc = "Breathe out a flame of Yin or Yang Chi."
	level = 4
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = FALSE

//GOBLIN LANTERN
/datum/discipline_power/chi/ghost_flame_shintai/goblin_lantern
	name = "Goblin Lantern"
	desc = "Coat or transform yourself into Yin or Yang Chi."
	level = 5
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE


/mob/living/basic/goblin_shapes
	name = "Living Flame"
	desc = "A shifting mass of fire."
	icon = 'icons/mob/effects/onfire.dmi'
	icon_state = "human_big_fire"
	mob_biotypes = MOB_SPIRIT
	health = INFINITY
	maxHealth = INFINITY
	plane = GHOST_PLANE
	sight = SEE_SELF
	throwforce = 0

	friendly_verb_continuous = "touches"
	friendly_verb_simple = "touch"
	response_help_continuous = "passes through"
	response_help_simple = "pass through"
	response_disarm_continuous = "swings through"
	response_disarm_simple = "swing through"
	response_harm_continuous = "punches through"
	response_harm_simple = "punch through"
	minimum_survivable_temperature = 0
	maximum_survivable_temperature = INFINITY

	move_resist = MOVE_FORCE_OVERPOWERING
	movement_type = GROUND | FLYING
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB | PASSDOORS
