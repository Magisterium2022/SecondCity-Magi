/datum/subsplat/numina
	abstract_type = /datum/subsplat/numina

	var/list/numina_types = list()

/datum/subsplat/numina/on_gain(mob/living/carbon/human/gaining_mob, datum/splat/gaining_splat, joining_round)
	. = ..()
	// Placeholder!
	for(var/numina in numina_types)
		gaining_splat.add_power(numina)
