/// @description Insert description here
// You can write your code in this editor
/// @description Check if player wins


//Textbox
if(place_meeting(x,y,obj_player))
{
	if(active_textbox == noone)
	{
		tbox = create_textbox(fact,factSpeaker);
		active_textbox = tbox;
		instance_destroy();
	}
	else
	{
		if(!instance_exists(active_textbox))
		{
			active_textbox = noone;
		}
	}

}

