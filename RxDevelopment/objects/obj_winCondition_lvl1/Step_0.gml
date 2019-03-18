/// @description Check if player wins




//Textbox
if(place_meeting(x,y,obj_player))
{
	if(active_textbox == noone)
	{
		tbox = create_textbox(text,speakers);
		active_textbox = tbox;
	}
	else
	{
		if(!instance_exists(active_textbox))
		{
			active_textbox = noone;
			room_restart();
		}
	}

}

