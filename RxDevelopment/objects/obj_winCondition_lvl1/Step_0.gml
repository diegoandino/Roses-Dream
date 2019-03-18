/// @description Check if player wins


number_enemies = instance_number(obj_basicEnemy);

//Textbox
if(place_meeting(x,y,obj_player) and number_enemies < 1 and  delay == false)
{
	if(active_textbox == noone)
	{
		tbox = create_textbox(winText,winSpeakers);
		active_textbox = tbox;
	}
	else
	{
		if(!instance_exists(active_textbox))
		{
			active_textbox = noone;
			room_goto(MenuScreen);
		}
	}

}
else if(place_meeting(x,y,obj_player) and number_enemies >=1 and delay == false)
{
	if(active_textbox == noone)
	{
		tbox = create_textbox(goText,goSpeakers);
		active_textbox = tbox;
	}
	else
	{
		if(!instance_exists(active_textbox))
		{
			active_textbox = noone;
			delay = true;
			alarm[0] = room_speed*3; 
		}
	}
}

