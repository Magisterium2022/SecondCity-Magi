/mob/living/carbon/human/proc/kj_flesh_eat()
	if(!COOLDOWN_FINISHED(src, flesh_eat_use_cd))
		return
	COOLDOWN_START(src, flesh_eat_use_cd, 1 SECONDS)
	if(grab_state > GRAB_PASSIVE)
		if(isliving(pulling))
			var/mob/living/bit_living = pulling
			if(!isvampiresplat(src)) //Shouldn't ever come up unless someone makes a mistake, but it's useful to have judt in case.
				SEND_SOUND(src, sound('modular_darkpack/modules/blood_drinking/sounds/need_blood.ogg', volume = 75))
				to_chat(src, span_warning("You're not desperate enough to try <i>that</i>.")) 
				return

			if(bit_living.stat == DEAD)
				SEND_SOUND(src, sound('', volume = 75))
				to_chat(src,span_warning("You eagerly begin tearing into the Yin-aspected flesh of the corpse."))
				bit_living.visible_message(span_warning(span_bold("[src] tears a chunk out of [bit_living]'s flesh!")))
				SEND_SIGNAL(src, COMSIG_MASQUERADE_VIOLATION)
				tear_dead_flesh(bit_living, TRUE)

			bit_living.emote("scream")

			if(ishuman(bit_living))
				var/mob/living/carbon/human/bit_human = bit_living
				bit_human.add_bite_animation()

			var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
			if(!skipface)
				playsound(src, '', 50, TRUE)
				to_chat(src,span_warning("You eagerly begin tearing into the Yang-aspected flesh of [bit_living]."))
				bit_living.visible_message(span_warning(span_bold("[src] tears a chunk out of [bit_living]'s flesh!")), span_warning(span_bold("[src] attacks your flesh, biting viciously!")))
				SEND_SIGNAL(src, COMSIG_MASQUERADE_VIOLATION)
				tear_living_flesh(bit_living, TRUE)

/mob/living/carbon/human/proc/tear_dead_flesh(mob/living/eaten_from)
	if(!COOLDOWN_FINISHED(src, tear_dead_use_cd))
		return
	COOLDOWN_START(src, tear_dead_use_cd, 3 SECONDS)

/mob/living/carbon/human/proc/tear_living_flesh(mob/living/eaten_from)
	if(!COOLDOWN_FINISHED(src, tear_living_use_cd))
		return
	COOLDOWN_START(src, tear_living_use_cd, 3 SECONDS)

	if(isnpc(drunk_from))
		var/mob/living/carbon/human/npc/NPC = eaten_from
		NPC.danger_source = null
		eaten_from.Stun(40) //NPCs don't get to resist

	else if(!do_after(src, 3 SECONDS, target = eaten_from, timed_action_flags = NONE, progress = FALSE))
		eaten_from.Stun(40) //NPCs don't get to resist

if(ishuman(eaten_from))
		var/mob/living/carbon/human/H = eaten_from
		eaten_of |= "[H.dna.real_name]"

		if(iskindred(eaten_from))
			to_chat(owner,span_warning("You notice something is wrong. [bit_living]'s flesh is dead, with a strong Yin aspect."))

		if(iskindred(eaten_from))
			to_chat(owner,span_warning("You notice something is wrong. [bit_living]'s flesh is dead, with a strong Yin aspect."))

		eaten_from.adjust_brute_loss(60, TRUE)
