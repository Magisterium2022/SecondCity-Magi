/datum/st_stat/chi_virtues
	abstract_type = /datum/st_stat/chi_virtues
	category = "Chi Virtues"
	starting_score = 1
	min_score = 1 //You need at least one point for all of these.
	max_score = 9 //Dharma 1-5 have pools of 10 at most, and need at least one point in each.
	points = 0

/datum/st_stat/chi_virtues/hun
	name = "Hun"
	editable = FALSE
	description = "Your higher self, and consciousness. The inverse to this is your P'o."

/datum/st_stat/chi_virtues/po
	name = "P'o"
	editable = FALSE
	starting_score = 9
	description = "Your lower self, and animal instincts. The inverse to this is your Hun."

/datum/st_stat/chi_virtues/hun_po_balance
	name = "Hun-P'o Balance"
	description = "Your balance between your Hun and your P'o."
	freebie_point_cost = 0

/datum/st_stat/chi_virtues/yin
	name = "Yin"
	editable = FALSE
	description = "Your capacity to store the energies of Death and Metal, or their tainted equivalents."

/datum/st_stat/chi_virtues/yang
	name = "Yang"
	starting_score = 9
	editable = FALSE
	description = "Your capacity to store the energies of Life and Wood, or their tainted equivalents."

/datum/st_stat/chi_virtues/yin_yang_balance
	name = "Yin-Yang Balance"
	description = "Your balance between your Yin and your Yang."
	freebie_point_cost = 0
