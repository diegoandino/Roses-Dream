/// @description Insert description here
// You can write your code in this editor

//if (instance_exists(follow)) {
//	xTo = follow.x; 
//	yTo = follow.y;
//}

//x += (xTo - x) / 50;
//y += (yTo - y) / 50; 

//x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
//y = clamp(y, viewHeightHalf, room_width - viewHeightHalf);

for(i = 0; i < global.numOfHearts; i++)
{
	draw_sprite(spr_Health,-1,x+(xOffset*i),y);
}
//draw_text(x,y,string(global.numOfHearts));