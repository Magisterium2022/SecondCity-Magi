/datum/subsplat/dharma
	abstract_type = /datum/subsplat/dharma
	/// The icon for this Dharma. Used in preferences.
	var/icon
	/// Description of the Dharma's philosophies
	var/philosophy
	/// The aspect the Dharma focuses on. 
	var/virtue

	/// List of Disciplines that are innate to this Dharma (Mostly Scorpion Eaters and Face of Gods)
	var/list/dharma_disciplines = list()
	/// List of Disciplines that are rejected by this Dharma (No tainted Chi disciplines for you if you're not a Scorpion Eater)
	var/list/restricted_disciplines = list()
	/// List of traits that are applied to members of this Dharma
	var/list/dharma_traits = list()
