if (global.checkpointR == room) {
	obj_player.x = global.checkpointX; 
	obj_player.y = global.checkpointY;
	global.numOfHearts = 3;
}

else {
	obj_player.x = obj_player.startX;
	obj_player.y = obj_player.startY;
	global.numOfHearts = 3;
}