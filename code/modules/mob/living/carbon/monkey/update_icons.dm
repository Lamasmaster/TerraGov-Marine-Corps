//Monkey Overlays Indexes////////
#define M_HEADBITE_LAYER			10
#define M_LASER_LAYER			9
#define M_MASK_LAYER			8
#define M_BACK_LAYER			7
#define M_HANDCUFF_LAYER		6
#define M_L_HAND_LAYER			5
#define M_R_HAND_LAYER			4
#define M_TARGETED_LAYER		3
#define M_FIRE_LAYER			2
#define M_BURST_LAYER			1
#define M_TOTAL_LAYERS			10
/////////////////////////////////

/mob/living/carbon/monkey
	var/list/overlays_standing[M_TOTAL_LAYERS]

/mob/living/carbon/monkey/apply_overlay(cache_index)
	var/image/I = overlays_standing[cache_index]
	if(I)
		overlays += I

/mob/living/carbon/monkey/remove_overlay(cache_index)
	if(overlays_standing[cache_index])
		overlays -= overlays_standing[cache_index]
		overlays_standing[cache_index] = null

/mob/living/carbon/monkey/regenerate_icons()
	update_inv_wear_mask()
	update_inv_back()
	update_inv_r_hand()
	update_inv_l_hand()
	update_inv_handcuffed()
	update_fire()
	update_burst()
	update_transform()
	update_headbite()

////////
/mob/living/carbon/monkey/update_inv_wear_mask()
	remove_overlay(M_MASK_LAYER)
	if(wear_mask)
		if(client && hud_used?.hud_shown && hud_used?.inventory_shown)
			wear_mask.screen_loc = ui_monkey_mask
			client.screen += wear_mask
		overlays_standing[M_MASK_LAYER] = image("icon" = 'icons/mob/mask.dmi', "icon_state" = "[wear_mask.icon_state]", "layer" =-M_MASK_LAYER)
		apply_overlay(M_MASK_LAYER)


/mob/living/carbon/monkey/update_inv_r_hand()
	remove_overlay(M_R_HAND_LAYER)
	if(r_hand)
		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			client.screen += r_hand
			r_hand.screen_loc = ui_rhand
		
		overlays_standing[M_R_HAND_LAYER] = r_hand.make_worn_icon(body_type = species.name, inhands = TRUE, slot_name = slot_r_hand_str, default_icon = 'icons/mob/items_righthand_0.dmi', default_layer = M_R_HAND_LAYER)
		apply_overlay(M_R_HAND_LAYER)


/mob/living/carbon/monkey/update_inv_l_hand()
	remove_overlay(M_L_HAND_LAYER)
	if(l_hand)
		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			client.screen += l_hand
			l_hand.screen_loc = ui_lhand
		
		overlays_standing[M_L_HAND_LAYER] = l_hand.make_worn_icon(body_type = species.name, inhands = TRUE, slot_name = slot_l_hand_str, default_icon = 'icons/mob/items_lefthand_0.dmi', default_layer = M_L_HAND_LAYER)
		remove_overlay(M_L_HAND_LAYER)


/mob/living/carbon/monkey/update_inv_back()
	remove_overlay(M_BACK_LAYER)
	if(back)
		if(client && hud_used && hud_used.hud_shown)
			back.screen_loc = ui_monkey_back
			client.screen += back
		overlays_standing[M_BACK_LAYER]	= image("icon" = 'icons/mob/back.dmi', "icon_state" = "[back.icon_state]", "layer" =-M_BACK_LAYER)
		apply_overlay(M_BACK_LAYER)


/mob/living/carbon/monkey/update_inv_handcuffed()
	remove_overlay(M_HANDCUFF_LAYER)
	if(handcuffed)
		overlays_standing[M_HANDCUFF_LAYER]	= image("icon" = 'icons/mob/monkey.dmi', "icon_state" = "handcuff", "layer" =-M_HANDCUFF_LAYER)

		apply_overlay(M_HANDCUFF_LAYER)


/mob/living/carbon/monkey/update_fire()
	remove_overlay(M_FIRE_LAYER)
	if(on_fire)
		switch(fire_stacks)
			if(1 to 14)	overlays_standing[M_FIRE_LAYER] = image("icon"='icons/mob/OnFire.dmi', "icon_state"="monkey_weak", "layer"=-M_FIRE_LAYER)
			if(15 to 20) overlays_standing[M_FIRE_LAYER] = image("icon"='icons/mob/OnFire.dmi', "icon_state"="monkey_medium", "layer"=-M_FIRE_LAYER)

		apply_overlay(M_FIRE_LAYER)


/mob/living/carbon/monkey/update_burst()
	remove_overlay(M_BURST_LAYER)
	var/image/standing = null

	if(chestburst == 1)
		standing = image("icon" = 'icons/Xeno/Effects.dmi',"icon_state" = "burst_stand", "layer" =-M_BURST_LAYER)
	else if(chestburst == 2)
		standing = image("icon" = 'icons/Xeno/Effects.dmi',"icon_state" = "bursted_stand", "layer" =-M_BURST_LAYER)

	overlays_standing[M_BURST_LAYER]	= standing
	apply_overlay(M_BURST_LAYER)

/mob/living/carbon/monkey/update_headbite()
	remove_overlay(M_HEADBITE_LAYER)
	var/image/standing = null

	if(headbitten)
		standing = image("icon" = 'icons/Xeno/Effects.dmi',"icon_state" = "headbite_stand", "layer" =-M_HEADBITE_LAYER)

	overlays_standing[M_HEADBITE_LAYER]	= standing
	apply_overlay(M_HEADBITE_LAYER)

//Monkey Overlays Indexes////////
#undef M_HEADBITE_LAYER
#undef M_MASK_LAYER
#undef M_BACK_LAYER
#undef M_HANDCUFF_LAYER
#undef M_L_HAND_LAYER
#undef M_R_HAND_LAYER
#undef M_TARGETED_LAYER
#undef M_FIRE_LAYER
#undef M_BURST_LAYER
#undef M_TOTAL_LAYERS

