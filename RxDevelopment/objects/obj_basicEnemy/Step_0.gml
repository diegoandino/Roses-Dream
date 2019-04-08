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
	sprite_index = spr_basicEnemy;	
}


if distance_to_object(obj_player) < radiusPlayer
{
	if(initialAttackCounter < room_speed*initialAttackDelay)
	{
		initialAttackCounter++;
	}
}
else
{
	initialAttackCounter = 0;
}

if(initialAttackCounter == room_speed*initialAttackDelay and delay == false)
{
	attack = 1;
}
else
{
	attack = 0;
}

if(attack == 1)
{
	if(obj_player.x < x)
	{
		instance_create_layer(x-radiusPlayer,y,"Enemies",obj_damageBox);
	} 
	else if (obj_player.x > x)
	{
		instance_create_layer(x+radiusPlayer,y,"Enemies",obj_damageBox);
	}
	delay = true;
	alarm[0] = room_speed*inBetweenAttackDelay;
}

// MOVEMENT

//if(!place_meeting(x+hspd,y,obj_wallParent))
//{
//	hspd = 5;
//}
//else if(!place_meeting(x-hspd,y,obj_wallParent))
//{
	//hspd = -5;
//}	
//x += hspd;
