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
	
	audio_play_sound(Jump, 6, false);
	isJumping = true;
	vspd = -flatJump;
} 

else if (!place_meeting(x, y + 1, obj_platfloorParent) && sign(vspd) < 0 && sprite_index == spr_runAnimWand) {
	
	sprite_index = spr_jumpAnimWand; 
}

if (sign(vspd) == 0 && place_meeting(x, y + 1, obj_platfloorParent) && sprite_index == spr_jumpAnimWand)
	sprite_index = spr_runAnimWand;



if (place_meeting(x, y + 1, obj_platfloorParent) && keyJump && sprite_index == spr_runAnimWandLeft) {
		audio_play_sound(Jump, 6, false);	
		isJumping = true;
		vspd = -flatJump;
} 

else if (!place_meeting(x, y + 1, obj_platfloorParent) && sign(vspd) < 0 && sprite_index == spr_runAnimWandLeft) {

	sprite_index = spr_jumpAnimWandLeft;  	
}

if (sign(vspd) == 0 && place_meeting(x, y + 1, obj_platfloorParent) && sprite_index == spr_jumpAnimWandLeft)
	sprite_index = spr_runAnimWandLeft;



if (place_meeting(x, y + 1, obj_platfloorParent) && keyJump && sprite_index == spr_wandAnim) {
		audio_play_sound(Jump, 6, false);
		isJumping = true;
		vspd = -flatJump;
}

else if (!place_meeting(x, y + 1, obj_platfloorParent) && sign(vspd) < 0 && sprite_index == spr_wandAnim) {
	
	sprite_index = spr_jumpAnimWand; 
}

if (sign(vspd) == 0 && sign(move) == 0 && place_meeting(x, y + 1, obj_platfloorParent) && sprite_index == spr_jumpAnimWand)
	sprite_index = spr_wandAnim;



if (place_meeting(x, y + 1, obj_platfloorParent) && keyJump && sprite_index == spr_wandAnimLeft) {
		audio_play_sound(Jump, 6, false);
		isJumping = true; 
		vspd = -flatJump;
}

else if (!place_meeting(x, y + 1, obj_platfloorParent) && sign(vspd) < 0 && sprite_index == spr_wandAnimLeft) {	 
	
	sprite_index = spr_jumpAnimWandLeft; 	
}

if (sign(vspd) == 0 && sign(move) == 0 && place_meeting(x, y + 1, obj_platfloorParent) && sprite_index == spr_jumpAnimWandLeft)
	sprite_index = spr_wandAnimLeft;

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

//Wall collision stuff
if(stuckToWall == true)
{
	
	// jumping up a wall
	if(keyJump)
	{
		audio_play_sound(Jump, 6, false);
		
		if(place_meeting(x + 1, y, obj_wallParent))
		{
			hspd = -wallSideJump;
			sprite_index = spr_wandAnim; 
		}
		
		else if(place_meeting(x - 1, y, obj_wallParent))
		{
			hspd = wallSideJump;
			sprite_index = spr_wandAnimLeft;
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
	audio_play_sound(Dash, 6, false);
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

//Dash
/*if(keyDash or dashing) 
{
	finishDash = false;
	dashAct = dashSpeed *sign(hspd);
	sprite_index = spr_dashAnim;
	image_xscale = sign(hspd);
	if(keyDash)
	{
		dashing = true;
	}
	i = 0;
	while(i < dashSpeed)
	{
		if(place_meeting(x+(i*sign(dashAct)),y,obj_EnvironmentPieceParent))
		{
			while(!place_meeting(x + sign(dashAct), y, obj_EnvironmentPieceParent))
			{
				x += sign(hspd);	
			}
			hspd = 0;
			finishDash = true;
		}
		i++;
	}
	if(!finishDash)
	{
		dashingCounter += 1;
		if(dashingCounter < 6)
		{
			hspd = dashAct/5;
		}
		else
		{
			dashing = false;
			dashingCounter = 0;
			hspd = 0;
		}
	}
}*/

if(freezeMotion)
{
	move = 0;
	keyUp =  false;
	keyDown =  false;
	keyJump = false;
	keyDash = false;
	keyRun = false;
	keyInteract = false;
	keyFire =  false;
	hspd = 0;
	vspd = 0;
}

x = x + hspd;
y = y + vspd;

// Firing
if((keyFire) && (firingDelay < 0))
{
	audio_play_sound(MagicAttack, 6, false);
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

if(place_meeting(x,y,obj_damageBox))
{
	if(faceLeft)
	{
		sprite_index = spr_damageAnimL;
		alarm[0] = room_speed*.5;
	}
	else
	{
		sprite_index = spr_damageAnim;
		alarm[0] = room_speed*.5;
	}
}


//Climbing 
if (keyUp || keyDown) 
	if (place_meeting(x, y, parent_ladder)) 
		ladder = true;
	

//Player Damage/death
if (global.numOfHearts < 1) checkpointDeath();

//Walk sound
/*
if (sprite_index == spr_runAnimWand || sprite_index == spr_runAnimWandLeft && counterFootsteps == 0)
//fix sound when jumping
{
    audio_play_sound(snd_playerStep, 8, false);
    counterFootsteps = 10; // number of steps to wait before trying to play the sound again
}
else if (counterFootsteps > 0) counterFootsteps--; */