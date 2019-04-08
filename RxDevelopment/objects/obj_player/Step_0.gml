/*
Player updates and mechanics 
*/

keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp =  keyboard_check_pressed(vk_up) keyboard_check(ord("W"));
keyDown =  keyboard_check_pressed(vk_down) keyboard_check(ord("S"));
keyJump = keyboard_check_pressed(ord("I")) || keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(vk_shift); 
keyRun = keyboard_check(vk_lshift); 
keyInteract = keyboard_check_pressed(ord("E"));
keyFire =  mouse_check_button_pressed(mb_left) ||  keyboard_check_pressed(ord("J"));

var move = keyRight - keyLeft;
hspd = move * walkspd;
hspdOG = hspd;
vspd = vspd + grv;
vspdOG = vspd;
firingDelay -= 1; 

//Character direction and anims

if (move != 0)
{
	if(move < 0)
	{
		sprite_index = spr_runAnimWandLeft; 
		faceLeft = true;
	}
	
	else if (move > 0)
	{
		sprite_index = spr_runAnimWand; 
		faceLeft = false;
	}
}

else if (move == 0 && sprite_index == spr_runAnimWandLeft)
{
	sprite_index = spr_wandAnimLeft; 
	faceLeft = true; 
}

else if (move == 0 && sprite_index == spr_runAnimWand)
{
	sprite_index = spr_wandAnim; 
	faceLeft = false; 
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
if(place_meeting(x, y + 1, obj_platfloorParent) && keyJump && sprite_index == spr_runAnimWand)
{
		sprite_index = spr_jumpAnimWand; 
		vspd = -flatJump;
}

if (place_meeting(x, y + 1, obj_platfloorParent) && keyJump && sprite_index == spr_runAnimWandLeft) {
		sprite_index = spr_jumpAnimWandLeft; 
		vspd = -flatJump;
} 

if (place_meeting(x, y + 1, obj_platfloorParent) && keyJump && sprite_index == spr_wandAnim) {
		sprite_index = spr_jumpAnimWand; 
		vspd = -flatJump;
}

if (place_meeting(x, y + 1, obj_platfloorParent) && keyJump && sprite_index == spr_wandAnimLeft) {
		sprite_index = spr_jumpAnimWandLeft; 
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
	if(keyJump)
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

if(freezeMotion)
{
	hspd = 0;
	vspd = 0;
}

x = x + hspd;
y = y + vspd;

// Firing
if((keyFire) && (firingDelay < 0))
{
	firingDelay = 5;	
	if(faceLeft)
	{
		with(instance_create_layer(x, y, "WandProjectiles", obj_wandProjectile)) 
		{				
			speed = -15;
			direction = other.direction; 
		}
	}
	
	else
	{
		with(instance_create_layer(x, y, "WandProjectiles", obj_wandProjectile)) 
		{				
			speed = 15;
			direction = other.direction; 
		}
	}
}

//Climbing 
if (keyUp || keyDown) 
	if (place_meeting(x, y, parent_ladder)) 
		ladder = true;
	

	

if (ladder) {
	vspd = 0; 
	hspd = 0; 
	
	if (keyUp) 
		vspd = -2; 
	
	if (keyDown) 
		vspd = 2;
		
	if (!place_meeting(x , y, parent_ladder)) 
		ladder = false; 
	
	if (keyJump)
		ladder = false; 
}


//Player Death
if (global.numOfHearts < 1) room_restart();