/// @description Insert description here
// You can write your code in this editor

// enemy health management
if(enemyHealth < 1)
{
	instance_destroy();
}

damageFrameCounter += 1;

if(damageSpr == true)
{
	//change spr to red
	sprite_index = spr_basicEnemyDamage;
	damageFrameCounter += 1;
	if(damageFrameCounter >= 15)
	{
		damageSpr = false;
		damageFrameCounter = 0;
	}
}
else
{
	if(!attackAnim){
	sprite_index = spr_basicEnemy;	}
}


// MOVEMENT


if (moveLeft)
{
	hspd = -1;
	image_xscale = 1;
	if ( x < xstart - movementRange)
	{
		moveLeft = !moveLeft;
	}
}
else
{
	hspd = 1;
	image_xscale = -1;
	if ( x > xstart + movementRange)
	{
		moveLeft = !moveLeft;
	}
}

if(place_meeting(x+1,y,obj_wallParent) and place_meeting(x-1,y,obj_wallParent))
{
	instance_destroy();
}
else if(place_meeting(x+1,y,obj_wallParent) or place_meeting(x-1,y,obj_wallParent))
{
	moveLeft = !moveLeft;
}

//ATTACK
if distance_to_object(obj_player) < radiusPlayer
{
	dividing = true;
	if(initialAttackCounter < room_speed*initialAttackDelay)
	{
		initialAttackCounter++;
	}
	if(obj_player.x < x)
	{
		image_xscale = 1;
	}
	else
	{
		image_xscale = -1;
	}
	hspd = 0;
}
else
{
	initialAttackCounter = 0;
}

if(initialAttackCounter >= room_speed*initialAttackDelay and delay == false)
{
	attack = 1;
}
else
{
	attack = 0;
}

if(attack == 1)
{
	attackAnim = true;
	sprite_index = spr_basicEnemyAttack;
	if(obj_player.x < x)
	{
		image_xscale = -1;
	} 
	else if (obj_player.x > x)
	{
		image_xscale = 1;
		
	}
	delay = true;
	alarm[1] = room_speed*.15;
	alarm[0] = room_speed*inBetweenAttackDelay;
	
}
if(instance_number(obj_basicEnemy) >30)
{
	dividing = false;
}
if(dividing && divided)
{
	divided = false;
	alarm[2] = room_speed*10;
}

x += hspd;