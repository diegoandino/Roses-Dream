x = obj_player.x + 75; 
y = obj_player.y + 65;
 
firingDelay -= 1; 

if (mouse_check_button(mb_left)) && (firingDelay < 0) {
	firingDelay = 5; 
	
	with(instance_create_layer(x, y, "WandProjectiles", obj_wandProjectile)) {
		speed = 15; 
		direction = other.image_angle + random_range(-3, 3);  
	}
}