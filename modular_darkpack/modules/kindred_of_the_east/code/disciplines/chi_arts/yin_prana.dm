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

/datum/discipline_power/chi/yin_prana/proc/on_talk(datum/source, list/speech_args)
	SIGNAL_HANDLER

	// This is a soft reveal as only as you would only be revealed to the person next to you. (which we are missing implementation of rn)
	if(speech_args[SPEECH_MODS][WHISPER_MODE] == MODE_WHISPER)
		return

	to_chat(owner, span_danger("Your Concealment falls away as you reveal yourself!"))
	try_deactivate(direct = TRUE)

	deltimer(cooldown_timer)
	cooldown_timer = addtimer(CALLBACK(src, PROC_REF(cooldown_expire)), COMBAT_COOLDOWN_LENGTH, TIMER_STOPPABLE | TIMER_DELETE_ME)

/datum/discipline_power/chi/yin_prana/proc/handle_move(datum/source, atom/moving_thing, dir)
	SIGNAL_HANDLER

	if (owner.move_intent != MOVE_INTENT_WALK)
		to_chat(owner, span_danger("Your Concealment falls away as you move too quickly!"))
		try_deactivate(direct = TRUE)

		deltimer(cooldown_timer)
		cooldown_timer = addtimer(CALLBACK(src, PROC_REF(cooldown_expire)), REVEAL_COOLDOWN_LENGTH, TIMER_STOPPABLE | TIMER_DELETE_ME)

//SHROUDED MOON
/datum/discipline_power/chi/yin_prana/shrouded_moon
	name = "Shrouded Moon"
	desc = "Attune yourself to the shadows and fade into the night."
	level = 1
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE

/datum/discipline_power/chi/yin_prana/shrouded_moon/activate() //Should only work in the dark, but detection for that would be a pain, and it'd massively limit utility.
	. = ..()
	RegisterSignals(owner, aggressive_signals, PROC_REF(on_combat_signal))
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(handle_move))
	RegisterSignal(owner, COMSIG_POWER_ACTIVATE, PROC_REF(on_discipline_activation))
	RegisterSignal(owner, COMSIG_MOB_SAY, PROC_REF(on_talk))

	for(var/mob/living/carbon/human/npc/NPC in GLOB.npc_list)
		if (NPC.danger_source == owner)
			NPC.danger_source = null

	ADD_TRAIT(owner, TRAIT_OBFUSCATED, YIN_PRANA_TRAIT)

/datum/discipline_power/chi/yin_prana/shrouded_moon/deactivate()
	. = ..()

	UnregisterSignal(owner, aggressive_signals)
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)
	UnregisterSignal(owner, list(COMSIG_POWER_ACTIVATE, COMSIG_MOB_SAY))

	REMOVE_TRAIT(owner, TRAIT_OBFUSCATED, YIN_PRANA_TRAIT)

//YIN MANTLE
/datum/discipline_power/chi/yin_prana/yin_mantle
	name = "Yin Mantle"
	desc = "Conjure forth the essence of your Yin."
	level = 2
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE

//BONE DANCE
/datum/discipline_power/chi/yin_prana/bone_dance
	name = "Bone Dance"
	desc = "Permate the local area with Yin energy, inducing tiredness and suggestiveness in others."
	level = 3
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE

//EIGHTFOLD YIN MANTLE
/datum/discipline_power/chi/yin_prana/eightfold_yin_mantle
	name = "Eightfold Yin Mantle"
	desc = "Call forth Yin Chi into physical objects."
	level = 4
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE

//SEMBLANCE OF THE EBON QUEEN
/datum/discipline_power/chi/yin_prana/semblance_of_the_ebon_queen
	name = "Semblance of the Ebon Queen"
	desc = "Transform into an invisible and intangible cloud of Yin energy and enter the Yin world."
	level = 5
	violates_masquerade = TRUE
	cooldown_length = 1 TURNS
	toggled = TRUE

/datum/discipline_power/chi/yin_prana/semblance_of_the_ebon_queen/activate() //Turns them into pure Yin energy and pushes them into the Yin world, where ghosts and spirits exist. I need to do it this way because they maintain a vulnerability to Mental effects such as Dominate.
	. = ..()
	ADD_TRAIT(owner, TRAIT_GODMODE, CHI_TRAIT)//Immune to any form of physical or magical attack, but still vulnerable to Mental attacks from those who can see them. Dominate and similar still work on those in Godmode.
	ADD_TRAIT(owner, TRAIT_HANDS_BLOCKED, CHI_TRAIT)//No picking up items when you're intangible.
	ADD_TRAIT(owner, TRAIT_PACIFIST, CHI_TRAIT)//You can't punch people from across the veil.
	ADD_TRAIT(owner, TRAIT_GHOST_VISION, CHI_TRAIT)
	ADD_TRAIT(owner, TRAIT_SIXTHSENSE, CHI_TRAIT)//Allows them to hear ghosts.
	owner.update_sight()
	owner.incorporeal_move = INCORPOREAL_MOVE_SHADOW
	owner.invisibility = INVISIBILITY_REVENANT

/datum/discipline_power/chi/yin_prana/semblance_of_the_ebon_queen/deactivate() //
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_GHOST_VISION, CHI_TRAIT)
	owner.update_sight()
