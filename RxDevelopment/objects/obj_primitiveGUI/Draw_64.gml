/// @description Insert description here
// You can write your code in this editor

if (instance_exists(follow)) {
	xTo = follow.x; 
	yTo = follow.y;
}

x += (xTo - x) / 50;
y += (yTo - y) / 50; 

x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_width - viewHeightHalf);

draw_sprite(Health, 0, x, y); 