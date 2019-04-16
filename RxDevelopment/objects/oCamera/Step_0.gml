//Update Player Destination

if (instance_exists(follow)) {
	xTo = follow.x; 
	yTo = follow.y;
}

x += (xTo - x) / 10;
y += (yTo - y) / 10; 

//Player Clamp

x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_width - viewHeightHalf);

//Update Camera View

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);

//Parallax Effect

//if (layer_exists("Background"))
//{	
//	layer_x("Background" , x/2);
//}
