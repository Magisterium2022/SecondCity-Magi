/datum/discipline_power/chi
	///Piggybacking off of the existing Discipline code where possible, to avoid duplicating whole pages of code. 

	/* BASIC INFORMATION */
	/// No vitae costs for any Chi abilities
	vitae_cost = 0
	/// How much yin chi this power costs to activate
	var/yin_chi = 0
	/// How much yang chi this power costs to activate
	var/yang_chi = 0
	/// How much demon chi this power costs to activate
	var/demon_chi = 0
	/// How much tainted yin chi this power costs to activate
	var/tainted_yin_chi = 0
	/// How much tainted yang chi this power costs to activate
	var/tainted_yang_chi = 0
	/// How much golden chi this power costs to activate
	var/golden_chi = 0
