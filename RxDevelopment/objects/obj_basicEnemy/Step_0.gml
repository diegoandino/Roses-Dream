/// @description Insert description here
// You can write your code in this editor

// enemy health management
if(enemyHealth <= 0)
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