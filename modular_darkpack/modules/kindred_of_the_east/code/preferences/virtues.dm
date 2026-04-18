/datum/st_stat/chi_virtues
	abstract_type = /datum/st_stat/chi_virtues
	category = "Chi Virtues"
	starting_score = 2
	min_score = 1 //You need at least one point for all of these.
	max_score = 9 //Dharma 1-5 have pools of 10 at most, and need at least one point in each.
	points = 0

/datum/st_stat/chi_virtues/hun
	name = "Hun"
	starting_score = 1
	score = 1
	description = "Your higher self, and consciousness. The inverse to this is your P'o."

/datum/st_stat/chi_virtues/po
	name = "P'o"
	starting_score = 1
	score = 1
	description = "Your lower self, and animal instincts. The inverse to this is your Hun."

/datum/st_stat/chi_virtues/yin
	name = "Yin"
	starting_score = 1
	score = 1
	description = "Your capacity to store the energies of Death and Metal, or their tainted equivalents."

/datum/st_stat/chi_virtues/yang
	name = "Yang"
	starting_score = 1
	score = 1
	description = "Your capacity to store the energies of Life and Wood, or their tainted equivalents."
