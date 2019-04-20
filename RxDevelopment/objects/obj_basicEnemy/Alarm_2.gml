/// @description Cell Division

var inst = instance_create_layer(x,y,"Enemies",obj_basicEnemy);
inst.enemyHealth = .5*enemyHealth;
inst.moveLeft = !moveLeft;
divided = true;