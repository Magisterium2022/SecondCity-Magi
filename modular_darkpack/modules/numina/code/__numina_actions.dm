/datum/action/numina
	name = "numina action"
	desc = "numina desc."

	icon_icon = 'modular_tfn/modules/numina/icons/actions.dmi'
	button_icon = 'modular_tfn/modules/numina/icons/actions.dmi'

	var/cool_down = 0

/datum/action/numina/ApplyIcon(atom/movable/screen/movable/action_button/current_button, force = FALSE)
	icon_icon = 'modular_tfn/modules/numina/icons/actions.dmi'
	button_icon = 'modular_tfn/modules/numina/icons/actions.dmi'
	. = ..()
