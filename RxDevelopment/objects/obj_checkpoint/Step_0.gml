if (place_meeting (x, y, obj_player)) {
	global.checkpoint = id;
	global.checkpointX = x;
	global.checkpointY = y; 
	global.checkpointR = room;
}

if (global.checkpointR == room) {
	if (global.checkpoint == id) 
		sprite_index = spr_checkpointGreen;
	else
		sprite_index = spr_checkpointRed;
}