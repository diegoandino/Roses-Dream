if (keyboard_check_pressed(vk_escape)) {
	if (!pause) {
		pause = true;
		instance_deactivate_all(true); 
		audio_play_sound(snd_pauseMenu, 8, false); 
	}
	
	else {
		pause = false; 
		instance_activate_all(); 
		audio_stop_sound(snd_pauseMenu); 
	}
}