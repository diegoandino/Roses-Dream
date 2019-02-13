/// @description Insert description here
// You can write your code in this editor
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp =  keyboard_check_pressed(vk_up);
keySpace = keyboard_check_pressed(vk_space);
var move = keyRight - keyLeft;

hspd = move*walkspd;
hspdOG = hspd;
vspd = vspd + grv;
vspdOG = vspd;



// Horz Collision: run into wall
if(place_meeting(x+hspd,y,obj_wallParent))
{
	stuckToWall = true;
	while(!place_meeting(x+sign(hspd),y,obj_wallParent))
	{
		x = x+sign(hspd);	
	}
	hspd = 0;
}	

// Vert Collision: floor
if(place_meeting(x,y+vspd,obj_platfloorParent))
{
	while(!place_meeting(x,y+sign(vspd),obj_platfloorParent))
	{
		y = y+sign(vspd);	
	}
	vspd = 0;
}
// Ceiling
if (place_meeting(x,y-vspd,obj_ceilingParent))
{
	while(!place_meeting(x,y-sign(vspd),obj_ceilingParent))
	{
		y = y-sign(vspd);	
	}
	vspd = 0;
	stuckToWall = false;
}	

// Jump Stuff
if(place_meeting(x,y+1,obj_platfloorParent) and keySpace)
{
	vspd = -flatJump;
}
// Drop Stuff
else if(place_meeting(x,y-1,obj_ceilingParent) and keySpace)
{
	vspd = 3;
}



if(stuckToWall == true)
{
	//colliding with ceiling
	if(!place_meeting(x,y-1,obj_wallParent))
	{
		vspd = 0;
		hspd = 0;	
	}
	else
	{
		vspd = 0;
		hspd = hspdOG;
		if(keySpace)
		{
			vspd = 3;	
		}
	}
	// jumping up a wall
	if(keySpace)
	{
		if(place_meeting(x+1,y,obj_wallParent))
		{
			hspd = -wallSideJump;
			vspd = -wallVertJump;
		}
		else if(place_meeting(x-1,y,obj_wallParent))
		{
			hspd = wallSideJump;
			vspd = -wallVertJump;
		}
		
		stuckToWall = false;
	}
	
	
	
	
}

x = x + hspd;
y = y + vspd;