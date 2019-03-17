x = obj_player.x + 50; 
y = obj_player.y + 20;

keyFire =  mouse_check_button_pressed(mb_left) ||  keyboard_check_pressed(ord("S"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
firingDelay -= 1; 

/*
if ((keyFire) && (firingDelay < 0)) {
	firingDelay = 5; 
	
	with(instance_create_layer(x, y, "WandProjectiles", obj_wandProjectile)) {
		speed = 15; 
		direction = other.image_angle + random_range(-3, 3);  
		
		if (-direction) {	
			obj_wandProjectile.image_angle = 180; 
		}
	}
}*/


if ((keyFire) && (obj_player.image_angle == 0) && (firingDelay < 0)) {
	firingDelay = 5; 
	
	with (instance_create_layer(x, y, "WandProjectiles", obj_wandProjectile)) {
		speed = 15;
		obj_wandProjectile.image_angle = 0;
	}
	
} else if ((keyFire) && (obj_player.image_angle == 180) && (firingDelay < 0)) {
	firingDelay = 5; 
	
	with (instance_create_layer(x, y, "WandProjectiles", obj_wandProjectile)) {
		speed = -15;
		obj_wandProjectile.image_angle = 180;
	}
}
	
	