/// @description Player updates and mechanics 
/*
Player updates and mechanics 
*/

keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp =  keyboard_check_pressed(vk_up) keyboard_check(ord("W"));
keySpace = keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(vk_lshift); 
var move = keyRight - keyLeft;

hspd = move * walkspd;
hspdOG = hspd;
vspd = vspd + grv;
vspdOG = vspd;

//Looking to the left or right
if (keyLeft) {
	sprite_index = CharacterIdleLeft;
} 
else if (keyRight) {
	sprite_index = CharacterIdle;  
}

// Horz Collision: run into wall
if(place_meeting(x + hspd, y, obj_wallParent))
{
	stuckToWall = true;
	while(!place_meeting(x + sign(hspd), y,obj_wallParent))
	{
		x += sign(hspd);	
	}
	
	hspd = 0;
}

else if(place_meeting(x + hspd, y, obj_platfloorParent))
{
	while(!place_meeting(x + sign(hspd), y, obj_platfloorParent))
	{
		x += sign(hspd);	
	}
	
	hspd = 0;
}

else if(place_meeting(x, y + vspd, obj_wallParent))
{
	stuckToWall = true;
	hspd = 0;
}

// Vert Collision: floor
if(place_meeting(x, y + vspd, obj_platfloorParent))
{
	while(!place_meeting(x,y+sign(vspd),obj_platfloorParent))
	{
		y += sign(vspd);	
	}
	
	vspd = 0;
}
// Jump Stuff
if(place_meeting(x, y + 1, obj_platfloorParent) and keySpace)
{
	vspd = -flatJump;
}

// Ceiling
if (place_meeting(x, y + vspd,obj_EnvironmentPieceParent))
{
	while(!place_meeting(x, y + sign(vspd),obj_EnvironmentPieceParent))
	{
		y += sign(vspd);	
	}
	
	vspd = 0;
	stuckToWall = false;
}

if(stuckToWall == true)
{
	// jumping up a wall
	if(keySpace)
	{
		if(place_meeting(x + 1, y, obj_wallParent))
		{
			hspd = -wallSideJump;
		}
		
		else if(place_meeting(x - 1, y, obj_wallParent))
		{
			hspd = wallSideJump;
		}
		vspd = -wallVertJump;
		
		if(place_meeting(x , y - wallVertJump, obj_EnvironmentPieceParent))
		{
			while(!place_meeting(x, y - 1, obj_EnvironmentPieceParent))
			{
				y -= 1;	
			}
			vspd = 0;
		}
		
		else
		{
			vspd = -wallVertJump;
		}
		
		stuckToWall = false;
	}
	
	else
	{
		vspd = 0;
		hspd = 0;
	}
}

//Dash
if (keyDash) {
	dashAct = dashSpeed * sign(hspd);
	if(place_meeting(x + dashAct, y, obj_EnvironmentPieceParent))
	{
		while(!place_meeting(x + sign(dashAct), y, obj_EnvironmentPieceParent))
		{
			x += sign(hspd);	
		}
		hspd = 0;
	}
	
	else
	{
		hspd = dashAct;	
	}
}

x = x + hspd;
y = y + vspd;