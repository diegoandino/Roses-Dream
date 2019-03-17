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

//Health Updating
if(place_meeting(x,y,obj_player))
{
	global.numOfHearts -= 1;
	
	if(global.numOfHearts == 0) {
		room_restart(); 
	}
}