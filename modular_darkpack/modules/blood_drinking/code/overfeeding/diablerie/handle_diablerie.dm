/mob/living/carbon/human/proc/handle_diablerie(var/mob/living/mob)
	if(!ishuman(mob))
		CRASH("Tried to diablerize nonhuman vampire. Add handling for this!")

	var/mob/living/carbon/human/mob_human = mob
	AdjustHumanity(-1, 0)

	if(mob_human.stat == DEAD) //If they have Iron Gullet, they can drink from a corpse still, so adding a check here to prevent diablerie of someone who was FD'ed.
		to_chat(src, span_userdanger("<b>[mob_human] has suffered Final Death, and their soul has fled.</b>"))
		return

	while(!HAS_TRAIT(mob_human, TRAIT_TORPOR))
		if(mob_human.stat == DEAD) //In case they skip torpor or die suddenly.
			break
		var/dice_result = SSroll.storyteller_roll(user.st_get_stat(STAT_STRENGTH), 10, user, user, TRUE)
		mob_human.adjustAggLoss((dice_result * 30), forced = TRUE)

	var/generation_difference = (generation - mob_human.generation) //Subtracts victim's generation from diablerist to get the difference in generations as a positive.
	var/initial_generation_difference = generation_difference
	if(generation_difference > 0)
		generation -= 1 //Initial drop in generation, this is free as long as you're diablerising someone lower gen.
		generation_difference -=1
		while (generation_difference > 0)
			var/dice_result = SSroll.storyteller_roll(user.st_get_stat(STAT_STAMINA), 9, user, user, TRUE)
			if (dice_result > 0)
				generation -= 1
				generation_difference -=1
			else
				break

	var/victim_sucesses = 0
	var/diablerist_sucesses = 0
	var/victim_difficulty = 
	var/diablerist_difficulty clamp(mob_human.PERMANENT_WILLPOWER + max((initial_generation_difference - generational_difference), 0), 4, 9)
	var/victor_decided = FALSE

	while (victor_decided = FALSE)
		

	if(mob_human.generation >= generation)
		message_admins("[ADMIN_LOOKUPFLW(src)] successfully Diablerized [ADMIN_LOOKUPFLW(mob)]")
		log_attack("[key_name(src)] successfully Diablerized [key_name(mob)].")
		if(mob_human.client)
			var/datum/brain_trauma/special/imaginary_friend/trauma = gain_trauma(/datum/brain_trauma/special/imaginary_friend)
			trauma.friend.key = mob_human.key
	else
		var/start_prob = 10
		if(HAS_TRAIT(src, TRAIT_DIABLERIE))
			start_prob = 30
		if(prob(min(99, start_prob+((generation-mob_human.generation)*10))))
			to_chat(src, span_userdanger("<b>[mob_human]'s SOUL OVERCOMES YOURS AND GAINS CONTROL OF YOUR BODY.</b>"))
			message_admins("[ADMIN_LOOKUPFLW(src)] tried to Diablerize [ADMIN_LOOKUPFLW(mob)] and was overtaken.")
			log_attack("[key_name(src)] tried to Diablerize [key_name(mob)] and was overtaken.")
			generation = mob_human.generation
			if(mob_human.mind)
				mob_human.mind.transfer_to(src, TRUE)
			else
				death()
			return
		message_admins("[ADMIN_LOOKUPFLW(src)] successfully Diablerized [ADMIN_LOOKUPFLW(mob)]")
		log_attack("[key_name(src)] successfully Diablerized [key_name(mob)].")
		if(mob_human.client)
			var/datum/brain_trauma/special/imaginary_friend/trauma = gain_trauma(/datum/brain_trauma/special/imaginary_friend)
			trauma.friend.key = mob_human.key

	make_diablerist()
	adjustBruteLoss(-50, TRUE)
	adjustFireLoss(-50, TRUE)
	mob.death()

