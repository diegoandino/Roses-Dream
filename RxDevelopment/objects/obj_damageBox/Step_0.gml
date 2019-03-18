/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y,obj_player))
{
	global.numOfHearts -= 1;
	instance_destroy();
}
else if(place_meeting(x, y, obj_EnvironmentPieceParent))
{
	instance_destroy(); 
}
