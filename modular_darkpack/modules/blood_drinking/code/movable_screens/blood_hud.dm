/atom/movable/screen/blood
	name = "bloodpool"
	icon = 'modular_darkpack/modules/blood_drinking/icons/bloodpool.dmi'
	icon_state = "blood0"

/atom/movable/screen/blood/Click()
	if(iscarbon(usr))
		var/mob/living/carbon/human/BD = usr
		BD.update_blood_hud()
		if(BD.bloodpool > 0)
			to_chat(BD, span_notice("You've got [BD.bloodpool]/[BD.maxbloodpool] blood points."))
		else
			to_chat(BD, span_warning("You've got [BD.bloodpool]/[BD.maxbloodpool] blood points."))
	. = ..()

/mob/living/proc/update_blood_hud()
	if(!client || !hud_used)
		return
	var/generation_blood_bonus
	switch(generation) //7th gen and lower scale in a manner that's hard to make an effective formula for. These probably won't get used much, if at all, but who knows?
		if(8 to HIGHEST_GENERATION_LIMIT)
			generation_blood_bonus = 0
		if(7)
			generation_blood_bonus = 12
		if(6)
			generation_blood_bonus = 39
		if(5)
			generation_blood_bonus = 56
		if(4)
			generation_blood_bonus = 93
		if(1 to 3)
			generation_blood_bonus = INFINITY
	maxbloodpool = max(10 + (((13 - generation) * 3) + generation_blood_bonus), 10) //Using the max avoids issues for 14th gens and higher.
	if(hud_used.blood_icon)
		var/emm = round((bloodpool/maxbloodpool)*10)
		if(emm > 10)
			hud_used.blood_icon.icon_state = "blood10"
		if(emm < 0)
			hud_used.blood_icon.icon_state = "blood0"
		else
			hud_used.blood_icon.icon_state = "blood[emm]"
