x = obj_player.x + 50; 
y = obj_player.y + 20;

keyFire =  mouse_check_button_pressed(mb_left) ||  keyboard_check_pressed(ord("S"));
firingDelay -= 1; 

if ((keyFire) && (firingDelay < 0)) {
	firingDelay = 5; 
	
	with(instance_create_layer(x, y, "WandProjectiles", obj_wandProjectile)) {
		speed = 15; 
		direction = other.image_angle + random_range(-3, 3);  
	}
}