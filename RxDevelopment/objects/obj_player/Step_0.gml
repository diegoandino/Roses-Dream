/// @description Insert description here
// You can write your code in this editor
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp =  keyboard_check_pressed(vk_up);
keySpace = keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(vk_lshift); 
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
else if(place_meeting(x+hspd,y,obj_platfloorParent))
{
	while(!place_meeting(x+sign(hspd),y,obj_platfloorParent))
	{
		x = x+sign(hspd);	
	}
	hspd = 0;
}
else if(place_meeting(x,y+vspd,obj_wallParent))
{
	stuckToWall = true;
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
// Jump Stuff
if(place_meeting(x,y+1,obj_platfloorParent) and keySpace)
{
	vspd = -flatJump;
}
// Ceiling
if (place_meeting(x,y+vspd,obj_ceilingParent))
{
	while(!place_meeting(x,y+sign(vspd),obj_ceilingParent))
	{
		y = y+sign(vspd);	
	}
	vspd = 0;
	stuckToWall = false;
}	
// Drop Stuff
//if(place_meeting(x,y-1,obj_ceilingParent) and keySpace)
//{
//	vspd = dropDistance;//defined in Create
//}



if(stuckToWall == true)
{
		
	
	// jumping up a wall
	if(keySpace)
	{
		if(place_meeting(x+1,y,obj_wallParent))
		{
			hspd = -wallSideJump;
		}
		else if(place_meeting(x-1,y,obj_wallParent))
		{
			hspd = wallSideJump;
		}
		vspd = -wallVertJump;
		if(place_meeting(x,y-wallVertJump,obj_ceilingParent))
		{
			while(!place_meeting(x,y-1,obj_ceilingParent))
			{
				y = y-1;	
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
	dashAct = dashSpeed*sign(hspd);
	if(place_meeting(x+dashAct,y,obj_EnvironmentPieceParent))
	{
		while(!place_meeting(x+sign(hspd),y,obj_EnvironmentPieceParent))
		{
			x = x+sign(hspd);	
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



	

