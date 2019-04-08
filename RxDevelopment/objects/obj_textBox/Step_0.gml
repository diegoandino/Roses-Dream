/// @description Insert description here
if(keyboard_check_pressed(interact_key))
{
	if(counter < str_len){counter = str_len;}
	else if(page < array_length_1d(text) -1)
	{
		page++;
		event_perform(ev_other, ev_user1);
	}
	else 
	{ 
		obj_player.freezeMotion = false;
		instance_destroy();
		
	}
}

if(keyboard_check(interact_key))
{
	existance_counter += 1;
	timeHeld = existance_counter/room_speed;
	if(timeHeld>1)
	{
		obj_player.freezeMotion = false;
		instance_destroy();
	}
}


if(keyboard_check_released(interact_key))
{
	existance_counter = 0;
}