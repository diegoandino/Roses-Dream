/// @description Insert description here
// You can write your code in this editor
myTextBox = instance_create_layer(x,y,"UIandText",obj_textBox);
obj_player.freezeMotion = true;
if(keyboard_check_pressed(ord("E")))
{
	obj_player.freezeMotion = false;
	instance_destroy(obj_textBox);
	instance_destroy();
}
