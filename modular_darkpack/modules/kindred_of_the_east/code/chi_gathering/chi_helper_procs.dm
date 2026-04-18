//Wrapper function for adjusting chi pools.
/mob/living/proc/adjust_chi_pool(amount, updating_health = TRUE, on_spawn, chi_type)
	if(on_spawn) //Add a check for dharma.

	if(kuei_jin_splat)
		

	switch(chi_type)
		if("Yin")
			yin_chi = clamp(yin_chi+amount, 0, max_yin_chi-tainted_yin_chi)
		if("Yang")
			yang_chi = clamp(yang_chi+amount, 0, max_yang_chi-tainted_yang_chi)
    	if("Demon")
			demon_chi = clamp(demon_chi+amount, 0, max_demon_chi)
    	if("Tainted Yin")
			tainted_yin_chi = clamp(tainted_yin_chi+amount, 0, max_tainted_yin_chi-yin_chi)
		if("Tainted Yang")
			tainted_yang_chi = clamp(tainted_yang_chi+amount, 0, max_tainted_yang_chi-yang_chi)
		if("Golden")
			golden_chi = clamp(golden_chi+amount, 0, max_golden_chi)
  
	if(updating_health)
		update_chi_hud()

//Setting chi pools. Mostly called on spawn/
/mob/living/proc/set_max_chi_pool()
	if(!ishuman(src)) //Only Humans and other splats have Yin/Yang 
		return
	if(kuei_jin_splat)


	
