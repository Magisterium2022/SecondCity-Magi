/proc/create_new_stat_prefs(list/preference_storyteller_stats)
	var/list/stats_list = list()
	for(var/stat_path as anything in subtypesof(/datum/st_stat))
		var/datum/st_stat/stat = new stat_path()
		stat.set_score(stat.starting_score)
		stats_list[stat_path] = stat
	preference_storyteller_stats = stats_list
	update_middleware_stats(preference_storyteller_stats)
	return preference_storyteller_stats

// This entire snowflake code is done purely so that we can properly update stats that are based on other stats.
/proc/update_middleware_stats(list/preference_storyteller_stats)
	var/datum/st_stat/stat_courage = preference_storyteller_stats[STAT_COURAGE]
	var/datum/st_stat/stat_permenant_willpower = preference_storyteller_stats[STAT_PERMANENT_WILLPOWER]
	stat_permenant_willpower.add_stat_mod(clamp(-(stat_permenant_willpower.get_score(include_bonus = FALSE) - 10), 0, stat_courage.get_score(include_bonus = TRUE)), "COURAGE")
	var/datum/st_stat/stat_temporary_willpower = preference_storyteller_stats[STAT_TEMPORARY_WILLPOWER]
	stat_temporary_willpower.set_score(stat_permenant_willpower.get_score(include_bonus = TRUE))

	var/datum/st_stat/stat_hun = preference_storyteller_stats[STAT_HUN]
	var/datum/st_stat/stat_po = preference_storyteller_stats[STAT_PO]
	var/datum/st_stat/stat_hun_po_balance = preference_storyteller_stats[STAT_HUN_PO_BALANCE]
	stat_hun.add_stat_mod(stat_hun_po_balance.get_score(include_bonus = TRUE))
	stat_po.add_stat_mod(10 - stat_hun_po_balance.get_score(include_bonus = TRUE))

	var/datum/st_stat/stat_yin = preference_storyteller_stats[STAT_YIN]
	var/datum/st_stat/stat_yang = preference_storyteller_stats[STAT_YANG]
	var/datum/st_stat/stat_yin_yang_balance = preference_storyteller_stats[STAT_YIN_YANG_BALANCE]
	stat_yin.add_stat_mod(stat_yin_yang_balance.get_score(include_bonus = TRUE))
	stat_yang.add_stat_mod(10 - stat_yin_yang_balance.get_score(include_bonus = TRUE))

	var/datum/st_stat/morality_path/morality/stat_morality = preference_storyteller_stats[STAT_MORALITY]
	if(stat_morality?.morality_path)
		var/datum/st_stat/stat_conscience = preference_storyteller_stats[STAT_CONSCIENCE]
		var/datum/st_stat/stat_self_control = preference_storyteller_stats[STAT_SELF_CONTROL]
		var/datum/st_stat/stat_conviction = preference_storyteller_stats[STAT_CONVICTION]
		var/datum/st_stat/stat_instinct = preference_storyteller_stats[STAT_INSTINCT]

		if(stat_morality.morality_path.alignment == MORALITY_HUMANITY)
			stat_morality.set_score(clamp(stat_conscience.get_score(include_bonus = TRUE) + stat_self_control.get_score(include_bonus = TRUE), 0, 10))
		else if(stat_morality.morality_path.alignment == MORALITY_ENLIGHTENMENT)
			stat_morality.set_score(clamp(stat_conviction.get_score(include_bonus = TRUE) + stat_instinct.get_score(include_bonus = TRUE), 0, 10))
