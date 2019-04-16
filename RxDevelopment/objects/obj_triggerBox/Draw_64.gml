/// @description Insert description here
// You can write your code in this editor
if(myTextBox == noone){
	draw_text(x,y,"myTextBox = " + string(myTextBox));
}
else
{
	if(myTextBox != noone){
		instance_destroy(myTextBox);
	}
}